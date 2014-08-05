package com.mission.shop.order.service.order;

/**
 * User: hexizheng@163.com
 * Date: 14-7-20
 * Time: 下午3:04
 */
public class BuyedGoods {

    private Long goodesId;
    //购买数量
    private int buyNum;
    //商品单价，用于与创建订单时价格进行比较
    private int price;


    public BuyedGoods() {

    }

    public BuyedGoods(Long goodesId, int buyNum,int amount) {
        this.goodesId = goodesId;
        this.buyNum = buyNum;
    }

 

    public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Long getGoodesId() {
        return goodesId;
    }

    public void setGoodesId(Long goodesId) {
        this.goodesId = goodesId;
    }

    public int getBuyNum() {
        return buyNum;
    }

    public void setBuyNum(int buyNum) {
        this.buyNum = buyNum;
    }
}
