package com.mission.shop.user.service.impl.useraddress;

import com.mission.shop.base.common.exception.BusinessException;
import com.mission.shop.base.common.exception.SystemException;
import com.mission.shop.user.dao.mapper.UserAddressMapper;
import com.mission.shop.user.dao.model.UserAddress;
import com.mission.shop.user.service.useraddress.UserAddressServcie;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * User: hexizheng@163.com
 * Date: 14-7-23
 * Time: 下午8:03
 */
@Service
public class UserAddressServiceImpl implements UserAddressServcie {

    @Autowired
    private UserAddressMapper userAddressMapper;
    @Override
    public UserAddress queryById(Long userAddressId) throws BusinessException {
        if(userAddressId==null){
            throw new SystemException("userAddressId not null") ;
        }
        UserAddress userAddress = userAddressMapper.selectByPrimaryKey(userAddressId);
        if(userAddress==null){
             throw new BusinessException("地址不存在");
        }
        return userAddress;
    }
}
