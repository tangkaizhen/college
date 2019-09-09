<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="common.jsp"%>
<title>汉和学院</title>
<style type="text/css">
.my_collect_header_ul{
    overflow: hidden;
    width: 100%;
    border-bottom: .1rem solid #eee;
    background: #f2f2f2;
    padding-bottom: 1rem;
}
.my_collect_header_li{
    width: 50%;
    float: left;
    background: #fff;
    text-align: center;
    height: 6rem;
    font-size: 2.5rem;
    line-height: 6rem;
}
.my_collect_header_li.index{
	background:#148cd7;
	color: #fff;
    font-size: 3rem;
}
.my_collect_content_ul{

}
.my_collect_content_li{
    height: 18rem;
    border-bottom: .1rem solid #ccc;
}
.my_collect_content_li_img{
    width: 20rem;
    height: 12rem;
    margin: 3rem 2rem;
    float: left;
    border-radius: 1rem;
}
.my_collect_right_box{
	display: inline-block;
    width: 51%;
    margin-top: 4.5rem;
}
.my_collect_right_header{
    text-overflow: ellipsis;
    white-space: nowrap;
    overflow-y: hidden;
    font-size: 2.8rem;
    margin-bottom: 4rem;
}
.my_collect_right_date{
    font-size: 2.1rem;
    color: #ccc;
}
.my_collect_right_read{
	font-size: 2.1rem;
    color: #ccc;
    float: right;
}
.my_collect_content_fore{
	background:#148cd7;
    width: 1.6rem;
    height: 1.6rem;
    display: inline-block;
    margin-right: 2rem;
    margin-left: 5rem;
    margin-top: 5rem;
}
.my_collect_content_header{
	font-size: 2.6rem;
}
.my_collect_content_write{
    font-size: 2rem;
    color: #ccc;
    margin-left: 9rem;
    margin-top: 4rem;
}
</style>
<script type="text/javascript">
$(function(){
	$(".my_collect_header_li").click(function(){
		$(this).addClass("index").siblings().removeClass("index");
		if($.trim($(this).text())=="课程"){
			$(".course").show();
			$(".pic_empty_img_box1").show();
			$(".article").hide();
			$(".pic_empty_img_box2").hide();
			
		}else if($.trim($(this).text())=="干货"){
			$(".pic_empty_img_box1").hide();
			$(".course").hide();
			$(".pic_empty_img_box2").show();
			$(".article").show();
			
		}
	});
})

function my_collect_content_li(type,id){
	if(type==1){
		/* 表示是课程 */
		$(".collect_id").val(id);
		$("#collect_home").attr("action","${ctx}/wechat/courseDetails").submit();
	}else{
		$(".collect_id").val(id);
		$("#collect_home").attr("action","${ctx}/wechat/wikiDetails").submit();
	}
}
</script>
</head>
<body>
<form action="${ctx}/wechat/" id="collect_home" method="get">
	<input type="hidden" name="id" class="collect_id">
	<input type="hidden" name="fromName" class="my_collect" value="collect">
</form>
<ul class="my_collect_header_ul">
	<li class="my_collect_header_li index">
		课程
	</li>
	<li class="my_collect_header_li">
		干货
	</li>
</ul>
<c:choose>
	<c:when test="${empty favorites['courseList']}">
		<div class="pic_empty_img_box pic_empty_img_box1">
			<img alt="" src="${ctx}/images/pic_empty.jpg" class="pic_empty_img">
		</div>
	</c:when>
	<c:otherwise>
		<ul class="my_collect_content_ul course">
			<c:forEach items="${favorites['courseList']}" var="course">
				<li class="my_collect_content_li" onclick="my_collect_content_li(1,'${course.id}')">
					<span class="my_collect_content_fore"></span><span class="my_collect_content_header">${course.title}</span>
					<p class="my_collect_content_write">${course.studySize}人学习</p>
				</li>
			</c:forEach>
		</ul>
	</c:otherwise>
</c:choose>
<c:choose>
	<c:when test="${empty favorites['articleList']}">
		<div class="pic_empty_img_box pic_empty_img_box2" style="display:none">
			<img alt="" src="${ctx}/images/pic_empty.jpg" class="pic_empty_img">
		</div>
	</c:when>
	<c:otherwise>
		<ul class="my_collect_content_ul article" style="display:none">
			<c:forEach items="${favorites['articleList']}" var="article">
				<li class="my_collect_content_li" onclick="my_collect_content_li(2,'${article.id}')">
					<img alt="" src="${ctx}/${article.coverImg}" class="my_collect_content_li_img">
					<%-- <img alt="" src="${ctx}/images/banner_1.png" class="my_collect_content_li_img"> --%>
					<div class="my_collect_right_box">
						<h1 class="my_collect_right_header">${article.title}</h1>
						<span class="my_collect_right_date"><fmt:formatDate pattern="yyyy-MM-dd" value='${article.createTime}'/></span>
						<span class="my_collect_right_read">${article.readSize}次阅读</span>
					</div>
				</li>
			</c:forEach>
		</ul>
	</c:otherwise>
</c:choose>

</body>
</html>