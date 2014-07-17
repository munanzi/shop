package com.mission.shop.product.service.packinglist;

import com.mission.shop.product.dao.model.PackingList;

import java.util.List;

/**
 * User: hexizheng@163.com
 * Date: 14-7-17
 * Time: 下午1:51
 */
public interface PackingListService {

    /**
     * 查询商品包装物品列表
     * @return
     */
     public List<PackingList> queryPackingListByProductId(Long productId);
}
