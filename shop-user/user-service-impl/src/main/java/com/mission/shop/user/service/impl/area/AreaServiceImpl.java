package com.mission.shop.user.service.impl.area;

import com.mission.shop.base.common.exception.BusinessException;
import com.mission.shop.base.common.exception.SystemException;
import com.mission.shop.user.common.constants.UserConstants;
import com.mission.shop.user.dao.mapper.AreaMapper;
import com.mission.shop.user.dao.model.Area;
import com.mission.shop.user.dao.model.AreaExample;
import com.mission.shop.user.service.area.AreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * User: hexizheng@163.com
 * Date: 14-7-23
 * Time: 下午8:24
 */
@Service
public class AreaServiceImpl implements AreaService {

    @Autowired
    private AreaMapper areaMapper ;

    public Area queryById(Long areaId) throws BusinessException{
        if(areaId==null){
            throw  new SystemException("areaId can not be null");
        }
        Area area = areaMapper.selectByPrimaryKey(areaId);
        if(area==null){
            throw new BusinessException("地区不存在");
        }
        return area;
    }

    public List<Area> queryAllProvince(){

        AreaExample example = new AreaExample();
        example.createCriteria().andLevelEqualTo(UserConstants.PROVINCE_LEVEL);
        return areaMapper.selectByExample(example);
    }

    public List<Area> queryAllSubArea(Long areaId){
        AreaExample example = new AreaExample();
        example.createCriteria().andParentIdEqualTo(areaId);
        return areaMapper.selectByExample(example);
    }
}
