package com.mission.shop.product.service.category;

import java.util.List;

import com.mission.shop.base.common.exception.BusinessException;
import com.mission.shop.product.dao.model.Category;

public interface CategoryService {
	
	/**
	 * 查询顶级分类

	 * @return
	 * @throws BusinessException
	 */
	public Category queryTopCategory();


    /**
     *   根据层级和分类名称查找分类
     * @param level  层级
     * @param categeryName  分类名称
     * @return
     */
    public Category queryCategory(short level,String categeryName);

    /**
	 * 查询子分类

	 * @return
	 * @throws BusinessException
	 */
	public List<Category> queryCategoryByParent(Long parentId);
	
	/**
	 * 新增分类
	 * @param list
	 * @throws BusinessException
	 */
	public void addCatetories(List<Category> list) throws BusinessException;
}
