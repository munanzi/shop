package com.mission.shop.product.service.impl.goods;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mission.shop.base.common.exception.BusinessException;
import com.mission.shop.product.common.code.ProductStatus;
import com.mission.shop.product.common.constants.ProductConstants;
import com.mission.shop.product.dao.model.Goods;
import com.mission.shop.product.dao.model.Product;
import com.mission.shop.product.service.goods.GoodsManageService;
import com.mission.shop.product.service.goods.GoodsQueryService;
import com.mission.shop.product.service.goods.GoodsStockService;

/**
 * User: hexizheng@163.com
 * Date: 14-7-23
 * Time: 下午9:28
 */
@Service
public class GoodsStockServiceImpl implements GoodsStockService{

    @Autowired
    private GoodsQueryService goodsQueryService;

    @Autowired
    private GoodsManageService goodsManageService;


//    GoodsM

    @Transactional(rollbackFor = Exception.class)
    public void subStock(Long goodsId,int num) throws BusinessException{
        Goods goods = goodsQueryService.queryGoodsById(goodsId);
        if(ProductConstants.NORMAL_STATUS!=goods.getStatus()){
            throw new BusinessException("此规格商品已下架") ;
        }
        Product product = goodsQueryService.queryProductById(goodsId);
        if(ProductStatus.ON_SALE.getCode()!=product.getStatus()){
            throw new BusinessException("商品已下架");
        }
        int nowStock = goods.getStock();
        if(nowStock<num){
            throw new BusinessException("商品库存不足");
        }
        goods.setStock(nowStock-num);
        goodsManageService.updateGoods(goods);

    }

    @Transactional(rollbackFor = Exception.class)
    public void addStock(Long goodsId,int num) throws BusinessException{
    	Goods goods = goodsQueryService.queryGoodsById(goodsId);
        goods.setStock(goods.getStock()+num);
        goodsManageService.updateGoods(goods);
    }
}
