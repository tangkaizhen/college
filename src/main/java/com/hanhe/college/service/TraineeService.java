package com.hanhe.college.service;

import java.io.*;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.albaba.tools.util.DateUtil;
import com.albaba.tools.util.ExcelReader;
import com.albaba.tools.util.ExcelWriter;
import com.albaba.tools.util.IpUtil;
import com.github.pagehelper.PageHelper;
import com.google.common.base.Preconditions;
import com.google.common.collect.Lists;
import com.hanhe.college.common.RequestHolder;
import com.hanhe.college.common.UserBean;
import com.hanhe.college.constant.Constants;
import com.hanhe.college.dao.TraineeMapper;
import com.hanhe.college.entity.Trainee;
import com.hanhe.college.exception.ParamException;
import com.hanhe.college.exception.PermissionException;
import com.hanhe.college.param.admin.TraineeParam;
import com.hanhe.college.util.BeanValidator;
import com.hanhe.college.util.UploadUtil;

import lombok.extern.slf4j.Slf4j;

/**
 * Created by Angelo on 2018/8/31.
 */
@Slf4j
@Service
public class TraineeService {
	@Autowired
	private TraineeMapper traineeMapper;

	/**
	 * 学员列表
	 */
	public List<Trainee> list(String province, String keyword, Integer pageNum, Integer pageSize) {
		if ("全部".equals(province)) {
			province = null;
		}
		if (pageNum == null) {
			pageNum = Constants.DEFAULT_PAGE_NUM;
		}
		if (pageSize == null) {
			pageSize = Constants.DEFAULT_PAGE_SIZE;
		}
		PageHelper.startPage(pageNum, pageSize);
		Long trainingSiteId = null;
		UserBean userBean = RequestHolder.getCurrentUserBean();
		// 网点管理员
		if (userBean.getType() == Constants.ADMINISTRATOR_TYPE_MASTER) {
			trainingSiteId = userBean.getTrainingSiteId();
		}
		return traineeMapper.list(province, keyword, trainingSiteId);
	}

	/**
	 * 学员登记
	 */
	public long insert(TraineeParam param) throws IOException {
		BeanValidator.check(param);

		Date now = DateUtil.getNow();
		Trainee trainee = Trainee.builder().name(param.getName()).namePy(param.getNamePy()).gender(param.getGender())
				.birthDate(DateUtil.parseDate(param.getBirthDate())).pic(param.getPic()).phone(param.getPhone())
				.province(param.getProvince()).city(param.getCity()).address(param.getAddress())
				.addresseeName(param.getAddresseeName()).addresseePhone(param.getAddresseePhone())
				.addresseeProvince(param.getAddresseeProvince()).addresseeCity(param.getAddresseeCity())
				.addresseeAddress(param.getAddresseeAddress()).phone(param.getPhone())
				.certicateNo(param.getCerticateNo()).issueUnit(param.getIssueUnit())
				.issueDate(DateUtil.parseDate(param.getIssueDate()))
				.validityStartDate(DateUtil.parseDate(param.getValidityStartDate()))
				.validityEndDate(DateUtil.parseDate(param.getValidityEndDate())).rating(param.getRating())
				.remarks(param.getRemarks()).state(Constants.DEFAULT_STATE_NORMAL).createTime(now).build();
		if (UploadUtil.isUploadBase64Image(param.getPic())) {
			String projectPath = RequestHolder.getCurrentRequest().getServletContext().getRealPath("/");
			String base64ImageData = param.getPic().split(",")[1];
			String imgUrl = UploadUtil.uploadBase64Image(projectPath, base64ImageData, Constants.IMAGE_TYPE_TRAINEE);
			trainee.setPic(imgUrl);
		} else {
			throw new ParamException("图片上传格式有误");
		}
		if (RequestHolder.getCurrentUserBean().getTrainingSiteId() != null) {
			trainee.setTrainingSiteId(RequestHolder.getCurrentUserBean().getTrainingSiteId());
		}
		trainee.setOperator(RequestHolder.getCurrentUserBean().getName());
		trainee.setOperateTime(now);
		trainee.setOperateIp(IpUtil.getRemoteIp(RequestHolder.getCurrentRequest()));
		traineeMapper.insertSelective(trainee);
		return trainee.getId();
	}

	/**
	 * 修改学员
	 */
	public int update(TraineeParam param) throws IOException {
		BeanValidator.check(param);
		Trainee before = traineeMapper.selectByPrimaryKey(param.getId());
		Preconditions.checkNotNull(before, "待更新的学员不存在");
		UserBean userBean = RequestHolder.getCurrentUserBean();
		// 网点管理员
		if (userBean.getType() == Constants.ADMINISTRATOR_TYPE_MASTER) {
			Long trainingSiteId = userBean.getTrainingSiteId();
			if (before.getTrainingSiteId() == null || trainingSiteId == null || before.getTrainingSiteId().longValue() != trainingSiteId.longValue()) {
				throw new PermissionException("对不起，您无此权限");
			}
		}

		Trainee after = Trainee.builder().id(param.getId()).name(param.getName()).namePy(param.getNamePy())
				.gender(param.getGender()).birthDate(DateUtil.parseDate(param.getBirthDate())).pic(param.getPic())
				.phone(param.getPhone()).province(param.getProvince()).city(param.getCity()).address(param.getAddress())
				.addresseeName(param.getAddresseeName()).addresseePhone(param.getAddresseePhone())
				.addresseeProvince(param.getAddresseeProvince()).addresseeCity(param.getAddresseeCity())
				.addresseeAddress(param.getAddresseeAddress()).certicateNo(param.getCerticateNo())
				.issueUnit(param.getIssueUnit()).issueDate(DateUtil.parseDate(param.getIssueDate()))
				.validityStartDate(DateUtil.parseDate(param.getValidityStartDate()))
				.validityEndDate(DateUtil.parseDate(param.getValidityEndDate())).rating(param.getRating())
				.remarks(param.getRemarks()).build();
		// 新上传学员头像
		boolean isNewImage = false;
		String projectPath = RequestHolder.getCurrentRequest().getServletContext().getRealPath("/");
		if (UploadUtil.isUploadBase64Image(param.getPic())) {
			String base64ImageData = param.getPic().split(",")[1];
			String imgUrl = UploadUtil.uploadBase64Image(projectPath, base64ImageData, Constants.IMAGE_TYPE_ARTICLE);
			after.setPic(imgUrl);
			isNewImage = true;
		}
		after.setOperator(RequestHolder.getCurrentUserBean().getName());
		after.setOperateTime(DateUtil.getNow());
		after.setOperateIp(IpUtil.getRemoteIp(RequestHolder.getCurrentRequest()));
		int result = traineeMapper.updateByPrimaryKeySelective(after);
		if (result > 0) {
			if (isNewImage) {
				File imgFile = new File(projectPath + before.getPic());
				if (imgFile.exists()) {
					imgFile.delete();
				}
			}
		}
		return result;
	}

	/**
	 * 删除学员
	 */
	public int delete(long id) {
		Trainee before = traineeMapper.selectByPrimaryKey(id);
		Preconditions.checkNotNull(before, "待删除的学员不存在");
		UserBean userBean = RequestHolder.getCurrentUserBean();
		// 网点管理员
		if (userBean.getType() == Constants.ADMINISTRATOR_TYPE_MASTER) {
			Long trainingSiteId = userBean.getTrainingSiteId();
			if (before.getTrainingSiteId() == null || trainingSiteId == null || before.getTrainingSiteId().longValue() != trainingSiteId.longValue()) {
				throw new PermissionException("对不起，您无此权限");
			}
		}
		Trainee after = Trainee.builder().id(id).state(Constants.DEFAULT_STATE_DELETE).build();
		after.setOperator(RequestHolder.getCurrentUserBean().getName());
		after.setOperateTime(DateUtil.getNow());
		after.setOperateIp(IpUtil.getRemoteIp(RequestHolder.getCurrentRequest()));
		return traineeMapper.updateByPrimaryKeySelective(after);
	}

	/**
	 * 查看学员详情
	 */
	public Trainee getDetails(Long id) {
		Trainee trainee = traineeMapper.selectByPrimaryKey(id);
		Preconditions.checkNotNull(trainee, "待查看的学员不存在");
		UserBean userBean = RequestHolder.getCurrentUserBean();
		// 网点管理员
		if (userBean.getType() == Constants.ADMINISTRATOR_TYPE_MASTER) {
			Long trainingSiteId = userBean.getTrainingSiteId();
			if (trainee.getTrainingSiteId() == null || trainingSiteId == null || trainee.getTrainingSiteId().longValue() != trainingSiteId.longValue()) {
				throw new PermissionException("对不起，您无此权限");
			}
		}
		return trainee;
	}

	/**
	 * 批量导出学员信息
	 */
	public void exportExcel(String province, String keyword, HttpServletResponse response) throws UnsupportedEncodingException {
		if ("全部".equals(province)) {
			province = null;
		}
		Long trainingSiteId = null;
		UserBean userBean = RequestHolder.getCurrentUserBean();
		// 网点管理员
		if (userBean.getType() == Constants.ADMINISTRATOR_TYPE_MASTER) {
			trainingSiteId = userBean.getTrainingSiteId();
		}
		List<Trainee> trainees = traineeMapper.list(province, keyword, trainingSiteId);
		String excelName = "学员_" + (StringUtils.isEmpty(province) ? "": province + "_") + DateUtil.format(new Date(), "yyyy_MM_dd") + ".xls";
		response.reset();
		response.setContentType("application/vnd.ms-excel;charset=UTF-8");
		response.addHeader("Content-Disposition",
				"attachment;filename=" + new String(excelName.getBytes("UTF-8"), "ISO-8859-1" ));
		try {
			OutputStream toClient = new BufferedOutputStream(response.getOutputStream());
			ExcelWriter ew = new ExcelWriter(toClient, 1);

			ew.createRow(0);
			ew.setCell(0, "序号");
			ew.setCell(1, "合格证编号（身份证号码）");
			ew.setCell(2, "姓名");
			ew.setCell(3, "姓名拼音");
			ew.setCell(4, "性别");
			ew.setCell(5, "出生日期");
			ew.setCell(6, "省份");
			ew.setCell(7, "城市");
			ew.setCell(8, "详细地址");
			ew.setCell(9, "手机号码");
			ew.setCell(10, "合格证等级");
			ew.setCell(11, "收件人");
			ew.setCell(12, "收件人手机号");
			ew.setCell(13, "收件人省份");
			ew.setCell(14, "收件人城市");
			ew.setCell(15, "收件人详细地址");
			ew.setCell(16, "备注");
			ew.setCell(17, "签发日期");
			ew.setCell(18, "有效期");
			ew.setCell(19, "签发单位");

			int i = 1;
			for (Trainee trainee : trainees) {
				ew.createRow(i++);
				ew.setCell(0, i-1);
				ew.setCell(1, trainee.getCerticateNo());
				ew.setCell(2, trainee.getName());
				ew.setCell(3, trainee.getNamePy());
				ew.setCell(4, trainee.getGender());
				ew.setCell(5, DateUtil.format(trainee.getBirthDate()));
				ew.setCell(6, trainee.getProvince());
				ew.setCell(7, trainee.getCity());
				ew.setCell(8, trainee.getAddress());
				ew.setCell(9, trainee.getPhone());
				ew.setCell(10, trainee.getRating());
				ew.setCell(11, trainee.getAddresseeName());
				ew.setCell(12, trainee.getAddresseePhone());
				ew.setCell(13, trainee.getAddresseeProvince());
				ew.setCell(14, trainee.getAddresseeCity());
				ew.setCell(15, trainee.getAddresseeAddress());
				ew.setCell(16, trainee.getRemarks());
				ew.setCell(17, DateUtil.format(trainee.getIssueDate()));
				ew.setCell(18, DateUtil.format(trainee.getValidityStartDate()) + "至" + DateUtil.format(trainee.getValidityEndDate()));
				ew.setCell(19, trainee.getIssueUnit());
			}
			ew.export();
		} catch (Exception e) {
			log.error("导出失败",e);
		}
	}

	/**
	 * 批量导入学员信息
	 */
    public int importExcel(MultipartFile file, String projectPath) throws IOException {
		if (file == null || file.isEmpty()) {
			throw new ParamException("文件不存在");
		}
		String contentType = file.getContentType();
		if (contentType.equalsIgnoreCase("application/vnd.ms-excel")
				|| contentType.equalsIgnoreCase("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet")) {
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
				if (templatesOk == null || templatesOk.length < 19) {
					throw new ParamException("导入模版错误，请使用正确模版导入试题");
				}
				if ("合格证编号（身份证号码）".equals(templatesOk[0])
						&& "姓名".equals(templatesOk[1])
						&& "姓名拼音".equals(templatesOk[2])
						&& "性别".equals(templatesOk[3])
						&& "出生日期".equals(templatesOk[4])
						&& "省份".equals(templatesOk[5])
						&& "城市".equals(templatesOk[6])
						&& "详细地址".equals(templatesOk[7])
						&& "手机号码".equals(templatesOk[8])
						&& "合格证等级".equals(templatesOk[9])
						&& "收件人".equals(templatesOk[10])
						&& "收件人手机号".equals(templatesOk[11])
						&& "收件人省份".equals(templatesOk[12])
						&& "收件人城市".equals(templatesOk[13])
						&& "收件人详细地址".equals(templatesOk[14])
						&& "备注".equals(templatesOk[15])
						&& "签发日期".equals(templatesOk[16])
						&& "有效期".equals(templatesOk[17])
						&& "签发单位".equals(templatesOk[18])) {
					List<Trainee> traineeList = Lists.newArrayList();
					Date now = DateUtil.getNow();
					Long trainingSiteId = RequestHolder.getCurrentUserBean().getTrainingSiteId();
					String operator = RequestHolder.getCurrentUserBean().getName();
					String operateIp = IpUtil.getRemoteIp(RequestHolder.getCurrentRequest());
					for (int i = 1; i <= row; i++) {
						String[] datas = er.readExcelLine(0, i);
						if (datas == null || datas.length < 14) {
							throw new ParamException("第" + (i + 1) + "行数据异常，导入失败");
						}
						String certicateNo = datas[0];
						String name = datas[1];
						String namePy = datas[2];
						String gender = datas[3];
						String birthDate = datas[4];
						String province = datas[5];
						String city = datas[6];
						String address = datas[7];
						String phone = datas[8];
						String rating = datas[9];
						String addresseeName = datas[10];
						String addresseePhone = datas[11];
						String addresseeProvince = datas[12];
						String addresseeCity = datas[13];
						String addresseeAddress = datas[14];
						String remarks = datas[15];
						String issueDate = datas[16];
						String validityDate = datas[17];
						String issueUnit = datas[18];


						if (StringUtils.isEmpty(validityDate) || validityDate.indexOf("至") == -1 || validityDate.split("至").length !=2) {
							throw new ParamException("第" + (i + 1) + "行有效期错误");
						} else {
							String[] dates = validityDate.split("至");
							String validityStartDate = dates[0];
							String validityEndDate = dates[1];
							TraineeParam param = new TraineeParam(null, name, namePy, gender, birthDate, "pic", phone, province, city, "", address, addresseeName,
									addresseePhone, addresseeProvince, addresseeCity, "", addresseeAddress, certicateNo, issueUnit,
									issueDate, validityStartDate, validityEndDate, rating, remarks);
							BeanValidator.checkExcelData(param, i + 1);

							Trainee trainee = Trainee.builder().name(param.getName()).namePy(param.getNamePy()).gender(param.getGender())
									.birthDate(DateUtil.parseDate(param.getBirthDate())).pic(param.getPic()).phone(param.getPhone())
									.province(param.getProvince()).city(param.getCity()).address(param.getAddress())
									.addresseeName(param.getAddresseeName()).addresseePhone(param.getAddresseePhone())
									.addresseeProvince(param.getAddresseeProvince()).addresseeCity(param.getAddresseeCity())
									.addresseeAddress(param.getAddresseeAddress()).phone(param.getPhone())
									.certicateNo(param.getCerticateNo()).issueUnit(param.getIssueUnit())
									.issueDate(DateUtil.parseDate(param.getIssueDate()))
									.validityStartDate(DateUtil.parseDate(param.getValidityStartDate()))
									.validityEndDate(DateUtil.parseDate(param.getValidityEndDate())).rating(param.getRating())
									.remarks(param.getRemarks()).state(Constants.DEFAULT_STATE_NORMAL).createTime(now).build();
							trainee.setTrainingSiteId(trainingSiteId);
							trainee.setOperator(operator);
							trainee.setOperateTime(now);
							trainee.setOperateIp(operateIp);
							traineeList.add(trainee);
						}
					}
					return traineeMapper.batchInsert(traineeList);
				} else {
					throw new ParamException("导入模版错误，请使用正确模版导入试题");
				}
			}
		} else {
			throw new ParamException("请选择.xls或.xlsx为后缀的Excel文件上传");
		}
    }
}
