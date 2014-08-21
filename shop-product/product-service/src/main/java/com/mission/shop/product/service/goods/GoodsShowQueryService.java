package com.mission.shop.product.service.goods;

import java.util.List;
import java.util.Map;

import com.mission.shop.base.common.exception.BusinessException;
import com.mission.shop.product.dao.model.Cart;

public interface GoodsShowQueryService {

	
	/**
     * 查找出用于显示下单页面的商品信息列表
     * @param goodsId
     * @param goodsNum
     * @return Map<店铺名称,goodsview>
     * @throws BusinessException
     */
    public GoodsView queryGoodsView(Long goodsId,int goodsNum)throws BusinessException;
    
    /**
     * 查找出用于显示下单页面的商品信息列表
     * @param List<goodsId,goodsNum>
     * @return Map<shopName,List<GoodsView>>
     * @throws BusinessException
     */
    public Map<String,List<GoodsView>> queryGoodsView(List<Cart> list )throws BusinessException;
}
