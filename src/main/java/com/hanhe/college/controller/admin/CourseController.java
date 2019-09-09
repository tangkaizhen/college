package com.hanhe.college.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.hanhe.college.common.ApiMsg;
import com.hanhe.college.dto.CourseDTO;
import com.hanhe.college.entity.CourseCategory;
import com.hanhe.college.param.admin.CourseParam;
import com.hanhe.college.service.CourseCategoryService;
import com.hanhe.college.service.CourseService;
import com.hanhe.college.service.UavTypeService;
import com.hanhe.college.service.UserTypeService;

/**
 * 课程管理
 */
@Controller
@RequestMapping("/admin/course")
public class CourseController {
	@Autowired
	private CourseService courseService;
	@Autowired
	private UserTypeService userTypeService;
	@Autowired
	private UavTypeService uavTypeService;
	@Autowired
	private CourseCategoryService courseCategoryService;

	@RequestMapping("/course_manage.page")
	public String course_manage(Model model, Long userTypeId, Long uavTypeId, Long courseCategoryId, Integer pageNum,
			Integer pageSize) {
		List<CourseDTO> courses = courseService.list(userTypeId, uavTypeId, courseCategoryId, pageNum, pageSize);
		PageInfo<CourseDTO> page = new PageInfo(courses);
		model.addAttribute("courses", courses);
		model.addAttribute("userTypes", userTypeService.getAvailable());
		model.addAttribute("uavTypes", uavTypeService.getAvailable());
		model.addAttribute("page", page);
		model.addAttribute("userTypeId", userTypeId);
		model.addAttribute("uavTypeId", uavTypeId);
		model.addAttribute("courseCategoryId", courseCategoryId);
		if (courseCategoryId != null) {
			CourseCategory courseCategory = courseCategoryService.getById(courseCategoryId);
			if (courseCategory != null) {
				model.addAttribute("courseCategoryName", courseCategory.getName());
			}
			
		}
		return "admin/course_manage";
	}
	@RequestMapping("/add_course_manage.page")
	public String add_course_manage(Model model, Long id) {
		if (id != null) {
			CourseDTO course = courseService.getDetails(id);
			model.addAttribute("course", course);
		}
		model.addAttribute("userTypes", userTypeService.getAvailable());
		model.addAttribute("uavTypes", uavTypeService.getAvailable());
		return "admin/add_course_manage";
	}

	// **************************** 课程管理-异步接口 START ****************************
	/**
	 * 保存课程
	 */
	@ResponseBody
	@RequestMapping("/saveCourse.json")
	public ApiMsg saveCourse(CourseParam param) {
		if (param.getId() == null) {
			long id = courseService.insert(param);
			return ApiMsg.success(id);
		} else {
			int result = courseService.update(param);
			return result > 0 ? ApiMsg.success() : ApiMsg.fail("更新失败");
		}
	}

	/**
	 * 删除课程
	 */
	@ResponseBody
	@RequestMapping("/deleteCourse.json")
	public ApiMsg deleteCourse(long id) {
		int result = courseService.delete(id);
		return result > 0 ? ApiMsg.success() : ApiMsg.fail("删除失败");
	}
	// **************************** 课程管理-异步接口 END ****************************
}
