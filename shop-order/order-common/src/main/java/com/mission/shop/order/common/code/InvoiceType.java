package com.mission.shop.order.common.code;

/**
 * User: hexizheng@163.com
 * Date: 14-6-24
 * Time: 下午9:39
 */
public enum InvoiceType {

    NORMAL((short)1,"普通发票"),
    VALUE_ADDED_TAX((short)2,"增值税发票");


    private short code;
    private String name;

    private InvoiceType(short code, String name) {
        this.code = code;
        this.name = name;
    }

    public static boolean isCodeExist(short code){

        for (InvoiceType invoiceType : values()) {
           if(invoiceType.getCode()==code){
               return true;
           }
        }
        return false;
    }

    public static String getNameByCode(short code){
        for (InvoiceType invoiceType : values()) {
            if(invoiceType.getCode()==code){
                return invoiceType.getName();
            }
        }
        return "";
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
