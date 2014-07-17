package com.mission.shop.product.service.productpic;

import com.mission.shop.product.dao.model.ProductPic;

import java.util.List;

/**
 * User: hexizheng@163.com
 * Date: 14-7-15
 * Time: 下午8:20
 */
public interface ProductPicService {

    /**
     * 查询商品详情页的图片列表
     * @param productId  商品id
     * @return
     */
    public List<ProductPic> queryProductDetailImg(Long productId) ;

}
