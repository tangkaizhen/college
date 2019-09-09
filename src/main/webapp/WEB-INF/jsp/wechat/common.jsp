<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<script type="text/javascript">
    var ctx = "${ctx}";
    var api_ctx = "${api_ctx}";
    var res_ctx = "${res_ctx}";
</script>
<script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<link href="${ctx}/css/common.css" type="text/css" rel="stylesheet">
<script type="text/javascript">
function pushHistory() {
    var state = {
        title: "汉和学院",
        url: "#"
    };
    window.history.pushState(state, state.title, state.url);
}

$(function(){
    
})
function isVisitor(){
	var isVisitor=false;
	if('${user.id}'){
	}else{
		
		$(".confirm_box").show();
		$(".bg").show();
		
		$(".confirm_header").text("您还没有注册，是否前去注册");
		$(".confirm_li.confirm").on("click",function(){
			location.href="${ctx}/wechat/register";
		});
		$(".confirm_li.cancel,.confirm_box_close").on("click",function(){
			$(".confirm_box").hide();
			$(".bg").hide();
		});
		
		isVisitor=true;
	}
	
	return isVisitor;
}

</script>
  
<div class="reminder_box" style="display:none"></div>
<div class="bg" style="display:none"></div>

<div class="confirm_box" style="display:none">
	<span class="confirm_box_close">X</span>
	<h1 class="confirm_header">您确认删除该身份吗？</h1>
	<ul class="confirm_ul">
		<li class="confirm_li confirm">确认</li>
		<li class="confirm_li cancel">取消</li>
	</ul>
</div>