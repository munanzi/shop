package com.mission.shop.product.common.code;

/**
 * User: hexizheng@163.com
 * Date: 14-6-24
 * Time: 下午9:39
 */
public enum ProductStatus {

    ON_SALE(1000,"上架"),
    OFF_SALE(1001,"下架"),
    INIT(1002,"初始"),
    VERIFYING(1003,"待审核") ,
    REFUSED(1004,"拒绝"),
    DELETED(1005,"已删除");


    private int code;
    private String name;

    private ProductStatus(int code, String name) {
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
