package cn.fungus.util;

/**
 * create by fungus on 2019/1/15
 **/

public class PathUtil {
    private static String separator = System.getProperty("file.separator");
    public static String getBasePath() {
        String os = System.getProperty("os.name");
        String basePath = "";
        if (os.toLowerCase().startsWith("win")) {
            basePath = "D:/o2oProjectDev/image";
        } else {
            basePath = "home/o2o/image";
        }
        basePath = basePath.replace("/", separator);
        return basePath;
    }

    public static String getShopImagePath(Long shopId) {
        String imagePath = "/upload/item/shop/" + shopId + "/";
        return imagePath.replace("/", separator);
    }


}
