<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="common.jsp"%>
<title>汉和学院</title>
<style type="text/css">
.encyclopedia_details_header{
    padding: 2rem 3rem;
    font-size: 4rem;
    font-weight: bold;
    text-align: center;
}
.encyclopedia_details_box{
    padding: 0 3rem;
    font-size: 2.4rem;
    overflow: hidden;
}
.encyclopedia_details_img{
    width: 4rem;
    height: 4rem;
    border-radius: 2rem;
    float: left;
}
.encyclopedia_details_name{
    font-size: 2.4rem;
    float: left;
    margin: .8rem 2rem;
}
.encyclopedia_details_date{
    color: #ccc;
    margin-top: .8rem;
    float: left;
}
.encyclopedia_details_scan{
    color: #ccc;
    float: right;
    margin-top: .8rem;
}
.encyclopedia_details_btn_ul{
    position: fixed;
    bottom: 0;
    width: 100%;
    border-top: .1rem solid #ccc;
    height: 8rem;
    background: #fff;
}
.encyclopedia_details_btn_li{
    width: 33.3%;
    float: left;
    font-size: 2.4rem;
    text-align: center;
    padding-top: 4.5rem;
}
.encyclopedia_details_btn_span{

}
.encyclopedia_details_btn_li:nth-child(1){
	background: url(${ctx}/images/icon_message.png) no-repeat center 30%;
}
.encyclopedia_details_btn_li:nth-child(2){
	background: url(${ctx}/images/icon_like.png) no-repeat center 30%;
}
.encyclopedia_details_btn_li:nth-child(3){
	background: url(${ctx}/images/icon_collect.png) no-repeat center 30%;
}

.encyclopedia_details_btn_li:nth-child(2).index{
	background: url(${ctx}/images/icon_like_r.png) no-repeat center 30%;
}
.encyclopedia_details_btn_li:nth-child(3).index{
	background: url(${ctx}/images/icon_collect_r.png) no-repeat center 30%;
}
.encyclopedia_details_btn_li{

}
.encyclopedia_top_box{
    width: 100%;
    background: #fff;
}
.encyclopedia_details_content{
    margin-bottom: 7rem;
}
.message_box{
    padding: 0 4rem;
    margin-bottom: 11rem;
}
.message_box_header{
	font-size: 2.4rem;
    color: #5c5c5c;
    margin-bottom: 4rem;
}
.message_box_ul{

}
.message_box_li{
    margin-bottom: 3rem;
}
.message_box_right{
    display: inline-block;
    width: 80%;
    padding-top: .8rem;
}
.message_box_name{
    font-size: 2.4rem;
    color: #5c5c5c;
}
.message_box_li_img{
    width: 4rem;
    height: 4rem;
    float: left;
    margin-right: 5%;
}
.message_box_like{
    float: right;
    color: #5c5c5c;
    font-size: 2.4rem;
        display: inline-block;
    width: 4.5rem;
    text-align: right;
    background: url(${ctx}/images/icon_like.png) no-repeat left center;
}
.message_box_like.index{
	color:#ff4e00;
	background: url(${ctx}/images/icon_like_r.png) no-repeat left center;
}
.message_box_content{
    font-size: 2.4rem;
    line-height: 3rem;
    margin-top: 1.5rem;
}
.message_reply_header{
    border-left: .3rem solid #2ba245;
    font-size: 2.4rem;
    color: #5c5c5c;
    padding-left: .5rem;
    margin-top: 1.5rem;
}
.message_reply_txt{
    font-size: 2.4rem;
    color: #000;
    margin-top: 1rem;
}
</style>
<script type="text/javascript">
$(function(){
	
	$(".encyclopedia_details_btn_li").eq(1).click(function(){
		$(this).toggleClass("index");
		if($(this).hasClass("index")){
			$.ajax({
				   type: "POST",
				   url: "/college/wechat/api/upvoteArticle.json",
				   dataType: "json",
				   data: {userId:'${user.id}',articleId:'${article.id}'},
				   success: function(msg){
						if(msg.status==1){
							$(".encyclopedia_details_btn_span").eq(1).text(msg.data);
							
						}else{
							reminder_box(msg.msg);
						}
				   }
			})
		}else{
			$.ajax({
				   type: "POST",
				   url: "/college/wechat/api/downvoteArticle.json",
				   dataType: "json",
				   data: {userId:'${user.id}',articleId:'${article.id}'},
				   success: function(msg){
						if(msg.status==1){
							$(".encyclopedia_details_btn_span").eq(1).text(msg.data);
						}else{
							reminder_box(msg.msg);
						}
				   }
			})
		}
	});
	
	
	$(".encyclopedia_details_btn_li").eq(2).click(function(){
		$(this).toggleClass("index");
		
		if($(this).hasClass("index")){
			$.ajax({
				   type: "POST",
				   url: "/college/wechat/api/starArticle.json",
				   dataType: "json",
				   data: {userId:'${user.id}',articleId:'${article.id}'},
				   success: function(msg){
						if(msg.status==1){
							$(".encyclopedia_details_btn_span").eq(2).text("已收藏");
						}else{
							reminder_box(msg.msg);
						}
				   }
			})
		}else{
			$.ajax({
				   type: "POST",
				   url: "/college/wechat/api/unStarArticle.json",
				   dataType: "json",
				   data: {userId:'${user.id}',articleId:'${article.id}'},
				   success: function(msg){
						if(msg.status==1){
							$(".encyclopedia_details_btn_span").eq(2).text("收藏");
						}else{
							reminder_box(msg.msg);
						}
				   }
			})
			
		}
		
	});
	
	/* 获取后台数据 */
		/* $.ajax({
		   type: "POST",
		   url: "/college/wechat/api/getWikiDetials.json",
		   dataType: "json",
		   data: {articleId:1},
		   success: function(msg){
				if(msg.status==1){
					var data=msg.data;
					$(".encyclopedia_details_header").text(data.title);
					$(".encyclopedia_details_name").text(data.author);
					$(".encyclopedia_details_date").text(data.createTime);
					$(".encyclopedia_details_scan").text(data.coverImg);
					$(".encyclopedia_details_content").html(data.content);
				}else{
					
				}
		   }
	}) */
	
	$(".encyclopedia_details_btn_li").eq(0).click(function(){
		$("#encyclopedia_details_home").attr("action","${ctx}/wechat/leaveMessage").submit();
	});
	/* 监听返回键 */
	pushHistory(); 
	window.addEventListener("popstate", function(e) {  
			//回调函数中实现需要的功能
			if(location.href.indexOf("articleCategoryId")>-1){
				$("#encyclopedia_details_home").attr("action","${ctx}/wechat/wikis").submit();
			}else if(location.href.indexOf("userTypeId")>-1){
				$("#encyclopedia_details_home").attr("action","${ctx}/wechat/home").submit();
			}else{
				history.go(-2)
			}
			
	}, false);
	
	$(".message_box_like").click(function(){
		if($(this).hasClass("index")){
			reminder_box("您已点赞，请勿重复点赞！");
			return;
		}
		
		var _this=$(this);
		$.ajax({
			   type: "POST",
			   url: "/college/wechat/api/upvoteComment.json",
			   dataType: "json",
			   data: {userId:"${user.id}",commentId:$(this).attr("id")},
			   success: function(msg){
					if(msg.status==1){
						reminder_box("点赞成功");
						_this.addClass("index");
						_this.text((1+1*$.trim(_this.text())));
					}else{
						reminder_box(msg.msg);
					}
			   }
		})
	});
})
</script>
</head>
<body>
<form action="${ctx}/wechat/" id="encyclopedia_details_home" method="get">
	<input type="hidden" name="id" value="${article.id}" class="article_id">
</form>
<div class="encyclopedia_top_box">
	<h1 class="encyclopedia_details_header">${article.title}</h1>
	<div class="encyclopedia_details_box">
		<img alt="" src="${ctx}/images/head_hanhe.png" class="encyclopedia_details_img">
		<span class="encyclopedia_details_name">汉和学院</span>
		<span class="encyclopedia_details_date"><fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${article.createTime}" /></span>
		<span class="encyclopedia_details_scan">${article.readSize}次浏览</span>
	</div>
</div>
<div class="encyclopedia_details_content ck_css">
	${article.content}
</div>
<c:if test="${not empty article.commentList}">
	<div class="message_box">
		<h1 class="message_box_header">精选留言</h1>
		<ul class="message_box_ul">
			<c:forEach items="${article.commentList}" var="comment">
				<li class="message_box_li">
					<c:choose>
						<c:when test="${empty comment.user.headImg}">
							<img alt="" src="${ctx}/images/my_head_small.png" class="message_box_li_img">
						</c:when>
						<c:otherwise>
							<img alt="" src="${ctx}/${comment.user.headImg}" class="message_box_li_img">
						</c:otherwise>
					</c:choose>
					
					<div class="message_box_right">
						<span class="message_box_name">${comment.user.name}</span>
						<c:choose>
							<c:when test="${comment.agree}">
								<span class="message_box_like index" id="${comment.id}">${comment.voteSize}</span>
							</c:when>
							<c:otherwise>
								<span class="message_box_like" id="${comment.id}">${comment.voteSize}</span>
							</c:otherwise>
						</c:choose>
						<p class="message_box_content">${comment.comment}</p>
						<c:if test="${comment.replyFlag}">
							<h1 class="message_reply_header">作者回复</h1>
							<p class="message_reply_txt">${comment.replyContent}</p>
						</c:if>
					</div>
				</li>
			</c:forEach>
		</ul>
	</div>
</c:if>


<ul class="encyclopedia_details_btn_ul">
	<li class="encyclopedia_details_btn_li">
		<p class="encyclopedia_details_btn_span">写留言</p>
	</li>
	<c:choose>
		<c:when test="${isVote}">
			<li class="encyclopedia_details_btn_li index">
				<p class="encyclopedia_details_btn_span">点赞</p>
			</li>
		</c:when>
		<c:otherwise>
			<li class="encyclopedia_details_btn_li">
				<p class="encyclopedia_details_btn_span">点赞</p>
			</li>
		</c:otherwise>
	</c:choose>
	<c:choose>
		<c:when test="${isStar}">
			<li class="encyclopedia_details_btn_li index">
				<p class="encyclopedia_details_btn_span">收藏</p>
			</li>
		</c:when>
		<c:otherwise>
			<li class="encyclopedia_details_btn_li">
				<p class="encyclopedia_details_btn_span">收藏</p>
			</li>
		</c:otherwise>
	</c:choose>
</ul>
</body>
</html>