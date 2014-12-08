package com.mission.shop.order.dao.model;

import org.springframework.util.StringUtils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.SimpleFormatter;

/**
 * User: hexizheng@163.com
 * Date: 14-11-4
 * Time: 上午10:38
 */
public class QueryOrderPO {

    private Long buyerId;
    private Long sellerId;
    private String productName;
    private Long orderId;

    private String beginDate;  //yyyy-MM-dd
    private String endDate;    //yyyy-MM-dd
    private Short status;

    private int pageSize = 20;
    private int skipNum =0;


    public Date getBeginTime(){
        if(StringUtils.isEmpty(beginDate)){
            return null;
        }
        try{
            return new SimpleDateFormat("yyyy-MM-dd").parse(beginDate);
        }catch(Exception e){
            throw new RuntimeException("日期格式化失败",e);
        }
    }
    public Date getEndTime(){
        if(StringUtils.isEmpty(endDate)){
            return null;
        }
        try{
            return new SimpleDateFormat("yyyy-MM-dd").parse(endDate);
        }catch(Exception e){
            throw new RuntimeException("日期格式化失败",e);
        }
    }
    public Long getBuyerId() {
        return buyerId;
    }

    public void setBuyerId(Long buyerId) {
        this.buyerId = buyerId;
    }

    public Long getSellerId() {
        return sellerId;
    }

    public void setSellerId(Long sellerId) {
        this.sellerId = sellerId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public String getBeginDate() {
        return beginDate;
    }

    public void setBeginDate(String beginDate) {
        this.beginDate = beginDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public Short getStatus() {
        return status;
    }

    public void setStatus(Short status) {
        this.status = status;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getSkipNum() {
        return skipNum;
    }

    public void setSkipNum(int skipNum) {
        this.skipNum = skipNum;
    }
}
