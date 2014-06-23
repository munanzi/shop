package com.mission.shop.user.service.user;

import com.mission.shop.user.dao.model.User;

/**
 *
 */
public interface UserLoginService {

    public User login(String userName,String password);
}
