package com.zj.json;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.junit.Test;

import java.util.ArrayList;
import java.util.List;

public class JsonLib {
    @Test
    public void fun1(){
        JSONObject map=new JSONObject();
        map.put("name","zhangjin");
        map.put("age","20");
        map.put("sex","m");
        String s= map.toString();
        System.out.println(s);
    }
    @Test
    public void fun2(){
        Person p = new Person("zhangsan",20,"f");
       JSONObject map= (JSONObject) JSONObject.toJSON(p);
        System.out.println(map.toString());
    }
    @Test
    public void fun3(){
        Person p1 = new Person("zhangsan1",21,"m");
        Person p2 = new Person("zhangsan2",20,"f");
        JSONArray list=new JSONArray();
        list.add(p1);
        list.add(p2);
        System.out.println(list.toString());
    }
    @Test
    public void fun4(){
        Person p1 = new Person("zhangsan1",21,"m");
        Person p2 = new Person("zhangsan2",20,"f");
        List<Person> list = new ArrayList<Person>();
        list.add(p1);
        list.add(p2);
        System.out.println(JSONArray.toJSON(list).toString());
    }
}
