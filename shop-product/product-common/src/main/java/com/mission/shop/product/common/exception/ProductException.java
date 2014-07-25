package com.mission.shop.product.common.exception;

import com.mission.shop.base.common.exception.BusinessException;
import com.mission.shop.product.common.returncode.ProductReturnCode;

public class ProductException extends BusinessException{
	

	/**
	 * 
	 */
	private static final long serialVersionUID = 6176531963941798677L;
	
	public ProductException(ProductReturnCode returnCode){
		super(returnCode.getCode(),returnCode.getMessage());
	}
	public ProductException(ProductReturnCode returnCode,Throwable t){
		super(returnCode.getCode(),returnCode.getMessage(),t);
	}

}
