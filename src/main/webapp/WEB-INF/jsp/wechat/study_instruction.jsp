<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="common.jsp"%>
<title>汉和学院</title>
<style type="text/css">

.study_instruction_ul{
    padding: 0 2rem;
}
.study_instruction_li{
	background: url(${ctx}/images/icon_more.png) no-repeat 95% center;
	border-bottom: .1rem solid #ccc;
    height: 9rem;
    font-size: 2.7rem;
    line-height: 9rem;
    padding-left: 2rem;
}
</style>
<script type="text/javascript">
function details(id) {
    $("#guideline_id").val(id);
    $("#guideline_form").submit();
}
</script>
</head>
<body>
<form action="${ctx}/wechat/guideline" method="get" id="guideline_form">
	<input type="hidden" name="id" id="guideline_id">
</form>
<c:choose>
	<c:when test="${empty guidelines}">
		<div class="pic_empty_img_box pic_empty_img_box1">
			<img alt="" src="${ctx}/images/pic_empty.jpg" class="pic_empty_img">
		</div>
	</c:when>
	<c:otherwise>
		<ul class="study_instruction_ul">
			<c:forEach items="${guidelines}" var="guideline">
				<li class="study_instruction_li" onclick="details('${guideline.id}')">
					${guideline.title}
				</li>
			</c:forEach>
		</ul>
	</c:otherwise>
</c:choose>

</body>
</html>