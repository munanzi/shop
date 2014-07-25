package com.mission.shop.order.common.code;

/**
 * User: hexizheng@163.com
 * Date: 14-6-24
 * Time: 下午9:39
 */
public enum OrderStatus {

    INIT((short)1,"初始下单"),
    PAYING((short)2,"支付中"),
    PAYED((short)3,"支付成功"),
    SEND_OFF((short)4,"已发货") ,
    SUCCESS((short)5,"交易成功") ,
    APPLY_REFUND((short)6,"退货申请中"),
    AGREE_REFUND((short)7,"已同意退货"),
    REFUD_SUCCESS((short)8,"退货成功"),
    REFUSE_REFUND((short)9,"拒绝退货");


    private short code;
    private String name;

    private OrderStatus(short code, String name) {
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
