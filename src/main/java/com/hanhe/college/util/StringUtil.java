package com.hanhe.college.util;

import java.util.List;
import java.util.stream.Collectors;

import com.google.common.base.Splitter;

public class StringUtil {

    // 1,2,3,4,,5
    public static List<Long> splitToListLong(String str) {
        List<String> strList = Splitter.on(",").trimResults().omitEmptyStrings().splitToList(str);
        return strList.stream().map(strItem -> Long.parseLong(strItem)).collect(Collectors.toList());
    }

    public static List<String> splitToList(String str) {
        return Splitter.on(",").trimResults().omitEmptyStrings().splitToList(str);
    }
}
