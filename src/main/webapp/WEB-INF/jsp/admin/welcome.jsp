<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome page</title>
<script type="text/javascript" src="/college/js/jquery-3.1.1.min.js"></script>
<script type="application/javascript">
	function a() {
	    $.post("/college/admin/administrator/list.json",{},function (result) {
			console.log(result);
           });
	}
</script>
</head>
<body>
	Dear <strong>${user}</strong>, Welcome to Home Page.
	<a href="<c:url value="/logout" />">Logout</a>
	<sec:authorize access="hasRole('ADMIN')">
		管理员权限
	</sec:authorize>
	<sec:authorize access="hasRole('EXPERT')">
		专家权限
	</sec:authorize>
	<input type="button" onclick="a()" value="点击">
</body>
</html>