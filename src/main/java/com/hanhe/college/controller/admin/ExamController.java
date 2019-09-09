package com.hanhe.college.controller.admin;

import java.io.IOException;
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
import com.hanhe.college.dto.ExamPaperDTO;
import com.hanhe.college.entity.Exam;
import com.hanhe.college.entity.ExamQuestion;
import com.hanhe.college.param.admin.ExamParam;
import com.hanhe.college.param.admin.ExamQuestionParam;
import com.hanhe.college.service.*;

/**
 * 考试管理
 */
@Controller
@RequestMapping("/admin/exam")
public class ExamController {
	@Autowired
	private ExamService examService;
	@Autowired
	private ExamPaperService examPaperService;
	@Autowired
	private ExamQuestionService examQuestionService;
	@Autowired
	private UserTypeService userTypeService;
	@Autowired
	private UavTypeService uavTypeService;
	@Autowired
	private CourseCategoryService courseCategoryService;

	@RequestMapping("/paper_manage.page")
	public String paper_manage(Model model, Long userTypeId, Long uavTypeId, Long courseCategoryId, Integer pageNum,
			Integer pageSize) {
		List<Exam> exams = examService.list(userTypeId, uavTypeId, courseCategoryId, pageNum, pageSize);
		PageInfo<Exam> page = new PageInfo(exams);
		model.addAttribute("exams", exams);
		model.addAttribute("userTypeId", userTypeId);
		model.addAttribute("uavTypeId", uavTypeId);
		model.addAttribute("courseCategoryId", courseCategoryId);
		model.addAttribute("userTypes", userTypeService.getAvailable());
		model.addAttribute("uavTypes", uavTypeService.getAvailable());
		model.addAttribute("courseCategories", courseCategoryService.getAvailable());
		model.addAttribute("page", page);
		return "admin/paper_manage";
	}
	@RequestMapping("/add_paper_manage.page")
	public String add_paper_manage(Model model, Long id) {
		if (id != null) {
			Exam exam = examService.getDetails(id);
			List<ExamPaperDTO> examPapers = examPaperService.list(id);
			model.addAttribute("exam", exam);
			model.addAttribute("examPapers", examPapers);
		}
		model.addAttribute("userTypes", userTypeService.getAvailable());
		model.addAttribute("uavTypes", uavTypeService.getAvailable());
		model.addAttribute("courseCategories", courseCategoryService.getAvailable());
		return "admin/add_paper_manage";
	}
	@RequestMapping("/wrod_manage.page")
	public String wrod_manage(Model model, Integer type, Long userTypeId, Long uavTypeId, Long courseCategoryId,
			Integer pageNum, Integer pageSize) {
		// 题型为固定值，试题类型：0：全部；1：单选；2：多选；3：判断
		List<ExamQuestion> examQuestions = examQuestionService.list(type, userTypeId, uavTypeId, courseCategoryId,
				pageNum, pageSize);
		PageInfo<ExamQuestion> page = new PageInfo(examQuestions);
		model.addAttribute("examQuestions", examQuestions);
		model.addAttribute("userTypes", userTypeService.getAvailable());
		model.addAttribute("uavTypes", uavTypeService.getAvailable());
		model.addAttribute("courseCategories", courseCategoryService.getAvailable());
		model.addAttribute("page", page);
		model.addAttribute("type", type);
		model.addAttribute("userTypeId", userTypeId);
		model.addAttribute("uavTypeId", uavTypeId);
		model.addAttribute("courseCategoryId", courseCategoryId);
		return "admin/wrod_manage";
	}
	@RequestMapping("/add_wrod_manage.page")
	public String add_wrod_manage(Model model, Long id) {
		if (id != null) {
			ExamQuestion examQuestion = examQuestionService.getDetails(id);
			model.addAttribute("examQuestion", examQuestion);
		}
		model.addAttribute("userTypes", userTypeService.getAvailable());
		model.addAttribute("uavTypes", uavTypeService.getAvailable());
		model.addAttribute("courseCategories", courseCategoryService.getAvailable());
		return "admin/add_wrod_manage";
	}

	// **************************** 考试管理-异步接口 START ****************************

	/**
	 * 添加试卷配置
	 */
	@ResponseBody
	@RequestMapping("/saveExamConfig.json")
	public ApiMsg saveExamConfig(ExamParam param) {
		long id = examService.insert(param);
		return ApiMsg.success(id);
	}

	/**
	 * 删除试卷配置
	 */
	@ResponseBody
	@RequestMapping("/deleteExamConfig.json")
	public ApiMsg deleteExamConfig(long id) {
		int result = examService.delete(id);
		return result > 0 ? ApiMsg.success() : ApiMsg.fail("删除失败");
	}
	
	/**
	 * 获取试题列表(添加考卷)
	 */
	@ResponseBody
	@RequestMapping("/getExamQuestions.json")
	public ApiMsg getExamQuestions(long userTypeId, long uavTypeId, Long courseCategoryId) {
		List<ExamQuestion> questions = examQuestionService.list(userTypeId, uavTypeId, courseCategoryId);
		return ApiMsg.success(questions);
	}

	/**
	 * 添加试卷
	 */
	@ResponseBody
	@RequestMapping("/saveExamPaper.json")
	public ApiMsg saveExamPaper(long examId, String questionIds) {
		long id = examPaperService.insert(examId, questionIds);
		return ApiMsg.success(id);
	}

	/**
	 * 删除试卷
	 */
	@ResponseBody
	@RequestMapping("/deleteExamPaper.json")
	public ApiMsg deleteExamPaper(Long id) {
		int result = examPaperService.delete(id);
		return result > 0 ? ApiMsg.success() : ApiMsg.fail("删除失败");
	}

	/**
	 * 保存试题
	 */
	@ResponseBody
	@RequestMapping("/saveExamQuestion.json")
	public ApiMsg saveExamQuestion(ExamQuestionParam param) {
		if (param.getId() == null) {
			long id = examQuestionService.insert(param);
			return ApiMsg.success(id);
		} else {
			int result = examQuestionService.update(param);
			return result > 0 ? ApiMsg.success() : ApiMsg.fail("更新失败");
		}
	}

	/**
	 * 删除试题
	 */
	@ResponseBody
	@RequestMapping("/deleteExamQuestion.json")
	public ApiMsg deleteExamQuestion(long id) {
		int result = examQuestionService.delete(id);
		return result > 0 ? ApiMsg.success() : ApiMsg.fail("删除失败");
	}

	/**
	 * 批量导入试题
	 */
	@ResponseBody
	@RequestMapping("/importExamQuestions.json")
	public ApiMsg importExamQuestions(@RequestParam("file") MultipartFile file, HttpServletRequest request,
									  HttpServletResponse response) throws IOException {
		String projectPath = request.getServletContext().getRealPath("/");
		int num = examQuestionService.importExcel(file, projectPath);
		return ApiMsg.success(num, "导入成功" + num + "行试题记录");
	}
	// **************************** 考试管理-异步接口 END ****************************
}
