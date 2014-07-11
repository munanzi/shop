package com.mission.shop.product.service.productattr;

import com.mission.shop.base.common.exception.BusinessException;
import com.mission.shop.product.dao.model.ProductAttr;

import java.util.List;
import java.util.Map;

/**
 * User: hexizheng@163.com
 * Date: 14-6-30
 * Time: 下午9:08
 */
public interface ProductAttrService {

    /**
     * 查询常用属性
     * @param productId
     * @return 常用属性列表
     */
    public List<ProductAttr> queryUsalAttrByProductId(Long productId);

    /**
     * 查询商品规格属性
     * @param productId
     * @return 规格属性列表
     */
    public List<ProductAttr> querySpecAttrByProductId(Long productId);

    /**
     * 查询产品的分组属性，商品属性可能分组，也可能不分组，不分组时返回空map
     * 属性是否分组取决于商品的商品类型product_kind，
     * 此方法用于分组显示商品属性
     * @param productId
     * @return    ，map key是组名，list<String> 是组内属性对象，
     * @throws BusinessException
     */
    public Map<String,List<ProductAttr>> queryGroupAttrsByProductId(Long productId)throws BusinessException;

    /**
     * 根据属性组id查询属性列表，不包含规格属性
     * @param groupId
     * @return 商品属性列表
     */
    public List<ProductAttr> queryProductAttrByGroupId(Long groupId);
}

