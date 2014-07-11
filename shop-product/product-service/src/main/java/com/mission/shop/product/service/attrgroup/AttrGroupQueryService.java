package com.mission.shop.product.service.attrgroup;

import java.util.List;

import com.mission.shop.product.dao.model.AttrGroup;

public interface AttrGroupQueryService {

	public abstract List<AttrGroup> queryAttrGroupByKindId(Long kindId);

}