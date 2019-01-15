package cn.fungus.service.impl;

import cn.fungus.dao.AreaDao;
import cn.fungus.entity.Area;
import cn.fungus.service.AreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * create by fungus on 2018/6/19
 **/

@Service
public class AreaServiceImpl implements AreaService {

    @Autowired
    private AreaDao areaDAO;

    @Override
    public List<Area> getAreaList() {
        return areaDAO.queryArea();
    }
}
