package com.mission.shop.product.common.returncode;

public enum ProductReturnCode {
	
	NOT_EXIST("2000","");
	
	private String code;
	private String message;
	
	ProductReturnCode(String code,String msg){
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
