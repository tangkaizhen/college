<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="common.jsp"%>
<title>${courseCategory.uavType}${courseCategory.name}-汉和学院</title>
<style type="text/css">
body{
    background: #f2f2f2;
}
.operatoin_top{
    height: 30rem;
    background: #fff;
    
}
.operatoin_top.index{
    background: url(${ctx}/images/exam_pass.png) no-repeat 95% 74%,#fff;
}

.operatoin_top_img{
    height: 100%;
    width: 50%;
}
.operatoin_top_nameBox{
	display: inline-block;
    float: right;
    width: 45%;
    margin-top: 12rem;
}
.operatoin_top_name{
    font-size: 4.8rem;
    color: #e88f22;
    margin-bottom: 2rem;
}
.operatoin_top_name_pass{
    color: #ccc;
    font-size: 2.4rem;
}
.operatoin_top_name_pass.index{
	color: #2ba245;
}
.operatoin_course_ul{
	background: #fff;
    margin-top: 1rem;
    padding-left: 1rem;
}
.operatoin_course_li{
    border-bottom: .1rem solid #eee;
    padding: 3rem 0 3rem 1rem;
}
.operatoin_course_fore{
    display: inline-block;
    width: 1.6rem;
    height: 1.6rem;
    background: #148cd7;
    margin-right: 1.5rem;
}
.operatoin_course_header{
    font-size: 2.8rem;
    display: inline-block;
}
.operatoin_course_people{
    font-size: 2rem;
    color: #bbb;
    padding-left: 3.2rem;
    margin-top: 2rem;
}
</style>
<script type="text/javascript">
function operatoin_top(e,userTypeId,uavTypeId){
	$(".userType_id").val(userTypeId);
	$(".uavType_id").val(uavTypeId);
	$("#operation_basics").attr("action","${ctx}/wechat/exams").submit();
}

function operatoin_course_li(id){
	$(".course_id").val(id);
	$("#operation_basics").attr("action","${ctx}/wechat/courseDetails").submit();
}
</script>
</head>
<body>
<form action="${ctx}/wechat/" id="operation_basics" method="get">
	<input type="hidden" name="id" class="course_id">
	<input type="hidden" name="userTypeId" class="userType_id">
	<input type="hidden" name="uavTypeId" class="uavType_id">
</form>
<c:choose>
	<c:when test="courseCategory.passExam">
		<div class="operatoin_top index" onclick="operatoin_top(this,'${courseCategory.userTypeId}','${courseCategory.uavTypeId}')">
			<img alt="" src="${ctx}/images/operation_base_banner.png" class="operatoin_top_img">
			<div class="operatoin_top_nameBox">
				<h1 class="operatoin_top_name">自我测试</h1>
				<!-- <p class="operatoin_top_name_pass index">已通过测试</p> -->
			</div>
		</div>
	</c:when>
	
	<c:otherwise>
		<div class="operatoin_top" onclick="operatoin_top(this,'${courseCategory.userTypeId}','${courseCategory.uavTypeId}')">
			<img alt="" src="${ctx}/images/operation_base_banner.png" class="operatoin_top_img">
			<div class="operatoin_top_nameBox">
				<h1 class="operatoin_top_name">自我测试</h1>
				<!-- <p class="operatoin_top_name_pass">未通过测试</p> -->
			</div>
		</div>
	</c:otherwise>
</c:choose>

<ul class="operatoin_course_ul">
	<c:forEach items="${courseCategory.courseList}" var="course">
		<li class="operatoin_course_li" onclick="operatoin_course_li('${course.id}')">
			<div class="operatoin_course_header_box">
				<span class="operatoin_course_fore"></span>
				<h1 class="operatoin_course_header">${course.title}</h1>
			</div>
			<p class="operatoin_course_people">${course.studySize}人学习</p>
		</li>
	</c:forEach>	
</ul>
</body>
</html>