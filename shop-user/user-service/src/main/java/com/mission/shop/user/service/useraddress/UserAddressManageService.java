package com.mission.shop.user.service.useraddress;

import com.mission.shop.base.common.exception.BusinessException;
import com.mission.shop.user.dao.model.UserAddress;



public interface UserAddressManageService {

	/**
	 * 新增用户地址
	 * @param userAddress，地区id，收件人，手机号，详细地址，邮编
	 * @return
	 * @throws BusinessException 地区不存在等抛出异常
	 */
	public UserAddress addUserAddress(UserAddress userAddress)throws BusinessException;
}
