package com.mission.shop.product.service.impl.goods;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mission.shop.base.common.exception.BusinessException;
import com.mission.shop.product.common.code.ProductStatus;
import com.mission.shop.product.common.code.ShopStatus;
import com.mission.shop.product.common.constants.ProductConstants;
import com.mission.shop.product.dao.model.Cart;
import com.mission.shop.product.dao.model.Goods;
import com.mission.shop.product.dao.model.Product;
import com.mission.shop.product.dao.model.Shop;
import com.mission.shop.product.service.goods.GoodsPriceService;
import com.mission.shop.product.service.goods.GoodsQueryService;
import com.mission.shop.product.service.goods.GoodsShowQueryService;
import com.mission.shop.product.service.goods.GoodsView;
import com.mission.shop.product.service.shop.ShopQueryService;


/**
 * 
 * 
 * 下单显示商品信息查询服务
 * @author hexizheng
 *
 */
@Service
public class GoodsShowQueryServiceimpl implements GoodsShowQueryService{

	@Autowired
	private GoodsPriceService goodsPriceService;
	@Autowired
	private GoodsQueryService goodsQueryService;
	@Autowired
	private ShopQueryService shopQueryService;
	 /**
     * 
     * @param goodsId
     * @param goodsNum
     * @return Map<店铺名称,goodsview>
     * @throws BusinessException
     */
    public GoodsView queryGoodsView(Long goodsId,int goodsNum)throws BusinessException{
    	GoodsView goodsView = new GoodsView();
    	Goods goods = goodsQueryService.queryGoodsById(goodsId);
    	goodsView.setGoodsId(goodsId);
    	goodsView.setNum(goodsNum);
    	try{
    		goodsView.setPrice(goodsPriceService.getGoodsPrice(goodsId));
    	}catch(BusinessException e){
    		goodsView.setPrice(goods.getPrice());
    	}
    	if(!goods.getStatus().equals(ProductConstants.NORMAL_STATUS)){
    		goodsView.setNormalStatus(false);
    	}
    	Product product = goodsQueryService.queryProductById(goodsId);
    	goodsView.setProductTitle(product.getProductTitle());
    	if(!product.getStatus().equals(ProductStatus.ON_SALE.getCode())){
    		goodsView.setNormalStatus(false);
    	}
    	goodsView.setProductTitle(product.getProductTitle());
    	Shop shop = shopQueryService.queryShopById(product.getShopId());
    	if(!shop.getStatus().equals(ShopStatus.NAORMAL.getClass())){
    		goodsView.setNormalStatus(false);
    	}
    	goodsView.setShopName(shop.getShopName());
    	return goodsView;
    }
	@Override
	public Map<String,List<GoodsView>> queryGoodsView(List<Cart> list)
			throws BusinessException {
		Map<String,List<GoodsView>> map = new HashMap<String,List<GoodsView>>();
		for(Cart cart:list){
			GoodsView goodsView = queryGoodsView(cart.getGoodsId(),cart.getBuyNum());
			List<GoodsView> viewList = map.get(goodsView.getShopName());
			if(viewList==null){
				viewList = new ArrayList<GoodsView>();
			}
			viewList.add(goodsView);
			map.put(goodsView.getShopName(), viewList);
		}
		return map;
	}

    public Map<String,List<GoodsView>> queryGoodsView(Map<String,String> goodsMap)throws BusinessException{

        Map<String,List<GoodsView>> map = new HashMap<String,List<GoodsView>>();

        Iterator iterator = goodsMap.keySet().iterator();
        while(iterator.hasNext()){
            Long goodsId =  Long.parseLong((String)iterator.next());
            int num= Integer.parseInt((String)goodsMap.get(goodsId+""));
            GoodsView goodsView = queryGoodsView(goodsId,num);
            List<GoodsView> viewList = map.get(goodsView.getShopName());
            if(viewList==null){
                viewList = new ArrayList<GoodsView>();
            }
            viewList.add(goodsView);
            map.put(goodsView.getShopName(), viewList);
        }

        return map;
    }
}
