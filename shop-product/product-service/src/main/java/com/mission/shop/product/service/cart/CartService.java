package com.mission.shop.product.service.cart;

import com.mission.shop.product.dao.model.Cart;

import java.util.List;

/**
 * User: hexizheng@163.com
 * Date: 14-7-17
 * Time: 下午5:16
 */
public interface CartService {

    /**
     * 根据用户ID goodsId找购物车商品
     * @param userId
     * @param goodsId
     * @return 找不到返回null
     */
    public Cart queryCart(Long userId,Long goodsId);
    /**
     * 需要购买的商品加入购物车，存入数据库持久化
     * @param goodsId
     * @param buyNum
     */
    public Cart addCartGoods(Long userId,Long goodsId,short buyNum);

    /**
     * 查询出当前登录用户购物车列表
     * @return  当前没有登录用户时返回空列表
     */
    public List<Cart> queryAllCartGoods(Long userId);
}
