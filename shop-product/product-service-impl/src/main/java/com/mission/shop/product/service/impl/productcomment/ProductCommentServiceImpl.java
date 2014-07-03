package com.mission.shop.product.service.impl.productcomment;

import com.mission.shop.product.common.code.ProductCommentStatus;
import com.mission.shop.product.dao.mapper.ProductCommentMapper;
import com.mission.shop.product.dao.model.ProductComment;
import com.mission.shop.product.dao.model.ProductCommentExample;
import com.mission.shop.product.service.productcomment.ProductCommentService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * User: hexizheng@163.com
 * Date: 14-6-30
 * Time: 下午9:53
 */
public class ProductCommentServiceImpl implements ProductCommentService {

    @Autowired
    private ProductCommentMapper productCommentMapper;

    @Override
    public List<ProductComment> queryByProductId(Long productId) {

        ProductCommentExample example = new ProductCommentExample();
        example.createCriteria().andProductIdEqualTo(productId)
                .andStatusEqualTo(ProductCommentStatus.NORMAL.getCode());
        return productCommentMapper.selectByExample(example);
    }
}
