package com.mission.shop.user.service.useraddress;

import com.mission.shop.base.common.exception.BusinessException;
import com.mission.shop.user.dao.model.UserAddress;

import java.util.List;

/**
 * User: hexizheng@163.com
 * Date: 14-7-23
 * Time: 下午8:02
 */
public interface UserAddressServcie {

	/**
	 * 主键查找
	 * @param userAddressId
	 * @return
	 * @throws BusinessException
	 */
    public UserAddress queryById(Long userAddressId) throws BusinessException;

    /**
     * 查找用户的收货地址列表
     * @param userId
     * @return
     */
    public List<UserAddress> queryAddressByUserId(Long userId);
    
    
    /**
     * 计算用户地址数
     * @param userId
     * @return
     */
    public Integer countUserAddressNum(Long userId);

}
