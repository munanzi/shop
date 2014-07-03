package com.mission.shop.product.service.productattr;

import com.mission.shop.product.dao.model.ProductAttr;

import java.util.List;

/**
 * User: hexizheng@163.com
 * Date: 14-6-30
 * Time: 下午9:08
 */
public interface ProductAttrService {

    public List<ProductAttr> queryNormalAttrByProductId(Long productId);
    public List<ProductAttr> querySpecAttrByProductId(Long productId);
}
