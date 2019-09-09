package com.hanhe.college.config;

import org.springframework.context.annotation.Configuration;

import com.albaba.tools.util.SystemProperties;

@Configuration
public class WxMpConfig {
  private String token = SystemProperties.getProperties("WEIXIN_ACCESSTOKEN");
  private String appid = SystemProperties.getProperties("WEIXIN_APPID");
  private String appsecret = SystemProperties.getProperties("WEIXIN_APPSECRET");
  private String aesKey = SystemProperties.getProperties("WEIXIN_ENCODINGAESKEY");

  public String getToken() {
    return this.token;
  }

  public String getAppid() {
    return this.appid;
  }

  public String getAppsecret() {
    return this.appsecret;
  }

  public String getAesKey() {
    return this.aesKey;
  }

}
