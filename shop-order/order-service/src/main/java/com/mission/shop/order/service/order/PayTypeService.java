package com.mission.shop.order.service.order;

import com.mission.shop.product.common.code.PayType;

/**
 * User: hexizheng@163.com
 * Date: 14-7-27
 * Time: 下午8:58
 */
public interface PayTypeService {

    /**
     * 计算订单支付方式
     * @return
     */
    public PayType getPayType();
}
