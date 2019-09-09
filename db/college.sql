/*
Navicat MySQL Data Transfer

Source Server         : 118.31.34.150_3306
Source Server Version : 50716
Source Host           : 118.31.34.150:3306
Source Database       : college

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2018-09-21 13:58:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for college_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `college_admin_role`;
CREATE TABLE `college_admin_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '管理员角色权限关系ID',
  `admin_id` bigint(20) NOT NULL COMMENT '管理员ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色权限ID',
  `operator` varchar(255) NOT NULL DEFAULT '' COMMENT '最后一次更新者昵称',
  `operate_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `operate_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '最后一个更新者的ip地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of college_admin_role
-- ----------------------------
INSERT INTO `college_admin_role` VALUES ('1', '1', '1', '系统初始化', '2018-08-01 15:14:35', '');

-- ----------------------------
-- Table structure for college_administrator
-- ----------------------------
DROP TABLE IF EXISTS `college_administrator`;
CREATE TABLE `college_administrator` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `training_site_id` bigint(20) DEFAULT NULL COMMENT '培训网点ID（限网点管理员）',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '管理员账号',
  `nickname` varchar(64) NOT NULL DEFAULT '' COMMENT '管理员昵称',
  `password` varchar(64) NOT NULL DEFAULT '' COMMENT '管理员密码（加密）',
  `type` int(1) NOT NULL DEFAULT '1' COMMENT '管理员类型，1：系统管理员；2：专家；3：培训网点管理员',
  `head_img` varchar(255) DEFAULT '' COMMENT '头像',
  `banner_img` varchar(255) DEFAULT '' COMMENT '专家横幅图片',
  `head_icon` varchar(255) DEFAULT '' COMMENT '头像icon（专家问答）',
  `head_img_src` varchar(255) DEFAULT '' COMMENT '头像源地址',
  `banner_img_src` varchar(255) DEFAULT '' COMMENT '专家横幅图片源地址',
  `label` varchar(255) DEFAULT '' COMMENT '专家姓名标签',
  `resume` varchar(255) DEFAULT '' COMMENT '专家一句话简介',
  `details` varchar(10000) DEFAULT '' COMMENT '专家详细介绍',
  `flag` int(1) DEFAULT NULL COMMENT '供微信首页显示指定专家使用',
  `state` int(1) NOT NULL DEFAULT '0' COMMENT '状态，0：删除，1：正常',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '最近一次登录时间',
  `interact_time` datetime DEFAULT NULL COMMENT '最近一次互动时间',
  `interact_title` varchar(128) DEFAULT '' COMMENT '最近一次专家文章标题',
  `stick_time` datetime DEFAULT NULL COMMENT '置顶时间（供专家大咖使用）',
  `operator` varchar(255) NOT NULL DEFAULT '' COMMENT '最后一次更新者昵称',
  `operate_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `operate_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '最后一个更新者的ip地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of college_administrator
-- ----------------------------
INSERT INTO `college_administrator` VALUES ('1', null, 'admin', '超级管理员', 'e10adc3949ba59abbe56e057f20f883e', '1', '', '', '', '', '', '', '', '', null, '1', '2018-12-06 10:26:50', null, null, '', null, '系统初始化', '2018-12-06 10:26:50', '127.0.0.1');
-- ----------------------------
-- Table structure for college_article
-- ----------------------------
DROP TABLE IF EXISTS `college_article`;
CREATE TABLE `college_article` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '文章ID',
  `category_id` bigint(1) DEFAULT NULL COMMENT '文章类别ID',
  `article_category` varchar(64) DEFAULT '' COMMENT '文章类别名称',
  `expert_id` bigint(20) DEFAULT NULL COMMENT '专家ID（限专家文章）',
  `author` varchar(64) NOT NULL DEFAULT '' COMMENT '作者昵称',
  `title` varchar(128) NOT NULL DEFAULT '' COMMENT '文章标题',
  `content` mediumtext NOT NULL COMMENT '文章内容',
  `content_plain` mediumtext COMMENT '文章内容（纯文本）',
  `type` int(1) NOT NULL DEFAULT '0' COMMENT '文章类型；1：汉和百科；2：专家文章',
  `cover_img` varchar(255) NOT NULL DEFAULT '' COMMENT '封面图片URL',
  `cover_img_src` varchar(255) DEFAULT '' COMMENT '封面图片源地址',
  `read_size` int(11) NOT NULL DEFAULT '0' COMMENT '浏览量',
  `vote_size` int(11) NOT NULL DEFAULT '0' COMMENT '点赞量',
  `seq` int(2) NOT NULL DEFAULT '0' COMMENT '排列顺序，升序排列',
  `state` int(1) NOT NULL DEFAULT '0' COMMENT '状态，0：删除，1：正常',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `operator` varchar(255) NOT NULL DEFAULT '' COMMENT '最后一次更新者昵称',
  `operate_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `operate_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '最后一个更新者的ip地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of college_article
-- ----------------------------

-- ----------------------------
-- Table structure for college_article_category
-- ----------------------------
DROP TABLE IF EXISTS `college_article_category`;
CREATE TABLE `college_article_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '文章类别ID',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '百科类别名称',
  `state` int(1) NOT NULL DEFAULT '0' COMMENT '状态，0：删除，1：正常',
  `operator` varchar(255) NOT NULL DEFAULT '' COMMENT '最后一次更新者昵称',
  `operate_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `operate_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '最后一个更新者的ip地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of college_article_category
-- ----------------------------

-- ----------------------------
-- Table structure for college_comment
-- ----------------------------
DROP TABLE IF EXISTS `college_comment`;
CREATE TABLE `college_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '留言ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `article_id` bigint(20) DEFAULT NULL COMMENT '文章ID',
  `expert_id` bigint(20) DEFAULT NULL COMMENT '专家ID',
  `comment` varchar(1000) DEFAULT NULL COMMENT '留言内容',
  `image` varchar(255) DEFAULT NULL COMMENT '提问所上传图片',
  `reply_admin_id` bigint(20) DEFAULT NULL COMMENT '回复人ID（管理员ID）',
  `reply_content` varchar(2000) DEFAULT '' COMMENT '回复内容',
  `reply_time` datetime DEFAULT NULL COMMENT '回复时间',
  `reply_flag` tinyint(1) DEFAULT '0' COMMENT '回复状态，0：未回复，1：已回复',
  `user_name` varchar(64) DEFAULT '' COMMENT '留言/提问用户姓名',
  `reply_name` varchar(64) DEFAULT '' COMMENT '回复人昵称',
  `vote_size` int(11) DEFAULT '0' COMMENT '点赞个数',
  `state` int(1) DEFAULT '0' COMMENT '审核状态，0：删除；1：审核中；2：通过；3：拒绝',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '留言创建时间',
  `operator` varchar(255) NOT NULL DEFAULT '' COMMENT '最后一次更新者昵称',
  `operate_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `operate_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '最后一个更新者的ip地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of college_comment
-- ----------------------------

-- ----------------------------
-- Table structure for college_course
-- ----------------------------
DROP TABLE IF EXISTS `college_course`;
CREATE TABLE `college_course` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '课程ID',
  `admin_id` bigint(20) NOT NULL COMMENT '作者ID（管理员ID）',
  `course_category_id` bigint(20) NOT NULL COMMENT '课程类别ID',
  `course_category` varchar(64) NOT NULL DEFAULT '' COMMENT '课程类别名称',
  `title` varchar(128) NOT NULL DEFAULT '' COMMENT '课程名称',
  `content` mediumtext NOT NULL COMMENT '课程内容',
  `study_size` int(11) NOT NULL DEFAULT '0' COMMENT '学习次数',
  `state` int(1) NOT NULL DEFAULT '0' COMMENT '状态，0：删除，1：正常',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `operator` varchar(255) NOT NULL DEFAULT '' COMMENT '最后一次更新者昵称',
  `operate_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `operate_ip` varchar(20) NOT NULL DEFAULT '' COMMENT '最后一个更新者的ip地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of college_course
-- ----------------------------

-- ----------------------------
-- Table structure for college_course_category
-- ----------------------------
DROP TABLE IF EXISTS `college_course_category`;
CREATE TABLE `college_course_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '课程类别ID',
  `user_type_id` bigint(20) NOT NULL COMMENT '用户身份ID',
  `uav_type_id` bigint(20) NOT NULL COMMENT '机型ID',
  `user_type` varchar(64) NOT NULL DEFAULT '' COMMENT '身份名称',
  `uav_type` varchar(64) NOT NULL DEFAULT '' COMMENT '机型名称',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '课程类别名称',
  `state` int(1) NOT NULL DEFAULT '0' COMMENT '状态，0：删除，1：正常',
  `operator` varchar(255) NOT NULL DEFAULT '' COMMENT '最后一次更新者昵称',
  `operate_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `operate_ip` varchar(20) NOT NULL DEFAULT '' COMMENT '最后一个更新者的ip地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of college_course_category
-- ----------------------------

-- ----------------------------
-- Table structure for college_enrolment
-- ----------------------------
DROP TABLE IF EXISTS `college_enrolment`;
CREATE TABLE `college_enrolment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '报名ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `training_site_id` bigint(20) NOT NULL COMMENT '培训网点ID',
  `training_type_id` bigint(20) NOT NULL COMMENT '培训类型ID',
  `training_type` varchar(128) NOT NULL DEFAULT '' COMMENT '培训类型',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '姓名',
  `phone` varchar(13) NOT NULL DEFAULT '' COMMENT '手机号',
  `spare` varchar(255) DEFAULT '' COMMENT '备注',
  `state` int(1) NOT NULL COMMENT '状态，0：删除；1：正常',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '报名提交时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of college_enrolment
-- ----------------------------

-- ----------------------------
-- Table structure for college_exam
-- ----------------------------
DROP TABLE IF EXISTS `college_exam`;
CREATE TABLE `college_exam` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '考试类别ID',
  `admin_id` bigint(20) NOT NULL COMMENT '作者ID（管理员ID）',
  `user_type_id` bigint(20) NOT NULL COMMENT '用户身份ID',
  `uav_type_id` bigint(20) NOT NULL COMMENT '无人机类型ID',
  `course_category_id` bigint(20) DEFAULT NULL COMMENT '课程类别ID',
  `user_type` varchar(64) NOT NULL DEFAULT '' COMMENT '身份名称',
  `uav_type` varchar(64) NOT NULL DEFAULT '' COMMENT '无人机类型',
  `course_category` varchar(64) DEFAULT NULL COMMENT '课程类别名称',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '试卷名称',
  `type` int(1) NOT NULL DEFAULT '0' COMMENT '考试类型，1：自测；2：综测',
  `per_mark` int(2) DEFAULT '0' COMMENT '每题分值',
  `total_count` int(3) DEFAULT NULL,
  `total_mark` int(4) DEFAULT '0' COMMENT '考试总分',
  `pass_mark` int(4) DEFAULT '0' COMMENT '合格分数',
  `single_count` int(3) DEFAULT '0' COMMENT '单选题个数',
  `single_mark` int(4) DEFAULT '0' COMMENT '单选题总分',
  `multi_count` int(3) DEFAULT '0' COMMENT '多选题个数',
  `multi_mark` int(4) DEFAULT '0' COMMENT '多选题总分',
  `judge_count` int(3) DEFAULT '0' COMMENT '判断题个数',
  `judge_mark` int(4) DEFAULT '0' COMMENT '判断题总分',
  `set_time` int(3) NOT NULL DEFAULT '0' COMMENT '考试时长，单位：分钟',
  `size` int(11) NOT NULL DEFAULT '0' COMMENT '试卷套数',
  `state` int(1) NOT NULL DEFAULT '0' COMMENT '状态，0：删除，1：正常',
  `operator` varchar(255) NOT NULL DEFAULT '' COMMENT '最后一次更新者昵称',
  `operate_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `operate_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '最后一个更新者的ip地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of college_exam
-- ----------------------------

-- ----------------------------
-- Table structure for college_exam_paper
-- ----------------------------
DROP TABLE IF EXISTS `college_exam_paper`;
CREATE TABLE `college_exam_paper` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '试卷考题关系ID',
  `exam_id` bigint(20) NOT NULL COMMENT '考试类别ID',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '考卷名称',
  `state` int(1) NOT NULL DEFAULT '0' COMMENT '状态，0：删除，1：正常',
  `operator` varchar(255) NOT NULL DEFAULT '' COMMENT '最后一次更新者昵称',
  `operate_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `operate_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '最后一个更新者的ip地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of college_exam_paper
-- ----------------------------

-- ----------------------------
-- Table structure for college_exam_paper_question
-- ----------------------------
DROP TABLE IF EXISTS `college_exam_paper_question`;
CREATE TABLE `college_exam_paper_question` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '试卷考题关系ID',
  `exam_paper_id` bigint(20) NOT NULL COMMENT '考试ID',
  `question_id` bigint(20) NOT NULL COMMENT '考题ID',
  `question_number` int(3) DEFAULT NULL COMMENT '题号',
  `question_mark` int(3) DEFAULT NULL COMMENT '考题分值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of college_exam_paper_question
-- ----------------------------

-- ----------------------------
-- Table structure for college_exam_question
-- ----------------------------
DROP TABLE IF EXISTS `college_exam_question`;
CREATE TABLE `college_exam_question` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '试题ID',
  `user_type_id` bigint(20) NOT NULL COMMENT '用户身份ID',
  `uav_type_id` bigint(20) NOT NULL COMMENT '无人机类型ID',
  `course_category_id` bigint(20) NOT NULL COMMENT '课程类别ID',
  `user_type` varchar(64) NOT NULL DEFAULT '' COMMENT '身份名称',
  `uav_type` varchar(64) NOT NULL DEFAULT '' COMMENT '无人机类型',
  `course_category` varchar(64) DEFAULT NULL COMMENT '课程类别名称',
  `type` int(1) NOT NULL DEFAULT '0' COMMENT '题型，1：单选；2：多选；3：判断',
  `question` varchar(500) NOT NULL DEFAULT '' COMMENT '题目',
  `option1` varchar(255) NOT NULL DEFAULT '' COMMENT '选项A',
  `option2` varchar(255) NOT NULL DEFAULT '' COMMENT '选项B',
  `option3` varchar(255) DEFAULT '' COMMENT '选项C',
  `option4` varchar(255) DEFAULT '' COMMENT '选项D',
  `answer` varchar(20) NOT NULL DEFAULT '' COMMENT '正确答案',
  `state` int(1) NOT NULL DEFAULT '0' COMMENT '状态，0：删除，1：正常',
  `operator` varchar(255) NOT NULL DEFAULT '' COMMENT '最后一次更新者名称',
  `operate_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `operate_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '最后一个更新者的ip地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of college_exam_question
-- ----------------------------

-- ----------------------------
-- Table structure for college_exam_record
-- ----------------------------
DROP TABLE IF EXISTS `college_exam_record`;
CREATE TABLE `college_exam_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '每题记录ID',
  `exam_result_id` bigint(20) NOT NULL COMMENT '考试结果ID',
  `question_id` bigint(20) NOT NULL COMMENT '试题ID',
  `answer` varchar(64) DEFAULT '' COMMENT '答题选项',
  `flag` int(1) DEFAULT '0' COMMENT '答题结果，1：正确；2：错误；3：未做',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of college_exam_record
-- ----------------------------

-- ----------------------------
-- Table structure for college_exam_result
-- ----------------------------
DROP TABLE IF EXISTS `college_exam_result`;
CREATE TABLE `college_exam_result` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '考试结果主键ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `user_type_id` bigint(20) NOT NULL COMMENT '试卷所对应的用户身份ID',
  `uav_type_id` bigint(20) NOT NULL COMMENT '试卷所对应的无人机类型ID',
  `exam_id` bigint(20) NOT NULL COMMENT '考试类别ID',
  `exam_paper_id` bigint(20) NOT NULL COMMENT '试卷ID',
  `course_category_id` bigint(20) DEFAULT NULL COMMENT '课程类别ID',
  `type` int(1) DEFAULT '0' COMMENT '考试类型，1：自测；2：综测',
  `cost_time` int(20) DEFAULT '0' COMMENT '考试所用时间，单位：毫秒',
  `total_num` int(3) DEFAULT '0' COMMENT '总题数',
  `pass_num` int(3) DEFAULT '0' COMMENT '答对题数',
  `fail_num` int(3) DEFAULT '0' COMMENT '答错题数',
  `none_num` int(3) DEFAULT '0' COMMENT '未答题数',
  `score` int(3) DEFAULT '0' COMMENT '考试得分',
  `unpass_questions` varchar(500) DEFAULT '' COMMENT '错误题目题号',
  `success` tinyint(1) DEFAULT '0' COMMENT '是否考试通过，0：未通过；1：通过',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '试卷提交时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of college_exam_result
-- ----------------------------

-- ----------------------------
-- Table structure for college_favorite
-- ----------------------------
DROP TABLE IF EXISTS `college_favorite`;
CREATE TABLE `college_favorite` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '收藏ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `course_id` bigint(20) DEFAULT NULL COMMENT '课程ID',
  `article_id` bigint(20) DEFAULT NULL COMMENT '文章ID',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '收藏时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of college_favorite
-- ----------------------------

-- ----------------------------
-- Table structure for college_guideline
-- ----------------------------
DROP TABLE IF EXISTS `college_guideline`;
CREATE TABLE `college_guideline` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '学习指引ID',
  `title` varchar(128) DEFAULT '' COMMENT '学习指引标题',
  `content` mediumtext COMMENT '学习指引内容',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `operator` varchar(255) NOT NULL DEFAULT '' COMMENT '最后一次更新者昵称',
  `operate_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `operate_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '最后一个更新者的ip地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of college_guideline
-- ----------------------------

-- ----------------------------
-- Table structure for college_role
-- ----------------------------
DROP TABLE IF EXISTS `college_role`;
CREATE TABLE `college_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '角色模块名',
  `role` varchar(64) NOT NULL DEFAULT '' COMMENT '角色标识',
  `visible` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可见，0：不可见，1：可见',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of college_role
-- ----------------------------
INSERT INTO `college_role` VALUES ('1', '管理员权限', 'ROLE_ADMIN', '0');
INSERT INTO `college_role` VALUES ('2', '知识库管理', 'ROLE_KNOWLEDGE', '1');
INSERT INTO `college_role` VALUES ('3', '课程管理', 'ROLE_COURSE', '1');
INSERT INTO `college_role` VALUES ('4', '考试管理', 'ROLE_EXAM', '1');
INSERT INTO `college_role` VALUES ('5', '培训管理', 'ROLE_TRAINING', '1');
INSERT INTO `college_role` VALUES ('6', '问答管理', 'ROLE_QA', '1');
INSERT INTO `college_role` VALUES ('7', '人员管理', 'ROLE_USER', '1');
INSERT INTO `college_role` VALUES ('8', '配置管理', 'ROLE_CONFIG', '1');
INSERT INTO `college_role` VALUES ('9', '专家管理', 'ROLE_EXPERT', '0');
INSERT INTO `college_role` VALUES ('10', '培训网点', 'ROLE_TRAINING_SITE', '0');

-- ----------------------------
-- Table structure for college_sms_log
-- ----------------------------
DROP TABLE IF EXISTS `college_sms_log`;
CREATE TABLE `college_sms_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '短信ID',
  `phone` varchar(20) DEFAULT '' COMMENT '手机号',
  `code` varchar(6) DEFAULT '' COMMENT '验证码',
  `type` int(1) DEFAULT '0' COMMENT '验证码类型',
  `ip` varchar(255) DEFAULT '' COMMENT '访问IP',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of college_sms_log
-- ----------------------------

-- ----------------------------
-- Table structure for college_trainee
-- ----------------------------
DROP TABLE IF EXISTS `college_trainee`;
CREATE TABLE `college_trainee` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '学员ID',
  `training_site_id` bigint(20) DEFAULT NULL COMMENT '培训网点ID',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '学员姓名',
  `name_py` varchar(64) NOT NULL DEFAULT '' COMMENT '学员姓名拼音',
  `gender` varchar(16) NOT NULL DEFAULT '' COMMENT '性别',
  `birth_date` date NOT NULL COMMENT '出生日期',
  `pic` varchar(255) NOT NULL DEFAULT '' COMMENT '照片',
  `phone` varchar(13) NOT NULL DEFAULT '' COMMENT '手机号',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '户籍省份',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '户籍城市',
  `district` varchar(32) DEFAULT '' COMMENT '户籍地区',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '户籍详细地址',
  `addressee_name` varchar(32) NOT NULL DEFAULT '' COMMENT '收件人姓名',
  `addressee_phone` varchar(13) NOT NULL DEFAULT '' COMMENT '收件人手机号',
  `addressee_province` varchar(32) NOT NULL DEFAULT '' COMMENT '收集人省份',
  `addressee_city` varchar(32) NOT NULL DEFAULT '' COMMENT '收件人城市',
  `addressee_district` varchar(32) DEFAULT '' COMMENT '收件人地区',
  `addressee_address` varchar(255) NOT NULL DEFAULT '' COMMENT '收件人详细地址',
  `profile` varchar(64) NOT NULL DEFAULT '' COMMENT '身份属性',
  `certicate_No` varchar(32) NOT NULL DEFAULT '' COMMENT '合格证编号',
  `issue_unit` varchar(64) NOT NULL DEFAULT '' COMMENT '签发单位',
  `issue_date` date NOT NULL COMMENT '签发日期',
  `validity_start_date` date NOT NULL COMMENT '有效期开始日期',
  `validity_end_date` date NOT NULL COMMENT '有效期结束日期',
  `issue_condition` varchar(255) NOT NULL DEFAULT '' COMMENT '签发条件',
  `rating` varchar(64) NOT NULL COMMENT '等级',
  `remarks` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `state` int(1) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `operator` varchar(255) NOT NULL DEFAULT '' COMMENT '最后一次更新者昵称',
  `operate_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `operate_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '最后一个更新者的ip地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of college_trainee
-- ----------------------------

-- ----------------------------
-- Table structure for college_training_course
-- ----------------------------
DROP TABLE IF EXISTS `college_training_course`;
CREATE TABLE `college_training_course` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '培训课程ID',
  `admin_id` bigint(20) NOT NULL COMMENT '创建者ID（管理员ID）',
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT '培训标题',
  `training_content` mediumtext NOT NULL COMMENT '培训内容',
  `training_fee` varchar(1000) DEFAULT '' COMMENT '培训费用',
  `state` int(1) NOT NULL DEFAULT '0' COMMENT '状态，0：删除，1：正常',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `operator` varchar(255) NOT NULL DEFAULT '' COMMENT '最后一次更新者昵称',
  `operate_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `operate_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '最后一个更新者的ip地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of college_training_course
-- ----------------------------

-- ----------------------------
-- Table structure for college_training_site
-- ----------------------------
DROP TABLE IF EXISTS `college_training_site`;
CREATE TABLE `college_training_site` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '培训网点ID',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '培训点名称',
  `admin_account` varchar(255) NOT NULL DEFAULT '' COMMENT '网点管理员账号',
  `class_name` varchar(255) NOT NULL DEFAULT '' COMMENT '开班名称',
  `province` varchar(32) NOT NULL DEFAULT '' COMMENT '省',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '市',
  `district` varchar(32) DEFAULT '' COMMENT '区',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '详细地址',
  `training_type` varchar(255) NOT NULL DEFAULT '' COMMENT '培训类型',
  `training_start_date` date NOT NULL COMMENT '培训开始日期',
  `training_end_date` date NOT NULL COMMENT '培训结束日期',
  `contact_name_1` varchar(32) NOT NULL DEFAULT '' COMMENT '联系人1姓名',
  `contact_phone_1` varchar(32) NOT NULL DEFAULT '' COMMENT '联系人1电话',
  `contact_name_2` varchar(32) DEFAULT '' COMMENT '联系人2姓名',
  `contact_phone_2` varchar(32) DEFAULT '' COMMENT '联系人2电话',
  `contact_name_3` varchar(32) DEFAULT '' COMMENT '联系人3姓名',
  `contact_phone_3` varchar(32) DEFAULT '' COMMENT '联系人3电话',
  `advantage` mediumtext COMMENT '培训优势',
  `training_description` varchar(10000) DEFAULT '' COMMENT '培训说明',
  `fee_description` varchar(1000) DEFAULT '' COMMENT '费用说明',
  `state` int(1) NOT NULL DEFAULT '0' COMMENT '状态，0：删除，1：正常',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `operator` varchar(255) NOT NULL DEFAULT '' COMMENT '最后一次更新者昵称',
  `operate_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `operate_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '最后一个更新者的ip地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of college_training_site
-- ----------------------------

-- ----------------------------
-- Table structure for college_training_site_type
-- ----------------------------
DROP TABLE IF EXISTS `college_training_site_type`;
CREATE TABLE `college_training_site_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '培训网点培训类型关系ID',
  `training_site_id` bigint(20) NOT NULL COMMENT '培训网点ID',
  `training_type_id` bigint(20) NOT NULL COMMENT '培训类型ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of college_training_site_type
-- ----------------------------

-- ----------------------------
-- Table structure for college_training_type
-- ----------------------------
DROP TABLE IF EXISTS `college_training_type`;
CREATE TABLE `college_training_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '培训类型ID',
  `user_type_id` bigint(20) NOT NULL COMMENT '用户身份ID',
  `uav_type_id` bigint(20) NOT NULL COMMENT '机型ID',
  `user_type` varchar(64) NOT NULL DEFAULT '' COMMENT '身份名称',
  `uav_type` varchar(64) NOT NULL DEFAULT '' COMMENT '机型名称',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '培训类型名称',
  `state` int(1) NOT NULL DEFAULT '0' COMMENT '状态，0：删除，1：正常',
  `operator` varchar(255) NOT NULL DEFAULT '' COMMENT '最后一次更新者昵称',
  `operate_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `operate_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '最后一个更新者的ip地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of college_training_type
-- ----------------------------

-- ----------------------------
-- Table structure for college_uav_type
-- ----------------------------
DROP TABLE IF EXISTS `college_uav_type`;
CREATE TABLE `college_uav_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '无人机类型ID',
  `name` varchar(64) NOT NULL COMMENT '无人机类型名称',
  `state` int(1) NOT NULL DEFAULT '0' COMMENT '状态，0：删除，1：正常',
  `operator` varchar(255) NOT NULL DEFAULT '' COMMENT '最后一次更新者昵称',
  `operate_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `operate_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '最后一个更新者的ip地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of college_uav_type
-- ----------------------------
INSERT INTO `college_uav_type` VALUES ('1', '金星一号', '1', '超级管理员', '2018-09-21 14:17:39', '221.6.105.122');
INSERT INTO `college_uav_type` VALUES ('2', '水星一号', '1', '超级管理员', '2018-09-21 14:17:54', '221.6.105.122');

-- ----------------------------
-- Table structure for college_user
-- ----------------------------
DROP TABLE IF EXISTS `college_user`;
CREATE TABLE `college_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `phone` varchar(13) NOT NULL DEFAULT '' COMMENT '手机号',
  `password` varchar(64) NOT NULL DEFAULT '' COMMENT '密码（加密）',
  `openid` varchar(64) NOT NULL DEFAULT '' COMMENT '微信标识',
  `name` varchar(64) DEFAULT '' COMMENT '姓名',
  `head_img` varchar(255) DEFAULT '' COMMENT '头像',
  `head_img_src` varchar(255) DEFAULT '' COMMENT '头像源文件',
  `invite_code` varchar(64) DEFAULT '' COMMENT '邀请码',
  `state` int(1) NOT NULL DEFAULT '1' COMMENT '状态，1：可用，0：冻结',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of college_user
-- ----------------------------

-- ----------------------------
-- Table structure for college_user_type
-- ----------------------------
DROP TABLE IF EXISTS `college_user_type`;
CREATE TABLE `college_user_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '身份ID',
  `name` varchar(64) NOT NULL COMMENT '用户身份名称',
  `flag` int(1) DEFAULT '0' COMMENT '供微信首页显示“操作员、教员”筛选用',
  `state` int(1) NOT NULL DEFAULT '0' COMMENT '状态，0：删除，1：正常',
  `operator` varchar(255) NOT NULL DEFAULT '' COMMENT '最后一次更新者昵称',
  `operate_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `operate_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '最后一个更新者的ip地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of college_user_type
-- ----------------------------
INSERT INTO `college_user_type` VALUES ('1', '操作员', '1', '1', '超级管理员', '2018-09-04 12:50:48', '192.168.1.64');
INSERT INTO `college_user_type` VALUES ('2', '教员', '2', '1', '超级管理员', '2018-09-04 12:50:54', '192.168.1.64');

-- ----------------------------
-- Table structure for college_video
-- ----------------------------
DROP TABLE IF EXISTS `college_video`;
CREATE TABLE `college_video` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '视频ID',
  `admin_id` bigint(20) NOT NULL COMMENT '作者ID（管理员ID）',
  `uav_type_id` bigint(20) NOT NULL COMMENT '无人机类型ID',
  `uav_type` varchar(64) NOT NULL DEFAULT '' COMMENT '机型名称',
  `name` varchar(128) NOT NULL COMMENT '视频名称',
  `video_url` varchar(2048) NOT NULL DEFAULT '' COMMENT '视频URL地址',
  `image` varchar(255) DEFAULT '' COMMENT '缩略图',
  `image_src` varchar(255) DEFAULT '' COMMENT '缩略图源地址',
  `introduction` mediumtext COMMENT '视频简介',
  `read_size` int(10) NOT NULL DEFAULT '0' COMMENT '浏览量',
  `seq` bigint(4) NOT NULL DEFAULT '0' COMMENT '排列顺序，升序排列',
  `state` int(1) NOT NULL DEFAULT '0' COMMENT '状态，0：删除，1：正常',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `operator` varchar(255) NOT NULL DEFAULT '' COMMENT '最后一次更新者昵称',
  `operate_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `operate_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '最后一个更新者的ip地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of college_video
-- ----------------------------

-- ----------------------------
-- Table structure for college_vote
-- ----------------------------
DROP TABLE IF EXISTS `college_vote`;
CREATE TABLE `college_vote` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '点赞ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `article_id` bigint(20) DEFAULT NULL COMMENT '文章ID',
  `comment_id` bigint(20) DEFAULT NULL COMMENT '评论ID',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '点赞创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of college_vote
-- ----------------------------

-- ----------------------------
-- Procedure structure for pro_downvote_article
-- ----------------------------
DROP PROCEDURE IF EXISTS `pro_downvote_article`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `pro_downvote_article`(IN v_user_id BIGINT, IN v_article_id BIGINT, OUT r_result INT)
BEGIN
    DECLARE delete_count INT DEFAULT 0;
    START TRANSACTION;
    DELETE FROM college_vote 
	WHERE user_id = v_user_id AND article_id = v_article_id;
    SELECT row_count()
    INTO delete_count;
    IF (delete_count = 0)
    THEN
      ROLLBACK;
      SET r_result = -1;
    ELSEIF (delete_count < 0)
      THEN
        ROLLBACK;
        SET r_result = -2;
    ELSE
      UPDATE college_article
      SET vote_size = vote_size - 1
      WHERE id = v_article_id
            AND state = 1
			AND vote_size > 0;
      SELECT row_count()
      INTO delete_count;
      IF (delete_count = 0)
      THEN
        ROLLBACK;
        SET r_result = 0;
      ELSEIF (delete_count < 0)
        THEN
          ROLLBACK;
          SET r_result = -2;
      ELSE
        COMMIT;
        SET r_result = 1;
      END IF;
    END IF;
  END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for pro_upvote_article
-- ----------------------------
DROP PROCEDURE IF EXISTS `pro_upvote_article`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `pro_upvote_article`(IN v_user_id BIGINT, IN v_article_id BIGINT,
   IN v_create_time  TIMESTAMP, OUT r_result INT)
BEGIN
    DECLARE insert_count INT DEFAULT 0;
    START TRANSACTION;
    INSERT IGNORE INTO college_vote
    (user_id, article_id, create_time)
    VALUES (v_user_id, v_article_id, v_create_time);
    SELECT row_count()
    INTO insert_count;
    IF (insert_count = 0)
    THEN
      ROLLBACK;
      SET r_result = -1;
    ELSEIF (insert_count < 0)
      THEN
        ROLLBACK;
        SET r_result = -2;
    ELSE
      UPDATE college_article
      SET vote_size = vote_size + 1
      WHERE id = v_article_id
            AND state = 1;
      SELECT row_count()
      INTO insert_count;
      IF (insert_count = 0)
      THEN
        ROLLBACK;
        SET r_result = 0;
      ELSEIF (insert_count < 0)
        THEN
          ROLLBACK;
          SET r_result = -2;
      ELSE
        COMMIT;
        SET r_result = 1;

      END IF;
    END IF;
  END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for pro_upvote_comment
-- ----------------------------
DROP PROCEDURE IF EXISTS `pro_upvote_comment`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `pro_upvote_comment`(IN v_user_id BIGINT, IN v_comment_id BIGINT,
   IN v_create_time  TIMESTAMP, OUT r_result INT)
BEGIN
    DECLARE insert_count INT DEFAULT 0;
    START TRANSACTION;
    INSERT IGNORE INTO college_vote
    (user_id, comment_id, create_time)
    VALUES (v_user_id, v_comment_id, v_create_time);
    SELECT row_count()
    INTO insert_count;
    IF (insert_count = 0)
    THEN
      ROLLBACK;
      SET r_result = -1;
    ELSEIF (insert_count < 0)
      THEN
        ROLLBACK;
        SET r_result = -2;
    ELSE
      UPDATE college_comment
      SET vote_size = vote_size + 1
      WHERE id = v_comment_id
            AND state = 2;
      SELECT row_count()
      INTO insert_count;
      IF (insert_count = 0)
      THEN
        ROLLBACK;
        SET r_result = 0;
      ELSEIF (insert_count < 0)
        THEN
          ROLLBACK;
          SET r_result = -2;
      ELSE
        COMMIT;
        SET r_result = 1;

      END IF;
    END IF;
  END
;;
DELIMITER ;
