package com.mission.shop.order.service.ordergoods;

import java.util.List;

import com.mission.shop.base.common.exception.BusinessException;
import com.mission.shop.order.service.order.BuyedGoods;

/**
 * User: hexizheng@163.com
 * Date: 14-7-22
 * Time: 下午9:45
 */
public interface OrderGoodsManageService {

    /**
     * 保存订单商品
     * @param orderId
     * @param goodsId
     * @param price
     * @param num
     */
    public Long saveOrderGoods(Long orderId,Long goodsId,int price,int num)throws BusinessException;
    
    /**
     * 保存订单商品
     * @param orderId
     */
    public void saveOrderGoods(Long orderId,List<BuyedGoods> list)throws BusinessException;
}
