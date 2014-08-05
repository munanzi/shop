package com.mission.shop.view.order.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mission.shop.base.common.exception.BusinessException;
import com.mission.shop.base.common.utils.JsonUtil;
import com.mission.shop.base.common.utils.NumberUtils;
import com.mission.shop.order.dao.model.Order;
import com.mission.shop.order.service.order.BuyedGoods;
import com.mission.shop.order.service.order.CreateOrderService;
import com.mission.shop.order.service.order.OrderPO;

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


//        try {
//            createOrderService.createOrder(goodsId,num) ;
//        } catch (BusinessException e) {
//
//            logger.error("创建订单失败 goodsId="+goodsId,e);
//        }

        return "";
    }
    @RequestMapping("settle")
    public String settle(@RequestParam("jsonGoods") String jsonGoods,OrderPO orderPO
                         ) {

    	List<BuyedGoods> goodsList = getGoodsList(jsonGoods);
        Map map = JsonUtil.jsonToObject(jsonGoods);

        try{
        	orderPO.setGoodsList(goodsList);
            createOrderService.createOrder(orderPO) ;
        } catch (BusinessException e) {

            logger.error("创建订单失败"+map,e);
        }

        return "";
    }
    
    
    @SuppressWarnings("rawtypes")
    private List<BuyedGoods> getGoodsList(String jsonGoods){
		List<Map> list = JsonUtil.json2Object(jsonGoods, List.class);
		List<BuyedGoods> goodsList = new ArrayList<BuyedGoods>();
    	for(Map map:list){
    		BuyedGoods buyedGoods = new BuyedGoods();
    		buyedGoods.setGoodesId(Long.parseLong((String)map.get("goodsId")));
    		buyedGoods.setBuyNum(Integer.parseInt((String)map.get("num")));
    		buyedGoods.setPrice(Integer.parseInt(NumberUtils.rightMove((String)map.get("price"), 2)));
    		goodsList.add(buyedGoods);
    	}
    	return goodsList;
    }
    
    
    public static void main(String[] args){
        Map map = new HashMap();
        map.put("goodsId","5");
        map.put("num","3");
        map.put("price","3.55");
        Map map2 = new HashMap();
        map2.put("goodsId","51");
        map2.put("num","31");
        map2.put("price","13.55");

        List list = new ArrayList();
        list.add(map);
//        list.add(map2);
        String s = JsonUtil.object2Json(list) ;
        System.out.println(s) ;

        List list2 = JsonUtil.json2Object(s, List.class);
        System.out.println(list2) ;
    }
    
    
}
