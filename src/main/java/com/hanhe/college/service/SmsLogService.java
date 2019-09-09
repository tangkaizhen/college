package com.hanhe.college.service;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.albaba.tools.util.DateUtil;
import com.albaba.tools.util.IpUtil;
import com.albaba.tools.util.RandomValidateCode;
import com.aliyuncs.exceptions.ClientException;
import com.hanhe.college.common.RequestHolder;
import com.hanhe.college.constant.Constants;
import com.hanhe.college.dao.SmsLogMapper;
import com.hanhe.college.dao.UserMapper;
import com.hanhe.college.entity.SmsLog;
import com.hanhe.college.exception.ParamException;
import com.hanhe.college.param.wechat.SMSParam;
import com.hanhe.college.util.BeanValidator;
import com.hanhe.college.util.SmsUtil;

/**
 * Created by Angelo on 2018/9/4.
 */
@Service
public class SmsLogService {
    @Autowired
    private SmsLogMapper smsLogMapper;
    @Autowired
    private UserMapper userMapper;

    public int sendSMS(SMSParam param) {
        BeanValidator.check(param);
        String sCode = (String) RequestHolder.getCurrentRequest().getSession().getAttribute(RandomValidateCode.RANDOM_CODE_KEY);
        if (StringUtils.isEmpty(sCode) || !sCode.equalsIgnoreCase(param.getVCode())) {
            throw new ParamException("图形验证码有误，发送失败");
        }
        final int type = param.getType();
        if (type == Constants.CODE_TYPE_REGISTER) {
            if (checkExist(param.getOpenid(), param.getPhone())) {
                throw new ParamException("该手机号/微信已注册");
            }
        }
        final String phone = param.getPhone();
        final String ip = IpUtil.getRemoteIp(RequestHolder.getCurrentRequest());
        int recentCount = smsLogMapper.getRecentCount(phone);
        if (recentCount > 0) {
            throw new ParamException("操作过于频繁，请稍后再试");
        } else {
            long count = smsLogMapper.getCount(phone, type);
            if (count > 4) {
                throw new ParamException("操作过于频繁，请稍后再试");
            } else if (!StringUtils.isEmpty(ip)) {
                long ipCount = smsLogMapper.getIpCount(ip);
                if (ipCount > 10) {
                    throw new ParamException("操作过于频繁，请稍后再试");
                }
            }
        }
        final String code = getRandom();
        try {
            boolean success = SmsUtil.sendSms(phone, code);
            if (success) {
                SmsLog smsLog = SmsLog.builder().phone(phone).type(type).code(code).ip(ip).createTime(DateUtil.getNow()).build();
                return smsLogMapper.insert(smsLog);
            } else {
                throw new ParamException("获取验证码失败，请稍后再试");
            }
        } catch (ClientException e) {
            throw new ParamException("获取验证码失败，请稍后再试");
        }
    }

    private boolean checkExist(String phone, String openid) {
        return userMapper.countByPhoneOrOpenid(phone, openid) > 0;
    }

    private String getRandom() {
        Random r = new Random();
        StringBuffer random = new StringBuffer();
        for(int i = 0; i < 6; ++i) {
            random.append(Math.abs(r.nextInt(10)));
        }
        return random.toString();
    }
}
