package com.mission.shop.order.service.order;

import com.mission.shop.base.common.exception.BusinessException;
import com.mission.shop.base.common.exception.SystemException;
import com.mission.shop.order.common.returncode.OrderReturnCode;
import com.mission.shop.order.dao.model.Order;
import com.mission.shop.order.dao.model.OrderExample;
import com.mission.shop.order.dao.model.QueryOrderPO;
import com.mission.shop.order.dao.model.QueryOrderRO;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * User: hexizheng@163.com
 * Date: 14-11-17
 * Time: 下午3:13
 */
public interface OrderQueryService {

    /**
     * id 查找订单
     * @param orderId
     * @return
     * @throws com.mission.shop.base.common.exception.BusinessException 订单不存在时抛出异常
     */
    public Order queryOrderbyOrderId(Long orderId) throws BusinessException ;


    public List<QueryOrderRO> queryOrder(QueryOrderPO queryOrderPO);

    public int countOrder(QueryOrderPO queryOrderPO);
}
