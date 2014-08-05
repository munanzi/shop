package com.mission.shop.order.service.impl.order;

import com.mission.shop.order.service.order.ExpressFeeService;
import org.springframework.stereotype.Service;

/**
 * User: hexizheng@163.com
 * Date: 14-7-27
 * Time: 下午8:46
 */
@Service
public class ExpressFeeServiceImpl implements ExpressFeeService{


    @Override
    public int getExpressFee() {
        //TODO 计算快递费
        return 8;
    }
}
