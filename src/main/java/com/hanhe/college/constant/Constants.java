package com.hanhe.college.constant;

import org.springframework.util.StringUtils;

import com.albaba.tools.util.SystemProperties;

/**
 * Created by Angelo on 2017/4/17.
 */
public class Constants {

	public static final boolean DEBUG = false;

	public static final String VERSION = "010101";

	/** seesion */
	public static final String SESSION_USER = "user";
	public static final String SESSION_OPENID = "openid";

	public static final String DEFAULT_PASSWORD = "123456";

	/** 短信验证格式 **/
	public static final String MESSAGE_HEAD = "您的验证码为：";
	public static final String MESSAGE_BACK = "";
	public static final String MESSAGE_NOTICE = "，请在10分钟内提交验证码，切勿将验证码泄露于他人";

	/** 短信验证码 */
	public static final String SMS_CHECK_TIME = "smsCheckTime";
	public static final int SMS_CHECK_TIME_NUMBER = 10;// 单位min
	public static final int SMS_LIMIT_COUNT_DAY = 5;// 每个手机号码每天最多发送条数
	public static final String DEFAULT_SMS_CHECK_CODE = "221133"; // 短信通关验证码

	/** 验证码类型；1：注册；2：忘记密码； */
	public static final Integer[] CODE_TYPES = {1, 2};
	public static final int CODE_TYPE_REGISTER = 1;
	public static final int CODE_TYPE_FORGET_PWD = 2;

	/** 默认显示页数 */
	public static final int DEFAULT_PAGE_NUM = 1;
	/** 默认每页显示条数 */
	public static final int DEFAULT_PAGE_SIZE = 10;
	/** 微信首页默认显示条数 */
	public static final int DEFAULT_TOP_PAGE_SIZE = 5;

	/** 状态类型：0: 删除；1：正常；2：成功；3：失败 */
	public static final int DEFAULT_STATE_DELETE = 0;
	public static final int DEFAULT_STATE_NORMAL = 1;
	public static final int DEFAULT_STATE_SUCCESS = 2;
	public static final int DEFAULT_STATE_FAIL = 3;

	/** 身份类型标识：1：初级（操作员）；2：高级（教员） */
	public static final int USER_TYPE_FLAG_JUNIOR = 1;
	public static final int USER_TYPE_FLAG_SENIOR = 2;

	/** 管理员类型：1：管理员；2：专家；3：培训网点管理员 */
	public static final int ADMINISTRATOR_TYPE_ADMIN = 1;
	public static final int ADMINISTRATOR_TYPE_EXPERT = 2;
	public static final int ADMINISTRATOR_TYPE_MASTER = 3;

	/** 首页专家 */
	public static final int ADMINISTRATOR_FLAG_HOME = 1;

	/** 默认权限ID：9：专家；10：培训网点管理员 */
	public static final long ROLE_EXPERT_ID = 9;
	public static final long ROLE_TRAINING_SITE_ID = 10;

	/** 文章类型：1：汉和干货；2：专家文章 */
	public static final int ARTICLE_TYPE_WIKI = 1;
	public static final int ARTICLE_TYPE_EXPERT = 2;

	/** 试题类型：1：单选；2：多选；3：判断 */
	public static final int QUESTION_TYPE_SINGLE = 1;
	public static final int QUESTION_TYPE_MULTIPLE = 2;
	public static final int QUESTION_TYPE_JUDGE = 3;

	/** 考试类型：1：自测；2：综测 */
	public static final int EXAM_TYPE_SELF_TEST = 1;
	public static final int EXAM_TYPE_SYNTHETIC_TEST = 2;

	public static final int DEFAULT_EXAM_PAPER_NUM = 10;

	/** 考试结果标识：1：正确；2：失败；3： */
	public static final int EXAM_RESULT_FLAG_PASS = 1;
	public static final int EXAM_RESULT_FLAG_FAIL = 2;
	public static final int EXAM_RESULT_FLAG_NONE = 3;

	/** 收藏类型：1：课程；2：干货 */
	public static final int FAVORITE_TYPE_COURSE = 1;
	public static final int FAVORITE_TYPE_WIKI = 2;

	/** 专家动态类型：0:全部（动态）；1：文章；2：问答 */
	public static final int MOMENTS_TYPE_ALL = 0;
	public static final int MOMENTS_TYPE_ARTICLE = 1;
	public static final int MOMENTS_TYPE_QA = 2;

	/** 默认分段数 */
	public static final int DEFAULT_FRAGMENT_NUM = 1;
	/** 默认分段长度 */
	public static final int DEFAULT_FRAGMENT_SIZE = 50;

	/** 图像标识：1：百科/专家文章；2：视频封面；3：专家头像/横幅；4：学员头像；5：用户头像；6：提问 */
	public static final int IMAGE_TYPE_ARTICLE = 1;
	public static final int IMAGE_TYPE_VIDEO = 2;
	public static final int IMAGE_TYPE_EXPERT = 3;
	public static final int IMAGE_TYPE_TRAINEE = 4;
	public static final int IMAGE_TYPE_USER = 5;
	public static final int IMAGE_TYPE_COMMENT = 6;

	/** ImageMagick 开关 */
	public static final boolean IMAGE_MAGICK_ON = !StringUtils.isEmpty(SystemProperties.getProperties("GRAPHICS_MAGICK_PATH"));

	/** ImageMagick 图像模块 */
	public static final String IMAGE_MODULE_ARTICLE = "article";
	public static final String IMAGE_MODULE_VIDEO = "video";
	public static final String IMAGE_MODULE_EXPERT = "expert";
	public static final String IMAGE_MODULE_EXPERT_BANNER = "expert_banner";
	public static final String IMAGE_MODULE_USER = "user";
}
