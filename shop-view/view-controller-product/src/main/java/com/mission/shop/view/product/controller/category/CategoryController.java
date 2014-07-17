package com.mission.shop.view.product.controller.category;

import com.mission.shop.base.common.exception.BusinessException;
import com.mission.shop.base.common.threadlocal.ThreadLocalUtils;
import com.mission.shop.base.common.utils.StringUtils;
import com.mission.shop.product.dao.model.Category;
import com.mission.shop.product.dao.model.Product;
import com.mission.shop.product.service.category.CategoryService;
import com.mission.shop.product.service.product.ProductQueryService;
import com.mission.shop.product.service.productCat.ProductCatService;
import com.mission.shop.user.dao.model.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

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
	public String index(String catId,Model model){

        User user = ThreadLocalUtils.getUser(User.class);
		try{
			Category catetory = categoryService.queryTopCategory();
			List<Category> list = categoryService.queryCategoryByParent(catetory.getCatId());
            model.addAttribute("catetory",catetory);
            model.addAttribute("catList",list);
            if(user!=null){
                 model.addAttribute("userName",user.getUserName());
            }
		}catch(BusinessException e){
			logger.error("category",e);
			return "common/error";
		}

        if(StringUtils.isNotEmpty(catId)){
            List<Product> list = productCatService.queryProductByCatId(Long.parseLong(catId));
            model.addAttribute("productList",list);
        }

		return "index";
	}
}
