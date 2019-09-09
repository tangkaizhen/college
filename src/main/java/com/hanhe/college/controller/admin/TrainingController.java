package com.hanhe.college.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.hanhe.college.common.ApiMsg;
import com.hanhe.college.entity.TrainingCourse;
import com.hanhe.college.entity.TrainingSite;
import com.hanhe.college.entity.TrainingType;
import com.hanhe.college.param.admin.TrainingCourseParam;
import com.hanhe.college.param.admin.TrainingSiteParam;
import com.hanhe.college.service.TrainingCourseService;
import com.hanhe.college.service.TrainingSiteService;
import com.hanhe.college.service.TrainingTypeService;

/**
 * 培训管理
 */
@Controller
@RequestMapping("/admin/training")
public class TrainingController {

	@Autowired
	private TrainingCourseService trainingCourseService;
	@Autowired
	private TrainingSiteService trainingSiteService;
	@Autowired
	private TrainingTypeService trainingTypeService;

	@RequestMapping("/field_training.page")
	public String field_training(Model model, Integer pageNum, Integer pageSize) {
		List<TrainingCourse> trainingCourses = trainingCourseService.list(pageNum, pageSize);
		PageInfo<TrainingCourse> page = new PageInfo(trainingCourses);
		model.addAttribute("trainingCourses", trainingCourses);
		model.addAttribute("page", page);
		return "admin/field_training";
	}
	@RequestMapping("/add_field_training.page")
	public String add_field_training(Model model, Long id) {
		if (id != null) {
			TrainingCourse trainingCourse = trainingCourseService.getDetails(id);
			model.addAttribute("trainingCourse", trainingCourse);
		}
		return "admin/add_field_training";
	}
	@RequestMapping("/training_net.page")
	public String training_net(Model model, String province, String trainingType, Integer pageNum, Integer pageSize) {
		List<TrainingSite> trainingSites = trainingSiteService.list(province, trainingType, pageNum, pageSize);
		PageInfo<TrainingSite> page = new PageInfo<TrainingSite>(trainingSites);
		model.addAttribute("trainingSites", trainingSites);
		model.addAttribute("page", page);
		model.addAttribute("province", province);
		model.addAttribute("trainingType", trainingType);
		return "admin/training_net";
	}
	@RequestMapping("/add_training_net.page")
	public String add_training_net(Model model, Long id) {
		List<TrainingType> trainingTypes = trainingTypeService.getAvailable();
		model.addAttribute("trainingTypes", trainingTypes);
		if (id != null) {
			TrainingSite trainingSite = trainingSiteService.getDetails(id);
			model.addAttribute("trainingSite", trainingSite);
		}
		return "admin/add_training_net";
	}

	// **************************** 培训管理-异步接口 START ****************************

	/**
	 * 添加实操培训
	 */
	@ResponseBody
	@RequestMapping("/saveTrainingCourse.json")
	public ApiMsg saveTrainingCourse(TrainingCourseParam param) {
		if (param.getId() == null) {
			long id = trainingCourseService.insert(param);
			return ApiMsg.success(id);
		} else {
			int result = trainingCourseService.update(param);
			return result > 0 ? ApiMsg.success() : ApiMsg.fail("更新失败");
		}
	}

	/**
	 * 删除实操培训
	 */
	@ResponseBody
	@RequestMapping("/deleteTrainingCourse.json")
	public ApiMsg deleteTrainingCourse(long id) {
		int result = trainingCourseService.delete(id);
		return result > 0 ? ApiMsg.success() : ApiMsg.fail("删除失败");
	}

	/**
	 * 添加培训网点
	 */
	@ResponseBody
	@RequestMapping("/saveTrainingSite.json")
	public ApiMsg saveTrainingSite(TrainingSiteParam param) {
		if (param.getId() == null) {
			long id = trainingSiteService.insert(param);
			return ApiMsg.success(id);
		} else {
			int result = trainingSiteService.update(param);
			return result > 0 ? ApiMsg.success() : ApiMsg.fail("更新失败");
		}
	}

	/**
	 * 删除培训网点
	 */
	@ResponseBody
	@RequestMapping("/deleteTrainingSite.json")
	public ApiMsg deleteTrainingSite(long id) {
		int result = trainingSiteService.delete(id);
		return result > 0 ? ApiMsg.success() : ApiMsg.fail("删除失败");
	}

	/**
	 * 重置网点管理员密码
	 */
	@ResponseBody
	@RequestMapping("/resetMasterPwd.json")
	public ApiMsg resetMasterPwd(long id, String password) {
		int result = trainingSiteService.resetMasterPwd(id, password);
		return result > 0 ? ApiMsg.success() : ApiMsg.fail("重置密码失败");
	}
	// **************************** 培训管理-异步接口 END ****************************
}
