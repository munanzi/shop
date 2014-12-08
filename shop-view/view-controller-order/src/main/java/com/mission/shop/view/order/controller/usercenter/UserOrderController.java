package com.mission.shop.view.order.controller.usercenter;

import com.mission.shop.base.common.page.Pager;
import com.mission.shop.order.common.code.OrderStatus;
import com.mission.shop.order.dao.model.Order;
import com.mission.shop.order.dao.model.QueryOrderPO;
import com.mission.shop.order.dao.model.QueryOrderRO;
import com.mission.shop.order.service.impl.order.OrderQueryServiceImpl;
import com.mission.shop.order.service.order.OrderQueryService;
import com.mission.shop.view.order.util.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
        Map<String,List<QueryOrderRO>> orderMap = getOrderMap(orderList);
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
    private Map<String,List<QueryOrderRO>> getOrderMap(List<QueryOrderRO> list){
        Map<String,List<QueryOrderRO>> map = new HashMap();
        for(QueryOrderRO queryOrderRO:list){
            String shopName = queryOrderRO.getShopName();
            list = map.get(shopName);
            if(list==null){
                list = new ArrayList<QueryOrderRO>();
            }
            list.add(queryOrderRO);
            map.put(shopName,list);

        }
        return map;
    }
}
