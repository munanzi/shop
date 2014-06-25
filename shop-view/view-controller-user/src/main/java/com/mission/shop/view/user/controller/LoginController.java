package com.mission.shop.view.user.controller;

import com.mission.shop.user.common.constants.UserConstants;
import com.mission.shop.user.dao.model.User;
import com.mission.shop.user.service.user.UserLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;


/**   

 * @Description: 
 * @author hexizheng@163.com 
 * @date 2014年6月18日 下午3:35:28 
 * @version V1.0   
 */

@RequestMapping("")
@Controller
public class LoginController {

    @Autowired
    private UserLoginService  userLoginService;
	
	@RequestMapping("login")
	public String login(){

		
		return "login";
	}
	@RequestMapping("logon")
	public String logon(String userName,String password,HttpServletRequest request,ModelMap modelMap){
        User user = userLoginService.login(userName,password);
        if(user==null){
            modelMap.addAttribute("error","用户名或密码错误");
            modelMap.addAttribute("userName",userName);
            return "login";
        }
        request.getSession().setAttribute(UserConstants.SESSION_USER,user);
        modelMap.addAttribute("userName",userName);
		return "index";
	}
}
