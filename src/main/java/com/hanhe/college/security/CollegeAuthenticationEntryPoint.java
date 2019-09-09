package com.hanhe.college.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;

import com.albaba.tools.util.JsonMapper;
import com.hanhe.college.common.ApiMsg;

/**
 * Created by Angelo on 2018/8/1.
 */
public class CollegeAuthenticationEntryPoint implements AuthenticationEntryPoint {
	@Override
	public void commence(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException authException) throws IOException, ServletException {
		String msg = authException.getMessage();
		if ("Full authentication is required to access this resource".equals(msg)) {
			msg = "对不起，您暂无权限，请刷新后再试";
		}
		if (isJsonRequest(request)) {
			writeJson(response, msg);
		} else {
			response.sendRedirect(request.getContextPath() + "/admin/denied/2");
		}
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

	private void writeJson(HttpServletResponse response, String msg) throws IOException {
		response.setHeader("Content-Type", "application/json;charset=utf-8");
		response.getWriter().print(JsonMapper.obj2String(ApiMsg.fail(msg)));
		response.getWriter().flush();
		response.getWriter().close();
	}
}
