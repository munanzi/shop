package com.mission.shop.order.service.order;

import com.mission.shop.base.common.exception.BusinessException;
import com.mission.shop.order.dao.model.Order;

import java.util.Map;

/**
 * User: hexizheng@163.com
 * Date: 14-7-17
 * Time: 下午3:36
 */
public interface CreateOrderService {

    /**
     * 创建订单
     * @param goodsId
     * @param num 购买数量
     * @return
     * @throws BusinessException
     */

    public Order createOrder(Long goodsId,int num)throws BusinessException;

    /**
     * 创建订单
     * @param map <goodsId,num>
     * @param
     * @return
     * @throws BusinessException
     */

    public Order createOrder(Map<String,String> map)throws BusinessException;
}
