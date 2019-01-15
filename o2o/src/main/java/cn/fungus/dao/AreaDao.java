package cn.fungus.dao;

import cn.fungus.entity.Area;
import java.util.List;

/**
 * create by fungus on 2018/6/16
 **/

public interface AreaDao {

    /**
     * 列出区域列表
     * @return areaList
     */
    List<Area> queryArea();

}
