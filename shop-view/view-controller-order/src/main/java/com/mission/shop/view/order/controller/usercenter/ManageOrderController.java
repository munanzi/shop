package com.mission.shop.view.order.controller.usercenter;

import com.mission.shop.base.common.page.Pager;
import com.mission.shop.order.dao.model.QueryOrderPO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * User: hexizheng@163.com
 * Date: 14-12-12
 * Time: 上午11:15
 */

@Controller
@RequestMapping("manageOrder")

public class ManageOrderController {

    private Logger logger = (Logger) LoggerFactory.getLogger(getClass());

    @RequestMapping("refund")
    @ResponseBody
    public Map<String,String> refund(long orderId,String remark,HttpSession session,ModelMap model){
        Map<String,String> retMap = new HashMap<String,String>();

        return retMap;
    }

}
