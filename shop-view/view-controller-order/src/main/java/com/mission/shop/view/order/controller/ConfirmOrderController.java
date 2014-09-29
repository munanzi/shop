package com.mission.shop.view.order.controller;

import com.mission.shop.base.common.exception.BusinessException;
import com.mission.shop.base.common.utils.JsonUtil;
import com.mission.shop.base.common.utils.StringUtils;
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
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * User: hexizheng@163.com
 * Date: 14-7-17
 * Time: 下午3:38
 */
@Controller
@RequestMapping("order")
public class ConfirmOrderController {

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
    public String confirmOrder(@RequestParam("goodsId") String goodsId,ModelMap model,
                      @RequestParam("num") String num,HttpSession session) {

        Map<String,String> map  = new HashMap<String, String>();
        map.put(goodsId,num);
        if (!setOrderInfo(model, session, map)) return "common/error";
        return "order/confirmOrder";
    }
    @RequestMapping("confirmOrder2")
    public String confirmOrder(String jsonGoods,OrderPO orderPO,ModelMap model,HttpSession session) {

        Map<String,String> map = (Map<String,String>)JsonUtil.jsonToObject(jsonGoods);

        if (!setOrderInfo(model, session, map)) return "common/error";
        return "order/confirmOrder";
    }

    private boolean setOrderInfo(ModelMap model, HttpSession session, Map<String, String> map) {
        try{
            Map<String,List<GoodsView>> goodsMap = goodsShowQueryService.queryGoodsView(map);
            String orderGoods = StringUtils.getUUID() ;
            session.setAttribute(orderGoods,goodsMap);
            model.addAttribute("goodsMap", goodsMap);
            model.addAttribute("orderGoods",orderGoods);
        } catch (BusinessException e) {
            model.addAttribute("errorMessage", e.getDisplayMessage());
            logger.error("查找找商品信息出错",e);
            return false;
        }

        User user  = UserUtils.getUser(session) ;
        List<UserAddress> addressList = userAddressServcie.queryAddressByUserId(user.getUserId());
        List<Area> provinceList = areaService.queryAllProvince();

        model.addAttribute("addressList",addressList);
        model.addAttribute("provinceList",provinceList);

        return true;
    }

    @RequestMapping("submitOrder")
    public String settle(@RequestParam("addressId") Long addressId,String orderGoods,
                         String remark,@RequestParam(value = "integral",defaultValue = "0") int integral,
                         String invoiceTitle,Short invoiceType,Short invoiceProductType,  ModelMap modelMap,
                         HttpSession session) {

        Map<String,List<GoodsView>> goodsMap = (Map<String,List<GoodsView>>)session.getAttribute(orderGoods);
        if(goodsMap==null){
            modelMap.addAttribute("errorMessage","请选择商品");
            return "common/error";
        }
        session.removeAttribute(orderGoods);
//    	List<BuyedGoods> goodsList = getGoodsList(jsonGoods);
//        Map map = JsonUtil.jsonToObject(jsonGoods);
        OrderPO orderPO = new OrderPO();
        orderPO.setRemark(remark);
        orderPO.setUserName(UserUtils.getUserName(session));
        orderPO.setUserId(UserUtils.getUserId(session));
        orderPO.setAddressId(addressId);
        orderPO.setUseIntegral(integral);
        if(StringUtils.isNotEmpty(invoiceTitle)){
            orderPO.setInvoiceProductType(invoiceProductType);
            orderPO.setInvoiceType(invoiceType);
            orderPO.setInvoiceTitle(invoiceTitle);
        }
        try{
        	orderPO.setGoodsMap(goodsMap);
            createOrderService.createOrder(orderPO) ;
        } catch (BusinessException e) {

            logger.error("创建订单失败"+goodsMap,e);
            modelMap.addAttribute("errorMessage",e.getMessage());
            return "common/error";
        }
        return "order/buySuccess";
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
