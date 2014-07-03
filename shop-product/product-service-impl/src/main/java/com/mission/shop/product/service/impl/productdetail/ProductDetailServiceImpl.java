package com.mission.shop.product.service.impl.productdetail;

import com.mission.shop.product.dao.mapper.ProductDetailMapper;
import com.mission.shop.product.dao.model.ProductDetail;
import com.mission.shop.product.dao.model.ProductDetailExample;
import com.mission.shop.product.service.productdetail.ProductDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * User: hexizheng@163.com
 * Date: 14-6-27
 * Time: 下午10:32
 */
@Service
public class ProductDetailServiceImpl implements ProductDetailService{

    @Autowired
    private ProductDetailMapper productDetailMapper;

    public ProductDetail queryByProductId(Long productId){

        ProductDetailExample example = new ProductDetailExample();
        example.createCriteria().andProductIdEqualTo(productId);
        List<ProductDetail> list = productDetailMapper.selectByExample(example);
        if(list.isEmpty()){
            return null;
        }else {
            return list.get(0);
        }

    }

}
