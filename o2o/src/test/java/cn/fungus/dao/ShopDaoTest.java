package cn.fungus.dao;

import cn.fungus.BaseTest;
import cn.fungus.entity.Area;
import cn.fungus.entity.PersonInfo;
import cn.fungus.entity.Shop;
import cn.fungus.entity.ShopCategory;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * create by fungus on 2018/6/29
 **/

public class ShopDaoTest extends BaseTest {
    @Autowired
    private ShopDao shopDao;

    @Test
    public void testInsertShop() {
        Shop shop = new Shop();
        PersonInfo owner = new PersonInfo();
        Area area = new Area();
        ShopCategory shopCategory = new ShopCategory();

        owner.setUserId(1L);
        area.setAreaId(2L);
        shopCategory.setShopCategoryId(1L);

//        shop;
    }

}
