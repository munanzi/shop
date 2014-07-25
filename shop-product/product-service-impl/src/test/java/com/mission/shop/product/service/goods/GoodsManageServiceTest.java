package com.mission.shop.product.service.goods;


import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.mission.shop.base.common.exception.BusinessException;
import com.mission.shop.base.common.exception.OptimisticLockException;
import com.mission.shop.product.dao.model.Goods;
import com.mission.shop.product.service.base.ProductServiceTestBase;

public class GoodsManageServiceTest extends ProductServiceTestBase {
	
	@Autowired
	private GoodsManageService goodsManageService;
	
	@Autowired
	private GoodsQueryService goodsQueryService;
   @Test
   public void testUpdate(){
		try {
			Goods  goods = goodsQueryService.queryGoodsById(1L);
			goods.setPrice(111);
			goods.setStock(222);
			goods.setSales(333);
			goodsManageService.updateGoods(goods);
			Goods goods2 = goodsQueryService.queryGoodsById(1L);
			Assert.assertEquals(goods.getPrice(), goods2.getPrice());
			Assert.assertEquals(new Integer(222), goods.getStock());
			Assert.assertEquals(new Integer(333), goods2.getSales());
			Assert.assertEquals(new Integer(1), goods2.getVersion());
		} catch (BusinessException e) {
			Assert.fail(e.getMessage());
		}
	}
   @Test(expected=OptimisticLockException.class)
   public void testUpdateOptiLock(){
	   try {
		   Goods goods = goodsQueryService.queryGoodsById(1L);
		   Goods goods2 = goodsQueryService.queryGoodsById(1L);
		   goods.setPrice(111);
		   goods.setStock(222);
		   goods.setSales(333);
		   goodsManageService.updateGoods(goods);
		   goods2.setGoodsSn(12);
		   //session 缓存，为了模拟并发时没有缓存的情况
		   goods2.setVersion(goods2.getVersion()-1);
		   goodsManageService.updateGoods(goods);
	   } catch (BusinessException e) {
		   Assert.fail(e.getMessage());
	   }
   }

@Override
public String getSqlFilePath() {
	return "sql/GoodsManageService.sql";
}
}
