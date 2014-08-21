package com.mission.shop.product.service.impl.shop;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mission.shop.base.common.exception.BusinessException;
import com.mission.shop.base.common.exception.SystemException;
import com.mission.shop.product.dao.mapper.ShopMapper;
import com.mission.shop.product.dao.model.Shop;
import com.mission.shop.product.service.shop.ShopQueryService;


@Service
public class ShopQueryServiceImpl implements ShopQueryService{

	@Autowired
	private ShopMapper shopMapper;
	
	
	public Shop queryShopById(Long shopId) throws BusinessException{
		if(shopId==null){
			throw new SystemException("参数不能为null");
		}
		Shop shop = shopMapper.selectByPrimaryKey(shopId);
		if(shop==null){
			throw new BusinessException();
		}
		return shop;
	}
	
}
