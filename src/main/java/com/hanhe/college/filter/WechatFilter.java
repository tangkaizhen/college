package com.hanhe.college.filter;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Set;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.albaba.tools.util.JsonMapper;
import com.google.common.base.Splitter;
import com.google.common.collect.Sets;
import com.hanhe.college.common.ApiMsg;
import com.hanhe.college.common.RequestHolder;
import com.hanhe.college.common.UserBean;
import com.hanhe.college.constant.Constants;

import lombok.Getter;
import lombok.Setter;

/**
 * Created by Angelo on 2018/7/24.
 */
@Getter
@Setter
public class WechatFilter implements Filter {

	private static Set<String> exclusionUrlSet = Sets.newConcurrentHashSet();

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		String exclusionUrls = filterConfig.getInitParameter("exclusions");
		List<String> exclusionUrlList = Splitter.on(",").trimResults().omitEmptyStrings().splitToList(exclusionUrls);
		exclusionUrlSet = Sets.newConcurrentHashSet(exclusionUrlList);
	}

	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) servletRequest;
		HttpServletResponse resp = (HttpServletResponse) servletResponse;
		String servletPath = req.getServletPath();
		String requestURL = req.getRequestURL().toString();

		if (!exclusionUrlSet.contains(servletPath)) {
			UserBean user = (UserBean) req.getSession().getAttribute(Constants.SESSION_USER);
			if (user == null) {
				if (requestURL.endsWith(".json")) {
					ApiMsg ret = ApiMsg.fail("连接超时，请刷新后再试");
					resp.setContentType("application/json;charset=utf-8");
					try {
						resp.getWriter().write(JsonMapper.obj2String(ret));
						return;
					} catch (IOException e) {
						e.printStackTrace();
					}
				} else {
					if (!"/wechat/index".equals(servletPath)) {
						String path = req.getContextPath() + "/wechat/index";
						String ret = URLEncoder.encode(servletPath, "UTF-8");
						resp.sendRedirect(path + "?ret=" + ret);
						return;
					}
				}
			}
			RequestHolder.add(user);
		}
		RequestHolder.add(req);
		filterChain.doFilter(servletRequest, servletResponse);
	}

	@Override
	public void destroy() {

	}
}
