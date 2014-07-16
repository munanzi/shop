package com.mission.shop.product.service.impl.goods;

import com.mission.shop.product.dao.mapper.GoodsMapper;
import com.mission.shop.product.dao.model.Goods;
import com.mission.shop.product.dao.model.GoodsExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mission.shop.product.service.goods.GoodsQueryService;

import java.util.List;

@Service
public class GoodsQueryServiceImpl implements GoodsQueryService{

    @Autowired
    private GoodsMapper goodsMapper;

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
}
