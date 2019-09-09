package com.hanhe.college.util;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import lombok.extern.slf4j.Slf4j;

/**
 * Created by Angelo on 2018/9/13.
 */
@Slf4j
public class WeChatUtil {

    // 获取上传媒体的接口地址
    private static final String DOWNLOAD_MEDIA_URL = "http://file.api.weixin.qq.com/cgi-bin/media/get?access_token=ACCESS_TOKEN&media_id=MEDIA_ID";

    public static void downloadImage(String accessToken, String mediaId, File imgFile) {
        // 拼接请求地址
        String requestUrl = DOWNLOAD_MEDIA_URL.replace("ACCESS_TOKEN", accessToken).replace("MEDIA_ID", mediaId);
        try {
            URL url = new URL(requestUrl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setDoInput(true);
            conn.setRequestMethod("GET");

            BufferedInputStream bis = new BufferedInputStream(conn.getInputStream());
            FileOutputStream fos = new FileOutputStream(imgFile);
            byte[] buf = new byte[8096];
            int size = 0;
            while ((size = bis.read(buf)) != -1) {
                fos.write(buf, 0, size);
            }

            fos.close();
            bis.close();
            conn.disconnect();
            String info = String.format("下载媒体文件成功，filePath=" + imgFile.getAbsolutePath());
            log.info(info);
        } catch (Exception e) {
            String error = String.format("下载媒体文件失败：%s", e);
            log.error(error);
        }
    }
}
