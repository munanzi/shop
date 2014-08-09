package com.mission.shop.order.service.order;

import com.mission.shop.order.common.code.OrderStatus;
import com.mission.shop.order.dao.model.Order;
import com.mission.shop.user.dao.model.User;
import com.mission.shop.user.service.user.UserQueryService;
import junit.framework.Assert;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.mission.shop.base.common.exception.BusinessException;
import com.mission.shop.order.service.base.OrderServiceTestBase;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * User: hexizheng@163.com
 * Date: 14-7-28
 * Time: 下午7:33
 */
public class CreateOrderServiceTest extends OrderServiceTestBase {

    @Autowired
    private CreateOrderService createOrderService;
    private UserQueryService userQueryService;
    Logger logger = LoggerFactory.getLogger(getClass());
    @Test
    public void testCreateOrder(){
        OrderPO orderPO = new OrderPO();
        orderPO.setAddressId(1L);
        orderPO.setInvoiceProductType((short) 1);
        orderPO.setInvoiceTitle("misson company");
        orderPO.setInvoiceType((short) 1);
        orderPO.setRemark("下单备注");
        orderPO.setUseIntegral(200);
        BuyedGoods buyedGoods1 = new BuyedGoods() ;
        buyedGoods1.setGoodesId(1L);
        buyedGoods1.setBuyNum(2);
        buyedGoods1.setPrice(30);
        BuyedGoods buyedGoods2 = new BuyedGoods() ;
        buyedGoods2.setGoodesId(2L);
        buyedGoods2.setBuyNum(3);
        buyedGoods2.setPrice(31);
        BuyedGoods buyedGoods3 = new BuyedGoods() ;
        buyedGoods3.setGoodesId(3L);
        buyedGoods3.setBuyNum(2);
        buyedGoods3.setPrice(21);
        BuyedGoods buyedGoods4 = new BuyedGoods() ;
        buyedGoods4.setGoodesId(4L);
        buyedGoods4.setBuyNum(1);
        buyedGoods4.setPrice(22);
        BuyedGoods buyedGoods5 = new BuyedGoods() ;
        buyedGoods5.setGoodesId(5L);
        buyedGoods5.setBuyNum(3);
        buyedGoods5.setPrice(23);
        orderPO.addGoods(buyedGoods1);
        orderPO.addGoods(buyedGoods2);
        orderPO.addGoods(buyedGoods3);
        orderPO.addGoods(buyedGoods4);
        orderPO.addGoods(buyedGoods5);
        orderPO.setUserId(1L);
        orderPO.setUserName("hexizheng");
        try {
            createOrderService.createOrder(orderPO);
        } catch (BusinessException e) {
            logger.error("",e);
            Assert.fail(e.getMessage());
        }
    }


    @Transactional()
    @Test()
    public void testCreateOrder2(){
        OrderPO orderPO = new OrderPO();
        orderPO.setAddressId(1L);
        orderPO.setInvoiceProductType((short)1);
        orderPO.setInvoiceTitle("misson company");
        orderPO.setInvoiceType((short)1);
        orderPO.setRemark("下单备注");
        orderPO.setUseIntegral(161);
        BuyedGoods buyedGoods1 = new BuyedGoods() ;
        buyedGoods1.setGoodesId(1L);
        buyedGoods1.setBuyNum(2);
        buyedGoods1.setPrice(30);
        BuyedGoods buyedGoods2 = new BuyedGoods() ;
        buyedGoods2.setGoodesId(2L);
        buyedGoods2.setBuyNum(3);
        buyedGoods2.setPrice(31);
        orderPO.addGoods(buyedGoods1);
        orderPO.addGoods(buyedGoods2);
        orderPO.setUserId(1L);
        orderPO.setUserName("hexizheng");
        try {
            List<Order> list = createOrderService.createOrder(orderPO);
            Order order = list.get(0);
            Assert.assertEquals(153,order.getAmount().intValue());
            Assert.assertEquals(OrderStatus.PAYED.getCode(),order.getStatus().intValue());
            Assert.assertEquals(161,order.getUseIntegral().intValue());
            Assert.assertEquals(8, order.getExpressFee().intValue());
            Assert.assertEquals(1, order.getShopId().intValue());

            User user = userQueryService.queryUserById(1L);
            Assert.assertEquals(1000-161, user.getIntegral().intValue());
        } catch (BusinessException e) {
            logger.error("",e);
            Assert.fail(e.getMessage());
        }
    }

    @Override
    public String getSqlFilePath() {
        return "sql/createOrderServiceTest.sql";
    }
}
