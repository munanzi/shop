package com.mission.shop.user.common.code;

/**
 * User: hexizheng@163.com
 * Date: 14-6-21
 * Time: 下午9:36
 */
public enum UserStatus {

    NORMAL((short)1,"正常"),
    DELETED((short)2,"已删除"),
    BLACK_LIST((short)3,"黑名单");

    private short code;
    private String name;

    private UserStatus(short code, String name) {
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
