package com.mission.shop.order.common.code;

/**
 * User: hexizheng@163.com
 * Date: 14-6-24
 * Time: 下午9:39
 */
public enum PaymentStatus {

    INIT((short)1,"初始"),
    PAYING((short)2,"支付中"),
    PAYED((short)3,"支付成功"),
    FAIL((short)4,"支付失败");




    private short code;
    private String name;

    private PaymentStatus(short code, String name) {
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
