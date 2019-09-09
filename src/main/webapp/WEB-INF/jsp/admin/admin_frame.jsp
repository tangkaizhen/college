<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>汉和学院后台管理系统</title>
<%@ include file="common.jsp"%>
<link href="${ctx}/css/background.css" rel="stylesheet" type="text/css">
<style type="text/css">
.back_box{

}                           
.back_top_box{
    height: 80px;
    border-bottom: 1px solid #ccc;
}
.back_logo{
    margin-left: 40px;
    margin-top: 20px;
    margin-bottom: -4px;
}
.back_top_login{
    display: inline-block;
    float: right;
    margin-right: 112px;
    margin-top: 23px;
    cursor: pointer;
}
.icon_user{
    margin-right: 8px;
    margin-bottom: -7px;
}
.back_top_name{
    font-size: 20px;
    color: #5c5c5c;
}
.back_left_box{
    display: inline-block;
    background: #267cb7;
    width: 14%;
    height:2000px;
    font-size: 20px;
    color: #fff;
    float: left;
}
.rightBox{
    width: 86%;
    height: 100%;
    float: left;
}
.back_nav_li{
    margin-top: 28px;
}
.theCon{
	width: 100%;
    height: 100%;
}
.back_article_header{
	background: url(${ctx}/images/plus.png) no-repeat 82% center;
	margin-left: 18%;
	cursor: pointer;
}
.back_article_header.index{
	background: url(${ctx}/images/minus.png) no-repeat 82% center;
}
.back_right_box{
    width: 100%;
    height: 100%;
}
.back_article_txt{

}
.back_article_ul{
	display:none
}
.back_article_li{
    margin-top: 6px;
    padding-left: 41%;
    background: url(${ctx}/images/icon_file_detail.png) no-repeat 31% center;
    padding: 8px 8px 8px 41%;
    border-radius: 8px;
    cursor: pointer;
    
}
.back_article_li.index{
	background: url(${ctx}/images/icon_file_detail.png) no-repeat 31% center,#16a0d3
}
.back_article_li:hover{
	background: url(${ctx}/images/icon_file_detail.png) no-repeat 31% center,#16a0d3
}
.back_article_li_span.index{
	
}
.confirm_box{
    position: fixed;
    z-index: 5;
    background: #fff;
    top: 30%;
    width: 30%;
    left: 35%;
    text-align: center;
    border-radius: 7px;
}
.confirm_header{
    padding: 35px 0 67px;
}
.confirm_ul{
    overflow: hidden;
    margin-bottom: 33px;
    width: 70%;
    margin-left: 15%;
}
.confirm_li.confirm{
    float: left;
    width: 49.5%;
    cursor: pointer;
    color: #fff;
    background: #139FD2;
    font-size: 16px;
    padding: 10px;
    border-radius: 4px;
}
.confirm_li.cancel{
    float: left;
    width: 49.5%;
    cursor: pointer;
    font-size: 16px;
    padding: 10px;
    border-radius: 4px;
}
.confirm_box_close{
    position: absolute;
    right: 20px;
    top: 10px;
    cursor: pointer;
}
.logout_btn{
	font-size: 16px;
    color: #ff0000;
    border-left: 2px solid #ccc;
    padding-left: 7px;
    cursor: pointer;
}

.pass_confirm_box{
    position: fixed;
    z-index: 5;
    background: #fff;
    top: 30%;
    width: 24%;
    left: 38%;
    text-align: center;
    border-radius: 7px;
}
.pass_confirm_box_close{
    position: absolute;
    right: 20px;
    top: 10px;
    cursor: pointer;
    font-size: 17px;
}
.pass_confirm_header{
   padding: 35px 0 35px;
}
.new_pass1{
        font-size: 16px;
    border: 1px solid #ccc;
    padding: 3px 0 3px 10px;
    border-radius: 5px;
    height: 31px;
    width: 37%;
    
}
.new_pass2{
	height: 31px;
    margin: 16px 0 27px;
    font-size: 16px;
    border: 1px solid #ccc;
    padding: 3px 0 3px 10px;
    border-radius: 5px;
    width: 37%;
}
.pass_confirm_ul{
    overflow: hidden;
    margin-bottom: 33px;
    width: 70%;
    margin-left: 15%;
}
.pass_confirm_li.confirm{
    float: left;
    width: 32%;
    cursor: pointer;
    color: #fff;
    background: #139FD2;
    font-size: 16px;
    padding: 4px;
    border-radius: 4px;
    margin-left: 18%;
}
.pass_confirm_li.cancel{
    float: left;
    width: 32%;
    cursor: pointer;
    font-size: 16px;
    padding: 4px;
    border-radius: 4px;
}
</style>
<script type="text/javascript">

$(function(){
	
	var top_header=$.trim($(".back_right_box").find("h1").eq(0).text());
	if(top_header){
		$(".back_article_li_span:contains("+top_header+")").parents(".back_nav_li").find(".back_article_header").addClass("index");
		$(".back_article_li_span:contains("+top_header+")").parents(".back_article_li").addClass("index");
		
		$(".back_article_li_span:contains("+top_header+")").parents(".back_article_ul").slideDown();
	}
	$(".back_box").height($(window).height()-$(".back_top_box").height()-2);
	$(".back_left_box").height($(window).height()-$(".back_top_box").height()); 
	$(".back_left_box").height($(document).height()-$(".back_top_box").height()); 
	
	$(".back_article_header").click(function(){
		$(this).toggleClass("index").parent(".back_article_box").find(".back_article_ul").toggle();
		$(this).parents(".back_nav_li").siblings().find(".back_article_header").removeClass("index");
		$(this).parents(".back_nav_li").siblings().find(".back_article_ul").hide();
	});
	/* 退出功能 */
	
	
	$(".back_article_li").click(function(){
		
		var back_article_li_value=$.trim($(this).text());
		if(back_article_li_value=="汉和干货"){
			location.href="${ctx}/admin/knowledge/baike.page";
		}else if(back_article_li_value=="视频管理"){
			location.href="${ctx}/admin/knowledge/video_manage.page";
		} else if(back_article_li_value=="专家文章"){
			location.href="${ctx}/admin/knowledge/expert/expert_article.page";
		}else if(back_article_li_value=="学习指引"){
			location.href="${ctx}/admin/knowledge/study_instruction.page";
		}else if(back_article_li_value=="课程管理"){
			location.href="${ctx}/admin/course/course_manage.page";
		}else if(back_article_li_value=="试卷管理"){
			location.href="${ctx}/admin/exam/paper_manage.page";
		}else if(back_article_li_value=="试题管理"){
			location.href="${ctx}/admin/exam/wrod_manage.page";
		}else if(back_article_li_value=="实操培训"){
			location.href="${ctx}/admin/training/field_training.page";
		}else if(back_article_li_value=="培训网点"){
			location.href="${ctx}/admin/training/training_net.page";
		}else if(back_article_li_value=="专家问答"){
			location.href="${ctx}/admin/qa/expert/expert_ask.page";
		}else if(back_article_li_value=="留言管理"){
			location.href="${ctx}/admin/qa/leave_manage.page";
		}else if(back_article_li_value=="管理员"){
			location.href="${ctx}/admin/user/manager_manage.page";
		}else if(back_article_li_value=="专家管理"){
			location.href="${ctx}/admin/user/expert_manage.page";
		}else if(back_article_li_value=="用户"){
			location.href="${ctx}/admin/user/user_manage.page";
		}else if(back_article_li_value=="报名人员"){
			location.href="${ctx}/admin/user/site/apply_manage.page";
		}else if(back_article_li_value=="学员"){
			location.href="${ctx}/admin/user/site/student_manage.page";
		}else if(back_article_li_value=="身份配置"){
			location.href="${ctx}/admin/config/identity_configuration.page";
		}else if(back_article_li_value=="机型配置"){
			location.href="${ctx}/admin/config/arg_configuration.page";
		}else if(back_article_li_value=="培训类型配置"){
			location.href="${ctx}/admin/config/train_configuration.page";
		}else if(back_article_li_value=="课程类别配置"){
			location.href="${ctx}/admin/config/courses_configuration.page";
		}else if(back_article_li_value=="干货类别配置"){
			location.href="${ctx}/admin/config/baike_configuration.page";
		}
		
	});
	
	$(".back_top_login").click(function(){
		location.href="${ctx}/admin/person_center.page";
	});
	
	
	$(".pass_confirm_li.cancel,.pass_confirm_box_close").click(function(){
		$(".bg").hide();
		$(".pass_confirm_box").hide();
	});
})
</script>
</head>
<body>
<div class="back_box">
	<!-- 顶部 -->
	<div class="back_top_box">
		<img src="${ctx}/images/logo.png" class="back_logo">
		<div class="back_top_login">
			<img src="${ctx}/images/icon_user.png" class="icon_user">
			<span class="back_top_name">${user.name}</span>
			<a class="logout_btn" href="${ctx}/admin/logout">退出</a>
		</div>
	</div>
	<!-- 左边导航栏 -->
	<div class="back_left_box">
		<ul class="back_nav_ul">
			<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_KNOWLEDGE','ROLE_EXPERT')">
				<li class="back_nav_li">
					<div class="back_article_box">
						<div class="back_article_header">
							<img src="${ctx}/images/icon_file.png" class="back_article_logo">
							<span class="back_article_txt">知识库管理</span>
						</div>
						<ul class="back_article_ul">
							<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_KNOWLEDGE')">
								<li class="back_article_li"><span class="back_article_li_span">汉和干货</span></li>
								<li class="back_article_li"><span class="back_article_li_span">视频管理</span></li>
								<li class="back_article_li"><span class="back_article_li_span">专家文章</span></li>
								<li class="back_article_li"><span class="back_article_li_span">学习指引</span></li>
							</sec:authorize>
							<sec:authorize access="hasRole('ROLE_EXPERT')">
								<li class="back_article_li"><span class="back_article_li_span">专家文章</span></li>
							</sec:authorize>

						</ul>
					</div>
				</li>
			</sec:authorize>
			<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_COURSE')">
				<li class="back_nav_li">
					<div class="back_article_box">
						<div class="back_article_header">
							<img src="${ctx}/images/icon_file.png" class="back_article_logo">
							<span class="back_article_txt">课程管理</span>
						</div>
						<ul class="back_article_ul">
							<li class="back_article_li"><span class="back_article_li_span">课程管理</span></li>
						</ul>
					</div>
				</li>
			</sec:authorize>
			<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_EXAM')">
				<li class="back_nav_li">
					<div class="back_article_box">
						<div class="back_article_header">
							<img src="${ctx}/images/icon_file.png" class="back_article_logo">
							<span class="back_article_txt">考试管理</span>
						</div>
						<ul class="back_article_ul">
							<li class="back_article_li"><span class="back_article_li_span">试卷管理</span></li>
							<li class="back_article_li"><span class="back_article_li_span">试题管理</span></li>
						</ul>
					</div>
				</li>
			</sec:authorize>
			<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_TRAINING')">
				<li class="back_nav_li">
					<div class="back_article_box">
						<div class="back_article_header">
							<img src="${ctx}/images/icon_file.png" class="back_article_logo">
							<span class="back_article_txt">培训管理</span>
						</div>
						<ul class="back_article_ul">
							<li class="back_article_li"><span class="back_article_li_span">实操培训</span></li>
							<li class="back_article_li"><span class="back_article_li_span">培训网点</span></li>
						</ul>
					</div>
				</li>
			</sec:authorize>
			<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_QA','ROLE_EXPERT')">
				<li class="back_nav_li">
					<div class="back_article_box">
						<div class="back_article_header">
							<img src="${ctx}/images/icon_file.png" class="back_article_logo">
							<span class="back_article_txt">问答管理</span>
						</div>
						<ul class="back_article_ul">
							<li class="back_article_li"><span class="back_article_li_span">专家问答</span></li>
							<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_QA')">
								<li class="back_article_li"><span class="back_article_li_span">留言管理</span></li>
							</sec:authorize>
						</ul>
					</div>
				</li>
			</sec:authorize>
			<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_USER','ROLE_TRAINING_SITE')">
				<li class="back_nav_li">
					<div class="back_article_box">
						<div class="back_article_header">
							<img src="${ctx}/images/icon_file.png" class="back_article_logo">
							<span class="back_article_txt">人员管理</span>
						</div>
						<ul class="back_article_ul">
							<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_USER')">
								<li class="back_article_li"><span class="back_article_li_span">管理员</span></li>
								<li class="back_article_li"><span class="back_article_li_span">专家管理</span></li>
								<li class="back_article_li"><span class="back_article_li_span">用户</span></li>
								<li class="back_article_li"><span class="back_article_li_span">报名人员</span></li>
								<li class="back_article_li"><span class="back_article_li_span">学员</span></li>
							</sec:authorize>
							<sec:authorize access="hasRole('ROLE_TRAINING_SITE')">
								<li class="back_article_li"><span class="back_article_li_span">报名人员</span></li>
								<li class="back_article_li"><span class="back_article_li_span">学员</span></li>
							</sec:authorize>
						</ul>
					</div>
				</li>
			</sec:authorize>
			<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_CONFIG')">
				<li class="back_nav_li">
					<div class="back_article_box">
						<div class="back_article_header">
							<img src="${ctx}/images/icon_file.png" class="back_article_logo">
							<span class="back_article_txt">配置管理</span>
						</div>
						<ul class="back_article_ul">
							<li class="back_article_li"><span class="back_article_li_span">身份配置</span></li>
							<li class="back_article_li"><span class="back_article_li_span">机型配置</span></li>
							<li class="back_article_li"><span class="back_article_li_span">培训类型配置</span></li>
							<li class="back_article_li"><span class="back_article_li_span">课程类别配置</span></li>
							<li class="back_article_li"><span class="back_article_li_span">干货类别配置</span></li>
						</ul>
					</div>
				</li>
			</sec:authorize>
		</ul>
	</div>
<script type="text/javascript">
	
</script>	
	<div class="rightBox">
        	<div class="theCon">
				<sitemesh:write property="body"/>
            </div>
        </div>
</div>
<div class="reminder_box" style="display:none"></div>
<div class="bg" style="display:none"></div>
<div class="confirm_box" style="display:none">
	<span class="confirm_box_close">X</span>
	<h1 class="confirm_header">您确认删除该身份吗？</h1>
	<ul class="confirm_ul">
		<li class="confirm_li confirm">确认</li>
		<li class="confirm_li cancel">取消</li>
	</ul>
</div>

<div class="pass_confirm_box" style="display:none">
	<span class="pass_confirm_box_close">X</span>
	<h1 class="pass_confirm_header">重置密码</h1>
	<input type="password" class="new_pass1" placeholder="请输入新密码(仅限数字)"><br>
	<input type="password" class="new_pass2" placeholder="请输入新密码(仅限数字)"><br>
	
	<ul class="pass_confirm_ul">
		<li class="pass_confirm_li confirm">确认</li>
		<li class="pass_confirm_li cancel">取消</li>
	</ul>
</div>
</body>
</html>