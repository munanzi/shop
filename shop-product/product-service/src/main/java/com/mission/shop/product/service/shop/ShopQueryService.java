package com.mission.shop.product.service.shop;

import com.mission.shop.base.common.exception.BusinessException;
import com.mission.shop.product.dao.model.Shop;

public interface ShopQueryService {

	public Shop queryShopById(Long shopId) throws BusinessException;
}
