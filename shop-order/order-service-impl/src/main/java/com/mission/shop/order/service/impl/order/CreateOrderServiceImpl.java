package com.mission.shop.order.service.impl.order;

import com.mission.shop.base.common.exception.BusinessException;
import com.mission.shop.base.common.threadlocal.ThreadLocalUtils;
import com.mission.shop.order.common.code.OrderStatus;
import com.mission.shop.order.dao.model.Order;
import com.mission.shop.order.service.invoice.InvoiceService;
import com.mission.shop.order.service.order.CreateOrderService;
import com.mission.shop.order.service.order.OrderPO;
import com.mission.shop.order.service.orderaddress.OrderAddressService;
import com.mission.shop.product.dao.model.Goods;
import com.mission.shop.product.service.goods.GoodsManageService;
import com.mission.shop.product.service.goods.GoodsQueryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.Map;

/**
 * User: hexizheng@163.com
 * Date: 14-7-17
 * Time: 下午3:36
 */
@Service
public class CreateOrderServiceImpl implements CreateOrderService {

    @Autowired
    private GoodsQueryService goodsQueryService;
    @Autowired
    private GoodsManageService goodsManageService;
    @Autowired
    private InvoiceService invoiceService;
    @Autowired
    private OrderAddressService orderAddressService;

    @Transactional(rollbackFor = Exception.class)
    public Order createOrder(Long goodsId,int num)throws BusinessException{
        Goods goods = goodsQueryService.queryGoodsById(goodsId);
        goodsQueryService.checkGoodsStatus(goodsId);

        return null;
    }

    @Transactional(rollbackFor = Exception.class)
    public Order createOrder(Map<String,String> map)throws BusinessException{


        return null;
    }

    @Transactional(rollbackFor = Exception.class)
    public Order createOrder(OrderPO orderPO)throws BusinessException{


        Long invoiceId = invoiceService.saveOrderInvoice(orderPO.getInvoiceTitle(),
                orderPO.getInvoiceProductType(),orderPO.getInvoiceType());
        Long orderAddresss = orderAddressService.saveOrderAddress(orderPO.getAddressId());


//        Goods goods = new Goods();
//
//        Order Order = new Order();
//        order.setAmount();
//        order.setDeleveryAmount();
//        order.setPayType();
//        order.setRemark();
//        order.setStatus(OrderStatus.INIT.getCode());
//        order.setIntegral();
//        order.setUserId(ThreadLocalUtils.getUserId());
//        order.setInvoiceId();
//        order.setLastUpdateTime(new Date());
        //订单地址
        //订单商品
        //发票信息
        return  null;
    }


}
