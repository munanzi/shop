package com.mission.shop.product.common.code;

/**
 * User: hexizheng@163.com
 * Date: 14-6-24
 * Time: 下午9:39
 * product_attr 表 attr_type 属性
 */
public enum ProductAttrType {

    SPEC_ATTR(1,"规格属性"),
    USUAL_ATTR(2,"常用属性"),
    GENERAL_ATTR(3,"一般属性");


    private int code;
    private String name;

    private ProductAttrType(int code, String name) {
        this.code = code;
        this.name = name;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
