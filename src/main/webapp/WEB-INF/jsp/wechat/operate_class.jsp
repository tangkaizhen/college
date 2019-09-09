<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="common.jsp"%>
<title>${userType}课程-汉和学院</title>
<style type="text/css">
body{
    background: #f2f2f2;
}
.operate_class_header_ul{
    overflow: hidden;
    width: 100%;
    border-bottom: .1rem solid #eee;
    background: #fff;
}
.operate_class_header_li{
    width: 50%;
    float: left;
    text-align: center;
    height: 7rem;
    font-size: 2.5rem;
    line-height: 7rem;
}
.operate_class_header_li.index{
	background:#148cd7;
	color: #fff;
    font-size: 3rem;
    font-weight: bold;
}
.operate_class_ul{

}
.operate_class_li{
    background: #fff;
    margin-top: 1rem;
}
.operate_class_li_img{
	margin: 3rem 3rem 3rem 7rem;
	height: 15rem;
}
.operate_class_right_box{
    display: inline-block;
    float: right;
    width: 51%;
    margin-top:6.2rem;
}
.operate_class_header{
    font-size: 3rem;
    margin-bottom: 1.5rem;
}
.operate_class_txt{
    font-size: 2.4rem;
    margin-bottom: 5rem;
}
.operate_class_pass{
    font-size: 2.3rem;
    color: rgb(92,92,92);
}
.permit{
	font-size: 2rem;
	color: #5c5c5c;
	background: url(${ctx}/images/icon_lock.png) no-repeat left center;
	padding: .5rem 0 .5rem 3.5rem;
}
</style>
<script type="text/javascript">
$(function(){
	$(".operate_class_header_li").click(function(){
		$(this).addClass("index").siblings().removeClass("index");
		
		if($(this).attr("id")==1){
			$(".uavType1").show();
			$(".uavType2").hide();
		}else{
			$(".uavType2").show();
			$(".uavType1").hide();
		}
	});
})
function to_course_small(id, permitted){
    if(permitted=='true') {
        $(".course_id").val(id);
        $("#home").attr("action","${ctx}/wechat/courseCategory").submit();
	}
}
</script>
</head>
<body>
<form action="${ctx}/wechat/" method="get" id="home">
	<input type="hidden" name="id" class="course_id">
</form>
<ul class="operate_class_header_ul">
	<c:forEach items="${uavTypes}" var="uavType" varStatus="index">
		<c:choose>
			<c:when test="${index.index==0}">
				<li class="operate_class_header_li index" id="${uavType.id}">
					${uavType.name}
				</li>
			</c:when>
			<c:otherwise>
				<li class="operate_class_header_li" id="${uavType.id}">
					${uavType.name}
				</li>
			</c:otherwise>
		</c:choose>
		
	</c:forEach>
</ul>
<c:forEach items="${uavTypes}" var="uavType" varStatus="index">

	    <c:choose>
			<c:when test="${index.index==0}">
				<ul class="operate_class_ul uavType1" course_name="${uavType.name}">
			</c:when>
			<c:otherwise>
				<ul class="operate_class_ul uavType2" style="display:none" course_name="${uavType.name}">
			</c:otherwise>
		</c:choose>	
	
		<c:forEach items="${map[uavType.id]}" var="courseCategory">
			<li class="operate_class_li" onclick="to_course_small('${courseCategory.id}','${courseCategory.permitted}')">
				<img alt="" src="${ctx}/images/icon_operator_base.png" class="operate_class_li_img">
				<div class="operate_class_right_box">
					<h1 class="operate_class_header">${courseCategory.name }</h1>
					<c:choose>
						<c:when test="${!courseCategory.permitted}">
							<p class="operate_class_pass permit">完成操作员综合考试后可解锁</p>
						</c:when>
						<c:when test="${courseCategory.passExam}">
							<p class="operate_class_pass">已通过考试</p>
						</c:when>
						<c:otherwise>
							<p class="operate_class_pass">未通过考试</p>
						</c:otherwise>
					</c:choose>
				</div>
			</li>
		</c:forEach>
	</ul>
</c:forEach>
</body>
</html>