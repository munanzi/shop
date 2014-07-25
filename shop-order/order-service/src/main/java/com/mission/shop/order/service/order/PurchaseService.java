package com.mission.shop.order.service.order;

import com.mission.shop.base.common.exception.BusinessException;

import java.util.Map;

/**
 * User: hexizheng@163.com
 * Date: 14-7-20
 * Time: 下午12:45
 */
public interface PurchaseService {

    /**
     * 把购买的商品按照商户分组
     * @param goodsMap  key goodsId,  value goods Num
     * @return  Map<shopId,Map<goodsId,goodsNum>>
     */
    public Map<Long,Map<Long,Integer>> getShopGoods(Map<String,String> goodsMap)  throws BusinessException;
}
