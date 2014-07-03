package com.mission.shop.product.service.product;

import com.mission.shop.product.dao.model.Product;
import com.mission.shop.product.dao.model.ProductAttr;
import com.mission.shop.product.dao.model.ProductComment;
import com.mission.shop.product.dao.model.ProductDetail;

import java.util.List;

/**
 * User: hexizheng@163.com
 * Date: 14-6-30
 * Time: 下午10:17
 */
public class FullProduct {

    private Product product;
    private ProductDetail productDetail;
    private List<ProductAttr> normalAttrList;
    private List<ProductAttr> specAttrList;
    private List<ProductComment> commentList;


    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public ProductDetail getProductDetail() {
        return productDetail;
    }

    public void setProductDetail(ProductDetail productDetail) {
        this.productDetail = productDetail;
    }

    public List<ProductAttr> getNormalAttrList() {
        return normalAttrList;
    }

    public void setNormalAttrList(List<ProductAttr> normalAttrList) {
        this.normalAttrList = normalAttrList;
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
