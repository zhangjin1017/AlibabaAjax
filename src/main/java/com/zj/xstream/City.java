package com.zj.xstream;

import lombok.Data;

/**
 * @author 1216916137
 */
@Data
public class City {
    private String cityName;
    private String description;

    public City(String cityName, String description) {
        this.cityName = cityName;
        this.description = description;
    }
}
