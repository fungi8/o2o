package cn.fungus.util;

import net.coobird.thumbnailator.Thumbnails;
import net.coobird.thumbnailator.geometry.Positions;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.imageio.ImageIO;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

/**
 * create by fungus on 2019/1/15
 **/

public class ImageUtil {
    private static String basePath = Thread.currentThread().getContextClassLoader().getResource("").getPath();
    private static final SimpleDateFormat sDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
    private static final Random r = new Random();

    public static String generateThumbnail(CommonsMultipartFile thumbnail, String targetAddr) {
        String realFileName = getRandomFileName();
        String extension = getFileExtension(thumbnail);
        markDirPath(targetAddr);
        String relativeAddr = targetAddr + realFileName + extension;
        File dest = new File(PathUtil.getBasePath() + relativeAddr);
        try {
            Thumbnails.of(thumbnail.getInputStream()).size(200, 200).
                    watermark(Positions.BOTTOM_RIGHT,
                            ImageIO.read(new File(basePath + "/dd.jpg")), 0.9f).outputQuality(0.8f).toFile(dest);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return relativeAddr;
    }

    /**
     * 创建目标路径所涉及的目录
     *
     * @param targetAddr
     */
    private static void markDirPath(String targetAddr) {
        String realFileParentPath = PathUtil.getBasePath() + targetAddr;
        File dirPath = new File(realFileParentPath);
        if (!dirPath.exists()) {
            dirPath.mkdirs();
        }
    }

    /**
     * 获取输入文件的扩展名
     *
     * @param cFile
     * @return
     */
    private static String getFileExtension(CommonsMultipartFile cFile) {
        String originalFileName = cFile.getOriginalFilename();
        return originalFileName.substring(originalFileName.lastIndexOf("."));
    }

    /**
     * 生成随机文件名， 当前时间年月日时分秒+五位随机数
     *
     * @return
     */
    private static String getRandomFileName() {
        int randNum = r.nextInt(89999) + 10000;
        String nowTime = sDateFormat.format(new Date());
        return nowTime + randNum;
    }

//
//    public static void main(String[] args) throws IOException {
//        Thumbnails.of(new File("C:/Users/fungus/Desktop/xiaohuangren1.jpg")).
//                size(200,200).
//                watermark(Positions.BOTTOM_RIGHT,
//                ImageIO.read(new File(basePath+"/dd.jpg")), 0.9f).
//                outputQuality(0.5f).toFile("C:/Users/fungus/Desktop/xiaohuangre2.jpg");
////        Thumbnails.of(new File("C:/Users/fungus/Desktop/dd2.jpg")).size(33,33).toFile("C:/Users/fungus/Desktop/dd3.jpg");
//
//    }
}
