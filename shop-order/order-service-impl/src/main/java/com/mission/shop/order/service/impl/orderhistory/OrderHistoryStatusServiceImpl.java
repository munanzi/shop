package com.mission.shop.order.service.impl.orderhistory;

import com.mission.shop.order.common.code.OrderStatus;
import com.mission.shop.order.dao.mapper.OrderHistoryStatusMapper;
import com.mission.shop.order.dao.model.OrderHistoryStatus;
import com.mission.shop.order.service.orderhistory.OrderHistoryStatusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * User: hexizheng@163.com
 * Date: 14-7-29
 * Time: 下午9:24
 */
@Service
public class OrderHistoryStatusServiceImpl implements OrderHistoryStatusService {

    @Autowired
    private OrderHistoryStatusMapper orderHistoryStatusMapper;

    public void saveStatusHistory(Long orderId,OrderStatus status,String remark){

        OrderHistoryStatus orderHistoryStatus = new OrderHistoryStatus();
        orderHistoryStatus.setCreateTime(new Date());
        orderHistoryStatus.setOrderId(orderId);
        orderHistoryStatus.setStatus(status.getCode());
        orderHistoryStatus.setRemark(remark);
        orderHistoryStatusMapper.insert(orderHistoryStatus);
    }
}
