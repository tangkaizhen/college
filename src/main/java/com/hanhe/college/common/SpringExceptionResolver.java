package com.hanhe.college.common;

import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import com.albaba.tools.util.IpUtil;
import com.albaba.tools.util.JsonMapper;
import com.hanhe.college.exception.ParamException;
import com.hanhe.college.exception.PermissionException;

import lombok.extern.slf4j.Slf4j;

/**
 * Created by Angelo on 2018/5/17.
 */
@Slf4j
public class SpringExceptionResolver implements HandlerExceptionResolver {

    @Override
    public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object o, Exception ex) {
        String url = request.getRequestURL().toString();
        ModelAndView mv;
        String defaultMsg = "服务器错误,请联系管理员";

        if (ex != null) {
            ex.printStackTrace();
            log.warn("******************************");
            String path = request.getContextPath();
            String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
                    + path + "/";
            String remoteAddress = request.getRemoteAddr();
            String servletPath = request.getServletPath();
            String realPath = request.getRealPath("/");
            String remoteUser = request.getRemoteUser();
            String requestURI = request.getRequestURI();
            log.warn("path=>" + path);
            log.warn("basePath=>" + basePath);
            log.warn("remoteAddress=>" + remoteAddress);
            log.warn("servletPath=>" + servletPath);
            log.warn("realPath=>" + realPath);
            log.warn("remoteUser=>" + remoteUser);
            log.warn("requestURI=>" + requestURI);
            log.warn("getRequestIP=>" + IpUtil.getRemoteIp(request));
            showParams(request);
            log.error(ex.toString());
            StackTraceElement[] error = ex.getStackTrace();
            for (StackTraceElement stackTraceElement : error) {
                log.error(stackTraceElement.toString());
            }
            log.error("******************************");
        }

        // .json, .page
        // 这里我们要求项目中所有请求json数据，都是用.json结尾
        if (isJsonRequest(request)) {
            ApiMsg result = null;
            if (ex instanceof PermissionException || ex instanceof ParamException) {
                result = ApiMsg.fail(ex.getMessage());
            } else {
                log.error("unknow json exception, url:" + url, ex);
                result = ApiMsg.fail(defaultMsg);
            }
            mv = new ModelAndView();
            writeJson(response, result.toMap());
        } else if (url.endsWith(".page")) { // 这里我们要求项目中所有请求page页面，都是用.page结尾
            log.error("unknow page exception, url:" + url, ex);
            ApiMsg result = ApiMsg.fail(defaultMsg);
            mv = new ModelAndView("exception", result.toMap());
        } else {
            log.error("unknow exception, url:" + url, ex);
            ApiMsg result = ApiMsg.fail(defaultMsg);
            mv = new ModelAndView();
            writeJson(response, result.toMap());
        }

        return mv;
    }

    private boolean isJsonRequest(HttpServletRequest request) {
        String requestPath = request.getRequestURL().toString();
        if (requestPath.endsWith(".json")) {
            return true;
        } else {
            return (request.getHeader("accept").contains("application/json")
                    || (request.getHeader("X-Requested-With") != null
                    && request.getHeader("X-Requested-With").contains("XMLHttpRequest")));
        }
    }

    private void writeJson(HttpServletResponse response, Map<?, ?> error) {
        response.setContentType("application/json;charset=utf-8");
        try {
            response.getWriter().write(JsonMapper.obj2String(error));
            response.getWriter().flush();
            response.getWriter().close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showParams(HttpServletRequest request) {
        Map map = new HashMap();
        Enumeration paramNames = request.getParameterNames();
        while (paramNames.hasMoreElements()) {
            String paramName = (String) paramNames.nextElement();

            String[] paramValues = request.getParameterValues(paramName);
            if (paramValues.length == 1) {
                String paramValue = paramValues[0];
                if (paramValue.length() != 0) {
                    map.put(paramName, paramValue);
                }
            }
        }
        Set<Map.Entry<String, String>> set = map.entrySet();
        log.info("------------------------------");
        for (Map.Entry entry : set) {
            log.info(entry.getKey() + ":" + entry.getValue());
        }
        log.info("------------------------------");
    }
}
