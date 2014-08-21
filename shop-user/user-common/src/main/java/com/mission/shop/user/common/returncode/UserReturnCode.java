package com.mission.shop.user.common.returncode;

import com.mission.shop.base.common.exception.ReturnCode;

public enum UserReturnCode implements ReturnCode{

	USER_NOT_EXIST("1000","用户不存在"),
	NOT_ENOUGH_INTEGRAL("1001","用户积分不足"),
	ADDREESS_OVER_LIMIT("1002","地址列表过多，请先删除部分地址"),
	
	
	
	
	SYSTEM_ERROR("1999","系统繁忙");

	private String code;
	private String message;

	UserReturnCode(String code, String msg){
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
