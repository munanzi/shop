package com.mission.shop.user.service.area;

import com.mission.shop.base.common.exception.BusinessException;
import com.mission.shop.user.dao.model.Area;

/**
 * User: hexizheng@163.com
 * Date: 14-7-23
 * Time: 下午8:24
 */
public interface AreaService {
    /**
     * 主键查找
     * @param areaId
     * @return
     * @throws BusinessException 不存在时抛出异常
     */
    public Area queryById(Long areaId) throws BusinessException;
}
