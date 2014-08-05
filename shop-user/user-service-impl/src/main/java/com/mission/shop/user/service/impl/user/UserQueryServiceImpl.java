package com.mission.shop.user.service.impl.user;

import com.mission.shop.base.common.exception.BusinessException;
import com.mission.shop.base.common.exception.SystemException;
import com.mission.shop.user.common.returncode.UserReturnCode;
import com.mission.shop.user.dao.mapper.UserMapper;
import com.mission.shop.user.dao.model.User;
import com.mission.shop.user.service.user.UserQueryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**

 * @Description: 
 * @author hexizheng@163.com 
 * @date 2014年6月18日 下午3:40:24 
 * @version V1.0   
 */
@Service
public class UserQueryServiceImpl implements UserQueryService {

    @Autowired
    private UserMapper userMapper;

    public User queryUserById(Long userId)throws BusinessException{
        if(userId==null){
            throw new SystemException("userId can not be null");
        }
        User user = userMapper.selectByPrimaryKey(userId);
        if(user==null){
            throw new BusinessException(UserReturnCode.USER_NOT_EXIST);
        }
        return user;
    }
}
