package com.mission.shop.product.common.code;

/**
 * User: hexizheng@163.com
 * Date: 14-6-24
 * Time: 下午9:39
 */
public enum PayType {

    CASH_ON_DELIVERY((short)1,"货到付款"),
    ONLINE_PAY((short)2,"在线支付"),
    ALL((short)3,"都支持");


    private short code;
    private String name;

    private PayType(short code, String name) {
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
