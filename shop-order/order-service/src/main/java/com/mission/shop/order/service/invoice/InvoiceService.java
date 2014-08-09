package com.mission.shop.order.service.invoice;


/**
 * User: hexizheng@163.com
 * Date: 14-7-22
 * Time: 下午9:45
 */
public interface InvoiceService {

    /**
     * 保存商品发票信息，
     * @param
     * @return  id，
     */
    public Long saveOrderInvoice(Long orderId,String title,short productType,short type);
}
