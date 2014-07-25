package com.mission.shop.product.service.goods;

import com.mission.shop.base.common.exception.BusinessException;

/**
 *
 * 计算商品库存销量
 * User: hexizheng@163.com
 * Date: 14-7-23
 * Time: 下午9:28
 */


public interface GoodsStockService {

    /**
     * 商品减库存
     * @param goodsId
     * @throws BusinessException 商品不存在或，库存不足
     */
    public void subStock(Long goodsId,int num) throws BusinessException;
    /**
     * 商品增加库存
     * @param goodsId
     * @throws BusinessException 商品不存在
     */
    public void addStock(Long goodsId,int num) throws BusinessException;
}
