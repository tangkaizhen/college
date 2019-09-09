package com.hanhe.college.service;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.albaba.tools.util.DateUtil;
import com.albaba.tools.util.ExcelReader;
import com.albaba.tools.util.IpUtil;
import com.github.pagehelper.PageHelper;
import com.google.common.base.Preconditions;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.hanhe.college.common.RequestHolder;
import com.hanhe.college.constant.Constants;
import com.hanhe.college.dao.CourseCategoryMapper;
import com.hanhe.college.dao.ExamQuestionMapper;
import com.hanhe.college.dao.UavTypeMapper;
import com.hanhe.college.dao.UserTypeMapper;
import com.hanhe.college.entity.CourseCategory;
import com.hanhe.college.entity.ExamQuestion;
import com.hanhe.college.entity.UavType;
import com.hanhe.college.entity.UserType;
import com.hanhe.college.exception.ParamException;
import com.hanhe.college.param.admin.ExamQuestionParam;
import com.hanhe.college.util.BeanValidator;
import com.hanhe.college.util.UploadUtil;

/**
 * Created by Angelo on 2018/8/13.
 */
@Service
public class ExamQuestionService {
	@Autowired
	private ExamQuestionMapper examQuestionMapper;
	@Autowired
	private UserTypeMapper userTypeMapper;
	@Autowired
	private UavTypeMapper uavTypeMapper;
	@Autowired
	private CourseCategoryMapper courseCategoryMapper;

	/**
	 * 试题列表
	 */
	public List<ExamQuestion> list(Integer type, Long userTypeId, Long uavTypeId, Long courseCategoryId,
			Integer pageNum, Integer pageSize) {
		if (pageNum == null) {
			pageNum = Constants.DEFAULT_PAGE_NUM;
		}
		if (pageSize == null) {
			pageSize = Constants.DEFAULT_PAGE_SIZE;
		}
		PageHelper.startPage(pageNum, pageSize);
		return examQuestionMapper.list(type, userTypeId, uavTypeId, courseCategoryId);
//		List<UserType> userTypes = userTypeMapper.getAll();
//		List<UavType> uavTypes = uavTypeMapper.getAll();
//		List<CourseCategory> courseCategories = courseCategoryMapper.getAll();
//		Map<Long, String> userTypeMap = userTypes.stream()
//				.collect(Collectors.toMap(UserType::getId, UserType::getName));
//		Map<Long, String> uavTypeMap = uavTypes.stream().collect(Collectors.toMap(UavType::getId, UavType::getName));
//		Map<Long, String> courseCategoryMap = courseCategories.stream()
//				.collect(Collectors.toMap(CourseCategory::getId, CourseCategory::getName));
//		List<ExamQuestionDTO> dtoList = Lists.newArrayList();
//		for (ExamQuestion examQuestion : questionList) {
//			dtoList.add(ExamQuestionDTO.adapt(examQuestion, userTypeMap, uavTypeMap, courseCategoryMap));
//		}
//		return dtoList;
	}
	
	/**
	 * 添加考卷获取试题列表
	 */
	public List<ExamQuestion> list(Long userTypeId, Long uavTypeId, Long courseCategoryId) {
		return examQuestionMapper.list(null, userTypeId, uavTypeId, courseCategoryId);
	}

	/**
	 * 添加试题
	 */
	public long insert(ExamQuestionParam param) {
		if (param.getType() != null && param.getType() == Constants.QUESTION_TYPE_JUDGE) {
			param.setOption3("PASS");
			param.setOption4("PASS");
		}
		BeanValidator.check(param);
		UserType userType = userTypeMapper.selectByPrimaryKey(param.getUserTypeId());
		Preconditions.checkNotNull(userType, "指定的身份不存在");
		UavType uavType = uavTypeMapper.selectByPrimaryKey(param.getUavTypeId());
		Preconditions.checkNotNull(uavType, "指定的机型不存在");
		CourseCategory courseCategory = courseCategoryMapper.selectByPrimaryKey(param.getCourseCategoryId());
		Preconditions.checkNotNull(courseCategory, "指定的课程类别不存在");

		Date now = DateUtil.getNow();
		ExamQuestion examQuestion = ExamQuestion.builder().userTypeId(param.getUserTypeId())
				.uavTypeId(param.getUavTypeId()).courseCategoryId(param.getCourseCategoryId())
				.userType(userType.getName()).uavType(uavType.getName()).courseCategory(courseCategory.getName())
				.type(param.getType()).question(param.getQuestion()).answer(param.getAnswer())
				.option1(param.getOption1()).option2(param.getOption2()).state(Constants.DEFAULT_STATE_NORMAL).build();
		if (param.getType() != Constants.QUESTION_TYPE_JUDGE) {
			examQuestion.setOption3(param.getOption3());
			examQuestion.setOption4(param.getOption4());
		}
		examQuestion.setOperator(RequestHolder.getCurrentUserBean().getName());
		examQuestion.setOperateTime(now);
		examQuestion.setOperateIp(IpUtil.getRemoteIp(RequestHolder.getCurrentRequest()));
		examQuestionMapper.insertSelective(examQuestion);
		return examQuestion.getId();
	}

	/**
	 * 更新试题
	 */
	public int update(ExamQuestionParam param) {
		if (param.getType() != null && param.getType() == Constants.QUESTION_TYPE_JUDGE) {
			param.setOption3("PASS");
			param.setOption4("PASS");
		}
		BeanValidator.check(param);
		ExamQuestion before = examQuestionMapper.selectByPrimaryKey(param.getId());
		Preconditions.checkNotNull(before, "待更新的试题不存在");
		UserType userType = userTypeMapper.selectByPrimaryKey(param.getUserTypeId());
		Preconditions.checkNotNull(userType, "指定的身份不存在");
		UavType uavType = uavTypeMapper.selectByPrimaryKey(param.getUavTypeId());
		Preconditions.checkNotNull(uavType, "指定的机型不存在");
		CourseCategory courseCategory = courseCategoryMapper.selectByPrimaryKey(param.getCourseCategoryId());
		Preconditions.checkNotNull(courseCategory, "指定的课程类别不存在");

		ExamQuestion after = ExamQuestion.builder().id(param.getId()).userTypeId(param.getUserTypeId())
				.uavTypeId(param.getUavTypeId()).courseCategoryId(param.getCourseCategoryId())
				.userType(userType.getName()).uavType(uavType.getName()).courseCategory(courseCategory.getName())
				.type(param.getType()).question(param.getQuestion()).answer(param.getAnswer())
				.option1(param.getOption1()).option2(param.getOption2()).build();
		if (param.getType() != Constants.QUESTION_TYPE_JUDGE) {
			after.setOption3(param.getOption3());
			after.setOption4(param.getOption4());
		}
		after.setOperator(RequestHolder.getCurrentUserBean().getName());
		after.setOperateTime(DateUtil.getNow());
		after.setOperateIp(IpUtil.getRemoteIp(RequestHolder.getCurrentRequest()));
		return examQuestionMapper.updateByPrimaryKeySelective(after);
	}

	/**
	 * 删除试题
	 */
	public int delete(long id) {
		ExamQuestion before = examQuestionMapper.selectByPrimaryKey(id);
		Preconditions.checkNotNull(before, "待删除的试题不存在");
		ExamQuestion after = ExamQuestion.builder().id(id).state(Constants.DEFAULT_STATE_DELETE).build();
		after.setOperator(RequestHolder.getCurrentUserBean().getName());
		after.setOperateTime(DateUtil.getNow());
		after.setOperateIp(IpUtil.getRemoteIp(RequestHolder.getCurrentRequest()));
		return examQuestionMapper.updateByPrimaryKeySelective(after);
	}

	/**
	 * 试题详情
	 */
	public ExamQuestion getDetails(Long id) {
		ExamQuestion examQuestion = examQuestionMapper.selectByPrimaryKey(id);
		Preconditions.checkNotNull(examQuestion, "待查看的试题不存在");
		return examQuestion;
	}

	/**
	 * 批量导入试题
	 */
	public int importExcel(MultipartFile file, String projectPath) throws IOException {
		if (file == null || file.isEmpty()) {
			throw new ParamException("文件不存在");
		}
		String contentType = file.getContentType();
		if (contentType.equalsIgnoreCase("application/vnd.ms-excel") || contentType.equalsIgnoreCase("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet")) {
			String dirPath = projectPath + "upload" + File.separator + "excels";
			ExcelReader er = new ExcelReader(UploadUtil.uploadFile(file, dirPath));
			try {
				er.open();
			} catch (IOException e) {
				throw new ParamException("文件读取异常");
			}

			int row = er.getRowCount();
			if (row == -1) {
				throw new ParamException("导入文件没有数据");
			} else {
				String[] templatesOk = er.readExcelLine(0, 0);       //模板验证
				if (templatesOk == null || templatesOk.length < 10) {
					throw new ParamException("导入模版错误，请使用正确模版导入试题");
				}
				if ("试题名称".equals(templatesOk[0])
						&& "题型".equals(templatesOk[1])
						&& "身份".equals(templatesOk[2])
						&& "机型".equals(templatesOk[3])
						&& "课程类别".equals(templatesOk[4])
						&& "选项A".equals(templatesOk[5])
						&& "选项B".equals(templatesOk[6])
						&& "选项C".equals(templatesOk[7])
						&& "选项D".equals(templatesOk[8])
						&& "正确答案".equals(templatesOk[9])) {
					Map<String, Integer> typeMap = Maps.newHashMap();
					typeMap.put("单选题", 1);
					typeMap.put("多选题", 2);
					typeMap.put("判断题", 3);
					List<CourseCategory> courseCategories = courseCategoryMapper.getAvailable();
					Map<String, CourseCategory> courseCategoryMap = courseCategories.stream()
							.collect(Collectors.toMap(CourseCategory::getKey, courseCategory -> courseCategory));
					List<ExamQuestion> examQuestionList = Lists.newArrayList();
					Date now = DateUtil.getNow();
					String operator = RequestHolder.getCurrentUserBean().getName();
					String operateIp = IpUtil.getRemoteIp(RequestHolder.getCurrentRequest());
					for (int i = 1; i <= row; i++) {
						String[] datas = er.readExcelLine(0, i);
						if (datas == null || datas.length < 10) {
							throw new ParamException("第" + (i + 1) + "行数据异常，导入失败");
						}
						String question = datas[0];
						String typeKey = datas[1];
						String userType = datas[2];
						String uavType = datas[3];
						String courseCategory = datas[4];
						String option1 = datas[5];
						String option2 = datas[6];
						String option3 = datas[7];
						String option4 = datas[8];
						String anseer = datas[9];
						String courseCategoryKey = userType + "_" + uavType + "_" + courseCategory;
						if (StringUtils.isEmpty(typeKey) || typeMap.get(typeKey) == null) {
							throw new ParamException("第" + (i + 1) + "行题型错误");
						} else if (StringUtils.isEmpty(userType) || StringUtils.isEmpty(uavType) || StringUtils.isEmpty(courseCategory) || courseCategoryMap.get(courseCategoryKey) == null) {
							throw new ParamException("第" + (i + 1) + "行身份/机型/课程类别不匹配");
						} else {
							CourseCategory category = courseCategoryMap.get(courseCategoryKey);
							int type = typeMap.get(typeKey);
							ExamQuestionParam param = new ExamQuestionParam(null, category.getUserTypeId(), category.getUavTypeId(), category.getId(), type, question,
									option1, option2, option3, option4, anseer);
							if (type == Constants.QUESTION_TYPE_JUDGE) {
								param.setOption3("PASS");
								param.setOption4("PASS");
							}
							BeanValidator.checkExcelData(param, i + 1);

							ExamQuestion examQuestion = ExamQuestion.builder().userTypeId(category.getUserTypeId())
									.uavTypeId(category.getUavTypeId()).courseCategoryId(category.getId())
									.userType(category.getUserType()).uavType(category.getUavType()).courseCategory(category.getName())
									.type(type).question(question.trim()).answer(anseer.trim().toUpperCase())
									.option1(option1.trim()).option2(option2.trim()).state(Constants.DEFAULT_STATE_NORMAL).build();
							if (type != Constants.QUESTION_TYPE_JUDGE) {
								examQuestion.setOption3(option3.trim());
								examQuestion.setOption4(option4.trim());
							}
							examQuestion.setOperator(operator);
							examQuestion.setOperateTime(now);
							examQuestion.setOperateIp(operateIp);
							examQuestionList.add(examQuestion);
						}
					}
					return examQuestionMapper.batchInsert(examQuestionList);
				} else {
					throw new ParamException("导入模版错误，请使用正确模版导入试题");
				}
			}
		} else {
			throw new ParamException("请选择.xls或.xlsx为后缀的Excel文件上传");
		}
	}
}
