package com.mission.shop.view.user.util;

import javax.servlet.http.HttpSession;

import com.mission.shop.base.common.exception.UserNotLoginException;
import com.mission.shop.user.common.constants.UserConstants;
import com.mission.shop.user.dao.model.User;


public class UserUtils {

	public static Long getUserId(HttpSession session){
		User user = (User)session.getAttribute(UserConstants.SESSION_USER);
		if(user==null){
			throw new UserNotLoginException("未登录异常");
		}
		return user.getUserId();
	}
	public static String  getUserName(HttpSession session){
		User user = (User)session.getAttribute(UserConstants.SESSION_USER);
		if(user==null){
			throw new UserNotLoginException("未登录异常");
		}
		return user.getUserName();
	}
	public static User  getUser(HttpSession session){
		User user = (User)session.getAttribute(UserConstants.SESSION_USER);
		if(user==null){
			throw new UserNotLoginException("未登录异常");
		}
		return user;
	}
}
