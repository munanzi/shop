package com.mission.shop.view.product.controller.product;

import com.mission.shop.product.service.product.FullProduct;
import com.mission.shop.product.service.product.FullProductService;
import com.mission.shop.product.service.product.ProductQueryService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * User: hexizheng@163.com
 * Date: 14-6-24
 * Time: 上午10:07
 */


@Controller
@RequestMapping("product")
public class ProductController {

    @Autowired
    private FullProductService fullProductService;

    private  final Logger logger = LoggerFactory.getLogger(getClass());


    @RequestMapping("detail")
    public String detail(Long productId,ModelMap model){
        try{
            FullProduct fullProduct = fullProductService.queryFullProduct(productId);
            model.addAttribute("fullProduct",fullProduct);
        }catch (Exception e ){
            logger.error("查询商品失败",e);
            return "common/error";
        }
        return "product/detail";
    }
}
