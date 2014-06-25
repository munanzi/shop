package com.mission.shop.product.service.impl.productcat;

import com.mission.shop.product.common.code.ProductStatus;
import com.mission.shop.product.dao.mapper.ProductCatMapper;
import com.mission.shop.product.dao.model.Product;
import com.mission.shop.product.dao.model.ProductCat;
import com.mission.shop.product.dao.model.ProductCatExample;
import com.mission.shop.product.dao.model.ProductExample;
import com.mission.shop.product.service.product.ProductQueryService;
import com.mission.shop.product.service.productCat.ProductCatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * User: hexizheng@163.com
 * Date: 14-6-24
 * Time: 上午10:16
 */
@Service
public class ProductCatServiceImpl implements ProductCatService {

    @Autowired
    private ProductCatMapper productCatMapper;

    @Autowired
    private ProductQueryService productQueryService;

    public List<ProductCat> queryByCatId(Long catId){
        //TODO 分页
        ProductCatExample example = new ProductCatExample();
        example.createCriteria().andCatIdEqualTo(catId);
        example.setOrderByClause(" sort_order ");
        List<ProductCat> list = productCatMapper.selectByExample(example);
        return list;
    }

    public List<Product> queryProductByCatId(Long catId){
        List<Product> productList = new ArrayList<Product>();
        //TODO 分页
        List<ProductCat> list = queryByCatId(catId);
        for(ProductCat productCat:list){
            Product product = productQueryService.QueryProduct(productCat.getProductId(), ProductStatus.ON_SALE);
            if(product!=null){
                productList.add(product);
            }
        }
        return productList;
    }

}
