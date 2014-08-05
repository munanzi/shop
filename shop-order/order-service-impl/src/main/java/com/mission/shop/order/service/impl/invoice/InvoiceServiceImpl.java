package com.mission.shop.order.service.impl.invoice;


import com.mission.shop.base.common.exception.SystemException;
import com.mission.shop.order.common.code.InvoiceProductType;
import com.mission.shop.order.common.code.InvoiceType;
import com.mission.shop.order.dao.mapper.InvoiceMapper;
import com.mission.shop.order.dao.model.Invoice;
import com.mission.shop.order.service.invoice.InvoiceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

/**
 * User: hexizheng@163.com
 * Date: 14-7-22
 * Time: 下午9:46
 */


@Service
public class InvoiceServiceImpl implements InvoiceService{

    @Autowired
    private InvoiceMapper invoiceMapper;


    @Transactional(rollbackFor = Exception.class)
    public Long saveOrderInvoice(String title,short productType,short type){
        if(!InvoiceProductType.isCodeExist(productType)) {
             throw new SystemException("不存在的invoiceProductType："+productType) ;
        }
        if(!InvoiceType.isCodeExist(type)){
            throw new SystemException("不存在的invoiceType："+type) ;
        }
        Invoice invoice = new Invoice();
        invoice.setProductType(productType);
        invoice.setType(type);
        invoice.setTitle(title);
        invoice.setCreateTime(new Date());
        invoiceMapper.insert(invoice);
        return invoice.getInvoiceId();
    }
}
