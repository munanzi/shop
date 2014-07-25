package com.mission.shop.user.service.useraddress;

import com.mission.shop.base.common.exception.BusinessException;
import com.mission.shop.user.dao.model.UserAddress;

/**
 * User: hexizheng@163.com
 * Date: 14-7-23
 * Time: 下午8:02
 */
public interface UserAddressServcie {

    public UserAddress queryById(Long userAddressId) throws BusinessException;

}
