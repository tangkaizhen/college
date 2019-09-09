<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="common.jsp"%>
<title>汉和学院</title>
<style type="text/css">
.encyclopedia_img_box{
    width: 100%;
    height: 28rem;
    background: url(${ctx}/images/pic_encyclopedia.png) no-repeat center;
    background-size:100%
}
.encyclopedia_btn_ul{ 
    overflow: hidden;
    margin-bottom: 3rem;
    margin-left: 6%;
}
.encyclopedia_btn_li{
    font-size: 2.4rem;
    color: rgb(92,92,92);
    border: .1rem solid;
    float: left;
    padding: 1rem;
    margin-right: 3.3%;
    text-align: center;
    margin-top: 2rem;
    border-radius: .6rem;
}
.encyclopedia_btn_li.index{
    border: .1rem solid rgb(255,78,0);
    color: rgb(255,78,0);
    font-weight: bold;
}
.encyclopedia_content_ul{
    padding: 0 1rem 11rem;
}
.encyclopedia_content_li{
    padding: 3rem .3rem 2rem 2.4rem;
    border-bottom: .1rem solid #ccc;
        overflow: hidden;
}
.encyclopedia_small{
    width: 20rem;
    height: 12rem;
    float: left;
    margin-right: 2rem;
    border-radius: 1rem;
}
.encyclopedia_content_li_right{
    display: inline-block;
    width: 54%;
    float: left;
    font-size: 3rem;
}
.encyclopedia_content_header{
    overflow-x: hidden;
    text-overflow: ellipsis;
    font-size: 3rem;
    white-space: nowrap;
    margin-bottom: 4.5rem;
}
.encyclopedia_content_date{
    font-size: 2rem;
    color: #ccc;
}
.encyclopedia_content_read{
    float: right;
    font-size: 2rem;
    color: #ccc;
}
.pic_empty_img_box1{
	margin-top:8%;
}
</style>
<script type="text/javascript">
isHasEncyclopedia=true;
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
			onload_encyclopedia(p_num,true);
			
			console.log(p_num);
			if(isHasEncyclopedia){
				p_num++;
			}
		}
		
	});
	
 	
 	
	$(".bottom_navigation_li").eq(1).addClass("index").siblings().removeClass("index");
	var articleCategoryId_value=$.trim($(".encyclopedia_id").val());
	
	if(articleCategoryId_value){
		$(".encyclopedia_btn_li").each(function(){
			if($(this).attr("id")==articleCategoryId_value){
				$(this).addClass("index");
			}
		});
	}else{
		$(".encyclopedia_btn_li").eq(0).addClass("index");
	}		
	
	$(".bottom_navigation_li").eq(1).addClass("index");
	
	$(".encyclopedia_btn_li").click(function(){
		$(this).addClass("index").siblings().removeClass("index");
		$(".encyclopedia_id").val($(this).attr("id"));
		$("#encyclopedia_home").attr("action","${ctx}/wechat/wikis").submit();
	});
})
function onload_encyclopedia(pageNum,isScroll){
	var html='';
	$.ajax({
        type: "POST",
        url: "/college/wechat/api/getWikiList.json",
        dataType: "json",
        data: {articleCategoryId:$.trim($(".encyclopedia_id").val()),pageNum:pageNum},
        success: function(msg){
            if(msg.status==1){
            	console.log(msg);
            	var encyclopedia_arr=msg.data;
            	
            	if(encyclopedia_arr.length>0){
            		isHasEncyclopedia=true;
            		
            		for(var i=0;i<encyclopedia_arr.length;i++){
            			html+='<li class="encyclopedia_content_li" onclick="encyclopedia_content_li('+encyclopedia_arr[i].id+')">';
            			html+='<img alt="" src="${ctx}/'+encyclopedia_arr[i].coverImg+'" class="encyclopedia_small">'; 
            			html+='<div class="encyclopedia_content_li_right">';
            			html+='<h1 class="encyclopedia_content_header">'+encyclopedia_arr[i].title+'</h1>';
            			html+='<span class="encyclopedia_content_date">'+encyclopedia_arr[i].createTime+'</span>';
            			html+='<span class="encyclopedia_content_read">'+encyclopedia_arr[i].readSize+'次阅读</span>';
            			html+='</div>';
            			html+='</li>';
            		}
            		
            		if(isScroll){
            			$(".encyclopedia_content_ul").append(html);
            		}
            	}else{
            		isHasEncyclopedia=false;
            	}
            
            }else{
                reminder_box(msg.msg);
            }
        }
    })
}
function encyclopedia_content_li(id){
	$(".article_id").val(id);
	$("#encyclopedia_home").attr("action","${ctx}/wechat/wikiDetails").submit();
}
</script>
</head>
<body>
<form action="${ctx}/wechat/" id="encyclopedia_home" method="get">
	<input type="hidden" name="articleCategoryId" value="${articleCategoryId}" class="encyclopedia_id">
	<input type="hidden" name="id" class="article_id">
</form>
<div class="encyclopedia_img_box"></div>

<ul class="encyclopedia_btn_ul">
	<li class="encyclopedia_btn_li">全部</li>
	<c:forEach items="${articleCategories}" var="articleCategory">
		<li class="encyclopedia_btn_li" id="${articleCategory.id}">${articleCategory.name}</li>
	</c:forEach>
</ul>

<c:choose>
	<c:when test="${empty articles}">
		<div class="pic_empty_img_box pic_empty_img_box1">
			<img alt="" src="${ctx}/images/pic_empty.jpg" class="pic_empty_img">
		</div>
	</c:when>
	<c:otherwise>
		<ul class="encyclopedia_content_ul">
			<c:forEach items="${articles}" var="article">
				<li class="encyclopedia_content_li" onclick="encyclopedia_content_li('${article.id}')">
					
					<img alt="" src="${ctx}/${article.coverImg}" class="encyclopedia_small">
					<%-- <img alt="" src="${ctx}/images/banner_1.png" class="encyclopedia_small"> --%>
				
					<div class="encyclopedia_content_li_right">
						<h1 class="encyclopedia_content_header">${article.title}</h1>
						<span class="encyclopedia_content_date"><fmt:formatDate pattern="yyyy-MM-dd" value='${article.createTime}'/></span>
						<span class="encyclopedia_content_read">${article.readSize}次阅读</span>
					</div>
				</li>
			</c:forEach>
		</ul>
	</c:otherwise>
</c:choose>



<%@ include file="bottom_nav.jsp" %>  
</body>
</html>