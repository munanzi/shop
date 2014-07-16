package com.mission.shop.product.service.product;

import com.mission.shop.product.dao.model.*;

import java.util.List;
import java.util.Map;

/**
 * User: hexizheng@163.com
 * Date: 14-6-30
 * Time: 下午10:17
 */
public class FullProduct {

    private Product product;
    private Goods goods;
    private Map specMap;
    private ProductDetail productDetail;
    private List<ProductAttr> usualAttrList;
    private Map<String,List<ProductAttr>> groupAttrsMap;
    private List<ProductAttr> specAttrList;
    private List<ProductComment> commentList;
    private List<PackingList> packingList;
    private List<ProductPic> productPic;


    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Goods getGoods() {
        return goods;
    }

    public void setGoods(Goods goods) {
        this.goods = goods;
    }

    public Map getSpecMap() {
        return specMap;
    }

    public void setSpecMap(Map specMap) {
        this.specMap = specMap;
    }

    public ProductDetail getProductDetail() {
        return productDetail;
    }

    public void setProductDetail(ProductDetail productDetail) {
        this.productDetail = productDetail;
    }

    public List<ProductAttr> getUsualAttrList() {
        return usualAttrList;
    }

    public void setUsualAttrList(List<ProductAttr> usualAttrList) {
        this.usualAttrList = usualAttrList;
    }

    public Map<String, List<ProductAttr>> getGroupAttrsMap() {
        return groupAttrsMap;
    }

    public void setGroupAttrsMap(Map<String, List<ProductAttr>> groupAttrsMap) {
        this.groupAttrsMap = groupAttrsMap;
    }

    public List<ProductAttr> getSpecAttrList() {
        return specAttrList;
    }

    public void setSpecAttrList(List<ProductAttr> specAttrList) {
        this.specAttrList = specAttrList;
    }

    public List<ProductComment> getCommentList() {
        return commentList;
    }

    public void setCommentList(List<ProductComment> commentList) {
        this.commentList = commentList;
    }
}
