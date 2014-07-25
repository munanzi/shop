package com.mission.shop.order.service.impl.ordergoods;

import com.mission.shop.base.common.exception.BusinessException;
import com.mission.shop.order.dao.mapper.OrderGoodsMapper;
import com.mission.shop.order.dao.model.OrderGoods;
import com.mission.shop.order.service.ordergoods.OrderGoodsManageServie;
import com.mission.shop.product.service.goods.GoodsQueryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * User: hexizheng@163.com
 * Date: 14-7-22
 * Time: 下午9:46
 */

@Service
public class OrderGoodsManageServieImpl implements OrderGoodsManageServie {

    @Autowired
    private OrderGoodsMapper orderGoodsMapper;

    @Autowired
    private GoodsQueryService goodsQueryService;

    public Long saveOrderGoods(Long orderId,Long goodsId,int price,int num)throws BusinessException{

        OrderGoods orderGoods = new OrderGoods();
        orderGoods.setCreateTime(new Date());
        orderGoods.setGoodsId(goodsId);
        orderGoods.setOrderId(orderId);
        orderGoods.setPrice(price);
        orderGoods.setQuanity(num);
        String productName = goodsQueryService.queryProductById(orderGoods.getGoodsId()).getProductName();
        orderGoods.setGoodsName(productName);
        orderGoodsMapper.insert(orderGoods);
        return orderGoods.getId();
    }
}
