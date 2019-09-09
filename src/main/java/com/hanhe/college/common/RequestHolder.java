package com.hanhe.college.common;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Angelo on 2018/5/22.
 */
public class RequestHolder {

    private static final ThreadLocal<UserBean> userHolder = new ThreadLocal<UserBean>();

    private static final ThreadLocal<HttpServletRequest> requestHolder = new ThreadLocal<HttpServletRequest>();

    public static void add(UserBean userBean) {
        userHolder.set(userBean);
    }

    public static void add(HttpServletRequest request) {
        requestHolder.set(request);
    }

    public static UserBean getCurrentUserBean() {
        return userHolder.get();
    }

    public static HttpServletRequest getCurrentRequest() {
        return requestHolder.get();
    }

    public static void remove() {
        userHolder.remove();
        requestHolder.remove();
    }
}
