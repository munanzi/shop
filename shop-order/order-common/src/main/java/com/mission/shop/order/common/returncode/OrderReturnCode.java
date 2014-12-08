package com.mission.shop.order.common.returncode;

import com.mission.shop.base.common.exception.ReturnCode;

public enum OrderReturnCode implements ReturnCode{

    ORDER_NOT_EXIST("3001","订单不存在")
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
