package com.mission.shop.product.service.productCat;

import com.mission.shop.product.dao.model.Product;
import com.mission.shop.product.dao.model.ProductCat;

import java.util.List;

/**
 * User: hexizheng@163.com
 * Date: 14-6-25
 * Time: 下午9:39
 */
public interface ProductCatService {

    public List<ProductCat> queryByCatId(Long catId);

    public List<Product> queryProductByCatId(Long catId);
}
