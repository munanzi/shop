package com.mission.shop.user.service.user;


import com.mission.shop.base.common.exception.ReturnCode;
import com.mission.shop.user.common.returncode.UserReturnCode;
import com.mission.shop.user.dao.model.User;
import com.mission.shop.user.service.base.UesrServiceTestBase;
import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.mission.shop.base.common.exception.BusinessException;
import com.mission.shop.base.common.exception.OptimisticLockException;
import com.mission.shop.user.dao.model.User;
import org.springframework.transaction.annotation.Transactional;


public class UserManageServiceTest extends UesrServiceTestBase {
	
	@Autowired
    private UserManageService userManageService;
    @Autowired
    private UserQueryService userQueryService;


    @Test
    public void updateUserIntegeral(){
        try {
            userManageService.updateUserIntegeral(1L,-100);
            User user =  userQueryService.queryUserById(1L);
            Assert.assertEquals(new Integer(901),user.getIntegral());
        } catch (BusinessException e) {
            Assert.fail();
        }
    }

   @Test
   public void updateUserIntegeralFail(){
       User user =  null;
       try {
            userManageService.updateUserIntegeral(1L,1000000);
            user = userQueryService.queryUserById(1L);
		} catch (BusinessException e) {
			if(e.getBuisinessCode().equals(UserReturnCode.NOT_ENOUGH_INTEGRAL.getCode())){
               Assert.assertEquals(new Integer(1001),user.getIntegral());
            }
           Assert.fail();
		}
	}

   @Test(expected=OptimisticLockException.class)
   public void testUpdateOptiLock(){
	   try {
		   User User = userQueryService.queryUserById(1L);
		   User User2 = userQueryService.queryUserById(1L);
		   User.setIntegral(99);
		   userManageService.updateUser(User);
		   User2.setIntegral(999);
		   //session 缓存，为了模拟并发时没有缓存的情况
		   User2.setVersion(User2.getVersion()-1);
		   userManageService.updateUser(User);
	   } catch (BusinessException e) {
		   Assert.fail(e.getMessage());
	   }
   }

    @Override
    public String getSqlFilePath() {
        return "sql/UserManageServiceTest.sql";
    }
}
