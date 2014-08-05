package com.mission.shop.user.service.UserIntegeral;

import com.mission.shop.base.common.exception.BusinessException;
import com.mission.shop.user.common.code.UserIntegeralType;
import com.mission.shop.user.dao.model.User;
import com.mission.shop.user.dao.model.UserIntegeral;
import com.mission.shop.user.service.base.UesrServiceTestBase;
import com.mission.shop.user.service.user.UserQueryService;
import com.mission.shop.user.service.userIntegeral.UserIntegeralService;
import junit.framework.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * User: hexizheng@163.com
 * Date: 14-8-2
 * Time: 下午9:23
 */
public class UserIntegeralServieTest extends UesrServiceTestBase {

    @Autowired
    private UserIntegeralService userIntegeralServie;
    @Autowired
    private UserQueryService userQueryService;

    @Test
    public void testSubIntegeral(){
        try {
            userIntegeralServie.subIntegeral(1L, 1L, 40, UserIntegeralType.CONSUME_SEND, "订单赠送");
            User user = userQueryService.queryUserById(1L);
            Assert.assertEquals(new Integer(60),user.getIntegral());
            UserIntegeral userIntegeral = userIntegeralServie.queryIntegeralLogByUserId(1L).get(0);
            Assert.assertEquals(new Long(1),userIntegeral.getOrderId());
            Assert.assertEquals(UserIntegeralType.CONSUME_SEND.getCode(),userIntegeral.getType().shortValue());
            Assert.assertEquals(-40,userIntegeral.getIntegral().intValue());
        } catch (BusinessException e) {
            Assert.fail("减少积分失败");
         }
    }

    @Test
    public void testAddIntegeral(){
        try {
            userIntegeralServie.addIntegeral(1L, 1L, 40, UserIntegeralType.CONSUME_SEND, "订单赠送");
            User user = userQueryService.queryUserById(1L);
            Assert.assertEquals(new Integer(140),user.getIntegral());
            UserIntegeral userIntegeral = userIntegeralServie.queryIntegeralLogByUserId(1L).get(0);
            Assert.assertEquals(new Long(1),userIntegeral.getOrderId());
            Assert.assertEquals(UserIntegeralType.CONSUME_SEND.getCode(),userIntegeral.getType().shortValue());
            Assert.assertEquals(40,userIntegeral.getIntegral().intValue());
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
            userIntegeralServie.subIntegeral(1L,1L,400, UserIntegeralType.CONSUME_SEND,"订单赠送");
            Assert.fail("测试积分不够失败");
        } catch (BusinessException e) {
            User user = null;
            try {
                user = userQueryService.queryUserById(1L);
                Assert.assertEquals(new Integer(100),user.getIntegral());
                List list = userIntegeralServie.queryIntegeralLogByUserId(1L);
                Assert.assertTrue(list.isEmpty());
            } catch (BusinessException e1) {
                Assert.fail();
            }

        }
    }


    @Override
    public String getSqlFilePath() {
        return "sql/UserIntegeralServieTest.sql";
    }
}
