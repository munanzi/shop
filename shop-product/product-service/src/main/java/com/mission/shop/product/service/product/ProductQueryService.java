package com.mission.shop.product.service.product;

import com.mission.shop.base.common.exception.BusinessException;
import com.mission.shop.product.common.code.ProductStatus;
import com.mission.shop.product.dao.model.Product;

import java.util.List;

public interface ProductQueryService {

//    public List<Product> queryByCatId(Long catId);

    /**
     * 主键查询，商品不存在时抛出异常
     * @param productId
     * @return Product
     * @throws BusinessException
     */
    public Product QueryProduct(Long productId)throws BusinessException ;

    /**
     * 主键和状态查询，没有查到结果时返回 null
     * @param productId
     * @return  Product  or  null
     * @throws
     */
    public Product QueryProduct(Long productId,ProductStatus status);


}
