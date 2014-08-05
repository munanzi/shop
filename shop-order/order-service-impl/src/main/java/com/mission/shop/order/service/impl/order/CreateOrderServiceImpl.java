package com.mission.shop.order.service.impl.order;



import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mission.shop.base.common.exception.BusinessException;
import com.mission.shop.base.common.exception.SystemException;
import com.mission.shop.order.common.code.OrderStatus;
import com.mission.shop.order.dao.mapper.OrderMapper;
import com.mission.shop.order.dao.model.Order;
import com.mission.shop.order.service.invoice.InvoiceService;
import com.mission.shop.order.service.order.BuyedGoods;
import com.mission.shop.order.service.order.CreateOrderService;
import com.mission.shop.order.service.order.ExpressFeeService;
import com.mission.shop.order.service.order.OrderPO;
import com.mission.shop.order.service.order.PayTypeService;
import com.mission.shop.order.service.orderaddress.OrderAddressService;
import com.mission.shop.order.service.ordergoods.OrderGoodsManageService;
import com.mission.shop.order.service.orderhistory.OrderHistoryStatusService;
import com.mission.shop.product.service.goods.GoodsPriceService;
import com.mission.shop.product.service.goods.GoodsQueryService;
import com.mission.shop.product.service.goods.GoodsStockService;
import com.mission.shop.user.common.code.UserIntegeralType;
import com.mission.shop.user.service.userIntegeral.UserIntegeralService;

/**
 * User: hexizheng@163.com
 * Date: 14-7-17
 * Time: 下午3:36
 */
@Service
public class CreateOrderServiceImpl implements CreateOrderService {

	@Autowired
    private OrderMapper orderMapper;
    
    @Autowired
    private GoodsQueryService goodsQueryService;
    @Autowired
    private GoodsStockService goodsStockService;
    @Autowired
    private InvoiceService invoiceService;
    @Autowired
    private OrderAddressService orderAddressService;
    @Autowired
    private GoodsPriceService goodsPriceService;

    @Autowired
    private ExpressFeeService expressFeeService;

    @Autowired
    private PayTypeService payTypeService;
    
    @Autowired
    private OrderGoodsManageService orderGoodsManageService;

    @Autowired
    private OrderHistoryStatusService orderHistoryStatusService;

    @Autowired
    private UserIntegeralService userIntegeralService;

    @Transactional(rollbackFor = Exception.class)
    public void createOrder(OrderPO orderPO)throws BusinessException{
        List<Order> orderList = new ArrayList<Order>();
        //按商户拆分订单
    	Map<Long,List<BuyedGoods>> map =  splitGoodsByShop(orderPO.getGoodsList());
    	for (Iterator<Long> iterator = map.keySet().iterator(); iterator.hasNext();) {
			Long shopId =  iterator.next();
			Order order = createOrderInternal(shopId,orderPO,map.get(shopId));
            orderList.add(order);

		}
    }


    private Order createOrderInternal(Long shopId,OrderPO orderPO,List<BuyedGoods> list)throws BusinessException{
    	//保存发票信息
        Long invoiceId = saveOrderInvoice(orderPO);
        //保存订单地址
        Long orderAddresss = saveOrderAddress(orderPO);

        Order order = new Order();
        order.setShopId(shopId);
        order.setPayType(payTypeService.getPayType().getCode());
        order.setRemark(orderPO.getRemark());
        order.setUserId(orderPO.getUserId());
        order.setUserName(orderPO.getUserName());
        order.setInvoiceId(invoiceId);
        order.setLastUpdateTime(new Date());
        order.setAddressId(orderAddresss);

        order.setExpressFee(expressFeeService.getExpressFee());
        order.setAmount(getTotalAmount(list));
        //计算使用积分
        countOrderUseIntegeral(orderPO, order);
        orderMapper.insert(order);

        //扣减库存
        subGoodsStock(list);
        //订单商品信息
        saveOrderGoodsDetail(list, order.getOrderId());
        //扣减用户积分
        subUserIntegeral(order);

        //订单历史
        saveOrderHistory(order);


        return  order;
    }

    private void subGoodsStock(List<BuyedGoods> list)throws BusinessException{
        for(BuyedGoods buyedGoods:list){
            goodsStockService.subStock(buyedGoods.getGoodesId(),buyedGoods.getBuyNum());
        }
    }
    private Long saveOrderAddress(OrderPO orderPO) throws BusinessException {
        return orderAddressService.saveOrderAddress(orderPO.getAddressId());
    }

    private Long saveOrderInvoice(OrderPO orderPO) {
        return invoiceService.saveOrderInvoice(orderPO.getInvoiceTitle(),
                    orderPO.getInvoiceProductType(),orderPO.getInvoiceType());
    }

    private int countOrderUseIntegeral(OrderPO orderPO,  Order order) {
        int needPayAmount = order.getAmount()+order.getExpressFee();
        if(needPayAmount>=orderPO.getUseIntegral()){
            order.setUseIntegral(orderPO.getUseIntegral());
            //此订单消耗所有积分
            orderPO.setUseIntegral(0);
            order.setStatus(OrderStatus.INIT.getCode());
        }else{
            order.setUseIntegral(needPayAmount);
            orderPO.setUseIntegral(orderPO.getUseIntegral() - needPayAmount);
            //状态为已付款
            order.setStatus(OrderStatus.PAYED.getCode());
        }
        return needPayAmount;
    }

    private void saveOrderGoodsDetail(List<BuyedGoods> list, Long orderId) throws BusinessException {
        orderGoodsManageService.saveOrderGoods(orderId,list);
    }

    private void subUserIntegeral(Order order) throws BusinessException {
        if(order.getUseIntegral()>0){
            userIntegeralService.subIntegeral(order.getUserId(),order.getOrderId(),
                order.getUseIntegral(), UserIntegeralType.CONSUME_PAY,"下单积分支付");
        }
    }

    private void saveOrderHistory(Order order) {
        orderHistoryStatusService.saveStatusHistory(order.getOrderId(), OrderStatus.INIT,"创建订单");
        if(order.getAmount()+order.getExpressFee()==order.getUseIntegral()){
            orderHistoryStatusService.saveStatusHistory(order.getOrderId(),OrderStatus.PAYED,"全积分支付完成");
        }
    }


    /**
     * 计算订单商品价格
     * @param goodsList   商品列表
     * @throws BusinessException
     */
    private int getTotalAmount(List<BuyedGoods> goodsList)throws BusinessException{

        int totalAmount = 0;
        for(BuyedGoods buyedGoods: goodsList){
            int price = goodsPriceService.getGoodsPrice(buyedGoods.getGoodesId());
            int amount = price *   buyedGoods.getBuyNum();
            if(price!=buyedGoods.getPrice()){
                throw new SystemException("页面显示单价与后台计算价格不一致goodsId["+
                        buyedGoods.getGoodesId()+"]display["+ buyedGoods.getPrice()+"]count["+price+"]") ;
            }
           totalAmount += amount;
        }

        return totalAmount;
    }


    /**
     * 按照商户拆分商品列表，用于生成多个订单
     * @param goodsList  商品列表
     * @throws BusinessException
     */
    private Map<Long,List<BuyedGoods>> splitGoodsByShop(List<BuyedGoods> goodsList)throws BusinessException{
    	Map<Long,List<BuyedGoods>> map = new HashMap<Long,List<BuyedGoods>>();
    	for(BuyedGoods buyedGoods: goodsList){
    		Long shopId = goodsQueryService.queryShopIdByGoodsId(buyedGoods.getGoodesId());
            List<BuyedGoods> list = map.get(shopId);
            if(list==null){
                list = new ArrayList<BuyedGoods>();
            }
            list.add(buyedGoods);
            map.put(shopId,list);
    	}
    	return map;
    }

}
