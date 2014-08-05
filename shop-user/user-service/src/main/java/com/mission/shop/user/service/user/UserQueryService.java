package com.mission.shop.user.service.user;

import com.mission.shop.base.common.exception.BusinessException;
import com.mission.shop.user.dao.model.User;

/**
 * User: hexizheng@163.com
 * Date: 14-8-1
 * Time: 下午9:52
 */
public interface UserQueryService {

    /**
     * 主键查找用户
     * @param userId
     * @return
     * @throws BusinessException  用户不存在时抛出异常
     */
    public User queryUserById(Long userId)throws BusinessException;


}
