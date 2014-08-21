package com.mission.shop.user.common.code;

/**
 * User: hexizheng@163.com
 * Date: 14-6-21
 * Time: 下午9:36
 */
public enum UserAddressStatus {

	DEFAULT((short)1,"默认地址"),
    NORMAL((short)2,"常用地址");

    private short code;
    private String name;

    private UserAddressStatus(short code, String name) {
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
