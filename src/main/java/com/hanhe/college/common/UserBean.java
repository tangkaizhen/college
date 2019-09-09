package com.hanhe.college.common;

import com.hanhe.college.entity.Administrator;
import com.hanhe.college.entity.User;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Created by Angelo on 2018/7/31.
 */
@Getter
@Setter
@NoArgsConstructor
public class UserBean {
    private Long id;
    private String name;
    private String openid;
    private Integer type;
    private Long trainingSiteId;

    public UserBean(User user) {
        this.id = user.getId();
        this.name = user.getName();
        this.openid = user.getOpenid();
    }

    public UserBean(Administrator administrator) {
        this.id = administrator.getId();
        this.name = administrator.getNickname();
        this.type = administrator.getType();
        this.trainingSiteId = administrator.getTrainingSiteId();
    }
}
