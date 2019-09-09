package com.hanhe.college.controller.admin;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageInfo;
import com.hanhe.college.common.ApiMsg;
import com.hanhe.college.common.RequestHolder;
import com.hanhe.college.common.UserBean;
import com.hanhe.college.constant.Constants;
import com.hanhe.college.dto.AdminDTO;
import com.hanhe.college.dto.EnrolmentDTO;
import com.hanhe.college.entity.Administrator;
import com.hanhe.college.entity.Role;
import com.hanhe.college.entity.Trainee;
import com.hanhe.college.entity.User;
import com.hanhe.college.param.admin.AdminParam;
import com.hanhe.college.param.admin.ExpertParam;
import com.hanhe.college.param.admin.TraineeParam;
import com.hanhe.college.service.*;

/**
 * 人员管理
 */
@Controller
@RequestMapping("/admin/user")
public class UserController {
	@Autowired
	private AdministratorService administratorService;
	@Autowired
	private UserService userService;
	@Autowired
	private EnrolmentService enrolmentService;
	@Autowired
	private RoleService roleService;
	@Autowired
	private TraineeService traineeService;

	@RequestMapping("/manager_manage.page")
	public String manager_manage(Model model, Integer pageNum, Integer pageSize) {
		List<Administrator> admins = administratorService.adminList(pageNum, pageSize);
		PageInfo<Administrator> page = new PageInfo(admins);
		model.addAttribute("admins", admins);
		model.addAttribute("page", page);
		return "admin/manager_manage";
	}

	@RequestMapping("/expert_manage.page")
	public String expert_manage(Model model, Integer pageNum, Integer pageSize) {
		List<Administrator> experts = administratorService.expertList(pageNum, pageSize);
		PageInfo<Administrator> page = new PageInfo(experts);
		model.addAttribute("experts", experts);
		model.addAttribute("page", page);
		return "admin/expert_manage";
	}

	@RequestMapping("/user_manage.page")
	public String user_manage(Model model, Integer pageNum, Integer pageSize) {
		List<User> users = userService.list(pageNum, pageSize);
		PageInfo<User> page = new PageInfo(users);
		model.addAttribute("users", users);
		model.addAttribute("page", page);
		return "admin/user_manage";
	}

	@RequestMapping("/site/apply_manage.page")
	public String apply_manage(Model model, String province, Integer pageNum, Integer pageSize) {
		Long trainingSiteId = null;
		UserBean userBean = RequestHolder.getCurrentUserBean();
		// 网点管理员
		if (userBean.getType() == Constants.ADMINISTRATOR_TYPE_MASTER) {
			trainingSiteId = userBean.getTrainingSiteId();
		}
		List<EnrolmentDTO> enrolments = enrolmentService.list(province, trainingSiteId, pageNum, pageSize);
		PageInfo<EnrolmentDTO> page = new PageInfo(enrolments);
		model.addAttribute("enrolments", enrolments);
		model.addAttribute("page", page);
		model.addAttribute("province", province);
		return "admin/apply_manage";
	}

	@RequestMapping("/site/student_manage.page")
	public String student_manage(Model model, String province, String keyword, Integer pageNum, Integer pageSize) {
		List<Trainee> trainees = traineeService.list(province, keyword, pageNum, pageSize);
		PageInfo<Administrator> page = new PageInfo(trainees);
		model.addAttribute("trainees", trainees);
		model.addAttribute("page", page);
		model.addAttribute("province", province);
		model.addAttribute("keyword", keyword);
		return "admin/student_manage";
	}

	@RequestMapping("/site/exportTrainees")
	public void exportExcel(String province, String keyword, HttpServletResponse response) throws UnsupportedEncodingException {
		traineeService.exportExcel(province, keyword, response);
	}

	@RequestMapping("/add_manager_manage.page")
	public String add_manager_manage(Model model, Long id) {
		List<Role> roles = roleService.getAvailable();
		if (id != null) {
			AdminDTO admin = administratorService.getAdminDetails(id);
			model.addAttribute("admin", admin);
		}
		model.addAttribute("roles", roles);
		return "admin/add_manager_manage";
	}

	@RequestMapping("/add_expert_manage.page")
	public String add_expert_manage(Model model, Long id) {
		if (id != null) {
			Administrator expert = administratorService.getDetails(id);
			model.addAttribute("expert", expert);
		}
		return "admin/add_expert_manage";
	}

	@RequestMapping("/site/add_student_manage.page")
	public String add_student_manage(Model model, Long id) {
		if (id != null) {
			Trainee trainee = traineeService.getDetails(id);
			model.addAttribute("trainee", trainee);
		}
		return "admin/add_student_manage";
	}

	// **************************** 人员管理-异步接口 START ****************************

	/**
	 * 保存管理员
	 */
	@ResponseBody
	@RequestMapping("/saveAdmin.json")
	public ApiMsg saveAdmin(AdminParam param) {
		if (param.getId() == null) {
			long id = administratorService.createAdmin(param);
			return ApiMsg.success(id);
		} else {
			int result = administratorService.updateAdmin(param);
			return result > 0 ? ApiMsg.success() : ApiMsg.fail("更新失败");
		}
	}

	/**
	 * 删除管理员
	 */
	@ResponseBody
	@RequestMapping("/deleteAdmin.json")
	public ApiMsg deleteAdmin(long id) {
		int result = administratorService.deleteAdmin(id);
		return result > 0 ? ApiMsg.success() : ApiMsg.fail("删除失败");
	}

	/**
	 * 重置密码（管理员/专家）
	 */
	@ResponseBody
	@RequestMapping("/resetPassword.json")
	public ApiMsg resetPassword(long id, String password) {
		int result = administratorService.resetPassword(id, password);
		return result > 0 ? ApiMsg.success() : ApiMsg.fail("重置密码失败");
	}

	/**
	 * 保存专家
	 */
	@ResponseBody
	@RequestMapping("/saveExpert.json")
	public ApiMsg saveExpert(ExpertParam param) throws Exception {
		if (param.getId() == null) {
			long id = administratorService.createExpert(param);
			return ApiMsg.success(id);
		} else {
			int result = administratorService.updateExpert(param);
			return result > 0 ? ApiMsg.success() : ApiMsg.fail("更新失败");
		}
	}

	/**
	 * 删除专家
	 */
	@ResponseBody
	@RequestMapping("/deleteExpert.json")
	public ApiMsg deleteExpert(long id) {
		int result = administratorService.deleteAdmin(id);
		return result > 0 ? ApiMsg.success() : ApiMsg.fail("删除失败");
	}

	/**
	 * 置顶专家
	 */
	@ResponseBody
	@RequestMapping("/stickExpert.json")
	public ApiMsg stickExpert(long id) {
		int result = administratorService.stickExpert(id);
		return result > 0 ? ApiMsg.success() : ApiMsg.fail("置顶失败");
	}

	/**
	 * 取消置顶专家
	 */
	@ResponseBody
	@RequestMapping("/cancelStickExpert.json")
	public ApiMsg cancelStickExpert(long id) {
		int result = administratorService.cancelStickExpert(id);
		return result > 0 ? ApiMsg.success() : ApiMsg.fail("取消置顶失败");
	}

	/**
	 * 删除用户
	 */
	@ResponseBody
	@RequestMapping("/deleteUser.json")
	public ApiMsg deleteUser(long id) {
		int result = userService.delete(id);
		return result > 0 ? ApiMsg.success() : ApiMsg.fail("删除失败");
	}

	/**
	 * 删除报名人员
	 */
	@ResponseBody
	@RequestMapping("/site/deleteApplicant.json")
	public ApiMsg deleteApplicant(long id) {
		int result = enrolmentService.delete(id);
		return result > 0 ? ApiMsg.success() : ApiMsg.fail("删除失败");
	}

	/**
	 * 报名人员添加备注
	 */
	@ResponseBody
	@RequestMapping("/site/saveSpare.json")
	public ApiMsg saveSpare(long id, String spare) {
		int result = enrolmentService.saveSpare(id, spare);
		return result > 0 ? ApiMsg.success() : ApiMsg.fail("添加备注失败");
	}

	/**
	 * 保存学员
	 */
	@ResponseBody
	@RequestMapping("/site/saveTrainee.json")
	public ApiMsg saveTrainee(TraineeParam param) throws IOException {
		if (param.getId() == null) {
			long id = traineeService.insert(param);
			return ApiMsg.success(id);
		} else {
			int result = traineeService.update(param);
			return result > 0 ? ApiMsg.success() : ApiMsg.fail("更新失败");
		}
	}

	/**
	 * 删除学员
	 */
	@ResponseBody
	@RequestMapping("/site/deleteTrainee.json")
	public ApiMsg deleteTrainee(long id) {
		int result = traineeService.delete(id);
		return result > 0 ? ApiMsg.success() : ApiMsg.fail("删除失败");
	}

	/**
	 * 批量导入学员
	 */
	@ResponseBody
	@RequestMapping("/site/importTrainees.json")
	public ApiMsg importTrainees(@RequestParam("file") MultipartFile file, HttpServletRequest request,
									  HttpServletResponse response) throws IOException {
		String projectPath = request.getServletContext().getRealPath("/");
		int num = traineeService.importExcel(file, projectPath);
		return ApiMsg.success(num, "导入成功" + num + "行试题记录");
	}
	// **************************** 人员管理-异步接口 END ****************************
}
