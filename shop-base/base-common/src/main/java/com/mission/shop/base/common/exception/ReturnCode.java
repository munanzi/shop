package com.mission.shop.base.common.exception;

public enum ReturnCode {
	
	;
	
	private String code;
	private String message;
	
	ReturnCode(String code,String msg){
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
