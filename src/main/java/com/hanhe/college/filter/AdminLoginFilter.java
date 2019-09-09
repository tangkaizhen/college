package com.hanhe.college.filter;

import java.io.IOException;
import java.util.List;
import java.util.Set;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.common.base.Splitter;
import com.google.common.collect.Sets;
import com.hanhe.college.common.RequestHolder;
import com.hanhe.college.common.UserBean;
import com.hanhe.college.constant.Constants;

import lombok.Getter;
import lombok.Setter;

/**
 * Created by Angelo on 2018/8/1.
 */
@Getter
@Setter
public class AdminLoginFilter implements Filter {

    private static Set<String> exclusionUrlSet = Sets.newConcurrentHashSet();

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        String exclusionUrls = filterConfig.getInitParameter("exclusions");
        List<String> exclusionUrlList = Splitter.on(",").trimResults().omitEmptyStrings().splitToList(exclusionUrls);
        exclusionUrlSet = Sets.newConcurrentHashSet(exclusionUrlList);
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse resp = (HttpServletResponse) servletResponse;
        String servletPath = req.getServletPath();
        String requestURL = req.getRequestURL().toString();

        if (exclusionUrlSet.contains(servletPath)) {
            filterChain.doFilter(servletRequest, servletResponse);
            return;
        } else {
            UserBean user = (UserBean) req.getSession().getAttribute(Constants.SESSION_USER);
            if (user == null) {
                String path = req.getContextPath() + "/admin/login.page";
                resp.sendRedirect(path);
                return;
            }
            RequestHolder.add(user);
            RequestHolder.add(req);
            filterChain.doFilter(servletRequest, servletResponse);
            return;
        }

    }

    @Override
    public void destroy() {

    }
}
