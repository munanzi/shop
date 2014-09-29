package com.mission.shop.view.order.controller;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mission.shop.base.common.exception.BusinessException;
import com.mission.shop.base.common.utils.JsonUtil;
import com.mission.shop.base.common.utils.NumberUtils;
import com.mission.shop.order.service.order.BuyedGoods;
import com.mission.shop.order.service.order.CreateOrderService;
import com.mission.shop.order.service.order.OrderPO;
import com.mission.shop.product.service.goods.GoodsShowQueryService;
import com.mission.shop.product.service.goods.GoodsView;
import com.mission.shop.user.dao.model.Area;
import com.mission.shop.user.dao.model.User;
import com.mission.shop.user.dao.model.UserAddress;
import com.mission.shop.user.service.area.AreaService;
import com.mission.shop.user.service.useraddress.UserAddressServcie;
import com.mission.shop.view.order.util.UserUtils;

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

    @Autowired
    private UserAddressServcie userAddressServcie;

    @Autowired
    private AreaService areaService;
    
    @Autowired
    private GoodsShowQueryService goodsShowQueryService;

    Logger logger = (Logger) LoggerFactory.getLogger(getClass());

    @RequestMapping("settle")
    public String settle(@RequestParam("jsonGoods") String jsonGoods,OrderPO orderPO) {
//    	List<BuyedGoods> goodsList = getGoodsList(jsonGoods);
//        Map map = JsonUtil.jsonToObject(jsonGoods);
//        try{
//        	orderPO.setGoodsList(goodsList);
//            createOrderService.createOrder(orderPO) ;
//        } catch (BusinessException e) {
//
//            logger.error("创建订单失败"+map,e);
//        }
        return "";
    }

    
    @SuppressWarnings("rawtypes")
    private List<BuyedGoods> getGoodsList(String jsonGoods){
		Map map = JsonUtil.jsonToObject(jsonGoods);
		List<BuyedGoods> goodsList = new ArrayList<BuyedGoods>();
        Iterator iterator = map.entrySet().iterator();
        while(iterator.hasNext()){
    	    Long goodsId =  Long.parseLong((String)iterator.next());
    		BuyedGoods buyedGoods = new BuyedGoods();
    		buyedGoods.setGoodesId(goodsId);
    		buyedGoods.setBuyNum(Integer.parseInt((String)map.get("num")));
    		goodsList.add(buyedGoods);
    	}
    	return goodsList;
    }


    
}
