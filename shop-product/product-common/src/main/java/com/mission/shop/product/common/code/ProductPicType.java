package com.mission.shop.product.common.code;

/**
 * User: hexizheng@163.com
 * Date: 14-6-24
 * Time: 下午9:39
 */
public enum ProductPicType {

    SEARCH_MAIN((short)1,"搜索首页图片"),
    PRODUCT_DETAIL_PIC((short)2,"详情页左侧展示图片"),
    SPEC_PIC((short)3,"对应规格goods的图片");


    private short code;
    private String name;

    private ProductPicType(short code, String name) {
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
