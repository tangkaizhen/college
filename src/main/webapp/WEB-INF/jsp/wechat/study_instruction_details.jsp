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
    padding: 0 3rem;
}
.study_instruction_details_header{
    font-size: 3.6rem;
    text-align: center;
    margin: 4rem;
}
.study_instruction_details_content{
    line-height: 2;
}
</style>
</head>
<body>
	<h1 class="study_instruction_details_header">${guideline.title}</h1>
	<div class="study_instruction_details_content">${guideline.content}</div>
</body>
</html>