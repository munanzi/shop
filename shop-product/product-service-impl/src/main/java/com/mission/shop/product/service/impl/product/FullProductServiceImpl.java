package com.mission.shop.product.service.impl.product;

import com.mission.shop.base.common.exception.BusinessException;
import com.mission.shop.base.common.utils.JsonUtil;
import com.mission.shop.base.common.utils.StringUtils;
import com.mission.shop.product.dao.model.*;
import com.mission.shop.product.service.goods.GoodsQueryService;
import com.mission.shop.product.service.product.FullProduct;
import com.mission.shop.product.service.product.FullProductService;
import com.mission.shop.product.service.product.ProductQueryService;
import com.mission.shop.product.service.productattr.ProductAttrService;
import com.mission.shop.product.service.productcomment.ProductCommentService;
import com.mission.shop.product.service.productdetail.ProductDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    @Autowired
    private GoodsQueryService goodsQueryService;

    @Override
    public FullProduct queryFullProduct(Long productId) throws BusinessException {

        FullProduct fullProduct = new FullProduct();
        Product product = productQueryService.QueryProduct(productId);
//        Goods goods = goodsQueryService.queryMostSailByProductId(productId);
        ProductDetail productDetail = productDetailService.queryByProductId(productId);
        List<ProductComment> commentList = productCommentService.queryByProductId(productId);
        List<ProductAttr> usualAttrList =  productAttrService.queryUsualAttrByProductId(productId);
        List<ProductAttr> specAttrList =  productAttrService.querySpecAttrByProductId(productId);
        Map<String,List<ProductAttr>> attrMap = productAttrService.queryGroupAttrsByProductId(productId);
        fullProduct.setProduct(product);
        fullProduct.setProductDetail(productDetail);
        fullProduct.setCommentList(commentList);
        fullProduct.setUsualAttrList(usualAttrList);
        fullProduct.setSpecAttrList(specAttrList);
        fullProduct.setGroupAttrsMap(attrMap);
//        fullProduct.setGoods(goods);
//        if(StringUtils.isEmpty(goods.getSpec()))  {
//            fullProduct.setSpecMap(new HashMap()) ;
//        } else{
//            Map map = JsonUtil.jsonToObject(goods.getSpec());
//            fullProduct.setSpecMap(map);
//        }
        return fullProduct;
    }

}
