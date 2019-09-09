<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="common.jsp"%>
<title>汉和学院</title>
<style type="text/css">
.apply_success_top{
    text-align: center;
    font-size: 3rem;
    color:#148cd7;
    padding: 5rem 0;
}
.apply_success_img{
    margin-right: 2rem;
    margin-bottom: -1.2rem;
}
.apply_success_txt{

}
.apply_success_info_ul{
    padding: 0 1rem;
}
.apply_success_info_li{
    border-bottom: .1rem solid #ccc;
    font-size: 2.8rem;
    padding: 2rem 0 2rem 3rem;
}
.apply_success_info_li.position{
	height: auto;
    line-height: normal;
    padding: 2rem 0 2rem 3rem;
} 
.apply_success_info_li.position .apply_success_info_name{
	float:left;
	margin-right: 2rem;
}
.apply_success_info_li.position .apply_success_info_value{
    width: 64%;
    display: inline-block;
}
.apply_success_info_name{
}
.apply_success_info_value{
font-size: 2.4rem;
}
.icon_tel{
    float: right;
    margin-right: 3rem;
}
.apply_train_explain_box{
    padding-left: 4rem;
    line-height: 5rem;
    margin: 5rem 0;
}
.apply_train_explain_header{
    border-left: .5rem solid#148cd7;
    font-size: 3rem;
    padding-left: 2rem;
        height: 2rem;
    line-height: 2rem;
    margin-bottom: 1rem;
}
.apply_train_explain_txt{
	font-size: 2.4rem;
    padding-left: 2.2rem;
    padding-right: 1rem;
}
.apply_train_money_box{
    padding-left: 4rem;
    line-height: 5rem;
}
.apply_train_money_header{
	border-left: .5rem solid#148cd7;
    font-size: 3rem;
        height: 2rem;
    line-height: 2rem;
    margin-bottom: 1rem;
    padding-left: 2rem;
}
.apply_train_money_txt{
	font-size: 2.4rem;
    padding-left: 2.2rem;
    padding-right: 1rem;
}
</style>
<script type="text/javascript">
$(function(){
	/* 这是拨打联系电话 */
	$(".icon_tel").click(function(){
		
		$(".info_box_header").text("联系培训网点");
		$(".info_box_txt").text("拨打培训网点电话？").css("marginBottom","2rem");
		$(".info_box_txt_tel").text($(this).siblings(".apply_success_info_value").attr("tel")).show();
		$(".info_box_cancel").text("取消");
		$(".info_box_confirm").html('<a href="tel:'+$(this).siblings(".apply_success_info_value").attr("tel")+'" class="da_btn">确定</a>');
		$(".bg").show(); 
		$(".info_box").show(); 
		
		$(".info_box_cancel").on("click",function(){
			$(".bg").hide(); 
			$(".info_box").hide(); 
		});
		
		
	});
})
</script>
</head>
<body>
<div class="apply_success_top">
	<img alt="" src="${ctx}/images/icon_signup_success.jpg" class="apply_success_img">
	<span class="apply_success_txt">报名成功</span>
</div>
<ul class="apply_success_info_ul">
	<li class="apply_success_info_li">
		<span class="apply_success_info_name">开班名称</span>
		<span class="apply_success_info_value">${trainingSite.name}</span>
	</li>
	<li class="apply_success_info_li">
		<span class="apply_success_info_name">培训类型</span>
		<span class="apply_success_info_value">${trainingSite.trainingType}</span>
	</li>
	<li class="apply_success_info_li">
		<span class="apply_success_info_name">培训时间</span>
		<span class="apply_success_info_value"><fmt:formatDate pattern="yyyy-MM-dd" type="date" dateStyle="medium" timeStyle="medium" value="${trainingSite.trainingStartDate}" />~<fmt:formatDate pattern="yyyy-MM-dd" type="date" dateStyle="medium" timeStyle="medium" value="${trainingSite.trainingEndDate}" /></span>
	</li>
	<li class="apply_success_info_li position">
		<span class="apply_success_info_name">培训地点</span>
		<span class="apply_success_info_value">${trainingSite.province}/${trainingSite.city}/${trainingSite.address}</span>
	</li>
	<%-- <li class="apply_success_info_li">
		<span class="apply_success_info_name">联系方式</span>
		<span class="apply_success_info_value" tel="${trainingSite.contactPhone1}">${trainingSite.contactName1}&nbsp;(&nbsp;${trainingSite.contactPhone1}&nbsp;)</span>
		<img alt="" src="${ctx}/images/icon_tel.jpg" class="icon_tel">
	</li>
	
	<c:if test="${not empty trainingSite.contactName2}">
		<li class="apply_success_info_li">
			<span class="apply_success_info_name">联系方式</span>
			<span class="apply_success_info_value" tel="${trainingSite.contactPhone2}">${trainingSite.contactName2}&nbsp;(&nbsp;${trainingSite.contactPhone2}&nbsp;)</span>
			<img alt="" src="${ctx}/images/icon_tel.jpg" class="icon_tel">
		</li>
	</c:if>
	<c:if test="${not empty trainingSite.contactName3}">
		<li class="apply_success_info_li">
			<span class="apply_success_info_name">联系方式</span>
			<span class="apply_success_info_value" tel="${trainingSite.contactPhone3}">${trainingSite.contactName3}&nbsp;(&nbsp;${trainingSite.contactPhone3}&nbsp;)</span>
			<img alt="" src="${ctx}/images/icon_tel.jpg" class="icon_tel">
		</li>
	</c:if> --%>
			
			
</ul>

<div class="apply_train_explain_box">
	<h1 class="apply_train_explain_header">培训说明</h1>
	<p class="apply_train_explain_txt">${trainingSite.trainingDescription}</p>
</div>
<div class="apply_train_money_box">
	<h1 class="apply_train_money_header">优势说明</h1>
	<p class="apply_train_money_txt">${trainingSite.advantage}</p>
</div>

<div class="info_box" style="display:none">
	<h1 class="info_box_header"></h1>
	<p class="info_box_txt"></p>
	<p class="info_box_txt info_box_txt_tel" style="display:none"></p>
	<ul class="info_box_ul">
		<li class="info_box_confirm">
			确定
		</li>
		<li class="info_box_cancel">
			取消
		</li>
	</ul>
</div>

</body>
</html>