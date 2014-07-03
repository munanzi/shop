package com.mission.shop.product.common.code;

/**
 * User: hexizheng@163.com
 * Date: 14-6-30
 * Time: 下午9:58
 */
public enum ProductCommentStatus {

    NORMAL(1000,"正常"),
    DELETED(1001,"已删除");

    private int code;
    private String name;

    private ProductCommentStatus(int code, String name) {
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
