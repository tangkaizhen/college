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
	background:#fafafa
}
.my_top{
	background: url(${ctx}/images/icon_more.png) no-repeat 90% center,#fff;
	    padding: 4rem 5rem;
    overflow: hidden;
    margin-bottom: 2rem;
}
.my_top_img {
	width: 10rem;
	height: 10rem;
	border-radius: 5rem;
	float: left;
}
.my_top_name{
    font-size: 3.3rem;
    float: left;
    margin-top: 3.3rem;
    margin-left: 3rem;
}
.my_ul{
    background: #fff;
    padding: 0 1rem;

}
.my_li{
	background: url(${ctx}/images/icon_more.png) no-repeat 90% center;
	    border-bottom: .1rem solid #ccc;
    padding: 3rem 3rem 3rem 5rem;
}
.my_li_img{
	float: left;
    margin-right: 1rem;
    margin-top: -.5rem;
}
.my_li_name{
    font-size: 2.8rem;
    color: rgb(92,92,92);
}
</style>
<script type="text/javascript">
$(function(){
	$(".bottom_navigation_li").eq(3).addClass("index").siblings().removeClass("index");
	
	$(".bottom_navigation_li").eq(3).addClass("index");
	
    $(".my_top").click(function () {
        location.href="${ctx}/wechat/details";
    })
    $(".my_li").click(function() {
        var my_li_name = $.trim($(this).children(".my_li_name").text());
        if(my_li_name=="我的邀请卡"){
        	location.href="${ctx}/wechat/${user.id}/invite";
        } else if (my_li_name=="我的收藏"){
            location.href="${ctx}/wechat/collect";
		} else if (my_li_name=="我的问答"){
            location.href="${ctx}/wechat/questions";
		} else if (my_li_name=="学习指导"){
            location.href="${ctx}/wechat/guidelines";
		} else if (my_li_name=="报名记录") {
            location.href="${ctx}/wechat/enrolments";
		}
    });
});
</script>
</head>
<body>
<form action="${ctx}/wechat/" id="my_form" method="get">
</form>
<div class="my_top">
	<c:choose>
		<c:when test="${empty user.headImg}">
			<img alt="" src="${ctx}/images/my_head.png" class="my_top_img">
		</c:when>
		<c:otherwise>
			<img alt="" src="${ctx}/${user.headImg}" class="my_top_img">
		</c:otherwise>
	</c:choose>

	<span class="my_top_name">${user.name}</span>
</div>
<ul class="my_ul">
	<li class="my_li">
		<img alt="" src="${ctx}/images/icon_my_invite.png" class="my_li_img">
		<span class="my_li_name">我的邀请卡</span>
	</li>
	<li class="my_li">
		<img alt="" src="${ctx}/images/icon_my_collect.png" class="my_li_img">
		<span class="my_li_name">我的收藏</span>
	</li>
	<li class="my_li">
		<img alt="" src="${ctx}/images/icon_my_ask.png" class="my_li_img">
		<span class="my_li_name">我的问答</span>
	</li>
	<li class="my_li">
		<img alt="" src="${ctx}/images/icon_my_guide.png" class="my_li_img">
		<span class="my_li_name">学习指导</span>
	</li>
	<li class="my_li">
		<img alt="" src="${ctx}/images/icon_my_record.png" class="my_li_img">
		<span class="my_li_name">报名记录</span>
	</li>
</ul>
<%@ include file="bottom_nav.jsp" %> 
</body>
</html>