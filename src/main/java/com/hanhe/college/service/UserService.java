package com.hanhe.college.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.albaba.tools.image.GraphicsUtil;
import com.albaba.tools.util.DateUtil;
import com.github.pagehelper.PageHelper;
import com.google.common.base.Preconditions;
import com.hanhe.college.common.RequestHolder;
import com.hanhe.college.common.UserBean;
import com.hanhe.college.constant.Constants;
import com.hanhe.college.dao.SmsLogMapper;
import com.hanhe.college.dao.UserMapper;
import com.hanhe.college.entity.SmsLog;
import com.hanhe.college.entity.User;
import com.hanhe.college.exception.ParamException;
import com.hanhe.college.param.wechat.RegisterParam;
import com.hanhe.college.param.wechat.UserParam;
import com.hanhe.college.util.BeanValidator;
import com.hanhe.college.util.FileUtil;
import com.hanhe.college.util.UploadUtil;

/**
 * Created by Angelo on 2018/7/19.
 */
@Service
public class UserService {

	@Autowired
	private UserMapper userMapper;
	@Autowired
	private SmsLogMapper smsLogMapper;
	@Autowired
	private WeixinService weixinService;

	public User getById(Long id) {
		return userMapper.selectByPrimaryKey(id);
	}

	public User getByOpenId(String openid) {
		return userMapper.getByOpenId(openid);
	}

	/**
	 * 注册用户
	 */
	public long register(RegisterParam param) {
		BeanValidator.check(param);
		if (checkExist(param.getPhone(), param.getOpenid())) {
			throw new ParamException("该手机号或微信已注册");
		}
		if (!Constants.DEFAULT_SMS_CHECK_CODE.equals(param.getCheckCode())) {
			// 获取最新的验证码
			SmsLog smsLog = smsLogMapper.getCheckCode(param.getPhone(), Constants.CODE_TYPE_REGISTER);
			if (smsLog != null) {
				Date beginDate = smsLog.getCreateTime();
				Date nowDate = new Date();
				// 时间是否小于10分钟
				if (nowDate.getTime() - beginDate.getTime() < Constants.SMS_CHECK_TIME_NUMBER * 60 * 1000) {
					if (!StringUtils.isEmpty(smsLog.getCode())) {
						// 验证码不相同
						if (!smsLog.getCode().trim().equals(param.getCheckCode().trim())) {
							throw new ParamException("验证码错误");
						}
					} else {
						throw new ParamException("请重新获取验证码");
					}
				} else {
					throw new ParamException("验证码过期，请重新获取");
				}
			} else {
				throw new ParamException("请先获取验证码");
			}
		}
		User user = User.builder().name(param.getName()).phone(param.getPhone()).openid(param.getOpenid())
				.state(Constants.DEFAULT_STATE_NORMAL).createTime(DateUtil.getNow()).build();
		userMapper.insertSelective(user);
		
		RequestHolder.getCurrentRequest().getSession().setAttribute(Constants.SESSION_USER, new UserBean(user));
		return user.getId();
	}

	/**
	 * 修改资料
	 */
	public int saveDetails(UserParam param) throws Exception {
		BeanValidator.check(param);
		User before = userMapper.selectByPrimaryKey(param.getId());
		Preconditions.checkNotNull(before, "用户不存在");

		User after = User.builder().id(param.getId()).name(param.getName()).build();
		boolean isNewImg = false;
		if (!StringUtils.isEmpty(param.getHeadImg())) {
			String projectPath = RequestHolder.getCurrentRequest().getServletContext().getRealPath("/");
			String url = UploadUtil.getWechatImagePath(projectPath, weixinService.getAccessToken(), param.getHeadImg(),
					Constants.IMAGE_TYPE_USER);
			after.setHeadImg(url);

			if(Constants.IMAGE_MAGICK_ON && !StringUtils.isEmpty(after.getHeadImg())) {
				String[] paths = GraphicsUtil.generateImage(Constants.IMAGE_MODULE_USER, after.getHeadImg());
				if (paths != null && paths.length > 0) {
					after.setHeadImgSrc(after.getHeadImg());
					after.setHeadImg(paths[0]);
				}
			}
			isNewImg = true;
		}
		int result = userMapper.updateByPrimaryKeySelective(after);
		if (result > 0) {
			if (isNewImg) {
				String projectPath = RequestHolder.getCurrentRequest().getServletContext().getRealPath("/");
				FileUtil.delete(projectPath, before.getHeadImgSrc());
				FileUtil.delete(projectPath, before.getHeadImg());
			}
		}

		return result;
	}

	public List<User> list(Integer pageNum, Integer pageSize) {
		if (pageNum == null) {
			pageNum = Constants.DEFAULT_PAGE_NUM;
		}
		if (pageSize == null) {
			pageSize = Constants.DEFAULT_PAGE_SIZE;
		}
		PageHelper.startPage(pageNum, pageSize);
		return userMapper.list();
	}

	/**
	 * 删除用户
	 */
	public int delete(long id) {
		User before = userMapper.selectByPrimaryKey(id);
		Preconditions.checkNotNull(before, "待删除的用户不存在");
		User after = User.builder().id(id).state(Constants.DEFAULT_STATE_DELETE).build();
		return userMapper.updateByPrimaryKeySelective(after);
	}

	private boolean checkExist(String phone, String openid) {
		return userMapper.countByPhoneOrOpenid(phone, openid) > 0;
	}



}
