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
    background: #eee;
}
.test_ul{
    background: #eee;
    overflow: hidden;
}
.test_li{
    margin-bottom: 1rem;
    height: 25rem;
    background: #fff;
}
.test_li:nth-child(1){
	background: url(${ctx}/images/pic_jinxing.jpg) no-repeat center;
	background-size:100% 100%;
}
.test_li:nth-child(2){
	background: url(${ctx}/images/pic_jinxing.jpg) no-repeat center;
	background-size:100% 100%;
}
.test_li:nth-child(3){
	background: url(${ctx}/images/pic_jinxingadd.png) no-repeat center;
	background-size:100% 100%;
}
.test_li:nth-child(4){
	background: url(${ctx}/images/pic_jinxingadd.png) no-repeat center;
	background-size:100% 100%;
}

.test_li_nameBox{
    display: inline-block;
    font-size: 3.2rem;
    color:#000;
    float: right;
    margin-top:9rem;
    width: 35%;
}
.test_li_nameBox_name{

}
.test_li_nameBox_txt{

}
.mercury .test_li_nameBox {
    color: rgb(2,85,209);
}
</style>
<script type="text/javascript">
$(function(){
	
})
function test_li(userTypeId,uavTypeId){
	$(".userTypeId").val(userTypeId);
	$(".uavTypeId").val(uavTypeId);
	$("#test_home").attr("action","${ctx}/wechat/exams").submit();
}
</script>
</head>
<body>
<form action="${ctx}/wechat/" id="test_home" method="get">
	<input type="hidden" name="userTypeId" class="userTypeId">
	<input type="hidden" name="uavTypeId" class="uavTypeId">
</form>
<ul class="test_ul">
	<c:forEach items="${examCategories}" var="examCategory" varStatus="index">
		<li class="test_li" onclick="test_li('${examCategory.userTypeId}','${examCategory.uavTypeId}')">
			<%-- <c:choose>
				<c:when test="${examCategory.uavTypeName=='金星一号'}">
					<img alt="" src="${ctx}/images/mercury.png" class="test_li_img">
				</c:when>
				<c:otherwise>
					<img alt="" src="${ctx}/images/venus.png" class="test_li_img">
				</c:otherwise>
			</c:choose> --%>
			<div class="test_li_nameBox">
				<h1 class="test_li_nameBox_name">${examCategory.uavTypeName}</h1>
				<p class="test_li_nameBox_txt">${examCategory.userTypeName}</p>
			</div>
		</li>
	</c:forEach>	
</ul>
</body>
</html>