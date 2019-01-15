package cn.fungus.dao;

import cn.fungus.entity.Shop;

/**
 * create by fungus on 2018/6/29
 **/

public interface ShopDao {

    /**
     * 新增店铺
     * @param shop
     * @return 影响行数
     */
    int insertShop(Shop shop);

    /**
     * 更新店铺
     * @param shop
     * @return
     */
    int updateShop(Shop shop);
}
