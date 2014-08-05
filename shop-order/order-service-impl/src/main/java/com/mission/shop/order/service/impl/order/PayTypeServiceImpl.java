package com.mission.shop.order.service.impl.order;

import com.mission.shop.order.service.order.PayTypeService;
import com.mission.shop.product.common.code.PayType;
import org.springframework.stereotype.Service;

/**
 * User: hexizheng@163.com
 * Date: 14-7-27
 * Time: 下午8:58
 */
@Service
public class PayTypeServiceImpl implements PayTypeService {

    public PayType getPayType(){
        //TODO 支付方式
        return PayType.ONLINE_PAY;
    }

}
