package com.mission.shop.product.service.impl.goods;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mission.shop.base.common.exception.OptimisticLockException;
import com.mission.shop.product.dao.mapper.GoodsMapper;
import com.mission.shop.product.dao.model.Goods;
import com.mission.shop.product.dao.model.GoodsExample;
import com.mission.shop.product.service.goods.GoodsManageService;

@Service
public class GoodsManageServiceImpl implements GoodsManageService {

    @Autowired
    private GoodsMapper goodsMapper;


    @Transactional(rollbackFor=Exception.class)
    public void updateGoods(Goods goods){

        int version = goods.getVersion()==null?0:goods.getVersion();
        goods.setVersion(version+1);
        goods.setUpdateTime(new Date());
        GoodsExample goodsExample = new GoodsExample();
        //乐观锁
        goodsExample.createCriteria().andGoodsIdEqualTo(goods.getGoodsId())
                .andVersionEqualTo(version);

        int result = goodsMapper.updateByExample(goods,goodsExample);
        if(result == 0){
            throw new OptimisticLockException("更新库存乐观锁异常");
        }
    }
}
