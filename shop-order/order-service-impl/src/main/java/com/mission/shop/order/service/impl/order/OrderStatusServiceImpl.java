package com.mission.shop.order.service.impl.order;

import com.mission.shop.base.common.exception.BusinessException;
import com.mission.shop.order.common.code.OrderStatus;
import com.mission.shop.order.common.returncode.OrderReturnCode;
import com.mission.shop.order.dao.mapper.OrderMapper;
import com.mission.shop.order.dao.model.Order;
import com.mission.shop.order.service.order.OrderQueryService;
import com.mission.shop.order.service.order.OrderStatusService;
import com.mission.shop.order.service.orderhistory.OrderHistoryStatusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;



@Service
public class OrderStatusServiceImpl implements OrderStatusService {
	
	
	@Autowired
	private OrderMapper orderMapper;
	@Autowired
	private OrderQueryService orderQueryService;
	
	@Autowired
	private OrderHistoryStatusService orderHistoryStatusService;


//    INIT((short)1,"初始下单"),
//    PAYING((short)2,"支付中"),
//    PAYED((short)3,"支付成功"),
//    SEND_OFF((short)4,"已发货") ,
//    SUCCESS((short)5,"交易成功") ,
//    APPLY_REFUND((short)6,"退货申请中"),
//    AGREE_REFUND((short)7,"已同意退货"),
//    REFUND_SUCCESS((short)8,"退货成功"),
//    REFUSE_REFUND((short)9,"拒绝退货"),
//    CLOSED((short)10,"交易关闭");


    @Override
    @Transactional(rollbackFor = Exception.class)
    public void changeStatus2Paying(long orderId)throws BusinessException{
        Order order = orderQueryService.queryOrderbyOrderId(orderId);
        if(OrderStatus.INIT.getCode()!=order.getStatus()){
            throw new BusinessException(OrderReturnCode.CHANGE_STATUS_PAYING_FAIL);
        }
        updateOrderStatus(orderId,OrderStatus.PAYING.getCode());
        orderHistoryStatusService.saveStatusHistory(orderId, OrderStatus.PAYING, "订单状态变更为支付中");
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void changeStatus2Payed(long orderId)throws BusinessException{
        Order order = orderQueryService.queryOrderbyOrderId(orderId);
        if(OrderStatus.PAYING.getCode()!=order.getStatus()){
            throw new BusinessException(OrderReturnCode.CHANGE_STATUS_PAYED_FAIL);
        }
        updateOrderStatus(orderId,OrderStatus.PAYED.getCode());
        orderHistoryStatusService.saveStatusHistory(orderId, OrderStatus.PAYED, "订单状态变更为支付成功");
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void changeStatus2SendOff(long orderId)throws BusinessException{
        Order order = orderQueryService.queryOrderbyOrderId(orderId);
        if(OrderStatus.INIT.getCode()!=order.getStatus()&&
                OrderStatus.PAYED.getCode()!=order.getStatus()){
            throw new BusinessException(OrderReturnCode.CHANGE_STATUS_SENDOFF_FAIL);
        }
        updateOrderStatus(orderId,OrderStatus.PAYED.getCode());
        orderHistoryStatusService.saveStatusHistory(orderId, OrderStatus.PAYED, "订单状态变更为支付成功");
    }
	
	
	/* (non-Javadoc)
	 * @see com.qianbao.shop.order.service.impl.order.OrderStatusService#closeOrder(int, int, java.lang.String, java.lang.String)
	 */
	@Override
    @Transactional(rollbackFor = Exception.class)
	public void closeOrder(long userId,long orderId)throws BusinessException{
		Order order = orderQueryService.queryOrderbyOrderId(orderId);
		if(OrderStatus.INIT.getCode()!=order.getStatus()){
			throw new BusinessException(OrderReturnCode.CANCEL_ORDER_FAIL);
		}
		updateOrderStatus(orderId,OrderStatus.CLOSED.getCode());
        orderHistoryStatusService.saveStatusHistory(orderId, OrderStatus.CLOSED, userId + "取消订单");
	}
	/**
	 * 更新订单状态,并更新备注
	 * @param orderId
	 * @param status
	 * @throws BusinessException
	 */
    @Transactional(rollbackFor = Exception.class)
	public void updateOrderStatus(long orderId,short status)throws BusinessException{
		Order order= new Order();
		order.setOrderId(orderId);
		order.setStatus(status);
		order.setUpdateTime(new Date());
		orderMapper.updateByPrimaryKeySelective(order);
		
		
	}
}
