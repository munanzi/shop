package com.mission.shop.view.order.controller.usercenter;

import com.mission.shop.base.common.exception.BusinessException;
import com.mission.shop.base.common.page.Pager;
import com.mission.shop.order.common.code.OrderStatus;
import com.mission.shop.order.dao.model.*;
import com.mission.shop.order.service.impl.order.OrderQueryServiceImpl;
import com.mission.shop.order.service.order.OrderQueryService;
import com.mission.shop.order.service.orderaddress.OrderAddressService;
import com.mission.shop.order.service.ordergoods.OrderGoodsQueryService;
import com.mission.shop.view.order.util.UserUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * User: hexizheng@163.com
 * Date: 14-11-4
 * Time: 上午10:18
 */
@Controller
@RequestMapping("userCenter")
public class UserOrderController {

    @Autowired
    private OrderQueryService orderQueryService;

    @Autowired
    private OrderGoodsQueryService orderGoodsQueryService;

    @Autowired
    private OrderAddressService orderAddressService;

    private Logger logger = (Logger) LoggerFactory.getLogger(getClass());

    @RequestMapping("orderList")
    public String orderlist(QueryOrderPO queryOrderPO,Pager pager,HttpSession session,ModelMap model){


        queryOrderPO.setBuyerId(UserUtils.getUserId(session));

        // 获取总条数
        int totalItem = orderQueryService.countOrder(queryOrderPO);

        // 设置总数
        pager.setTotalItem(totalItem);

        // 计算分页开始条数，并设值
        queryOrderPO.setSkipNum(pager.getStartItem());
        // 计算分页结束条数，并设值
        queryOrderPO.setPageSize(pager.getPageSize());

        List<QueryOrderRO> orderList = orderQueryService.queryOrder(queryOrderPO);
        Map<Long,List<QueryOrderRO>> orderMap = getOrderMap(orderList);
        model.addAttribute("orderMap",orderMap);
        model.addAttribute("queryOrderPO",queryOrderPO);
        model.addAttribute("statusMap", OrderStatus.getOrderStatusMap());
        model.addAttribute("pager", pager);
        return "order/userCenter/orderList" ;
    }







    /**
     * 重新组织数据接口，用于前段展示
     * @param list
     * @return Map<String,List<QueryOrderRO>>
     */
    private Map<Long,List<QueryOrderRO>> getOrderMap(List<QueryOrderRO> list){
        Map<Long,List<QueryOrderRO>> map = new TreeMap(Collections.reverseOrder());
        for(QueryOrderRO queryOrderRO:list){
            Long orderId = queryOrderRO.getOrderId();
            list = map.get(orderId);
            if(list==null){
                list = new ArrayList<QueryOrderRO>();
            }
            list.add(queryOrderRO);
            map.put(orderId,list);

        }
        return map;
    }




    @RequestMapping("orderDetail")
    public String orderDetail(long orderId,HttpSession session,ModelMap model){
        try {
            Order order = orderQueryService.queryOrderbyOrderId(orderId);
            List<OrderGoods> goodsList = orderGoodsQueryService.queryOrderGoodsByOrderId(orderId);
            OrderAddress orderAddress = orderAddressService.queryOrderAddress(orderId);

            model.addAttribute("order",order);
            model.addAttribute("goodsList",goodsList);
            model.addAttribute("orderAddress",orderAddress);
            model.addAttribute("statusMap", OrderStatus.getOrderStatusMap());

        } catch (BusinessException e) {
            logger.error("查询订单出错",e);
            return "common/error";
        }

        return "order/userCenter/orderDetail";
    }

}