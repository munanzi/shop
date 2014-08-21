package com.mission.shop.user.service.impl.useraddress;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mission.shop.base.common.exception.BusinessException;
import com.mission.shop.user.common.code.UserAddressStatus;
import com.mission.shop.user.common.constants.UserConstants;
import com.mission.shop.user.common.returncode.UserReturnCode;
import com.mission.shop.user.dao.mapper.UserAddressMapper;
import com.mission.shop.user.dao.model.UserAddress;
import com.mission.shop.user.service.area.AreaService;
import com.mission.shop.user.service.useraddress.UserAddressManageService;
import com.mission.shop.user.service.useraddress.UserAddressServcie;

import java.util.Date;

@Service
public class UserAddressManageServiceImpl implements UserAddressManageService{
	
	@Autowired
	private UserAddressMapper userAddressMapper;
	@Autowired
	private UserAddressServcie userAddressServcie;
	@Autowired
	private AreaService areaService;
	
	public UserAddress addUserAddress(UserAddress userAddress)throws BusinessException{
		
		int count = userAddressServcie.countUserAddressNum(userAddress.getUserId());
		if(count>=UserConstants.USER_ADDRESS_LIMIT_NUM){
			throw new BusinessException(UserReturnCode.ADDREESS_OVER_LIMIT);
		}
		String provinceName = areaService.queryById(userAddress.getProvinceId()).getAreaName();
		String cityName = areaService.queryById(userAddress.getCityId()).getAreaName();
		String countyName = areaService.queryById(userAddress.getCountyId()).getAreaName();
		userAddress.setStatus(UserAddressStatus.NORMAL.getCode());
		userAddress.setProvince(provinceName);
		userAddress.setCity(cityName);
		userAddress.setCounty(countyName);
        userAddress.setCreateTime(new Date());
        userAddress.setUpdateTime(new Date());
        userAddressMapper.insert(userAddress);
		
		return userAddress;
	}

}
