<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:choose>
    <c:when test="${empty pageContext.request.contextPath}">
        <c:set var="ctx" value="admin"/>
    </c:when>
    <c:otherwise>
        <c:set var="ctx" value="${pageContext.request.contextPath}"/>
    </c:otherwise>
</c:choose>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>汉和学院后台管理系统</title>
<script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<link href="${ctx}/css/background.css" type="text/css" rel="stylesheet">
<style type="text/css">
body {
   background: url("${ctx}/images/login_background.png") no-repeat;
   position: relative;
}
.login_box{
	position: fixed;
    right: 7%;
    box-shadow: -3px 0px 0px rgba(192,192,192, .2), 3px 0px 0px rgba(192,192,192, .2);
    text-align: center;
    top: 30%;
    border: none;
}        
#login_form{

}        
.login_header{
    font-size: 30px;
    color: #4d4b4c;
    margin-bottom: 41px;
}        
.login_account_box{
    margin-bottom: 38px;
}        
.login_account_name{
    font-size: 24px;
    margin-right: 13px;
}        
.login_account_value{
    height: 50px;
    width: 370px;
    font-size: 20px;
    padding-left: 14px;
    border: .1rem solid #ccc;
}        
.login_pass_box{
    margin-bottom: 37px;
}        
.login_pass_name{
	font-size: 24px;
    margin-right: 13px;
}        
.login_pass_value{
    height: 50px;
    width: 370px;
    font-size: 20px;
    padding-left: 14px;
    border: .1rem solid #ccc;
}        
.login_submit{
    background: #54a547;
    color: #fff;
    font-size: 24px;
    border: none;
    width: 200px;
    height: 48px;
    border-radius: 24px;
    cursor: pointer;
    outline:none
}        
.login_inner_box{
	background: #eee;
    padding: 41px 28px;
    margin-bottom: 47px;
    position: relative;
}
.login_banner{
    top: 40%;
    position: fixed;
    width: 100%;
}
</style>
<script type="text/javascript">
$(function(){
	$(".login_submit").click(function(){
		if($.trim($(".login_account_value").val())==""){
			reminder_box("请输入账号");
            return;
        }
		if($.trim($(".login_account_value").val()).length<2){
			reminder_box("账号长度不小于两个字符");
            return;
		}
        if($.trim($(".login_pass_value").val())==""){
        	reminder_box("请输入密码");
            return;
        }
        if($.trim($(".login_pass_value").val()).length<6){
			reminder_box("密码最小6个字符");
            return;
		}
        $("#login_form").submit();
	});
	
	if("${error}"){
		reminder_box("${error}");
	}
})

</script>
</head>
<body>
<img alt="" src="${ctx}/images/login_jinxing.png" class="login_banner">
<div class="login_box">
	<form action="${ctx}/admin/login" method="post" id="login_form">
		<h1 class="login_header">欢迎登录</h1>
		<div class="login_inner_box">
			<div class="login_account_box">
				<span class="login_account_name">账号</span>
				<input type="text" placeholder="请输入账号" maxlength="50" id="username" name="username" class="login_account_value" required>
			</div>
			<div class="login_pass_box">
				<span class="login_pass_name">密码</span>
				<input type="password" placeholder="请输入密码" maxlength="12" id="password" name="password"  class="login_pass_value" required>
			</div>
			<input type="submit" class="login_submit" value="登录">
		</div>
	</form>
</div>
<div class="reminder_box" style="display:none"></div>
</body>
</html>