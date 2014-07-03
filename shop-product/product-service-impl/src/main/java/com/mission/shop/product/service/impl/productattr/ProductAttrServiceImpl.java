package com.mission.shop.product.service.impl.productattr;

import com.mission.shop.base.common.exception.BusinessException;
import com.mission.shop.product.common.constants.ProductConstants;
import com.mission.shop.product.dao.mapper.ProductAttrMapper;
import com.mission.shop.product.dao.model.ProductAttr;
import com.mission.shop.product.dao.model.ProductAttrExample;
import com.mission.shop.product.service.productattr.ProductAttrService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * User: hexizheng@163.com
 * Date: 14-6-30
 * Time: 下午9:10
 */
public class ProductAttrServiceImpl implements ProductAttrService {

    @Autowired
    private ProductAttrMapper productAttrMapper;

    @Override
    public List<ProductAttr> queryNormalAttrByProductId(Long productId) {

        ProductAttrExample example = new ProductAttrExample();
        example.createCriteria().andProductIdEqualTo(productId)
                .andIsSpecAttrNotEqualTo(ProductConstants.SPEC_ATTR);
        example.setOrderByClause(" sort_order ");
        return productAttrMapper.selectByExample(example);
    }
    @Override
    public List<ProductAttr> querySpecAttrByProductId(Long productId) {

        ProductAttrExample example = new ProductAttrExample();
        example.createCriteria().andProductIdEqualTo(productId)
                .andIsSpecAttrEqualTo(ProductConstants.SPEC_ATTR);
        example.setOrderByClause(" sort_order ");
        return productAttrMapper.selectByExample(example);
    }
}
