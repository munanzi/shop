package com.mission.shop.product.service.productdetail;

import com.mission.shop.product.dao.model.ProductDetail;

/**
 * User: hexizheng@163.com
 * Date: 14-6-30
 * Time: 下午9:02
 */
public interface ProductDetailService {
    public ProductDetail queryByProductId(Long productId);
}
