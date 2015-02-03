package com.mission.shop.order.common.returncode;

import com.mission.shop.base.common.exception.ReturnCode;

public enum OrderReturnCode implements ReturnCode{

    ORDER_NOT_EXIST("3001","订单不存在"),
    CANCEL_ORDER_FAIL("3002","当前订单状态不能取消订单"),
    CHANGE_STATUS_PAYING_FAIL("3003","当前订单状态不能支付"),
    CHANGE_STATUS_PAYED_FAIL("3004","当前订单状态不能支付成功"),
    CHANGE_STATUS_SENDOFF_FAIL("3005","当前订单状态不能发货")
	;
	
	private String code;
	private String message;
	
	OrderReturnCode(String code,String msg){
		this.code = code;
		this.message = msg;
	}
	
	public String getCode(){
		return code;
	}
	public String getMessage(){
		return message;
	}
}
