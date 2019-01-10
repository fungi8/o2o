package cn.fungus.dao;

import cn.fungus.entity.Shop;

/**
 * create by fungus on 2018/6/29
 **/

public interface ShopDao {

    /**
     * 新增店铺
     * @param shop
     * @return
     */
    int insertShop(Shop shop);
}
