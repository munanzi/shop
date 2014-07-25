package com.mission.shop.order.common.code;

/**
 * User: hexizheng@163.com
 * Date: 14-6-24
 * Time: 下午9:39
 * 发票中商品类型
 */
public enum InvoiceProductType {

	/*1：办公用品  2：日用品   3：食品*/
	
    OFFICE_SUPPLIES((short)1,"办公用品"),
    DAILY_USE((short)2,"日用品"),
    FOOD((short)2,"食品");


    private short code;
    private String name;

    private InvoiceProductType(short code, String name) {
        this.code = code;
        this.name = name;
    }


    public static boolean isCodeExist(short code){

        for (InvoiceProductType invoiceProductType : values()) {
            if(invoiceProductType.getCode()==code){
                return true;
            }
        }
        return false;
    }

    public static String getNameByCode(short code){
        for (InvoiceProductType invoiceProductType : values()) {
            if(invoiceProductType.getCode()==code){
                return invoiceProductType.getName();
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
