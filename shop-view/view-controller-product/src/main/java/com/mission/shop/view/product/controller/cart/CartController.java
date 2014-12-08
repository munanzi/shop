package com.mission.shop.view.product.controller.cart;

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

import com.mission.shop.base.common.exception.BusinessException;
import com.mission.shop.product.dao.model.Cart;
import com.mission.shop.product.service.cart.CartService;
import com.mission.shop.product.service.goods.GoodsShowQueryService;
import com.mission.shop.product.service.goods.GoodsView;
import com.mission.shop.view.product.util.UserUtils;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("cart")
public class CartController {
	@Autowired
	private CartService cartService;
	
	@Autowired
	private GoodsShowQueryService goodsShowQueryService;
	
    Logger logger = (Logger) LoggerFactory.getLogger(getClass());
    
	@RequestMapping("init")
	public String init(ModelMap model,HttpSession session){
		
		List<Cart> cartList = cartService.queryAllCartGoods(UserUtils.getUserId(session));
		try {
			Map<String,List<GoodsView>> goodsMap = goodsShowQueryService.queryGoodsView(cartList);
			model.addAttribute("goodsMap",goodsMap);
		} catch (BusinessException e) {
			model.addAttribute("errorMessage",e.getDisplayMessage());
			logger.error("查找找商品信息出错",e);
			return "common/error";
		}
		return "cart/cartDetail";
	}
	@RequestMapping("add")
    @ResponseBody
	public Map<String,String> add(@RequestParam("goodsId") long goodsId,@RequestParam("num") int num,ModelMap model,HttpSession session){
        Map<String,String> map = new HashMap<String,String>();
		try {
            cartService.addCartGoods(UserUtils.getUserId(session),goodsId,num);
            map.put("success","true");
		} catch (Exception e) {

			logger.error("加入购物车失败",e);
            map.put("success","false");
            map.put("message","加入购物车失败");
		}
		return map;
	}

}
