package com.mission.shop.product.service.goods;

import com.mission.shop.base.common.exception.BusinessException;
import com.mission.shop.product.common.returncode.ProductReturnCode;
import com.mission.shop.product.dao.model.Goods;
import com.mission.shop.product.service.base.ProductServiceTestBase;
import junit.framework.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * User: hexizheng@163.com
 * Date: 14-8-5
 * Time: 下午9:25
 */
public class GoodsStockServiceTest extends ProductServiceTestBase {

    @Autowired
    private GoodsStockService goodsStockService;
    @Autowired
    private GoodsQueryService goodsQueryService;
    @Test
    public void subStock(){

        try {
            goodsStockService.subStock(1L,10);
        } catch (BusinessException e) {
            Assert.assertEquals(ProductReturnCode.OFF_SALE.getCode(),e.getBuisinessCode());
        }
        try {
            goodsStockService.subStock(2L,10);
        } catch (BusinessException e) {
            Assert.assertEquals(ProductReturnCode.OFF_SALE.getCode(),e.getBuisinessCode());
        }
        try {
            goodsStockService.subStock(3L,11);
        } catch (BusinessException e) {
            Assert.assertEquals(ProductReturnCode.OUT_OF_STOCK.getCode(),e.getBuisinessCode());
        }

        try {
            goodsStockService.subStock(3L,9);
            Goods goods = goodsQueryService.queryGoodsById(3L);
            Assert.assertEquals(1,goods.getStock().intValue());
        } catch (BusinessException e) {
            Assert.fail();
        }
    }


    @Test
    public void addStock(){
        try {
            goodsStockService.addStock(1L,10);
            Goods goods = goodsQueryService.queryGoodsById(1L);
            Assert.assertEquals(110,goods.getStock().intValue());
        } catch (BusinessException e) {
            Assert.fail();
        }
    }


    @Override
    public String getSqlFilePath() {
        return "sql/GoodsStockServiceTest.sql";
    }
}
