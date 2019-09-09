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
    margin: 1.6rem 1rem 1rem 2rem;
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
    float: right;
    margin-right: 2rem;
    margin-top: 1.6rem;
    height: 6rem;
    line-height: 6rem;
    width: 7rem;
    text-align: center;
}
.key_word_search_baike_box{
    background: #fff;
    margin-bottom: 2rem;
}
.key_word_search_baike_header{
	background: url(${ctx}/images/icon_encyclopedia.png) no-repeat 4% center;
	    font-size: 2.4rem;
    color: #5c5c5c;
    padding-left: 6rem;
    background-size: 3.2rem;
    margin-bottom: 1rem;
}
.key_word_search_baike_ul{
    padding: 0 1rem;
    border-top: .1rem solid #ccc;
}
.key_word_search_baike_li{
    border-bottom: .1rem solid #ccc;
    padding: 2rem;
    overflow: hidden;
}
.key_word_search_baike_li_img{
    width: 19rem;
    height: 12rem;
    margin-right: 2rem;
    float: left;
}
.key_word_search_baike_li_right{
    display: inline-block;
    width: 50%;
}
.key_word_search_baike_li_name{
    font-size: 2.8rem;
    white-space: nowrap;
    text-overflow: ellipsis;
    overflow-x: hidden;
    margin-bottom: 5.5rem;
    margin-top: 1rem;
}
.key_word_search_baike_li_date{
    font-size: 2rem;
    color: #ccc;
}
.key_word_search_baike_li_read{
    font-size: 2rem;
    color: #ccc;
    float: right;
}
.key_word_search_expert_box{
    background: #fff;
    margin-bottom: 2rem;
}
.key_word_search_expert_header{
	background: url(${ctx}/images/icon_search_article.png) no-repeat 4% center;
	    font-size: 2.4rem;
    color: #5c5c5c;
    padding-left: 6rem;
    background-size: 3.2rem;
    margin-bottom: 1rem;
}
.key_word_search_expert_ul{
	padding: 0 1rem;
    border-top: .1rem solid #ccc;
}
.key_word_search_expert_li{
    border-bottom: .1rem solid #ccc;
    padding: 2rem;
    overflow: hidden;
}
.key_word_search_expert_li_img{
    width: 19rem;
    height: 12rem;
    margin-right: 2rem;
    float: left;
}
.key_word_search_expert_li_right{
    display: inline-block;
    width: 50%;
}
.key_word_search_expert_li_name{
    font-size: 2.8rem;
    white-space: nowrap;
    text-overflow: ellipsis;
    overflow-x: hidden;
    margin-bottom: 5.5rem;
    margin-top: 1rem;
}
.key_word_search_expert_li_date{
    font-size: 2rem;
    color: #ccc;
}
.key_word_search_expert_li_read{
    font-size: 2rem;
    color: #ccc;
    float: right;
}
.key_word_search_video_box{
    background: #fff;
	margin-top: 10rem;
    margin-bottom: 2rem;
}
.key_word_search_video_header{
	background: url(${ctx}/images/icon_search_video.png) no-repeat 4% center;
	    font-size: 2.4rem;
    color: #5c5c5c;
    padding-left: 6rem;
    background-size: 3.2rem;
    margin-bottom: 1rem;
}
.key_word_search_video_li_img{
    width: 100%;
    height: 100%;
    position: absolute;
    z-index: 1;
}
.key_word_search_video_ul{
    padding: 2rem;
}
.key_word_search_video_li{
    margin-bottom: 4rem;
    overflow: hidden;
}
.key_word_search_video_left{
    width: 52%;
    height: 17rem;
    position: relative;
    margin-right: 3%;
    display: inline-block;
    float: left;
}
.icon_video_start{
    position: absolute;
    z-index: 2;
    left: 40%;
    top: 40%;
}
.key_word_search_video_right{
    display: inline-block;
    width: 43%;
}
.key_word_search_video_date{
	font-size: 2rem;
    color: #ccc;
}
.key_word_search_video_txt{
	overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    font-size: 2.8rem;
    margin-bottom: 7rem;
    margin-top: 1rem;
}
em{
	color:#ff0000;
}
</style>
<script type="text/javascript">
    $(function(){
        $(".key_word_search_btn").click(function(){
            if(!$.trim($(".key_word_search_value").val())){
                reminder_box("请输入要查询的关键字/资格证号");
                return;
            }

            $("#key_word_search .key_word_query").val($.trim($(".key_word_search_value").val()));
            $("#key_word_search").attr("action","${ctx}/wechat/search").submit();
        });
        reminder_box("缺少分页【接口：/wechat/api/search.json】")
    });
	function to_video_details(id) {
		reminder_box("视频播放");
    }
    function  to_article_details(id) {
        location.href="${ctx}/wechat/wikiDetails?id="+id;
    }
</script>
</head>
<body>
<form action="" id="key_word_search" method="get">
	<input type="hidden" name="query" class="key_word_query">
</form>
<div class="key_word_search_box">
	<div class="key_word_search_top_box">
		<input type="text" placeholder="请输入需要查询的关键字" class="key_word_search_value" value="${query}">
		<img alt="" src="${ctx}/images/icon_search_delete.png" class="icon_search_delete">
	</div>
	<span class="key_word_search_btn">搜索</span>
</div>
<c:if test="${not empty videos}">
	<div class="key_word_search_video_box">
		<h1 class="key_word_search_video_header">教学视频</h1>
		<ul class="key_word_search_video_ul">
			<c:forEach items="${videos}" var="video">
				<li class="key_word_search_video_li" onclick="to_video_details('${video.id}')">
					<div class="key_word_search_video_left">
						<img alt="" src="${ctx}/${video.image}" class="key_word_search_video_li_img">
						<img alt="" src="${ctx}/images/icon_video_start.png" class="icon_video_start">
					</div>
					<div class="key_word_search_video_right">
						<p class="key_word_search_video_txt">${video.name}</p>
						<span class="key_word_search_video_date"><fmt:formatDate pattern="yyyy-MM-dd" type="date" dateStyle="medium" timeStyle="medium" value="${video.createTime}" /></span>
					</div>
				</li>
			</c:forEach>
		</ul>
	</div>
</c:if>
<c:if test="${not empty articles}">
	<c:forEach items="${articles}" var="article">
		<c:choose>
			<c:when test="${article.type ==1}">
				<!-- 控制标题是否显示 -->
				<c:if test="${empty wikiTitle}">
					<div class="key_word_search_baike_box">
						<h1 class="key_word_search_baike_header">汉和干货</h1>
						<ul class="key_word_search_baike_ul">
				</c:if>
						<li class="key_word_search_baike_li" onclick="to_article_details('${article.id}')">
							<img alt="" src="${ctx}/${article.coverImg}" class="key_word_search_baike_li_img">
							<div class="key_word_search_baike_li_right">
								<h1 class="key_word_search_baike_li_name">${article.title}</h1>
								<span class="key_word_search_baike_li_date"><fmt:formatDate pattern="yyyy-MM-dd" type="date" dateStyle="medium" timeStyle="medium" value="${article.createTime}" /></span>
								<span class="key_word_search_baike_li_read">${article.readSize}次阅读</span>
							</div>
						</li>
					<c:set var="wikiTitle" value="1"/>
				</c:when>
			<c:otherwise>
				<!-- 控制标题是否显示 -->
				<c:if test="${empty expertTitle}">
					<!-- 控制汉和干货模块是否收尾 -->
					<c:if test="${not empty wikiTitle}">
						</ul>
						</div>
					</c:if>
					<div class="key_word_search_expert_box">
						<h1 class="key_word_search_expert_header">专家文章</h1>
						<ul class="key_word_search_expert_ul">
				</c:if>
					<li class="key_word_search_expert_li" onclick="to_article_details('${article.id}')">
						<img alt="" src="${ctx}/${article.coverImg}" class="key_word_search_expert_li_img">
						<div class="key_word_search_expert_li_right">
							<h1 class="key_word_search_expert_li_name">${article.title}</h1>
							<span class="key_word_search_expert_li_date"><fmt:formatDate pattern="yyyy-MM-dd" type="date" dateStyle="medium" timeStyle="medium" value="${article.createTime}" /></span>
							<span class="key_word_search_expert_li_read">${article.readSize}次阅读</span>
						</div>
					</li>
					<c:set var="expertTitle" value="1"/>
			</c:otherwise>
		</c:choose>
	</c:forEach>

		</ul>
	</div>
</c:if>

<script type="text/javascript">
$(function(){
	$(".icon_search_delete").click(function(){
		$(".key_word_search_value").val("");
	});
})
</script>
</body>
</html>