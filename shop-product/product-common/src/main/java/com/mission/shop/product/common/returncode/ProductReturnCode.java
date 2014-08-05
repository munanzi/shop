package com.mission.shop.product.common.returncode;

import com.mission.shop.base.common.exception.ReturnCode;

public enum ProductReturnCode implements ReturnCode {
	
	NOT_EXIST("2000","商品不存在"),
	OFF_SALE("2001","此规格商品已下架"),
	OUT_OF_STOCK("2002","商品已售完");


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
