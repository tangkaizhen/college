package com.hanhe.college.common;

import java.util.HashMap;
import java.util.Map;

import lombok.Getter;
import lombok.Setter;

/**
 * Created by Angelo on 2018/7/9.
 */
@Getter
@Setter
public class ApiMsg {

    private int status;
    private String msg;
    private Object data;

    public ApiMsg(int status) {
        this.status = status;
    }

    public ApiMsg(int status, String msg) {
        this(status, msg, null);
    }

    public ApiMsg(int status, String msg, Object data) {
        super();
        this.status = status;
        this.msg = msg;
        this.data = data;
    }

    public static ApiMsg success(Object object, String msg) {
        ApiMsg apiMsg = new ApiMsg(1);
        apiMsg.data = object;
        apiMsg.msg = msg;
        return apiMsg;
    }

    public static ApiMsg success(Object object) {
        ApiMsg apiMsg = new ApiMsg(1);
        apiMsg.data = object;
        return apiMsg;
    }

    public static ApiMsg success() {
        return new ApiMsg(1);
    }

    public static ApiMsg fail(String msg) {
        ApiMsg apiMsg = new ApiMsg(0);
        apiMsg.msg = msg;
        return apiMsg;
    }

    public static ApiMsg fail(String msg, Object object) {
        ApiMsg apiMsg = new ApiMsg(0);
        apiMsg.msg = msg;
        apiMsg.data = object;
        return apiMsg;
    }

    public Map<String, Object> toMap() {
        HashMap<String, Object> result = new HashMap<>();
        result.put("status", status);
        result.put("msg", msg);
        result.put("data", data);
        return result;
    }
}
