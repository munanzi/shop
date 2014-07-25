package com.mission.shop.product.service.goods;

import com.mission.shop.base.common.exception.BusinessException;
import com.mission.shop.product.dao.model.Goods;
import com.mission.shop.product.dao.model.Product;

public interface GoodsQueryService {

    /**
     * 查找销量最多的且有库存一个规格货品
     * @param productId
     * @return
     */
    public Goods queryMostSailByProductId(Long productId);

    /**
     * 主键找goods
     * @param goodsId
     * @return
     * @throws BusinessException  找不到时抛出异常
     */
    public Goods queryGoodsById(Long goodsId) throws BusinessException;


    /**
     * 查找商品
     * @param goodsId
     * @return
     * @throws BusinessException
     */
    public Product queryProductById(Long goodsId)throws BusinessException;

    /**
     * 检查商品状态
     * @param goodsId
     * @return
     * @throws BusinessException
     */
    public void checkGoodsStatus(Long goodsId) throws BusinessException;

}
