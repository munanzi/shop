package com.mission.shop.user.service.UserIntegral;

import java.util.List;

import junit.framework.Assert;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.mission.shop.base.common.exception.BusinessException;
import com.mission.shop.user.common.code.UserIntegeralType;
import com.mission.shop.user.dao.model.User;
import com.mission.shop.user.dao.model.UserIntegral;
import com.mission.shop.user.service.base.UesrServiceTestBase;
import com.mission.shop.user.service.user.UserQueryService;
import com.mission.shop.user.service.userIntegral.UserIntegralService;

/**
 * User: hexizheng@163.com
 * Date: 14-8-2
 * Time: 下午9:23
 */
public class UserIntegralServieTest extends UesrServiceTestBase {

    @Autowired
    private UserIntegralService userIntegralServie;
    @Autowired
    private UserQueryService userQueryService;

    @Test
    public void testSubIntegeral(){
        try {
            userIntegralServie.subIntegeral(1L, 1L, 40, UserIntegeralType.CONSUME_SEND, "订单赠送");
            User user = userQueryService.queryUserById(1L);
            Assert.assertEquals(new Integer(60),user.getIntegral());
            UserIntegral userIntegral = userIntegralServie.queryIntegeralLogByUserId(1L).get(0);
            Assert.assertEquals(new Long(1),userIntegral.getOrderId());
            Assert.assertEquals(UserIntegeralType.CONSUME_SEND.getCode(),userIntegral.getType().shortValue());
            Assert.assertEquals(-40,userIntegral.getIntegral().intValue());
        } catch (BusinessException e) {
            Assert.fail("减少积分失败");
         }
    }

    @Test
    public void testAddIntegeral(){
        try {
            userIntegralServie.addIntegeral(1L, 1L, 40, UserIntegeralType.CONSUME_SEND, "订单赠送");
            User user = userQueryService.queryUserById(1L);
            Assert.assertEquals(new Integer(140),user.getIntegral());
            UserIntegral userIntegral = userIntegralServie.queryIntegeralLogByUserId(1L).get(0);
            Assert.assertEquals(new Long(1),userIntegral.getOrderId());
            Assert.assertEquals(UserIntegeralType.CONSUME_SEND.getCode(),userIntegral.getType().shortValue());
            Assert.assertEquals(40,userIntegral.getIntegral().intValue());
        } catch (BusinessException e) {
            Assert.fail("增加积分失败");
        }
    }

    /**
     * 测试积分不够的情况
     */
    @Test
    public void testSubIntegeralException(){
        try {
            userIntegralServie.subIntegeral(1L,1L,400, UserIntegeralType.CONSUME_SEND,"订单赠送");
            Assert.fail("测试积分不够失败");
        } catch (BusinessException e) {
            User user = null;
            try {
                user = userQueryService.queryUserById(1L);
                Assert.assertEquals(new Integer(100),user.getIntegral());
                List list = userIntegralServie.queryIntegeralLogByUserId(1L);
                Assert.assertTrue(list.isEmpty());
            } catch (BusinessException e1) {
                Assert.fail();
            }

        }
    }


    @Override
    public String getSqlFilePath() {
        return "sql/userIntegralServieTest.sql";
    }
}
