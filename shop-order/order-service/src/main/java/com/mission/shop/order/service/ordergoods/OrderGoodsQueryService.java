package com.mission.shop.order.service.ordergoods;

import com.mission.shop.order.dao.model.OrderGoods;

import java.util.List;

/**
 * User: hexizheng@163.com
 * Date: 14-12-10
 * Time: 上午11:19
 */
public interface OrderGoodsQueryService {

    List<OrderGoods> queryOrderGoodsByOrderId(Long orderId);
}
