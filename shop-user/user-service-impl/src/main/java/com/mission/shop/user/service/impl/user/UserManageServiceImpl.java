package com.mission.shop.user.service.impl.user;

import com.mission.shop.base.common.exception.BusinessException;
import com.mission.shop.base.common.exception.OptimisticLockException;
import com.mission.shop.user.common.returncode.UserReturnCode;
import com.mission.shop.user.dao.mapper.UserMapper;
import com.mission.shop.user.dao.model.User;
import com.mission.shop.user.dao.model.UserExample;
import com.mission.shop.user.service.user.UserManageService;
import com.mission.shop.user.service.user.UserQueryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

@Service
public class UserManageServiceImpl implements UserManageService {

    @Autowired
    private UserMapper userMapper;
    @Autowired
    private UserQueryService userQueryService;

    @Transactional(rollbackFor=Exception.class)
    public void updateUser(User user){

        int version = user.getVersion()==null?0:user.getVersion();
        user.setVersion(version+1);
        user.setUpdateTime(new Date());
        UserExample userExample = new UserExample();
        //乐观锁
        userExample.createCriteria().andUserIdEqualTo(user.getUserId())
                .andVersionEqualTo(version);

        int result = userMapper.updateByExample(user,userExample);
        if(result == 0){
            throw new OptimisticLockException("更新库存乐观锁异常");
        }
    }
    @Transactional(rollbackFor=Exception.class)
    public void updateUserIntegeral(Long userId,int integeral)throws BusinessException{
        User user = userQueryService.queryUserById(userId);
        int result = user.getIntegral()+integeral;
        if(result<0){
            throw new BusinessException(UserReturnCode.NOT_ENOUGH_INTEGRAL);
        }else{
            user.setIntegral(result);
        }
        updateUser(user);
    }


}
