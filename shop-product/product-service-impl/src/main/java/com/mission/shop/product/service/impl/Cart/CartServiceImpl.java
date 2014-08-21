package com.mission.shop.product.service.impl.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mission.shop.product.dao.mapper.CartMapper;
import com.mission.shop.product.dao.model.Cart;
import com.mission.shop.product.dao.model.CartExample;
import com.mission.shop.product.service.cart.CartService;

/**
 * User: hexizheng@163.com
 * Date: 14-7-17
 * Time: 下午7:42
 */
@Service
public class CartServiceImpl implements CartService{

    @Autowired
    private CartMapper cartMapper;

    public Cart addCartGoods(Long userId,Long goodsId,short buyNum){
        Cart cart = queryCart(userId,goodsId);
        if(cart!=null){
            cart.setBuyNum((short)(cart.getBuyNum()+buyNum));
            cartMapper.updateByPrimaryKeySelective(cart);
        }else{
            cart = new Cart();
            cart.setBuyNum(buyNum);
            cart.setGoodsId(goodsId);
            cart.setUserId(userId);
            cartMapper.insert(cart);
        }
        return cart;
    }

    public List<Cart> queryAllCartGoods(Long userId){
        CartExample cartExample = new CartExample();
        cartExample.createCriteria().andUserIdEqualTo(userId);
        return cartMapper.selectByExample(cartExample);
    }

    public Cart queryCart(Long userId,Long goodsId){
        CartExample cartExample = new CartExample();
        cartExample.createCriteria().andUserIdEqualTo(userId)
                    .andGoodsIdEqualTo(goodsId);
        List<Cart> list = cartMapper.selectByExample(cartExample);
        if(list.isEmpty()){
            return null;
        }else{
            return list.get(0);
        }
    }
}
