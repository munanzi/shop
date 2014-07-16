package com.mission.shop.product.service.impl.productattr;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mission.shop.base.common.exception.BusinessException;
import com.mission.shop.product.common.code.ProductAttrType;
import com.mission.shop.product.dao.mapper.ProductAttrMapper;
import com.mission.shop.product.dao.model.AttrGroup;
import com.mission.shop.product.dao.model.ProductAttr;
import com.mission.shop.product.dao.model.ProductAttrExample;
import com.mission.shop.product.service.attrgroup.AttrGroupQueryService;
import com.mission.shop.product.service.product.ProductQueryService;
import com.mission.shop.product.service.productattr.ProductAttrService;

/**
 * User: hexizheng@163.com
 * Date: 14-6-30
 * Time: 下午9:10
 */
@Service
public class ProductAttrServiceImpl implements ProductAttrService {

    @Autowired
    private ProductAttrMapper productAttrMapper;
    @Autowired
    private ProductQueryService productQueryService;
    @Autowired
    private AttrGroupQueryService attrGroupQueryService;
    

    @Override
    public List<ProductAttr> queryUsualAttrByProductId(Long productId) {

        ProductAttrExample example = new ProductAttrExample();
        example.createCriteria().andProductIdEqualTo(productId)
                .andAttrTypeEqualTo(ProductAttrType.USUAL_ATTR.getCode());
        example.setOrderByClause(" sort_order ");
        return productAttrMapper.selectByExample(example);
    }
    @Override
    public List<ProductAttr> querySpecAttrByProductId(Long productId) {

        ProductAttrExample example = new ProductAttrExample();
        example.createCriteria().andProductIdEqualTo(productId)
                .andAttrTypeEqualTo(ProductAttrType.SPEC_ATTR.getCode());
        example.setOrderByClause(" sort_order ");
        return productAttrMapper.selectByExample(example);
    }
    
    public Map<String,List<ProductAttr>> queryGroupAttrsByProductId(Long productId)throws BusinessException{
    	long kindId = productQueryService.QueryProduct(productId).getKindId();
    	
    	List<AttrGroup> list = attrGroupQueryService.queryAttrGroupByKindId(kindId);
    	Map<String,List<ProductAttr>> map = new HashMap<String,List<ProductAttr>>();

		for(AttrGroup attrGroup: list){
            List<ProductAttr> attrList = queryProductAttrByGroupId(attrGroup.getAttrGroupId());
            map.put(attrGroup.getGroupName(),attrList);
		}

        return map;
    }

    public List<ProductAttr> queryProductAttrByGroupId(Long groupId){

        ProductAttrExample example = new ProductAttrExample();
        example.createCriteria().andAttrGroupIdEqualTo(groupId)
                .andAttrTypeNotEqualTo(ProductAttrType.SPEC_ATTR.getCode());
        example.setOrderByClause(" sort_order ");
        return productAttrMapper.selectByExample(example);
    }
}
