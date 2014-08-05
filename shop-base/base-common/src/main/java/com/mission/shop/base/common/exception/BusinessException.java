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

    private Long id;

	public BusinessException() {
		super();
	}

	public BusinessException(String message) {
		super(message);
	}
	public BusinessException(String message,Long id) {
		super("id=["+id+"]"+message);
	}

	public BusinessException(String code, String message) {
		super(message);
		buisinessCode = code;
	}
	public BusinessException(ReturnCode returnCode) {
		super(returnCode.getMessage());
		buisinessCode = returnCode.getCode();
	}

	public BusinessException(String message, Throwable t) {
		super(message, t);
	}

	public BusinessException(String code, String message, Throwable t) {
		super(message, t);
		buisinessCode = code;
	}
	public BusinessException(ReturnCode returnCode, Throwable t) {
		super(returnCode.getMessage(), t);
		buisinessCode = returnCode.getCode();
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
