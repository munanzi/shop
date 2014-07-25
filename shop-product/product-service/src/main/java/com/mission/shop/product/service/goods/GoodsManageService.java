package com.mission.shop.product.service.goods;

import com.mission.shop.base.common.exception.BusinessException;
import com.mission.shop.product.dao.model.Goods;

public interface GoodsManageService {

    /**
     * 更新商品，加乐观锁。
     * @param goods
     * @throws OptimisticLockException 乐观锁异常抛出
     */
    public void updateGoods(Goods goods);

}
