package com.mission.shop.view.product.controller.product;

import com.mission.shop.product.service.product.ProductQueryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
    private ProductQueryService productQueryService;

    @RequestMapping("product")
    public String detail(String productId){

        return "product/detail";
    }
}
