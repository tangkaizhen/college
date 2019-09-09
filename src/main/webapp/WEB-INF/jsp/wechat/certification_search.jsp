<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="common.jsp"%>
<title>资格证查询-汉和学院</title>
<style type="text/css">
.key_word_search_box{
    background: #fff;
    margin-bottom: 2rem;
    position: fixed;
    width: 100%;
    top: 0;
    z-index: 10;
}
.key_word_search_top_box{
	border: .1rem solid #ccc;
    margin: 1.6rem 2% 1rem 4%;
    height: 6rem;
    width: 77%;
    display: inline-block;
}
.key_word_search_value{
	background: url(${ctx}/images/icon_search.png) no-repeat 5% center;
	    border: none;
    font-size: 2.4rem;
    padding-left: 7rem;
    height: 100%;
    width: 84%;

}
.icon_search_delete{
    float: right;
    margin: 1.5rem 1.3rem 0 0;
}

.key_word_search_btn{
    border: .1rem solid #ccc;
    font-size: 2.5rem;
    display: inline-block;
    margin-top: 1.6rem;
    height: 6rem;
    line-height: 6rem;
    width:12%;
    text-align: center;
}

.certification_search_box{
	background:url(${ctx}/images/certificate.png) no-repeat;
	background-size:100% 100%;
	margin-top: 13rem;
    width: 90%;
    margin-left: 5%;
    margin-bottom: 4rem;
    text-align: center;
}
.certification_search_header{
    font-size: 3.6rem;
    padding-top: 6rem;
    font-weight: bold;
    margin-bottom: 4rem;
}
.certification_search_img{
    width: 13rem;
}
.certification_search_date{
        margin: 2rem 0;
    font-size: 2.8rem;
    text-align: left;
    padding-left: 17%;
    font-weight: bold;
}
.certification_search_date_value{
    font-weight: 200;
    margin-left: 1rem;
}
.certification_search_name{
	font-size: 2.8rem;
    text-align: left;
    font-weight: bold;
    text-align: center;
}
.certification_search_company{
    font-size: 2.8rem;
    text-align: left;
    padding-left: 17%;
    font-weight: bold;
}
.certification_search_company_value,.certification_search_name_value{
    font-weight: 200;
    margin-left: 1rem;
}
.certification_search_details{
    text-align: left;
    padding-left: 16%;
    font-size: 1.6rem;
    color: #5c5c5c;
    line-height: 3rem;
    height: 34rem;
    padding-top:11rem;
    background: url(${ctx}/images/certificate_stamp.png) no-repeat 95% top;
}
.certification_search_details_sign{
    font-size: 2.5rem;
    font-weight: bold;
    color: #000;
    margin-bottom: 2rem;
}
.certification_search_name {
    margin-top: 2rem;
}
.certification_search_details_li{

}
</style>
</head>
<body>
<form action="${ctx}/wechat/" id="home_search" method="get">
	<input type="hidden" name="query" class="certification_id">
</form>
<div class="key_word_search_box">
	<div class="key_word_search_top_box">
		<input type="text" placeholder="请输入需要查询的资格证" class="key_word_search_value" value="${query}">
		<img alt="" src="${ctx}/images/icon_search_delete.png" class="icon_search_delete">
	</div>
	<span class="key_word_search_btn">搜索</span>
</div>
<c:forEach items="${trainees}" var="trainee">
	<div class="certification_search_box">
		<h1 class="certification_search_header">合格证书</h1>
		
		
		<c:choose>
			<c:when test="${empty trainee.pic}">
				<img alt="" src="${ctx}/images/pic_head_default.png" class="certification_search_img">
			</c:when>
			<c:otherwise>
				<img alt="" src="${ctx}/${trainee.pic}" class="certification_search_img">
			</c:otherwise>
		</c:choose>
		
		<p class="certification_search_name">${trainee.name}</p>
		<p class="certification_search_date">证件有效期:<span class="certification_search_date_value"><fmt:formatDate pattern="yyyy-MM-dd" value='${trainee.validityStartDate}'/>~<fmt:formatDate pattern="yyyy-MM-dd" value='${trainee.validityEndDate}'/></span></p>
		<p class="certification_search_company">发证企业:<span class="certification_search_company_value">无锡汉和学院</span></p>

		<div class="certification_search_details">

			<p class="certification_search_details_sign">总经理签字：</p>
			<ul class="certification_search_details_ul">
				<li class="certification_search_details_li">地址：无锡市新吴区震泽路18号国家软件园狮子座A2楼</li>
				<li class="certification_search_details_li">邮编：214135</li>
				<li class="certification_search_details_li">电话：0510-66613660</li>
				<li class="certification_search_details_li">FAX：0510-66613627</li>
			</ul>
		</div>
	</div>
</c:forEach>
<script type="text/javascript">
$(function(){
	$(".icon_search_delete").click(function(){
		$(".key_word_search_value").val("");
	});
	
	$(".key_word_search_btn").click(function(){
		
		if(!$.trim($(".key_word_search_value").val())){
			reminder_box("请输入要查询的资格证号");
			return;
		}
		
		/* 是否是合格的资格证号 */
		if(!isIDCard1.test($.trim($(".key_word_search_value").val()))){
			reminder_box("资格证号格式错误");
			return;
		}
		
		$("#home_search .certification_id").val($.trim($(".key_word_search_value").val()));
		$("#home_search").attr("action","${ctx}/wechat/search").submit();
	});
})
var isIDCard1=/^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$|^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X|x)$/;
</script>

</body>
</html>