package com.mission.shop.product.service.goods;

import com.mission.shop.base.common.utils.NumberUtils;


/**
 * 确认订单页显示商品用
 * @author hexizheng
 *
 */
public class GoodsView {

	private long goodsId;
	private int price;
	private String productTitle;
	private String picUrl;
	private int num;
	//goods, product,shop 都为正常时为true
	private boolean isNormalStatus = true;	
	private String shopName;
	private Long shopId;

	public String getAmount() {
		return NumberUtils.leftMove((num*price)+"", 2);
	}

	public String getPriceStr() {
		return NumberUtils.leftMove(price+"", 2);
	}
    public int getPrice(){
        return price;
    }
	public void setPrice(int price) {
		this.price = price;
	}
	public String getProductTitle() {
		return productTitle;
	}
	public void setProductTitle(String productTitle) {
		this.productTitle = productTitle;
	}
	public String getPicUrl() {
		return picUrl;
	}
	public void setPicUrl(String picUrl) {
		this.picUrl = picUrl;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}

	public long getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(long goodsId) {
		this.goodsId = goodsId;
	}

	public boolean isNormalStatus() {
		return isNormalStatus;
	}

	public void setNormalStatus(boolean isNormalStatus) {
		this.isNormalStatus = isNormalStatus;
	}

	public String getShopName() {
		return shopName;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

    public Long getShopId() {
        return shopId;
    }

    public void setShopId(Long shopId) {
        this.shopId = shopId;
    }
}
