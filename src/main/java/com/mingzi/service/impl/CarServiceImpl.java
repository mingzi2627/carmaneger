package com.mingzi.service.impl;

import com.mingzi.mapper.CarMapper;
import com.mingzi.pojo.Car;
import com.mingzi.service.CarService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author dyqstart
 * @create 2020-05-07 16:11
 */
@Service
public class CarServiceImpl implements CarService {
    @Resource
    private CarMapper carMapper;


    @Override
    public List<Car> selectByList() {
        return carMapper.selectByList();
    }
}
