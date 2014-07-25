package com.mission.shop.order.service.impl.order;

import com.mission.shop.base.common.exception.BusinessException;
import com.mission.shop.base.common.utils.JsonUtil;
import com.mission.shop.order.service.order.BuyedGoods;
import com.mission.shop.product.service.goods.GoodsQueryService;
import com.mission.shop.product.service.product.ProductQueryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * User: hexizheng@163.com
 * Date: 14-7-20
 * Time: 下午12:49
 */
@Service
public class PurchaseServiceImpl {

    @Autowired
    private GoodsQueryService goodsQueryService;
    @Autowired
    private ProductQueryService productQueryService;

    public Map<Long,Map<Long,Integer>> getShopGoods(Map<String,String> goodsMap) throws BusinessException{
        Map<Long,Map<Long,Integer>> shopGoodsMap = new HashMap<Long,Map<Long,Integer>>();
        Iterator iterator = goodsMap.keySet().iterator();
        while(iterator.hasNext()){
            Long goodsId = Long.parseLong((String) iterator.next());
            Long productId = goodsQueryService.queryGoodsById(goodsId).getProductId();
            Long shopId = productQueryService.QueryProduct(productId).getShopId();
//            shopGoodsMap.put(shopId,new HashMap<Long, Integer>()));
//            goodsId,Integer.parseInt((String)goodsMap.get(goodsId)
        }
        return shopGoodsMap;
    }

//    public static void main(String[] args){
//        ArrayList list = new ArrayList();
//        list.add(new BuyedGoods(1123L,23));
//        list.add(new BuyedGoods(11223L,2533));
//        list.add(new BuyedGoods(11223L,253));
//        String json = JsonUtil.object2Json(list);
//        System.out.println(json) ;
//        System.out.println(JsonUtil.json2Object(json, List.class)) ;
//    }
}
