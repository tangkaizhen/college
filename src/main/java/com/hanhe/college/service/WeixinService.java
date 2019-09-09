package com.hanhe.college.service;

import javax.annotation.PostConstruct;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hanhe.college.config.WxMpConfig;

import me.chanjar.weixin.mp.api.WxMpInMemoryConfigStorage;
import me.chanjar.weixin.mp.api.impl.WxMpServiceImpl;

/**
 * 
 * @author Binary Wang
 *
 */
@Service
public class WeixinService extends WxMpServiceImpl {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private WxMpConfig wxConfig;

    @PostConstruct
    public void init() {
        final WxMpInMemoryConfigStorage config = new WxMpInMemoryConfigStorage();
        config.setAppId(this.wxConfig.getAppid());// 设置微信公众号的appid
        config.setSecret(this.wxConfig.getAppsecret());// 设置微信公众号的app corpSecret
        config.setToken(this.wxConfig.getToken());// 设置微信公众号的token
        config.setAesKey(this.wxConfig.getAesKey());// 设置消息加解密密钥
        super.setWxMpConfigStorage(config);
    }

}
