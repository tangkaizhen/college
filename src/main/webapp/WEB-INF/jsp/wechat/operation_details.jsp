<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="common.jsp"%>
<title>${course.title}-汉和学院</title>
<style type="text/css">
body{
}
.operation_basics_header{
	padding: 0 4.8rem;
    font-size: 3rem;
    margin-top: 3.2rem;
    font-weight: bold;
}
.operation_basics_top{
	padding: 0 3rem;
    font-size: 2.4rem;
    overflow: hidden;
}
.operation_basics_img{
    width: 4rem;
    height: 4rem;
    border-radius: 2rem;
    float: left;
    margin-top: .3rem;
}
.operation_basics_name{
    font-size: 2.4rem;
    float: left;
    margin: .8rem 2rem;
}
.operation_basics_date{
    color: #ccc;
    margin-top: .8rem;
    float: left;
}
.operation_basics_scan{
    color: #ccc;
    float: right;
    font-size:2.2rem;
    margin-top: 1.2rem;
}
.operation_basics_collect{
    position: fixed;
    bottom: 0;
    width: 100%;
    font-size: 2rem;
    text-align: center;
    border-top: .1rem solid #ccc;
    height: 7rem;
    z-index:10
}
.operation_basics_collect_btn{
	margin-top: 4rem;
}
.operation_basics_collect{
	background: url(${ctx}/images/icon_collect.png) no-repeat center 1rem,#fff;
}
.operation_basics_collect.index{
	background: url(${ctx}/images/icon_collect_r.png) no-repeat center 1rem,#fff;
}
.course_content{
	padding: 0rem 4rem 10rem;
	    line-height: 2;
}
.top_box{
    width: 100%;
    background: #fff;
    z-index: 10;
    padding-bottom: 2rem;
}
</style>
<script type="text/javascript">
$(function(){
	$(".operation_basics_collect").click(function(){
		if($.trim($(this).find(".operation_basics_collect_btn").text())=="收藏"){
			$.ajax({
				   type: "POST",
				   url: "${ctx}/wechat/api/starCourse.json",
				   dataType: "json",
				   data: {userId:'${user.id}',courseId:'${course.id}'},
				   success: function(msg){
					   if(msg.status==1){
						   
						   reminder_box('收藏成功');
						   $(".operation_basics_collect").toggleClass("index");
						   $(".operation_basics_collect").find(".operation_basics_collect_btn").text("已收藏");
					   }else{
						   reminder_box(msg.msg);
					   }
				   }
			})
		}else{
			$.ajax({
				   type: "POST",
				   url: "${ctx}/wechat/api/unStarCourse.json",
				   dataType: "json",
				   data: {userId:'${user.id}',courseId:'${course.id}'},
				   success: function(msg){
					   if(msg.status==1){
						   $(".operation_basics_collect").toggleClass("index");
						   $(".operation_basics_collect").find(".operation_basics_collect_btn").text("收藏");
						   reminder_box('取消收藏成功');
					   }else{
						   reminder_box(msg.msg);
					   }
				   }
			})
			
		}
		
	});
})
</script>
</head>
<body>
<div class="top_box">

	<h1 class="operation_basics_header">${course.title}</h1>
	<div class="operation_basics_top">
		<img alt="" src="${ctx}/images/head_hanhe.png" class="operation_basics_img">
		<span class="operation_basics_name">汉和学院</span>
		<span class="operation_basics_date"><fmt:formatDate type="date" dateStyle="medium" timeStyle="medium" value="${course.createTime}" /></span>
		<span class="operation_basics_scan">${course.studySize}浏览</span>
	
	</div>
	
</div>
<div class="course_content">
	${course.content}
</div>
<c:choose>
	<c:when test="${isStar}">
		<div class="operation_basics_collect index">
			<p class="operation_basics_collect_btn">已收藏</p>
		</div>
	</c:when>
	<c:otherwise>
		<div class="operation_basics_collect">
			<p class="operation_basics_collect_btn">收藏</p>
		</div>
	</c:otherwise>
</c:choose>

</body>
</html>