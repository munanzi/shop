package com.mission.shop.product.service.product;

import com.mission.shop.base.common.exception.BusinessException;

/**
 * User: hexizheng@163.com
 * Date: 14-6-30
 * Time: 下午10:23
 */
public interface FullProductService {


    /**
     * 查询商品的所有相关属性
     * @param productId
     * @return
     * @throws BusinessException 找不到product时抛出
     */
    public FullProduct queryFullProduct(Long productId)throws BusinessException;
}
