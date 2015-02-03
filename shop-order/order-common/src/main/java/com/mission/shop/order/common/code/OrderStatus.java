package com.mission.shop.order.common.code;

import java.util.HashMap;
import java.util.Map;

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
    REFUND_SUCCESS((short)8,"退货成功"),
    REFUSE_REFUND((short)9,"拒绝退货"),
    CLOSED((short)10,"交易关闭");


    private final short code;
    private final String name;

    private OrderStatus(short code, String name) {
        this.code = code;
        this.name = name;

    }

    public short getCode() {
        return code;
    }

    public String getName() {
        return name;
    }


    public static Map<Short,String> getOrderStatusMap(){
        Map<Short,String> map = new HashMap<Short,String>();
        for(OrderStatus status:values()){
            map.put(status.getCode(),status.getName());
        }
        return map;
    }


}
