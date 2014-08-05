package com.mission.shop.user.service.user;

import com.mission.shop.base.common.exception.BusinessException;
import com.mission.shop.user.dao.model.User;

/**
 * User: hexizheng@163.com
 * Date: 14-8-1
 * Time: 下午9:56
 */
public interface UserManageService {

    /**
     * 更新用户信息，加乐观锁
     * @param user
     */
    public void updateUser(User user);

    /**
     * 更新用户积分
     * @param userId
     * @param integeral 可以为正或负，负数时为减积分
     * @throws BusinessException 减积分时，积分不足抛出异常
     */
    public void updateUserIntegeral(Long userId, int integeral) throws BusinessException;

}
