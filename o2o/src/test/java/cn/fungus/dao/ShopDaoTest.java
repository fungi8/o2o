package cn.fungus.dao;

import cn.fungus.BaseTest;
import cn.fungus.entity.Area;
import cn.fungus.entity.PersonInfo;
import cn.fungus.entity.Shop;
import cn.fungus.entity.ShopCategory;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;

import static org.junit.Assert.assertEquals;

/**
 * create by fungus on 2018/6/29
 **/

public class ShopDaoTest extends BaseTest {
    @Autowired
    private ShopDao shopDao;

    @Test
    @Ignore
    public void testInsertShop() {
        Shop shop = new Shop();
        PersonInfo owner = new PersonInfo();
        Area area = new Area();
        ShopCategory shopCategory = new ShopCategory();
        owner.setUserId(1L);
        area.setAreaId(2L);
        shopCategory.setShopCategoryId(1L);
        shop.setArea(area);
        shop.setOwner(owner);
        shop.setShopCategory(shopCategory);
        shop.setShopName("测试的店铺");
        shop.setPhone("test");
        shop.setShopImg("test");
        shop.setShopAddr("test");
        shop.setShopDesc("test");
        shop.setCreateTime(new Date());
        shop.setAdvice("审核中");
        shop.setEnableStatus(1);
        int effectedNum = shopDao.insertShop(shop);
        assertEquals(1, effectedNum);
    }

    @Test
    public void testUpdateShop() {
        Shop shop = new Shop();
        shop.setShopId(1L);
        shop.setShopAddr("测试更新地址");
        shop.setShopDesc("测试更新描述");
        shop.setLastEditTime(new Date());
        int effectedNum = shopDao.updateShop(shop);
        assertEquals(1, effectedNum);
    }
}
