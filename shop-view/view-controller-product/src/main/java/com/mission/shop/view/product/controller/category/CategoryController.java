package com.mission.shop.view.product.controller.category;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mission.shop.base.common.utils.StringUtils;
import com.mission.shop.product.dao.model.Category;
import com.mission.shop.product.dao.model.Product;
import com.mission.shop.product.service.category.CategoryService;
import com.mission.shop.product.service.product.ProductQueryService;
import com.mission.shop.product.service.productCat.ProductCatService;
import com.mission.shop.user.dao.model.User;
import com.mission.shop.view.product.util.UserUtils;

@Controller
@RequestMapping("category")
public class CategoryController {
	
	@Autowired
	private CategoryService categoryService;

    @Autowired
    private ProductQueryService productQueryService;

    @Autowired
    private ProductCatService  productCatService;

    private  final Logger logger = LoggerFactory.getLogger(getClass());

    
    
	@RequestMapping("index")
	public String index(String catId,Model model,HttpSession session){

        User user = UserUtils.getUser(session);
		
		Category catetory = categoryService.queryTopCategory();
		List<Category> catList = categoryService.queryCategoryByParent(catetory.getCatId());
        model.addAttribute("catetory",catetory);
        model.addAttribute("catList",catList);
        if(user!=null){
             model.addAttribute("userName",user.getUserName());
        }
		

        if(StringUtils.isNotEmpty(catId)){
            List<Product> list = productCatService.queryProductByCatId(Long.parseLong(catId));
            model.addAttribute("productList",list);
        }

		return "index";
	}
}
