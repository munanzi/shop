package com.mission.shop.product.service.impl.packinglist;

import com.mission.shop.product.common.constants.ProductConstants;
import com.mission.shop.product.dao.mapper.PackingListMapper;
import com.mission.shop.product.dao.model.PackingList;
import com.mission.shop.product.dao.model.PackingListExample;
import com.mission.shop.product.service.packinglist.PackingListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * User: hexizheng@163.com
 * Date: 14-7-17
 * Time: 下午1:50
 */
@Service
public class PackingListServiceImpl implements PackingListService {

    @Autowired
    private PackingListMapper packingListMapper;

    public List<PackingList> queryPackingListByProductId(Long productId){
        PackingListExample example = new PackingListExample();
        example.createCriteria().andProductIdEqualTo(productId)
                    .andStatusEqualTo(ProductConstants.NORMAL_STATUS);
        return packingListMapper.selectByExample(example) ;
    }
}
