package com.mission.shop.view.user.controller.area;

import com.mission.shop.user.dao.model.Area;
import com.mission.shop.user.service.area.AreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * User: hexizheng@163.com
 * Date: 14-8-18
 * Time: 下午7:51
 */

@Controller
@RequestMapping("area")
public class AreaController {


    @Autowired
    private AreaService areaService;



    @RequestMapping("getSubArea")
     public @ResponseBody List<Area> getSubArea(String areaId){
        List<Area> areaList = areaService.queryAllSubArea(Long.parseLong(areaId)) ;

        return areaList;

    }

    @RequestMapping("test")
    @ResponseBody
    public  Map<String,String> test(){
       Map<String,String> map = new HashMap<String,String>();
        map.put("sdf","sdf") ;

        return map;

    }
    @RequestMapping("test2")
    @ResponseBody
    public  String test2(){
    	
    	return "sdf测试";
    	
    }
}
