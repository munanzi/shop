package com.mission.shop.base.common.jstl;

import com.mission.shop.base.common.utils.NumberUtils;

/**
 * User: hexizheng@163.com
 * Date: 14-11-25
 * Time: 下午4:54
 */
public class AmountTransfer {


    public static String display(Integer amount){
        if(amount==null){
            return "";
        }
        return NumberUtils.leftMove(amount.toString(),2);
    }
}
