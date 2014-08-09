package com.mission.shop.order.service.impl.orderaddress;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mission.shop.base.common.exception.BusinessException;
import com.mission.shop.order.dao.mapper.OrderAddressMapper;
import com.mission.shop.order.dao.model.OrderAddress;
import com.mission.shop.order.service.orderaddress.OrderAddressService;
import com.mission.shop.user.dao.model.UserAddress;
import com.mission.shop.user.service.area.AreaService;
import com.mission.shop.user.service.useraddress.UserAddressServcie;

/**
 * User: hexizheng@163.com
 * Date: 14-7-22
 * Time: 下午9:46
 */
@Service
public class OrderAddressServiceImpl implements OrderAddressService {

    @Autowired
    private OrderAddressMapper orderAddressMapper;
    @Autowired
    private AreaService areaService;

    @Autowired
    private UserAddressServcie userAddressServcie;

    @Override
    public Long saveOrderAddress(Long orderId,Long userAddressId) throws BusinessException{
        UserAddress userAddress = userAddressServcie.queryById(userAddressId);
        OrderAddress orderAddress = new OrderAddress();
        orderAddress.setOrderId(orderId);
        orderAddress.setProvince(areaService.queryById(userAddress.getProvinceId()).getAreaName());
        orderAddress.setCity(areaService.queryById(userAddress.getCityId()).getAreaName());
        orderAddress.setCounty(areaService.queryById(userAddress.getCountyId()).getAreaName());
        orderAddress.setAddress(userAddress.getAddress());
        orderAddress.setPhoneNum(userAddress.getPhoneNum());
        orderAddress.setConsigee(userAddress.getConsignee());
        orderAddress.setPostCode(userAddress.getPostCode());
        orderAddress.setCreateTime(new Date());
        orderAddressMapper.insert(orderAddress);
        return orderAddress.getId() ;
    }
}
