package com.mission.shop.order.common.exception;

import com.mission.shop.base.common.exception.BusinessException;
import com.mission.shop.order.common.returncode.OrderReturnCode;

public class OrderException extends BusinessException{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8370572965298084842L;

	public OrderException(OrderReturnCode returnCode){
		super(returnCode.getCode(),returnCode.getMessage());
	}
	public OrderException(OrderReturnCode returnCode,Throwable t){
		super(returnCode.getCode(),returnCode.getMessage(),t);
	}

}
