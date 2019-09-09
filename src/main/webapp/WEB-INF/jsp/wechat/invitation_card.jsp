<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="common.jsp"%>
<title>汉和学院</title>
<style type="text/css">
body{
}
.user_box{
	width:100%;
}
.erweima_img{
    width:100%;
}
</style>
<script type="text/javascript">
$(function(){
	
})
</script>
</head>
<body>
<form action="${ctx}/wechat/" id="leave_message_home" method="get">
	<input type="hidden" name="id" value="${id}" class="article_id">
</form>
<div class="user_box">
	<img alt="" src="${ctx}/images/my_invite.jpg" class="erweima_img">
	<%-- <c:choose>
		<c:when test="${empty user.headImg}">
			<img alt="" src="${ctx}/images/my_head_small.png" class="user_img">
		</c:when>
		<c:otherwise>
			<img alt="" src="${ctx}/${user.headImg}" class="user_img">
		</c:otherwise>
	</c:choose>
	<br>
	<p class="erweima_txt">长按二维码进入学院</p> --%>
</div>
</body>
</html>