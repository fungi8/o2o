package cn.fungus.service;

import cn.fungus.dto.ShopExecution;
import cn.fungus.entity.Shop;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.io.File;

/**
 * create by fungus on 2019/1/21
 **/

public interface ShopService {

    ShopExecution addShop(Shop shop, CommonsMultipartFile shopImg);
}
