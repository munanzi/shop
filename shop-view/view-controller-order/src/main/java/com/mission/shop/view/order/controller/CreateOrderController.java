package com.mission.shop.view.order.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
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
    @RequestMapping("confirmOrder")
    public String confirmOrder(@RequestParam("goodsId") Long goodsId,ModelMap model,
                      @RequestParam("num") int num,HttpSession session) {

        User user  = UserUtils.getUser(session) ;
        List<UserAddress> addressList = userAddressServcie.queryAddressByUserId(user.getUserId());

        List<Area> provinceList = areaService.queryAllProvince();

        try {
			GoodsView goodsView = goodsShowQueryService.queryGoodsView(goodsId, num);
			model.addAttribute("goodsView",goodsView);
		} catch (BusinessException e) {
			model.addAttribute("errorMessage",e.getDisplayMessage());
			logger.error("查找找商品信息出错",e);
			return "common/error";
		}

        model.addAttribute("addressList",addressList);
        model.addAttribute("provinceList",provinceList);
        return "order/confirmOrder";
    }
    @RequestMapping("settle")
    public String settle(@RequestParam("jsonGoods") String jsonGoods,OrderPO orderPO) {

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
    
}
