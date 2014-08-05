package com.mission.shop.order.service.orderhistory;

import com.mission.shop.order.common.code.OrderStatus;

/**
 * User: hexizheng@163.com
 * Date: 14-7-29
 * Time: 下午9:23
 */
public interface OrderHistoryStatusService {

    /**
     * 保存订单状态历史
     * @param orderId
     * @param status
     * @param remark
     */
    public void saveStatusHistory(Long orderId,OrderStatus status,String remark);
}
