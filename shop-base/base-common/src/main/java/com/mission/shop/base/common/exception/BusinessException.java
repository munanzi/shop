package com.mission.shop.base.common.exception;

import org.springframework.util.StringUtils;

/**
 * 业务异常
 * 
 * @author hexizheng
 * 
 */
public class BusinessException extends Exception {

	private static final long serialVersionUID = -5995434434196299378L;

	private String buisinessCode;

	public BusinessException() {
		super();
	}

	public BusinessException(String message) {
		super(message);
	}

	public BusinessException(String code, String message) {
		super(message);
		buisinessCode = code;
	}

	public BusinessException(String message, Throwable t) {
		super(message, t);
	}

	public BusinessException(String code, String message, Throwable t) {
		super(message, t);
		buisinessCode = code;
	}

	public String getBuisinessCode() {
		return buisinessCode;
	}
	public boolean isExistCode(){
		if(StringUtils.isEmpty(buisinessCode)){
			return false;
		}else{
			return true;
		}
	}
}
