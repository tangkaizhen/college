<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="common.jsp"%>
<title>汉和学院</title>
<style type="text/css">
.video_box{
    width: 100%;
    height: 100%; 
    position:relative;
    background: #fff;
    z-index: 3;
}
.video_control{
	width: 100%;
	height: 360px;
}
.video_desc{
    padding:0 3rem 3rem;
    margin-top: 10px;
    line-height: 2;
}
.video_name{
	font-size: 2.4rem;
    padding-left: 3rem;
    margin: 2rem 0;
}
.video_date{
    font-size: 2.4rem;
    padding-left: 3rem;
    margin: 2rem 0 1rem;
    color: #ccc;
}
</style>
<script type="text/javascript">
function video_list_li(url,image,desc){
	$(".video_control").attr("poster","${ctx}/${video.image}");
	if($(".video_control").attr("src").indexOf(url)>-1){
		
	}else{
		$(".video_control").attr("src","${ctx}/${video.videoUrl}");
	}
	
	$(".video_box").show();
}
$(function(){
	video_list_li();
	
})

</script>
</head>
<body>

<div class="video_box" style="display:none">
	<video src="" class="video_control" controls="controls">
		该播放器不支持该视频类型
	</video>
	<h1 class="video_name">${video.name}</h1>
	<p class="video_date"><fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${video.createTime}" /></p>
	<div class="video_desc">${video.introduction}</div>
</div>

</body>
</html>