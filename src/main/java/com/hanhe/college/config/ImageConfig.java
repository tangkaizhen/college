package com.hanhe.college.config;

import java.util.Locale;
import java.util.ResourceBundle;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Component;

/**
 * Created by Angelo on 2018/8/29.
 */
@Component
public class ImageConfig extends com.albaba.tools.image.ImageConfig {

    @PostConstruct
    @Override
    public void init() {
        super.init(ResourceBundle.getBundle("image", Locale.getDefault()));
    }
}
