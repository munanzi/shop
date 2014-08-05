package com.mission.shop.user.service.userIntegeral;

import com.mission.shop.base.common.exception.BusinessException;
import com.mission.shop.user.common.code.UserIntegeralType;
import com.mission.shop.user.dao.model.UserIntegeral;

import java.util.List;

/**
 * User: hexizheng@163.com
 * Date: 14-8-1
 * Time: 下午8:38
 */
public interface UserIntegeralService {

    /**
     * 减少用户积分，同时更新用户表
     * @param userId
     * @param orderId
     * @param integeral  减少的积分数，必须为正值
     * @param integeralType
     * @param remark
     * @throws BusinessException 积分不够用是抛出异常
     */
    public void subIntegeral(Long userId, Long orderId, int integeral,UserIntegeralType integeralType,String remark) throws BusinessException;

    /**
     * 增加用户积分 ，同时更新用户积分
     * @param userId
     * @param orderId
     * @param integeral
     * @param integeralType
     * @param remark
     * @throws BusinessException
     */
    public void addIntegeral(Long userId, Long orderId, int integeral,UserIntegeralType integeralType,String remark) throws BusinessException;

    /**
     * 查找用户积分记录
     * @param userId
     * @return
     */
    public List<UserIntegeral> queryIntegeralLogByUserId(Long userId);

}