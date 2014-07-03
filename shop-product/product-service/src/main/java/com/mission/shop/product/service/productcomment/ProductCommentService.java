package com.mission.shop.product.service.productcomment;

import com.mission.shop.product.dao.model.ProductComment;

import java.util.List;

/**
 * User: hexizheng@163.com
 * Date: 14-6-30
 * Time: 下午9:36
 */
public interface ProductCommentService {

    public List<ProductComment> queryByProductId(Long productId);
}
