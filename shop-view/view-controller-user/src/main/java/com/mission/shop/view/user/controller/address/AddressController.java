package com.mission.shop.view.user.controller.address;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mission.shop.base.common.exception.BusinessException;
import com.mission.shop.user.common.returncode.UserReturnCode;
import com.mission.shop.user.dao.model.UserAddress;
import com.mission.shop.user.service.useraddress.UserAddressManageService;
import com.mission.shop.view.user.util.UserUtils;


@Controller
@RequestMapping("address")
public class AddressController {
	
	@Autowired
	private UserAddressManageService userAddressManageService;
	
	@ResponseBody
	@RequestMapping("addAddress")
	public Map<String,String> addAddress(UserAddress userAddress,HttpSession session){
		Map<String,String> retMap = new HashMap<String,String>();
		userAddress.setUserId(UserUtils.getUserId(session));
		try {
			UserAddress address = userAddressManageService.addUserAddress(userAddress);
			retMap.put("code", "0");
			retMap.put("addressId",address.getAddressId()+"");
            retMap.put("province",address.getProvince());
            retMap.put("city",address.getCity());
            retMap.put("county",address.getCounty());
            retMap.put("address",address.getAddress());
            retMap.put("consignee",address.getConsignee());
            retMap.put("phoneNum",address.getPhoneNum());
		} catch (BusinessException e) {
			if(e.isExistCode()){
				retMap.put("code", e.getBuisinessCode());
				retMap.put("message", e.getMessage());
			}else{
				retMap.put("code", UserReturnCode.SYSTEM_ERROR.getCode());
				retMap.put("message",UserReturnCode.SYSTEM_ERROR.getMessage());
			}
		}
		return retMap;
	}

}
