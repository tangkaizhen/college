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

}
.families_list_ul{
    padding:0 1rem 9rem;
}
.families_list_li{
    border-bottom: .1rem solid #ccc;
    padding:1.5rem 2rem;
    overflow: hidden;
}
.expert_list{
    width: 18rem;
    height: 23rem;
    float: left;
    margin-right: 2rem;
    border-radius: 1rem;
}
.families_list_li_right{
        overflow: hidden;
    margin-top: 1rem;
    position: relative;
    height: 22rem;
}
.families_list_li_header{
    font-size: 3rem;
    overflow-x: hidden;
    white-space: nowrap;
    margin-bottom: 2rem;
}
.families_list_li_dot{
    margin: 0 1rem;
}
.families_list_li_txt{
    font-size: 2.4rem;
    color: rgb(92,92,92);
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 3;
    -webkit-box-orient: vertical;
}
.families_list_li_date{
	font-size: 2rem;
    color:#bbb;
    position: absolute;
    top: 15rem;
}
.home_baijia_article{
    position: absolute;
    top: 18rem;
    font-size:2.4rem;
    color: #060606;
    width:100%;
}
.home_baijia_article_title{
    white-space: nowrap;
    text-overflow: ellipsis;
    width: 74%;
    display: inline-block;
    overflow-x: hidden;
    position: relative;
}
.home_baijia_article_fore{
    float: left;
    margin-right: 1rem;
}
</style>

<script type="text/javascript">
isHasFamily=true;

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
			onload_family(p_num,true);
			
			console.log(p_num);
			if(isHasFamily){
				p_num++;
			}
		}
	}); 	
	$(".bottom_navigation_li").eq(2).addClass("index").siblings().removeClass("index");
	$(".bottom_navigation_li").eq(2).addClass("index");
})
function families_list_li(id){
	$(".expert_id").val(id);
	$("#family_home").attr("action","${ctx}/wechat/expert").submit();
}

function onload_family(pageNum,isScroll){
	var html='';
	$.ajax({
        type: "POST",
        url: "/college/wechat/api/schools.json",
        dataType: "json",
        data: {pageNum:pageNum},
        success: function(msg){
            if(msg.status==1){
            	console.log(msg);
            	var family_arr=msg.data;
            	if(family_arr.length>0){
            		isHasFamily=true;
            		
            		for(var i=0;i<family_arr.length;i++){
            			
            			html+='<li class="families_list_li" onclick="families_list_li('+family_arr[i].id+')">';
            			html+='<img alt="" src="${ctx}/'+family_arr[i].headImg+'"  class="expert_list">';
            			html+='<div class="families_list_li_right">';
            			html+='<h1 class="families_list_li_header"><span class="families_list_li_name">'+family_arr[i].nickname+'</span><span class="families_list_li_dot">·</span><span class="families_list_li_desc">'+family_arr[i].label+'</span></h1>';
            			html+='<p class="families_list_li_txt">'+family_arr[i].resume+'</p>';
            			html+='<p class="families_list_li_date">最近更新：'+family_arr[i].interactTime+'</p>';
            			html+='</div>';
            			html+='</li>';
            		}

            		if(isScroll){
            			$(".families_list_ul").append(html);
            		}
            		
            	}else{
            		isHasFamily=false;
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

<form action="${ctx}/wechat/" id="family_home" method="get">
	<input type="hidden" name="id" class="expert_id">
</form>

<c:choose>
	<c:when test="${empty experts}">
		<div class="pic_empty_img_box pic_empty_img_box1">
			<img alt="" src="${ctx}/images/pic_empty.jpg" class="pic_empty_img">
		</div>
	</c:when>
	<c:otherwise>
		<ul class="families_list_ul">
			<c:forEach items="${experts}" var="expert" >
				<li class="families_list_li" onclick="families_list_li('${expert.id}')">
					
					<%-- <img alt="" src="${ctx}/images/expert_list_small.png"  class="expert_list">--%>
					<img alt="" src="${ctx}/${expert.headImg}"  class="expert_list"> 
					<div class="families_list_li_right">
						<h1 class="families_list_li_header"><span class="families_list_li_name">${expert.nickname}</span><span class="families_list_li_dot">·</span><span class="families_list_li_desc">${expert.label}</span></h1>
						<p class="families_list_li_txt">${expert.resume}</p>
						<p class="families_list_li_date">最近更新：<fmt:formatDate pattern="yyyy-MM-dd" value='${expert.interactTime}'/></p>
						<p class="home_baijia_article">
							<span class="home_baijia_article_fore">文章 |</span> 
						<c:choose>
							<c:when test="${empty expert.interactTitle}">
								<span class="home_baijia_article_title">无</span></p>
							</c:when>
							<c:otherwise>
								<span class="home_baijia_article_title">${expert.interactTitle}</span></p>
							</c:otherwise>
						</c:choose>
						
					</div>
				</li>
			</c:forEach>
		</ul>
	</c:otherwise>
</c:choose>

<%@ include file="bottom_nav.jsp" %> 
</body>
</html>