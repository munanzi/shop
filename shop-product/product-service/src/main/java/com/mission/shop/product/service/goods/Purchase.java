package com.mission.shop.product.service.goods;

/**
 * 存放用户购买的商品及数量
 * User: hexizheng@163.com
 * Date: 14-7-17
 * Time: 下午7:17
 */
public class Purchase {

    private Long goodsId;
    private int buyNum; //购买的数量


    public Long getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Long goodsId) {
        this.goodsId = goodsId;
    }

    public int getBuyNum() {
        return buyNum;
    }

    public void setBuyNum(int buyNum) {
        this.buyNum = buyNum;
    }
}
