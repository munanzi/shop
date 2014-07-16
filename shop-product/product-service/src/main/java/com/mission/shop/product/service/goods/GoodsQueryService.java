package com.mission.shop.product.service.goods;

import com.mission.shop.product.dao.model.Goods;

public interface GoodsQueryService {

    /**
     * 查找销量最多的且有库存一个规格货品
     * @param productId
     * @return
     */
    public Goods queryMostSailByProductId(Long productId);

}
