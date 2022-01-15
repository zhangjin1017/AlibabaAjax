package com.zj.xstream;

import com.thoughtworks.xstream.XStream;
import org.junit.Test;

import java.util.ArrayList;
import java.util.List;

/**
 * @author 1216916137
 */
public class xstream {
    public List<Province> getProvinceList() {
        Province province1=new Province();
        province1.setProvinceName("常州");
        province1.addCity(new City("钟楼区","zhonglouqu"));
        province1.addCity(new City("武进区","wujinqu"));
        Province province2=new Province();
        province2.setProvinceName("连云港");
        province2.addCity(new City("海州区","haizhouqu"));
        province2.addCity(new City("连云区","lianyunqu"));
        List<Province> provinceList=new ArrayList<Province>();
        provinceList.add(province1);
        provinceList.add(province2);
        return provinceList;
    }
    @Test
    public void fun1(){
    List<Province> provinceList = getProvinceList();
    XStream xstream = new XStream();
    String s=xstream.toXML(provinceList);
        System.out.println(s);
    }
    @Test
    public void fun2(){
        List<Province> provinceList = getProvinceList();
        XStream xstream = new XStream();
        xstream.alias("china",List.class); //给List类型指定别名为china
        xstream.alias("province",Province.class);//给province指定别名为pzovince
        xstream.alias("city",City.class);//给city类型指定别名为city
        String s=xstream.toXML(provinceList);
        System.out.println(s);
    }

    @Test
    public void fun3(){
        List<Province> provinceList = getProvinceList();
        XStream xstream = new XStream();
        xstream.alias("china",List.class);
        xstream.alias("province",Province.class);
        xstream.alias("city",City.class);
        xstream.useAttributeFor(Province.class,"provinceName");//把Province类的名为provinceName成员，生成<province> 元素的provinceName属性
        String s=xstream.toXML(provinceList);
        System.out.println(s);
    }
    @Test
    public void fun4(){
        List<Province> provinceList = getProvinceList();
        XStream xstream = new XStream();
        xstream.alias("china",List.class);
        xstream.alias("province",Province.class);
        xstream.alias("city",City.class);
        xstream.useAttributeFor(Province.class,"provinceName");
        xstream.addImplicitCollection(Province.class,"cities");//让Province类的名为cities (它是List类型的，它的内容还会生成元素)的成名不生成元素去除类的指定成名，让其不生成xm1元素
        String s=xstream.toXML(provinceList);
        System.out.println(s);
    }
    @Test
    public void fun5(){
        List<Province> provinceList = getProvinceList();
        XStream xstream = new XStream();
        xstream.alias("china",List.class);
        xstream.alias("province",Province.class);
        xstream.alias("city",City.class);
        xstream.useAttributeFor(Province.class,"provinceName");
        xstream.addImplicitCollection(Province.class,"cities");
        xstream.omitField(City.class,"description");//在生成的xml中不会出现City类的名为description的对应的元素!
        String s=xstream.toXML(provinceList);
        System.out.println(s);
    }
}
