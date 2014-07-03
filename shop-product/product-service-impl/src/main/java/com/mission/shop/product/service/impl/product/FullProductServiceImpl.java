package com.mission.shop.product.service.impl.product;

import com.mission.shop.base.common.exception.BusinessException;
import com.mission.shop.product.dao.model.Product;
import com.mission.shop.product.dao.model.ProductAttr;
import com.mission.shop.product.dao.model.ProductComment;
import com.mission.shop.product.dao.model.ProductDetail;
import com.mission.shop.product.service.product.FullProduct;
import com.mission.shop.product.service.product.FullProductService;
import com.mission.shop.product.service.product.ProductQueryService;
import com.mission.shop.product.service.productattr.ProductAttrService;
import com.mission.shop.product.service.productcomment.ProductCommentService;
import com.mission.shop.product.service.productdetail.ProductDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * User: hexizheng@163.com
 * Date: 14-6-30
 * Time: 下午10:24
 */
@Service
public class FullProductServiceImpl implements FullProductService {

    @Autowired
    private ProductQueryService productQueryService;
    @Autowired
    private ProductDetailService productDetailService;
    @Autowired
    private ProductAttrService productAttrService;
    @Autowired
    private ProductCommentService productCommentService;


    @Override
    public FullProduct queryFullProduct(Long productId) throws BusinessException {

        FullProduct fullProduct = new FullProduct();
        Product product = productQueryService.QueryProduct(productId);
        ProductDetail productDetail = productDetailService.queryByProductId(productId);
        List<ProductComment> commentList = productCommentService.queryByProductId(productId);
        List<ProductAttr> normalAttrlist =  productAttrService.queryNormalAttrByProductId(productId);
        List<ProductAttr> specAttrlist =  productAttrService.querySpecAttrByProductId(productId);

        fullProduct.setProduct(product);
        fullProduct.setProductDetail(productDetail);
        fullProduct.setCommentList(commentList);
        fullProduct.setNormalAttrList(normalAttrlist);
        fullProduct.setNormalAttrList(specAttrlist);
        return null;
    }

}
