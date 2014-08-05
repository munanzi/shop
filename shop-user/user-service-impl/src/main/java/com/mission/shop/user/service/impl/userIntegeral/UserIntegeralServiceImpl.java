package com.mission.shop.user.service.impl.userIntegeral;

import com.mission.shop.base.common.exception.BusinessException;
import com.mission.shop.base.common.exception.SystemException;
import com.mission.shop.user.common.code.UserIntegeralType;
import com.mission.shop.user.dao.mapper.UserIntegeralMapper;
import com.mission.shop.user.dao.model.User;
import com.mission.shop.user.dao.model.UserIntegeral;
import com.mission.shop.user.dao.model.UserIntegeralExample;
import com.mission.shop.user.service.user.UserManageService;
import com.mission.shop.user.service.user.UserQueryService;
import com.mission.shop.user.service.userIntegeral.UserIntegeralService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * User: hexizheng@163.com
 * Date: 14-8-1
 * Time: 下午8:41
 */

@Service
public class UserIntegeralServiceImpl implements UserIntegeralService {
    @Autowired
    private UserIntegeralMapper userIntegeralMapper;
    @Autowired
    private UserManageService userManageService;
    @Autowired
    private UserQueryService userQueryService;


    @Override
    @Transactional(rollbackFor = Exception.class)
    public void subIntegeral(Long userId, Long orderId, int integeral,UserIntegeralType integeralType,String remark) throws BusinessException {
        if(integeral<=0){
            throw new SystemException("积分必须为正值");
        }
        updateIntegeral(userId,orderId,-integeral,integeralType,remark);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void addIntegeral(Long userId, Long orderId, int integeral,UserIntegeralType integeralType,String remark) throws BusinessException {
        if(integeral<=0){
            throw new SystemException("积分必须为正值");
        }
        updateIntegeral(userId,orderId,integeral,integeralType,remark);
    }


    private void updateIntegeral(Long userId, Long orderId, int integeral,UserIntegeralType integeralType,String remark) throws BusinessException {
        userManageService.updateUserIntegeral(userId,integeral);
        User user = userQueryService.queryUserById(userId);
        UserIntegeral userIntegeral = new UserIntegeral();
        userIntegeral.setCreateTime(new Date());
        userIntegeral.setUserId(userId);
        userIntegeral.setUserName(user.getUserName());
        userIntegeral.setOrderId(orderId);
        userIntegeral.setIntegral(integeral);
        userIntegeral.setRemark(remark);
        userIntegeral.setType(integeralType.getCode());
        userIntegeralMapper.insert(userIntegeral);
    }


    public List<UserIntegeral> queryIntegeralLogByUserId(Long userId){
        UserIntegeralExample example = new UserIntegeralExample();
        example.setOrderByClause(" create_time desc ");
        return userIntegeralMapper.selectByExample(example);
    }
}
