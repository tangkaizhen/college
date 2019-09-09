package com.hanhe.college.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hanhe.college.common.ApiMsg;
import com.hanhe.college.param.admin.ConfigParam;
import com.hanhe.college.param.admin.CourseCatrgoryParam;
import com.hanhe.college.param.admin.TrainingTypeParam;
import com.hanhe.college.service.*;

/**
 * 配置管理 Created by Angelo on 2018/7/31.
 */
@Controller
@RequestMapping("/admin/config")
public class ConfigController {
	@Autowired
	private UserTypeService userTypeService;
	@Autowired
	private UavTypeService uavTypeService;
	@Autowired
	private TrainingTypeService trainingTypeService;
	@Autowired
	private CourseCategoryService courseCategoryService;
	@Autowired
	private ArticleCategoryService articleCategoryService;

	@RequestMapping("/identity_configuration.page")
	public String identity_configuration(Model model) {
		model.addAttribute("userTypes", userTypeService.getAvailable());
		return "admin/identity_configuration";
	}
	@RequestMapping("/arg_configuration.page")
	public String arg_configuration(Model model) {
		model.addAttribute("uavTypes", uavTypeService.getAvailable());
		return "admin/arg_configuration";
	}
	@RequestMapping("/train_configuration.page")
	public String train_configuration(Model model) {
		model.addAttribute("userTypes", userTypeService.getAvailable());
		model.addAttribute("uavTypes", uavTypeService.getAvailable());
		model.addAttribute("trainTypes", trainingTypeService.getAvailable());
		return "admin/train_configuration";
	}
	@RequestMapping("/courses_configuration.page")
	public String courses_configuration(Model model) {
		model.addAttribute("userTypes", userTypeService.getAvailable());
		model.addAttribute("uavTypes", uavTypeService.getAvailable());
		model.addAttribute("courseCategories", courseCategoryService.getAvailable());
		return "admin/courses_configuration";
	}
	@RequestMapping("/baike_configuration.page")
	public String baike_configuration(Model model) {
		model.addAttribute("articleCategories", articleCategoryService.getAvailable());
		return "admin/baike_configuration";
	}

	// **************************** 配置管理-异步接口 START ****************************
	/**
	 * 添加身份
	 */
	@ResponseBody
	@RequestMapping("/saveUserType.json")
	public ApiMsg saveUserType(ConfigParam param) {
		long userTypeId = userTypeService.insert(param);
		return ApiMsg.success(userTypeId);
	}

	/**
	 * 删除身份
	 */
	@ResponseBody
	@RequestMapping("/deleteUserType.json")
	public ApiMsg deleteUserType(long id) {
		int result = userTypeService.delete(id);
		if (result > 0) {
			return ApiMsg.success();
		} else {
			return ApiMsg.fail("删除失败");
		}
	}

	/**
	 * 添加机型
	 */
	@ResponseBody
	@RequestMapping("/saveUavType.json")
	public ApiMsg saveUavType(ConfigParam param) {
		long uavTypeId = uavTypeService.insert(param);
		return ApiMsg.success(param);
	}

	/**
	 * 删除机型
	 */
	@ResponseBody
	@RequestMapping("/deleteUavType.json")
	public ApiMsg deleteUavType(long id) {
		int result = uavTypeService.delete(id);
		if (result > 0) {
			return ApiMsg.success();
		} else {
			return ApiMsg.fail("删除失败");
		}
	}

	/**
	 * 添加培训类型
	 */
	@ResponseBody
	@RequestMapping("/saveTrainingType.json")
	public ApiMsg saveTrainingType(TrainingTypeParam param) {
		long id = trainingTypeService.insert(param);
		return ApiMsg.success(id);
	}

	/**
	 * 删除培训类型
	 */
	@ResponseBody
	@RequestMapping("/deleteTrainingType.json")
	public ApiMsg deleteTrainingType(long id) {
		int result = trainingTypeService.delete(id);
		if (result > 0) {
			return ApiMsg.success();
		} else {
			return ApiMsg.fail("删除失败");
		}
	}

	/**
	 * 添加课程类别
	 */
	@ResponseBody
	@RequestMapping("/saveCourseCategory.json")
	public ApiMsg saveCourseCategory(CourseCatrgoryParam param) {
		long id = courseCategoryService.insert(param);
		return ApiMsg.success(id);
	}

	/**
	 * 删除课程类别
	 */
	@ResponseBody
	@RequestMapping("/deleteCourseCategory.json")
	public ApiMsg deleteCourseCategory(long id) {
		int result = courseCategoryService.delete(id);
		if (result > 0) {
			return ApiMsg.success();
		} else {
			return ApiMsg.fail("删除失败");
		}
	}

	/**
	 * 添加文章类别
	 */
	@ResponseBody
	@RequestMapping("/saveArticleCategory.json")
	public ApiMsg saveArticleCategory(ConfigParam param) {
		long id = articleCategoryService.insert(param);
		return ApiMsg.success(id);
	}

	/**
	 * 删除文章类别
	 */
	@ResponseBody
	@RequestMapping("/deleteArticleCategory.json")
	public ApiMsg deleteArticleCategory(long id) {
		int result = articleCategoryService.delete(id);
		if (result > 0) {
			return ApiMsg.success();
		} else {
			return ApiMsg.fail("删除失败");
		}
	}
	// **************************** 配置管理-异步接口 END ****************************
}
