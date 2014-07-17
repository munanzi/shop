package com.mission.shop.product.service.impl.productpic;


import com.mission.shop.product.common.code.ProductPicType;
import com.mission.shop.product.common.constants.ProductConstants;
import com.mission.shop.product.dao.mapper.ProductPicMapper;
import com.mission.shop.product.dao.model.ProductExample;
import com.mission.shop.product.dao.model.ProductPic;
import com.mission.shop.product.dao.model.ProductPicExample;
import com.mission.shop.product.service.productpic.ProductPicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * User: hexizheng@163.com
 * Date: 14-7-17
 * Time: 下午1:26
 */
@Service
public class ProductPicServiceImpl implements ProductPicService {

    @Autowired
    private ProductPicMapper productPicMapper;
    public List<ProductPic> queryProductDetailImg(Long productId) {

        ProductPicExample example = new ProductPicExample();
        example.createCriteria().andProductIdEqualTo(productId)
                .andStatusEqualTo(ProductConstants.NORMAL_STATUS)
                .andUseTypeEqualTo(ProductPicType.PRODUCT_DETAIL_PIC.getCode());
        return productPicMapper.selectByExample(example);
    }
}
