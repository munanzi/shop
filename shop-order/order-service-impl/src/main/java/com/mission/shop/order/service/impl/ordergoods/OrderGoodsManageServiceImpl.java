package com.mission.shop.order.service.impl.ordergoods;

import java.util.Date;
import java.util.List;

import com.mission.shop.order.service.ordergoods.OrderGoodsManageService;
import com.mission.shop.product.service.goods.GoodsView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mission.shop.base.common.exception.BusinessException;
import com.mission.shop.order.dao.mapper.OrderGoodsMapper;
import com.mission.shop.order.dao.model.OrderGoods;
import com.mission.shop.order.service.order.BuyedGoods;
import com.mission.shop.product.service.goods.GoodsQueryService;

/**
 * User: hexizheng@163.com
 * Date: 14-7-22
 * Time: 下午9:46
 */

@Service
public class OrderGoodsManageServiceImpl implements OrderGoodsManageService {

    @Autowired
    private OrderGoodsMapper orderGoodsMapper;

    @Autowired
    private GoodsQueryService goodsQueryService;

    @Transactional(rollbackFor=Exception.class)
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
    @Transactional(rollbackFor=Exception.class)
    public void saveOrderGoods(Long orderId,List<GoodsView> list)throws BusinessException{
    	
    	for(GoodsView goodsView:list){
    		saveOrderGoods(orderId,goodsView.getGoodsId(),goodsView.getPrice(),goodsView.getNum());
    	}
    }
}
