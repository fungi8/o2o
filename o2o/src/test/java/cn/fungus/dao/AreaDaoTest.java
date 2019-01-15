package cn.fungus.dao;

import cn.fungus.BaseTest;
import cn.fungus.entity.Area;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

import static org.junit.Assert.assertEquals;

/**
 * create by fungus on 2018/6/19
 **/

public class AreaDaoTest extends BaseTest{
    @Autowired
    private AreaDao dao;

    @Test
    public void testQueryArea() {
        List<Area> areas = dao.queryArea();
        for (Area a:
             areas) {
            System.out.println(a.getAreaId() + " : "  + a.getAreaName());
        }
//        assertEquals(2, areas.size());
    }

}
