package com.mission.shop.user.service.impl.user;

import com.mission.shop.user.common.code.UserStatus;
import com.mission.shop.user.dao.mapper.UserMapper;
import com.mission.shop.user.dao.model.User;
import com.mission.shop.user.dao.model.UserExample;
import com.mission.shop.user.service.user.UserLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * User: hexizheng@163.com
 * Date: 14-6-21
 * Time: 下午5:44
 */
@Service
public class UserLoginServiceImpl  implements UserLoginService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public User login(String userName, String password) {
        UserExample userExample = new UserExample();
        userExample.createCriteria().andUserNameEqualTo(userName).andStatusEqualTo(UserStatus.NORMAL.getCode());
        List<User> list = userMapper.selectByExample(userExample);
        if(list.isEmpty()){
            return null;
        }else{
            User user = list.get(0);
            // TODO valid passowrd
            return user;
        }
    }
}
