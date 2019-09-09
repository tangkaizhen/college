package com.hanhe.college.service;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.albaba.tools.image.GraphicsUtil;
import com.albaba.tools.util.DateUtil;
import com.albaba.tools.util.IpUtil;
import com.albaba.tools.util.MD5Util;
import com.github.pagehelper.PageHelper;
import com.google.common.base.Preconditions;
import com.google.common.collect.Lists;
import com.google.common.collect.Sets;
import com.hanhe.college.common.RequestHolder;
import com.hanhe.college.constant.Constants;
import com.hanhe.college.dao.*;
import com.hanhe.college.dto.AdminDTO;
import com.hanhe.college.dto.AdminRoleDTO;
import com.hanhe.college.dto.MomentDTO;
import com.hanhe.college.entity.AdminRole;
import com.hanhe.college.entity.Administrator;
import com.hanhe.college.entity.Role;
import com.hanhe.college.exception.ParamException;
import com.hanhe.college.exception.PermissionException;
import com.hanhe.college.param.admin.AdminParam;
import com.hanhe.college.param.admin.ExpertParam;
import com.hanhe.college.param.admin.PasswordParam;
import com.hanhe.college.util.BeanValidator;
import com.hanhe.college.util.FileUtil;
import com.hanhe.college.util.StringUtil;
import com.hanhe.college.util.UploadUtil;

/**
 * Created by Angelo on 2018/7/26.
 */
@Service
public class AdministratorService {

	@Autowired
	private AdministratorMapper administratorMapper;
	@Autowired
	private AdminRoleMapper adminRoleMapper;
	@Autowired
	private ArticleMapper articleMapper;
	@Autowired
	private CommentMapper commentMapper;
	@Autowired
	private RoleMapper roleMapper;

	public Administrator getById(long id) {
		return administratorMapper.selectByPrimaryKey(id);
	}

	public Administrator getByName(String name) {
		return administratorMapper.getByName(name);
	}

	/**
	 * 管理员列表
	 */
	public List<Administrator> adminList(Integer pageNum, Integer pageSize) {
		if (pageNum == null) {
			pageNum = Constants.DEFAULT_PAGE_NUM;
		}
		if (pageSize == null) {
			pageSize = Constants.DEFAULT_PAGE_SIZE;
		}
		PageHelper.startPage(pageNum, pageSize);
		List<Administrator> administratorList = administratorMapper.getByType(Constants.ADMINISTRATOR_TYPE_ADMIN);
		// 查询各管理员权限
		List<Long> adminIdList = administratorList.stream().map(administrator -> administrator.getId())
				.collect(Collectors.toList());
		List<AdminRoleDTO> dtoList = adminRoleMapper.getRoleNamesByAdminIdList(adminIdList);
		Map<Long, String> roleNamesMap = dtoList.stream()
				.collect(Collectors.toMap(AdminRoleDTO::getAdminId, AdminRoleDTO::getRoleNames));
		administratorList.stream()
				.forEach(administrator -> administrator.setRoleNames(roleNamesMap.get(administrator.getId())));
		return administratorList;
	}

	/**
	 * 添加管理员
	 */
	@Transactional
	public long createAdmin(AdminParam param) {
		BeanValidator.check(param);
		if (checkExist(param.getId(), param.getName(), param.getNickname())) {
			throw new ParamException("已存在相同名称的账户名/昵称");
		}
		Date now = DateUtil.getNow();
		Administrator administrator = Administrator.builder().name(param.getName()).nickname(param.getNickname())
				.password(param.getPassword()).type(Constants.ADMINISTRATOR_TYPE_ADMIN)
				.state(Constants.DEFAULT_STATE_NORMAL).createTime(now).updateTime(now).build();
		administrator.setOperator(RequestHolder.getCurrentUserBean().getName());
		administrator.setOperateTime(now);
		administrator.setOperateIp(IpUtil.getRemoteIp(RequestHolder.getCurrentRequest()));
		administratorMapper.insertSelective(administrator);
		// 权限
		Long adminId = administrator.getId();
		List<Long> roleIdList = StringUtil.splitToListLong(param.getRoleIds());
		updateAdminRoles(adminId, roleIdList);
		return adminId;
	}

	/**
	 * 更新管理员
	 */
	@Transactional
	public int updateAdmin(AdminParam param) {
		param.setPassword("PASSSS");
		BeanValidator.check(param);
		long adminId = param.getId();
		Administrator before = administratorMapper.selectByPrimaryKey(adminId);
		Preconditions.checkNotNull(before, "待更新的管理员不存在");
		if (checkExist(param.getId(), param.getName(), param.getNickname())) {
			throw new ParamException("已存在相同名称的账户名/昵称");
		}
		// 权限更新
		List<Long> originRoleIdList = adminRoleMapper.getByAdminId(param.getId());
		List<Long> roleIdList = StringUtil.splitToListLong(param.getRoleIds());
		if (originRoleIdList.size() == roleIdList.size()) {
			Set<Long> originRoleIdSet = Sets.newHashSet(originRoleIdList);
			Set<Long> roleIdSet = Sets.newHashSet(roleIdList);
			originRoleIdSet.removeAll(roleIdSet);
			if (CollectionUtils.isEmpty(originRoleIdSet)) {
				return 1;
			}
		}
		updateAdminRoles(adminId, roleIdList);
		Administrator after = Administrator.builder().id(adminId).build();
		after.setOperator(RequestHolder.getCurrentUserBean().getName());
		after.setOperateTime(DateUtil.getNow());
		after.setOperateIp(IpUtil.getRemoteIp(RequestHolder.getCurrentRequest()));
		return administratorMapper.updateByPrimaryKeySelective(after);
	}

	/**
	 * 删除管理员
	 */
	@Transactional
	public int deleteAdmin(long id) {
		Administrator before = administratorMapper.selectByPrimaryKey(id);
		Preconditions.checkNotNull(before, "待删除的管理员/专家不存在");
		if ("admin".equals(before.getName())) {
			throw new PermissionException("超级管理员无法删除");
		} else if ("1".equals(before.getFlag())) {
			throw new PermissionException("当前专家为首页显示大咖，暂无法删除");
		}
		Administrator after = Administrator.builder().id(id).state(Constants.DEFAULT_STATE_DELETE).build();
		after.setOperator(RequestHolder.getCurrentUserBean().getName());
		after.setOperateTime(DateUtil.getNow());
		after.setOperateIp(IpUtil.getRemoteIp(RequestHolder.getCurrentRequest()));
		int result = administratorMapper.updateByPrimaryKeySelective(after);
		updateAdminRoles(id, null);
		return result;
	}

	public AdminDTO getAdminDetails(long id) {
		Administrator admin = administratorMapper.selectByPrimaryKey(id);
		Preconditions.checkNotNull(admin, "待查看的管理员不存在");
		List<Role> roles = roleMapper.getRolesByAdminId(id);
		return AdminDTO.adapt(admin, roles);
	}

	/**
	 * 重置密码
	 */
	public int resetPassword(long id, String password) {
		Administrator before = administratorMapper.selectByPrimaryKey(id);
		Preconditions.checkNotNull(before, "待重置密码的管理员/专家不存在");
		if (StringUtils.isEmpty(password)) {
			password = MD5Util.encrypt(Constants.DEFAULT_PASSWORD);
		}
		Administrator after = Administrator.builder().id(id).password(password.toLowerCase())
				.build();
		after.setOperator(RequestHolder.getCurrentUserBean().getName());
		after.setOperateTime(DateUtil.getNow());
		after.setOperateIp(IpUtil.getRemoteIp(RequestHolder.getCurrentRequest()));
		return administratorMapper.updateByPrimaryKeySelective(after);
	}

	/**
	 * 更新管理员权限
	 */
	private void updateAdminRoles(long adminId, List<Long> roleIdList) {
		adminRoleMapper.deleteByAdminId(adminId);
		if (CollectionUtils.isEmpty(roleIdList)) {
			return;
		}
		List<AdminRole> adminRoleList = Lists.newArrayList();
		for (Long roleId : roleIdList) {
			AdminRole adminRole = AdminRole.builder().adminId(adminId).roleId(roleId)
					.operator(RequestHolder.getCurrentUserBean().getName())
					.operateIp(IpUtil.getRemoteIp(RequestHolder.getCurrentRequest())).operateTime(new Date()).build();
			adminRoleList.add(adminRole);
		}
		adminRoleMapper.batchInsert(adminRoleList);
	}

	private boolean checkExist(Long id, String name, String nickname) {
		return administratorMapper.countByName(id, name, nickname) > 0;
	}

	/**
	 * 专家列表
	 */
	public List<Administrator> expertList(Integer pageNum, Integer pageSize) {
		if (pageNum == null) {
			pageNum = Constants.DEFAULT_PAGE_NUM;
		}
		if (pageSize == null) {
			pageSize = Constants.DEFAULT_PAGE_SIZE;
		}
		PageHelper.startPage(pageNum, pageSize);
		return administratorMapper.getByType(Constants.ADMINISTRATOR_TYPE_EXPERT);
	}

	/**
	 * 添加专家
	 */
	public long createExpert(ExpertParam param) throws Exception {
		BeanValidator.check(param);
		if (checkExist(param.getId(), param.getName(), param.getNickname())) {
			throw new ParamException("已存在相同名称的账户名/姓名");
		}
		Date now = DateUtil.getNow();
		Administrator administrator = Administrator.builder().name(param.getName()).nickname(param.getNickname())
				.password(param.getPassword()).type(Constants.ADMINISTRATOR_TYPE_EXPERT).label(param.getLabel())
				.resume(param.getResume()).details(param.getDetails()).state(Constants.DEFAULT_STATE_NORMAL)
				.interactTime(now).createTime(now).updateTime(now).build();
		if (UploadUtil.isUploadBase64Image(param.getHeadImg()) && UploadUtil.isUploadBase64Image(param.getBannerImg())) {
			String projectPath = RequestHolder.getCurrentRequest().getServletContext().getRealPath("/");
			String base64HeadImageData = param.getHeadImg().split(",")[1];
			String headImgUrl = UploadUtil.uploadBase64Image(projectPath, base64HeadImageData, Constants.IMAGE_TYPE_EXPERT);

			String base64BannerImageData = param.getBannerImg().split(",")[1];
			String bannerImgUrl = UploadUtil.uploadBase64Image(projectPath, base64BannerImageData, Constants.IMAGE_TYPE_EXPERT);
			administrator.setHeadImg(headImgUrl);
			administrator.setBannerImg(bannerImgUrl);
			// 切图
			if (Constants.IMAGE_MAGICK_ON && !StringUtils.isEmpty(administrator.getHeadImg())) {
				String[] paths = GraphicsUtil.generateImage(Constants.IMAGE_MODULE_EXPERT, administrator.getHeadImg());
				if (paths != null && paths.length > 0) {
					administrator.setHeadImgSrc(administrator.getHeadImg());
					administrator.setHeadImg(paths[0]);
					if (paths.length > 1) {
						administrator.setHeadIcon(paths[1]);
					}
				}
			}
			if (Constants.IMAGE_MAGICK_ON && !StringUtils.isEmpty(administrator.getBannerImg())) {
				String[] paths = GraphicsUtil.generateImage(Constants.IMAGE_MODULE_EXPERT_BANNER, administrator.getBannerImg());
				if (paths != null && paths.length > 0) {
					administrator.setBannerImgSrc(administrator.getBannerImg());
					administrator.setBannerImg(paths[0]);
				}
			}
		} else {
			throw new ParamException("图片上传格式有误");
		}
		administrator.setOperator(RequestHolder.getCurrentUserBean().getName());
		administrator.setOperateTime(now);
		administrator.setOperateIp(IpUtil.getRemoteIp(RequestHolder.getCurrentRequest()));
		administratorMapper.insertSelective(administrator);

		// 专家权限
		Long adminId = administrator.getId();
		AdminRole adminRole = AdminRole.builder().adminId(adminId).roleId(Constants.ROLE_EXPERT_ID)
				.operator(RequestHolder.getCurrentUserBean().getName()).operateTime(now)
				.operateIp(IpUtil.getRemoteIp(RequestHolder.getCurrentRequest())).build();
		adminRoleMapper.insertSelective(adminRole);
		return administrator.getId();
	}

	/**
	 * 更新专家
	 */
	public int updateExpert(ExpertParam param) throws Exception {
		param.setPassword("PASSSS");
		BeanValidator.check(param);
		long id = param.getId();
		Administrator before = administratorMapper.selectByPrimaryKey(id);
		Preconditions.checkNotNull(before, "待更新的专家不存在");
		if (checkExist(param.getId(), param.getName(), param.getNickname())) {
			throw new ParamException("已存在相同名称的账户名/姓名");
		}
		Administrator after = Administrator.builder().id(id).label(param.getLabel()).resume(param.getResume())
				.details(param.getDetails()).headImg(param.getHeadImg()).bannerImg(param.getBannerImg()).build();

		// 新上传专家头像
		boolean isNewHeadImg = false;
		String projectPath = RequestHolder.getCurrentRequest().getServletContext().getRealPath("/");
		if (UploadUtil.isUploadBase64Image(param.getHeadImg())) {
			String base64ImageData = param.getHeadImg().split(",")[1];
			String imgUrl = UploadUtil.uploadBase64Image(projectPath, base64ImageData, Constants.IMAGE_TYPE_EXPERT);
			after.setHeadImg(imgUrl);

			if (Constants.IMAGE_MAGICK_ON && !StringUtils.isEmpty(after.getHeadImg())) {
				String[] paths = GraphicsUtil.generateImage(Constants.IMAGE_MODULE_EXPERT, after.getHeadImg());
				if (paths != null && paths.length > 0) {
					after.setHeadImgSrc(after.getHeadImg());
					after.setHeadImg(paths[0]);
					if (paths.length > 1) {
						after.setHeadIcon(paths[1]);
					}
				}
			}
			isNewHeadImg = true;
		}
		// 新上传专家横幅
		boolean isNewBannerImg = false;
		if (UploadUtil.isUploadBase64Image(param.getBannerImg())) {
			String base64ImageData = param.getBannerImg().split(",")[1];
			String imgUrl = UploadUtil.uploadBase64Image(projectPath, base64ImageData, Constants.IMAGE_TYPE_EXPERT);
			after.setBannerImg(imgUrl);

			if (Constants.IMAGE_MAGICK_ON && !StringUtils.isEmpty(after.getBannerImg())) {
				String[] paths = GraphicsUtil.generateImage(Constants.IMAGE_MODULE_EXPERT_BANNER, after.getBannerImg());
				if (paths != null && paths.length > 0) {
					after.setBannerImgSrc(after.getBannerImg());
					after.setBannerImg(paths[0]);
				}
			}
			isNewBannerImg = true;
		}
		after.setOperator(RequestHolder.getCurrentUserBean().getName());
		after.setOperateTime(DateUtil.getNow());
		after.setOperateIp(IpUtil.getRemoteIp(RequestHolder.getCurrentRequest()));
		int result = administratorMapper.updateByPrimaryKeySelective(after);
		if (result > 0) {
			if (isNewHeadImg) {
				FileUtil.delete(projectPath, before.getHeadImgSrc());
				FileUtil.delete(projectPath, before.getHeadImg());
				FileUtil.delete(projectPath, before.getHeadIcon());
			}
			if (isNewBannerImg) {
				FileUtil.delete(projectPath, before.getBannerImgSrc());
				FileUtil.delete(projectPath, before.getBannerImg());
			}
		}
		return result;
	}

	/**
	 * 汉和大咖
	 */
	public List<Administrator> schools(Integer pageNum, Integer pageSize) {
		if (pageNum == null) {
			pageNum = Constants.DEFAULT_PAGE_NUM;
		}
		if (pageSize == null) {
			pageSize = Constants.DEFAULT_PAGE_SIZE;
		}
		PageHelper.startPage(pageNum, pageSize);
		return administratorMapper.schools();
	}

	/**
	 * 专家详情
	 */
	public Administrator getDetails(long id) {
		return administratorMapper.selectByPrimaryKey(id);
	}

	/**
	 * 专家动态
	 */
	public List<MomentDTO> moments(long id, Integer type, Integer pageNum, Integer pageSize) {
		if (pageNum == null) {
			pageNum = Constants.DEFAULT_PAGE_NUM;
		}
		if (pageSize == null) {
			pageSize = Constants.DEFAULT_PAGE_SIZE;
		}
		PageHelper.startPage(pageNum, pageSize);
		if (type == null || type == Constants.MOMENTS_TYPE_ALL) {
			return administratorMapper.moments(id);
		} else if (type == Constants.MOMENTS_TYPE_ARTICLE) {
			return articleMapper.moments(id);
		} else if (type == Constants.MOMENTS_TYPE_QA) {
			return commentMapper.moments(id);
		}
		return null;
	}

	/**
	 * 更新管理员登录时间
	 */
	public int updateLoginTime(Long id) {
		Administrator administrator = Administrator.builder().id(id).updateTime(DateUtil.getNow()).build();
		return administratorMapper.updateByPrimaryKeySelective(administrator);
	}

	/**
	 * 管理员修改密码
	 */
    public int modifyPwd(PasswordParam param) {
		BeanValidator.check(param);
		long id = RequestHolder.getCurrentUserBean().getId();
		Administrator before = administratorMapper.selectByPrimaryKey(id);
		Preconditions.checkNotNull(before, "待修改密码的账户不存在");
		if (!param.getPassword().equals(before.getPassword())) {
			throw new ParamException("原密码输入不匹配");
		}
		Administrator after = Administrator.builder().id(id).password(param.getNewPassword()).build();
		return administratorMapper.updateByPrimaryKeySelective(after);
    }

	/**
	 * 微信首页显示大咖列表
	 */
	public List<Administrator> getHomeList() {
		return administratorMapper.getByFlag(Constants.ADMINISTRATOR_FLAG_HOME);
	}

	/**
	 * 大咖置顶
	 */
	public int stickExpert(long id) {
		Administrator before = administratorMapper.selectByPrimaryKey(id);
		Preconditions.checkNotNull(before, "待置顶的专家不存在");
		if (before.getType() != Constants.ADMINISTRATOR_TYPE_EXPERT) {
			throw new ParamException("置顶功能仅对专家有效");
		} else if (before.getFlag() != null && before.getFlag() == Constants.ADMINISTRATOR_FLAG_HOME) {
			throw new ParamException("当前专家已置顶，无需重复操作");
		} else {
			Administrator after = Administrator.builder().id(id).flag(1).stickTime(DateUtil.getNow()).build();
			after.setOperator(RequestHolder.getCurrentUserBean().getName());
			after.setOperateTime(DateUtil.getNow());
			after.setOperateIp(IpUtil.getRemoteIp(RequestHolder.getCurrentRequest()));
			return administratorMapper.updateByPrimaryKeySelective(after);
		}
	}

	/**
	 * 大咖取消置顶
	 */
	public int cancelStickExpert(long id) {
		Administrator before = administratorMapper.selectByPrimaryKey(id);
		Preconditions.checkNotNull(before, "待取消置顶的专家不存在");
		if (before.getType() != Constants.ADMINISTRATOR_TYPE_EXPERT) {
			throw new ParamException("取消置顶功能仅对专家有效");
		} else if (before.getFlag() == null || before.getFlag().intValue() == 0) {
			throw new ParamException("当前专家已取消置顶，无需重复操作");
		} else {
			Administrator after = Administrator.builder().id(id).flag(0).stickTime(null).build();
			after.setOperator(RequestHolder.getCurrentUserBean().getName());
			after.setOperateTime(DateUtil.getNow());
			after.setOperateIp(IpUtil.getRemoteIp(RequestHolder.getCurrentRequest()));
			return administratorMapper.updateByPrimaryKeySelective(after);
		}
	}
}
