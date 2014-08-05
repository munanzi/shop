package com.mission.shop.order.service.order;

import com.mission.shop.product.dao.model.Goods;

import java.util.List;

/**
 * User: hexizheng@163.com
 * Date: 14-7-27
 * Time: 下午8:05
 */
public interface IntegeralActivityService {

    /**
     * 订单完成后
     * 计算赠送的积分
     * @param
     * @return
     */
    public int getSentIntegral();
}
