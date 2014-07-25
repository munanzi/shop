package com.mission.shop.order.service.invoice;

import com.mission.shop.order.dao.model.Invoice;

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
    public Long saveOrderInvoice(String title,short productType,short type);
}
