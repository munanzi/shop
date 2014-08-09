package com.mission.shop.order.service.order;

import com.mission.shop.base.common.exception.BusinessException;
import com.mission.shop.order.dao.model.Order;

import java.util.List;
import java.util.Map;

/**
 * User: hexizheng@163.com
 * Date: 14-7-17
 * Time: 下午3:36
 */
public interface CreateOrderService {

    /**
     * 创建订单
     * @param orderPO
     * @throws BusinessException
     */
    public List<Order> createOrder(OrderPO orderPO)throws BusinessException;
}
