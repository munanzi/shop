package com.mission.shop.order.service.orderaddress;

import com.mission.shop.base.common.exception.BusinessException;
import com.mission.shop.order.dao.model.OrderAddress;

/**
 * User: hexizheng@163.com
 * Date: 14-7-22
 * Time: 下午9:45
 */
public interface OrderAddressService {


    /**
     * 查找订单地址
     * @param orderId
     * @return
     */
    public OrderAddress queryOrderAddress(Long orderId);


        /**
        * 由用户地址保存 订单地址，用户地址和订单地址分开存放
        * @param userAddressId
        * @return  订单地址Id
        */
    public Long saveOrderAddress(Long orderId,Long userAddressId)throws BusinessException;
}
