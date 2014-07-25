package com.mission.shop.base.common.utils;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import com.mission.shop.base.common.exception.SystemException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * 
 * 修改与2012-4-27
 * 

 */
public class JsonUtil {
    final static Logger LOG = LoggerFactory.getLogger(JsonUtil.class);

    public static String objectToJson(Object bean) {
        try {
            ObjectMapper om = new ObjectMapper();
            String json = om.writeValueAsString(bean);
            return json;
        } catch (IOException e) {
            LOG.error(e.getMessage(), e);
            throw new SystemException(e);
        }
    }

    public static String object2Json(Object obj) {
        return objectToJson(obj);
    }

    public static Map<?, ?> jsonToObject(String json) {
        try {
            ObjectMapper om = new ObjectMapper();
            Map<?, ?> map = om.readValue(json, Map.class);
            return map;
        } catch (Exception e) {
            LOG.error(e.getMessage(), e);
            throw new SystemException(e);
        }
    }

    public static <T> T json2Object(String json, Class<T> clz) {
        try {
            ObjectMapper om = new ObjectMapper();
            T obj = om.readValue(json, clz);
            return obj;
        } catch (Exception e) {
            LOG.error(e.getMessage(), e);
            throw new SystemException(e);
        }
    }

    public static void main(String[] args){
        Map map = new HashMap();
        map.put("颜色","白");
        map.put("网络","电信3G");

        System.out.print(object2Json(map) ) ;



    }

}
