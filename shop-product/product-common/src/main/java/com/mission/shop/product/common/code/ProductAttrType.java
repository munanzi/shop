package com.mission.shop.product.common.code;

/**
 * User: hexizheng@163.com
 * Date: 14-6-24
 * Time: 下午9:39
 * product_attr 表 attr_type 属性
 */
public enum ProductAttrType {

    SPEC_ATTR((short)1,"规格属性"),
    USUAL_ATTR((short)2,"常用属性"),
    GENERAL_ATTR((short)3,"一般属性");


    private short code;
    private String name;

    private ProductAttrType(short code, String name) {
        this.code = code;
        this.name = name;
    }

    public short getCode() {
        return code;
    }

    public void setCode(short code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
