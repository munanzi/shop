package com.mission.shop.product.service.impl.goods;

import com.mission.shop.product.common.returncode.ProductReturnCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mission.shop.base.common.exception.BusinessException;
import com.mission.shop.base.common.exception.SystemException;
import com.mission.shop.product.common.constants.ProductConstants;
import com.mission.shop.product.dao.model.Goods;
import com.mission.shop.product.service.goods.GoodsPriceService;
import com.mission.shop.product.service.goods.GoodsQueryService;

/**
 * User: hexizheng@163.com
 * Date: 14-7-23
 * Time: 下午9:22
 */
@Service
public class GoodsPriceServiceImpl implements GoodsPriceService {

    @Autowired
    private GoodsQueryService goodsQueryService;

    public int getGoodsPrice(Long goodsId) throws BusinessException{
        Goods goods = goodsQueryService.queryGoodsById(goodsId);
        if(ProductConstants.NORMAL_STATUS!=goods.getStatus()){
            throw new BusinessException(ProductReturnCode.OFF_SALE) ;
        }
        Integer price = goods.getPrice();
        if(price==null||price==0){
            throw new SystemException("商品价格信息异常");
        }
        return price;
    }
}
