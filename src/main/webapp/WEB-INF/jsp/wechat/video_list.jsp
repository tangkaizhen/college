<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="common.jsp"%>
<title>汉和学院</title>
<style type="text/css">
.video_list_ul{
    padding: 2rem;
}
.video_list_li{
	margin-bottom: 2rem;
	overflow: hidden;
	position: relative;
	display: flex;
	padding-bottom: 2rem;
    border-bottom: 1px solid #ccc;
}
.video_list_img{
    width: 27rem;
    height: 15rem;
    border-radius: 1rem;
    margin-right: 2rem;
}
.video_list_right{
    width: 50%;
    font-size: 3rem;
}
.video_list_header{
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    margin-bottom: 4rem;
    margin-top: 1rem;
}
.video_list_date{
    font-size: 2.4rem;
    color: #5c5c5c;
        position: absolute;
    top: 11rem;
}
.video_box{
    width: 100%;
    height: 100%; 
    position: fixed;
    top: 0;
    background: #fff;
    z-index: 3;
}
.video_control{
	width: 100%;
	margin-top: 36%;
}
.video_desc{

}
</style>
<script type="text/javascript">
isHasVideo=true;
function video_list_li(id){
	$(".video_id").val(id);
	$("#video_list").attr("action","${ctx}/wechat/vedioDetails").submit();
}
$(function(){
	/* 这是滚动加载 */	
	/* 这是滚动加载，当页面滑到下面的时候，开始加载 */
	/* 当前页面列表显示的是第几页 */
	var p_num=2;
 	$(document).scroll(function(){
		//屏幕高度
		var w_height=$(window).height();
		//整个文档高度
		var d_height=$(document).height();
		//滚动高度
		var s_height=$(window).scrollTop();
		
		/* 当滚动到快接近底部时候，实施加载  */
		if(w_height+s_height+1>=d_height){
			onload_video(p_num);
			
			if(isHasVideo){
				p_num++;
			}
		}
		
	});
 	
 	
})
function onload_video(pageNum){
	var html='';
	$.ajax({
        type: "POST",
        url: "/college/wechat/api/getVideoList.json",
        dataType: "json",
        data: {pageNum:pageNum},
        success: function(msg){
            if(msg.status==1){
            	console.log(msg);
            	var video_list=msg.data;
            	if(video_list.length>0){
            		isHasVideo=true;
	            	for(var i=0;i<video_list.length;i++){
	            		html+='<li class="video_list_li" onclick="video_list_li('+video_list[i].id+')" url="'+video_list[i].videoUrl+'">';
	                	if(video_list[i].image==undefined){
	                		html+='<img alt="" src="${ctx}/images/banner_1.png" class="video_list_img">';
	                	}else{
	                		html+='<img alt="" src="${ctx}/'+video_list[i].image+'" class="video_list_img">';
	                	}
	                	html+='<div class="video_list_right">';
	                	html+='<p class="video_list_header">'+video_list[i].name+'</p>';
	                	html+='<span class="video_list_date">'+video_list[i].createTime+'</span>';
	                	html+='</div>';
	                	html+='</li>';
	                	
	            	}
	            	
	            	$(".video_list_ul").append(html);
            	}else{
            		isHasVideo=false;
            	}
            }else{
                reminder_box(msg.msg);
            }
        }
    })
}
</script>
</head>
<body>
<form action="${ctx}/wechat/" id="video_list" method="get">
	<input type="hidden" name="id" class="video_id">
</form>

<c:choose>
	<c:when test="${empty videos}">
		<div class="pic_empty_img_box pic_empty_img_box1">
			<img alt="" src="${ctx}/images/pic_empty.jpg" class="pic_empty_img">
		</div>
	</c:when>
	<c:otherwise>
		<ul class="video_list_ul">
			<c:forEach items="${videos}" var="video" varStatus="index">
				<li class="video_list_li" onclick="video_list_li('${video.id}')" url="${video.videoUrl}">
					<c:choose>
						<c:when test="${empty video.image}">
							<img alt="" src="${ctx}/images/banner_1.png" class="video_list_img">
						</c:when>
						<c:otherwise>
							<%-- <img alt="" src="${ctx}/images/banner_1.png" class="video_list_img"> --%>
							<img alt="" src="${ctx}/${video.image}" class="video_list_img">
						</c:otherwise>
					</c:choose>
					
					<div class="video_list_right">
						<p class="video_list_header">${video.name}</p>
						<span class="video_list_date"><fmt:formatDate pattern="yyyy-MM-dd" type="date" dateStyle="medium" timeStyle="medium" value="${video.operateTime}" /></span>
					</div>
				</li>
			</c:forEach>	
		</ul>
	</c:otherwise>
</c:choose>

</body>
</html>