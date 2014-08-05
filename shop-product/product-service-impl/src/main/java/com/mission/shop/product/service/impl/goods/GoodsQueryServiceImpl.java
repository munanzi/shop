package com.mission.shop.product.service.impl.goods;

import com.mission.shop.base.common.exception.BusinessException;
import com.mission.shop.base.common.exception.SystemException;
import com.mission.shop.product.common.code.ProductStatus;
import com.mission.shop.product.common.constants.ProductConstants;
import com.mission.shop.product.common.returncode.ProductReturnCode;
import com.mission.shop.product.dao.mapper.GoodsMapper;
import com.mission.shop.product.dao.model.Goods;
import com.mission.shop.product.dao.model.GoodsExample;
import com.mission.shop.product.dao.model.Product;
import com.mission.shop.product.service.product.ProductQueryService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mission.shop.product.service.goods.GoodsQueryService;

import java.util.List;

@Service
public class GoodsQueryServiceImpl implements GoodsQueryService{

    @Autowired
    private GoodsMapper goodsMapper;
    @Autowired
    private ProductQueryService productQueryService;

    public Goods queryGoodsById(Long goodsId) throws BusinessException{
        if(goodsId==null){
            throw new SystemException("goodsId is null");
        }
        Goods goods = goodsMapper.selectByPrimaryKey(goodsId);
        if(goods==null){
            throw new BusinessException(ProductReturnCode.NOT_EXIST);
        }
        return goods;
    }

    public void checkGoodsStatus(Long goodsId) throws BusinessException{
        Goods goods =   queryGoodsById(goodsId);
        if(ProductConstants.NORMAL_STATUS !=goods.getStatus()) {
            throw new BusinessException(ProductReturnCode.OFF_SALE);
        }
        if(goods.getStock()==0){
            throw new BusinessException(ProductReturnCode.OUT_OF_STOCK);
        }
        Product product = productQueryService.QueryProduct(goods.getProductId()) ;
        if(!product.getStatus().equals(ProductStatus.ON_SALE.getCode())){
            throw new BusinessException(ProductReturnCode.OFF_SALE);
        }
    }

    public Goods queryMostSailByProductId(Long productId){
        //先找有库存中的销量最高的商品，如果全部都没有库存，则找销量最高的一个。
        GoodsExample goodsExample = new GoodsExample();
        goodsExample.createCriteria().andStockGreaterThan(0)
                    .andProductIdEqualTo(productId);
        goodsExample.setOrderByClause(" sales desc limit 1 ");
        List<Goods> list = goodsMapper.selectByExample(goodsExample);
        if(list.size()>0){
            return list.get(0);
        }else{
            goodsExample.clear();
            goodsExample.createCriteria().andProductIdEqualTo(productId);
            goodsExample.setOrderByClause(" sales desc limit 1 ");
            List<Goods> list2 = goodsMapper.selectByExample(goodsExample);
            return list2.get(0);
        }
    }

    public Product queryProductById(Long goodsId)throws BusinessException{
        Goods goods = queryGoodsById(goodsId);
        return productQueryService.QueryProduct(goods.getProductId());
    }
    
    public Long queryShopIdByGoodsId(Long goodsId)throws BusinessException{
    	return queryProductById(goodsId).getShopId();
    }

}
