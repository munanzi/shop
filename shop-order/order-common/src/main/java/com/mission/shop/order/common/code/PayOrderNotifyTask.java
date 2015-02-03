package com.mission.shop.order.common.code;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.http.NameValuePair;

import com.qianwang.pay.order.constants.PayOrderConstants;
import com.qianwang.pay.order.domain.PayOrder;
import com.qianwang.pay.order.service.PayOrderService;

import com.qianwang.pay.order.thread.PayNotifyThread;
import com.qianwang.pay.utils.MD5SignUtils;

import com.qianwang.pay.utils.PaginationOption;
import com.qianwang.pay.utils.PayLogger;
import com.qianwang.pay.utils.http.HttpClientUtil;



public class PayOrderNotifyTask {

	
	PayLogger logger = new PayLogger(PayOrderNotifyTask.class);
	
	@Resource
	PayOrderService payOrderService;
	
	@Resource
	private boolean timerTaskSwitch;
	
	public void execute(){
		if (!timerTaskSwitch) {
			logger.info("PayOrderNotifyTask 定时任务不执行！");
			return;
		}
		
		logger.info("订单通知定时任务开始");
		
		// 查询出所有的状态为支付中的订单
		
		Calendar current = Calendar.getInstance();
        
        Calendar endCurr = Calendar.getInstance();
        
        // 结束时间
        Date endDate = endCurr.getTime();

        // 时间回滚60分钟,查询之前0-60分钟之内的
        current.add(Calendar.MINUTE, -600);
       
        // 开始时间
        Date beginTime = current.getTime();
        
        PaginationOption paginationOption = new PaginationOption();
        
		List<PayOrder> payOrderList = payOrderService.listOrderForNotifyPage(beginTime, endDate, paginationOption);
		
		int failCount = 0;
		while (!payOrderList.isEmpty()) {
			
			for (PayOrder payOrder : payOrderList) {
				
				// 逐个订单发送到订单通知地址   发送后修改通知状态和次数
				boolean isSuccses = false;
				
				try {

					
					// 如果通知地址是空的，不做处理
					if (StringUtils.isBlank(payOrder.getNotifyUrl())) {
						
						logger.info("订单号["+payOrder.getId()+"]通知地址为空,跳过该笔，默认认为通知成功");
						payOrderService.updateNotifyStatusAndPullNum(payOrder.getId(), PayOrderConstants.NOTIFY_STATUS_1);
						continue;
					}
					List<NameValuePair> paramsList = MD5SignUtils.genPosListParam(payOrder);

					
					logger.info("订单号["+payOrder.getId()+"]通知内容:" + paramsList.toString());
					
					String responseBody = HttpClientUtil.post(payOrder.getNotifyUrl(),paramsList);
					
					logger.info("订单号["+payOrder.getId()+"]通知发送完成，对方应答:" + responseBody);
					
					// 判断对方系统是否收到订单通知
					if (StringUtils.isNotBlank(responseBody) && responseBody.toLowerCase().indexOf("success") >= 0) {
						
						isSuccses = true;
					}else {
						
						failCount++;
					}
						
				} catch (Exception e) {
					logger.error(e, "订单号["+payOrder.getId()+"]通知发送异常");
					failCount++ ;
				}
				
				payOrderService.updateNotifyStatusAndPullNum(payOrder.getId(), isSuccses?PayOrderConstants.PAYORDER_NOTIFY_STATUS_1:null);
				
				logger.info("订单号["+payOrder.getId()+"]通知完成," + (isSuccses?"对方确认收到通知":"对方未确认收到通知"));
			}

			paginationOption.setSkipNum(failCount);
			payOrderList = payOrderService.listOrderForNotifyPage(beginTime, endDate, paginationOption);
		}
		
		logger.info("订单通知任务结束");
	}
	
}
