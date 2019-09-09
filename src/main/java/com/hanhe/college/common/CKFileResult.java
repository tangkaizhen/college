package com.hanhe.college.common;

import java.util.Map;

import com.google.common.collect.Maps;

import lombok.Getter;
import lombok.Setter;

/**
 * CKEditor编辑器上传图片返回格式
 * Created by Angelo on 2018/8/28.
 */
@Getter
@Setter
public class CKFileResult{

    private int uploaded;
    private String fileName;
    private String url;
    private Map<String,Object> error;

    public CKFileResult(int uploaded) {
        this.uploaded = uploaded;
    }

    public static CKFileResult fail(String msg) {
        CKFileResult result = new CKFileResult(0);
        result.error = Maps.newHashMap();
        result.error.put("message", msg);
        return result;
    }

    public static CKFileResult success(String fileName, String fileUrl) {
        CKFileResult result = new CKFileResult(1);
        result.fileName = fileName;
        result.url = fileUrl;
        return result;
    }
}
