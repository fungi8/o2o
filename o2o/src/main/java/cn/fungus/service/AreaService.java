package cn.fungus.service;

import cn.fungus.entity.Area;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * create by fungus on 2018/6/19
 **/

public interface AreaService {
    List<Area> getAreaList();
}
