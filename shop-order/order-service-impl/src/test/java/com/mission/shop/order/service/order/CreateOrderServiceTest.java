package com.mission.shop.order.service.order;

import com.mission.shop.base.common.exception.BusinessException;
import com.mission.shop.base.common.threadlocal.CurrentUser;
import com.mission.shop.base.common.threadlocal.ThreadLocalUtils;
import com.mission.shop.order.service.base.OrderServiceTestBase;
import junit.framework.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * User: hexizheng@163.com
 * Date: 14-7-28
 * Time: 下午7:33
 */
public class CreateOrderServiceTest extends OrderServiceTestBase {

    @Autowired
    private CreateOrderService createOrderService;

    @Test
    public void testCreateOrder(){
        OrderPO orderPO = new OrderPO();
        orderPO.setAddressId(1L);
        orderPO.setInvoiceProductType((short)1);
        orderPO.setInvoiceTitle("misson company");
        orderPO.setInvoiceType((short)1);
        orderPO.setRemark("下单备注");
        orderPO.setTotalAmount(67097);
        orderPO.setUseIntegral(100);
        BuyedGoods buyedGoods1 = new BuyedGoods() ;
        buyedGoods1.setGoodesId(1L);
        buyedGoods1.setBuyNum(1);
        buyedGoods1.setPrice(1399);
        BuyedGoods buyedGoods2 = new BuyedGoods() ;
        buyedGoods2.setGoodesId(2L);
        buyedGoods2.setBuyNum(2);
        buyedGoods2.setPrice(1599);
        BuyedGoods buyedGoods3 = new BuyedGoods() ;
        buyedGoods3.setGoodesId(3L);
        buyedGoods3.setBuyNum(3);
        buyedGoods3.setPrice(5000);
        BuyedGoods buyedGoods4 = new BuyedGoods() ;
        buyedGoods4.setGoodesId(4L);
        buyedGoods4.setBuyNum(4);
        buyedGoods4.setPrice(5500);
        BuyedGoods buyedGoods5 = new BuyedGoods() ;
        buyedGoods5.setGoodesId(5L);
        buyedGoods5.setBuyNum(5);
        buyedGoods5.setPrice(5100);
        orderPO.setGoods(buyedGoods1);
        orderPO.setGoods(buyedGoods2);
        orderPO.setGoods(buyedGoods3);
        orderPO.setGoods(buyedGoods4);
        orderPO.setGoods(buyedGoods5);
        CurrentUser currentUser = new CurrentUser();
        currentUser.setUserId(1L);
        currentUser.setUserName("hexizheng");
        ThreadLocalUtils.setCurrentUser(currentUser);
        try {
            createOrderService.createOrder(orderPO);
        } catch (BusinessException e) {
            Assert.fail(e.getMessage());
        }
    }

    @Override
    public String getSqlFilePath() {
        return "sql/createOrderServiceTest.sql";
    }
}
