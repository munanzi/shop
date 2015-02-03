package com.mission.shop.order.service.impl.ordergoods;

import com.mission.shop.base.common.exception.SystemException;
import com.mission.shop.order.dao.mapper.OrderGoodsMapper;
import com.mission.shop.order.dao.model.OrderGoods;
import com.mission.shop.order.dao.model.OrderGoodsExample;
import com.mission.shop.order.service.ordergoods.OrderGoodsQueryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * User: hexizheng@163.com
 * Date: 14-12-10
 * Time: 上午11:08
 */
@Service
public class OrderGoodsQueryServiceImpl implements OrderGoodsQueryService {

    @Autowired
    private OrderGoodsMapper orderGoodsMapper;


    public List<OrderGoods> queryOrderGoodsByOrderId(Long orderId){
        if(orderId==null){
            throw new SystemException("orderId 不能为null");
        }
        OrderGoodsExample example = new OrderGoodsExample();
        example.createCriteria().andOrderIdEqualTo(orderId);
        return orderGoodsMapper.selectByExample(example);
    }
}
