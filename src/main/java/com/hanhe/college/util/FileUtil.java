package com.hanhe.college.util;


import java.io.File;

import org.springframework.util.StringUtils;

/**
 * Created by Angelo on 2018/9/19.
 */
public class FileUtil {

    public static void delete(String projectPath, String fileSrc) {
        if (!StringUtils.isEmpty(fileSrc)) {
            File file = new File(projectPath + fileSrc);
            if (file.exists() && file.isFile()) {
                file.delete();
            }
        }
    }
}
