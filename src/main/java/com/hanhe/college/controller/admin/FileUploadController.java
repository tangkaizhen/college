package com.hanhe.college.controller.admin;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.hanhe.college.common.ApiMsg;
import com.hanhe.college.common.CKFileResult;
import com.hanhe.college.util.UploadUtil;

import lombok.extern.slf4j.Slf4j;

/**
 * Created by Angelo on 2018/8/27.
 */
@Slf4j
@Controller
@RequestMapping("/upload")
public class FileUploadController {

    @ResponseBody
	@RequestMapping(value = "uploadCKImg")
	public CKFileResult uplodaCKImg(@RequestParam("upload") MultipartFile file, HttpServletRequest request,
                                    HttpServletResponse response) {
        String projectPath = request.getServletContext().getRealPath("/");
        String projectName = request.getContextPath();
        try {
            return UploadUtil.ckeditor(file, projectPath, projectName);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            return CKFileResult.fail("文件上传失败");
        }
	}

    @ResponseBody
    @RequestMapping(value = "uploadPic")
	public ApiMsg uploadPic(HttpServletRequest request, @RequestParam("file") MultipartFile file, Integer type) {
	    String url = null;
        try {
            String projectPath = request.getServletContext().getRealPath("/");
            url = UploadUtil.getPCImagePath(projectPath, file, type);
        } catch (IOException e) {
            e.printStackTrace();
            log.error(e.getMessage(), e);
        }
        if (StringUtils.isEmpty(url)) {
            return ApiMsg.fail("图片上传失败");
        } else {
            return ApiMsg.success(url);
        }
    }
}
