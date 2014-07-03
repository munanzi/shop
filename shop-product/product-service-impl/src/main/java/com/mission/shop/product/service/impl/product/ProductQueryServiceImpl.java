package com.mission.shop.product.service.impl.product;

import com.mission.shop.base.common.exception.BusinessException;
import com.mission.shop.product.common.code.ProductStatus;
import com.mission.shop.product.dao.mapper.ProductMapper;
import com.mission.shop.product.dao.model.Product;
import com.mission.shop.product.dao.model.ProductExample;
import com.mission.shop.product.service.product.FullProduct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mission.shop.product.service.product.ProductQueryService;

import java.util.List;

@Service
public class ProductQueryServiceImpl implements ProductQueryService{

    @Autowired
    private ProductMapper productMapper;
//    public List<Product> queryByCatId(Long catId){
//        ProductExample example = new ProductExample();
//        example.createCriteria();
//        productMapper.selectByExample()
//        return null;
//    }

    public Product QueryProduct(Long productId)throws BusinessException{

        Product product = productMapper.selectByPrimaryKey(productId);
        if(product==null){
            throw new BusinessException("商品不存在") ;
        }
        return product;
    }

    @Override
    public Product QueryProduct(Long productId, ProductStatus status) {
        ProductExample example = new ProductExample();
        example.createCriteria().andProductIdEqualTo(productId)
                .andStatusEqualTo(status.getCode()) ;
        List<Product> list = productMapper.selectByExample(example);
        if(list.isEmpty()){
            return null;
        }else{
            return list.get(0);
        }

    }



}
