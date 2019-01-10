package cn.fungus.service;

import cn.fungus.BaseTest;
import cn.fungus.entity.Area;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

import static org.junit.Assert.assertEquals;

/**
 * create by fungus on 2018/6/19
 **/

public class AreaServiceTest extends BaseTest {

    @Autowired
    private AreaService areaService;

    @Test
    public void testGetAreaList() {
        List<Area> list = areaService.getAreaList();
        System.out.println(list.get(0).getAreaName());
        assertEquals("西苑",list.get(0).getAreaName());
    }
}
