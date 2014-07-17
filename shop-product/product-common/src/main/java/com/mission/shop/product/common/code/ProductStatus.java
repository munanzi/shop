package com.mission.shop.product.common.code;

/**
 * User: hexizheng@163.com
 * Date: 14-6-24
 * Time: 下午9:39
 */
public enum ProductStatus {

    ON_SALE((short)1,"上架"),
    OFF_SALE((short)2,"下架"),
    INIT((short)3,"初始"),
    VERIFYING((short)4,"待审核") ,
    REFUSED((short)5,"拒绝"),
    DELETED((short)6,"已删除");


    private short code;
    private String name;

    private ProductStatus(short code, String name) {
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
