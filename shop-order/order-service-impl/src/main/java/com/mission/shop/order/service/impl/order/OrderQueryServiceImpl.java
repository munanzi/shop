package com.mission.shop.order.service.impl.order;

import com.mission.shop.base.common.exception.BusinessException;
import com.mission.shop.base.common.exception.SystemException;
import com.mission.shop.order.common.returncode.OrderReturnCode;
import com.mission.shop.order.dao.mapper.OrderMapper;
import com.mission.shop.order.dao.model.Order;
import com.mission.shop.order.dao.model.QueryOrderPO;
import com.mission.shop.order.dao.model.QueryOrderRO;
import com.mission.shop.order.service.order.OrderQueryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * User: hexizheng@163.com
 * Date: 14-11-4
 * Time: 上午10:21
 */
@Service
public class OrderQueryServiceImpl implements OrderQueryService {

    @Autowired
    private OrderMapper orderMapper;
    /**
     * id 查找订单
     * @param orderId
     * @return
     * @throws BusinessException 订单不存在时抛出异常
     */
    public Order queryOrderbyOrderId(Long orderId) throws BusinessException{

        if(orderId==null){
            throw new SystemException("orderId 不能为null");
        }
        Order order = orderMapper.selectByPrimaryKey(orderId);
        if(order==null){
            throw new BusinessException(OrderReturnCode.ORDER_NOT_EXIST);
        }
        return order;
    }


    public List<QueryOrderRO> queryOrder(QueryOrderPO queryOrderPO){

         return orderMapper.queryOrder(queryOrderPO);
    }
    public int countOrder(QueryOrderPO queryOrderPO){

         return orderMapper.countOrder(queryOrderPO);
    }
}
