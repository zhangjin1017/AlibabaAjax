package com.zj.xstream;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

/**
 * @author 1216916137
 */
@Data
public class Province {
    private String provinceName;
    private List<City> cities=new ArrayList<>();
    public void addCity(City city){
        cities.add(city);
    }
}
