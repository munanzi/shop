package com.mission.shop.product.service.goods;

import com.mission.shop.base.common.exception.BusinessException;

/**
 * User: hexizheng@163.com
 * Date: 14-7-23
 * Time: 下午9:20
 */
public interface GoodsPriceService {
    /**
     * 获取商品价格
     * @param goodsId
     * @return 价格
     * @throws BusinessException 货品不存在
     */
    public int getGoodsPrice(Long goodsId) throws BusinessException;
}
