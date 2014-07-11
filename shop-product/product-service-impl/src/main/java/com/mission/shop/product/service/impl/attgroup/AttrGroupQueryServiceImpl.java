package com.mission.shop.product.service.impl.attgroup;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mission.shop.product.common.code.AttrGroupStatus;
import com.mission.shop.product.dao.mapper.AttrGroupMapper;
import com.mission.shop.product.dao.model.AttrGroup;
import com.mission.shop.product.dao.model.AttrGroupExample;
import com.mission.shop.product.service.attrgroup.AttrGroupQueryService;


@Service
public class AttrGroupQueryServiceImpl implements AttrGroupQueryService {
	
	@Autowired
	private AttrGroupMapper attrGroupMapper;
	
	
	/* (non-Javadoc)
	 * @see com.mission.shop.product.service.attrgroup.AttrGroupQueryService#queryAttrGroupByKindId(java.lang.Long)
	 */
	@Override
	public List<AttrGroup> queryAttrGroupByKindId(Long kindId){
		
		AttrGroupExample example =new AttrGroupExample();
		example.createCriteria().andKindIdEqualTo(kindId)
						.andStatusEqualTo(AttrGroupStatus.NORMAL.getCode());
		return attrGroupMapper.selectByExample(example);
	}

}
