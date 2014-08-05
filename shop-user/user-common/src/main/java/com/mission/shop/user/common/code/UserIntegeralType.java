package com.mission.shop.user.common.code;

/**
 * 会员积分增减类型
 * User: hexizheng@163.com
 * Date: 14-6-24
 * Time: 下午9:39
 */
public enum UserIntegeralType {

    CONSUME_SEND((short)1,"消费赠送"),
    CONSUME_PAY((short)2,"积分消费"),
    REFUND_INTEGERAL((short)3,"退货退积分");


    private short code;
    private String name;

    private UserIntegeralType(short code, String name) {
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
