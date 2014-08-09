package com.mission.shop.order.service.order;

import java.util.ArrayList;
import java.util.List;

/**
 * 存放用户购买的商品及数量价格，发票，地址等
 * User: hexizheng@163.com
 * Date: 14-7-17
 * Time: 下午7:17
 */
public class OrderPO {

    private Long userId;
    private String userName;

    private List<BuyedGoods> goodsList = new ArrayList<BuyedGoods>();

    private Long addressId;

    private String isNeedInvoice;
    // 发票类型，增值税发票，普通发票等
    private short invoiceType;

    //发票商品类型
    private short invoiceProductType;

    private String invoiceTitle; //发票抬头

    private int totalAmount;//下单页面显示的金额，用来跟计算的金额比较是否一致

    private String remark ;// 下单备注

    private int useIntegral = 0; //使用的积分数


    //添加购买的商品
    public void addGoods(BuyedGoods buyedGoods){
        goodsList.add(buyedGoods);
    }

    public List<BuyedGoods> getGoodsList() {
        return goodsList;
    }

    public void setGoodsList(List<BuyedGoods> goodsList) {
        this.goodsList = goodsList;
    }

    public int getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(int totalAmount) {
        this.totalAmount = totalAmount;
    }

    public Long getAddressId() {
        return addressId;
    }

    public void setAddressId(Long addressId) {
        this.addressId = addressId;
    }

    public short getInvoiceType() {
        return invoiceType;
    }

    public void setInvoiceType(short invoiceType) {
        this.invoiceType = invoiceType;
    }

    public short getInvoiceProductType() {
        return invoiceProductType;
    }

    public void setInvoiceProductType(short invoiceProductType) {
        this.invoiceProductType = invoiceProductType;
    }

    public String getInvoiceTitle() {
        return invoiceTitle;
    }

    public void setInvoiceTitle(String invoiceTitle) {
        this.invoiceTitle = invoiceTitle;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public int getUseIntegral() {
        return useIntegral;
    }

    public void setUseIntegral(int useIntegral) {
        this.useIntegral = useIntegral;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
}
