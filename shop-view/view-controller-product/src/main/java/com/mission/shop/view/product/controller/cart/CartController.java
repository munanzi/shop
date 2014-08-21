package com.mission.shop.view.product.controller.cart;

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

}
