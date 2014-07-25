package com.mission.shop.view.order.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mission.shop.base.common.exception.BusinessException;
import com.mission.shop.base.common.utils.JsonUtil;
import com.mission.shop.order.dao.model.Order;
import com.mission.shop.order.service.order.CreateOrderService;

/**
 * User: hexizheng@163.com
 * Date: 14-7-17
 * Time: 下午3:38
 */
@Controller
@RequestMapping("order")
public class CreateOrderController {

    @Autowired
    private CreateOrderService createOrderService;

    Logger logger = (Logger) LoggerFactory.getLogger(getClass());
    @RequestMapping("buy")
    public String buy(@RequestParam("goodsId") Long goodsId,
                      @RequestParam("goodsId") int num) {


        try {
            Order order = createOrderService.createOrder(goodsId,num) ;
        } catch (BusinessException e) {

            logger.error("创建订单失败 goodsId="+goodsId,e);
        }

        return "";
    }
    @RequestMapping("settle")
    public String settle(@RequestParam("jsonGoods") String jsonGoods) {

        Map map = JsonUtil.jsonToObject(jsonGoods);

        try{
            Order order = createOrderService.createOrder(map) ;
        } catch (BusinessException e) {

            logger.error("创建订单失败"+map,e);
        }

        return "";
    }
}
