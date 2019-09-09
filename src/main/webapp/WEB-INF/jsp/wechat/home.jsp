<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="common.jsp"%>
<title>汉和学院</title>
<style type="text/css">
html{
	position: relative;
	height:100%;
}
body{
	background: #f2f2f2;
	height:100%;
}
.banner_box{
	height:32.6rem;
	overflow: hidden;
	margin: 0 0 1rem 0;
}
.banner_ul{
    height: 100%;
    position: relative;
    left:0
}
.banner_li{
    float: left;
    height: 100%;
    background-size:100%;
}
.banner_li:nth-child(1){
	background: url(${ctx}/images/banner_1.jpg) no-repeat center;
}
.banner_li:nth-child(2){
	background: url(${ctx}/images/banner_2.jpg) no-repeat center;
}
.banner_li:nth-child(3){
	background: url(${ctx}/images/banner_3.jpg) no-repeat center;
}
.banner_li:nth-child(4){
	background: url(${ctx}/images/banner_4.jpg) no-repeat center;
}
.banner_li:nth-child(5){
	background: url(${ctx}/images/banner_1.jpg) no-repeat center;
}
.banner_li:nth-child(6){
	background: url(${ctx}/images/banner_2.jpg) no-repeat center;
}
.banner_li:nth-child(7){
	background: url(${ctx}/images/banner_3.jpg) no-repeat center;
}
.banner_li:nth-child(8){
	background: url(${ctx}/images/banner_4.jpg) no-repeat center;
	
}
.banner_img{
    height: 100%;
    width: 100%;
}
.banner_box{

}
.banner_box{

}
.card_number_box{
	background: #fff;
    width: 100%;
    padding: 2rem;
    margin-bottom: 1rem;
}
.card_number{
	background: url(${ctx}/images/icon_search.png) no-repeat 3% center;
	width: 80%;
    height: 7rem;
    border: none;
    border: .1rem solid #ccc;
    font-size: 2.8rem;
    color: rgb(187,187,187);
    padding-left: 7rem;
        margin-right:3%;
}
.home_ul{
    background: #FFf;
    overflow: hidden;
    width: 100%;
    padding: 1rem 0 2rem;
    border-bottom: .1rem solid #ccc;
}
.home_li{
    width: 10rem;
    height: 12rem;
    color: #fff;
    font-size: 2.4rem;
    text-align: center;
    float: left;
    border-radius: 1rem;
    padding-top: 3.2rem;
}
.home_li:nth-child(1){
	
}
.home_li:nth-child(2){
background: url(${ctx}/images/icon_teacher.png) no-repeat center 7%;
    background-size: 95%;
}
.home_li:nth-child(3){
background: url(${ctx}/images/icon_test.png) no-repeat center 7%;
    background-size: 95%;
}
.home_li:nth-child(4){
background: url(${ctx}/images/icon_Sign-up.png) no-repeat center 7%;
    background-size: 95%;
}
.home_video_box{
        background: #fff;
    padding: 3rem;
    position: relative;
    margin-bottom: 1rem;
}
.home_video_header{
    text-align: left;
    font-size: 3.2rem;
    margin-bottom: 2rem;
    font-weight: bold;
    border-bottom: .1rem solid #ccc;
    padding-bottom: 1rem;
}
.home_video_all{
    font-size: 2rem;
    position: absolute;
    right: 3rem;
    top: 3.5rem;
    color: #5c5c5c;
}
.home_video_ul{
    overflow: hidden;
    padding: 0 2rem;
}
.home_video_li{
width: 36rem;
    float: left;
     margin-right: 2rem;
}
.home_video_li_box{
    width: 36rem;
    height: 20rem;
    position: relative;
}
.home_video_li_img{
    width: 100%;
    height: 100%;
    border-radius: 1rem;
    position: absolute;
}
.home_video_ul_box{
	width: 100%;
    overflow-x: auto;
} 
.video_btn{
	position: absolute;
    z-index: 3;
    left: 44%;
    top: 36%;
}
.home_video_li_name{
    font-size: 2.8rem;
    margin-top: 2.5rem;
    text-align: center;
    white-space: nowrap;
    overflow-x: hidden;
    text-overflow: ellipsis;
}
.home_baike_box{
    background: #fff;
    margin-bottom: 1rem;
    position: relative;
    padding: 3rem;
}
.home_baike_header{
	text-align: left;
    font-size: 3.2rem;
    margin-bottom: 1rem;
    font-weight: bold;
    border-bottom: .1rem solid #ccc;
    padding-bottom: 1rem;
}
.home_baike_icon{
    margin-left: 1rem;
    margin-bottom: -.6rem;
}
.home_baike_li_txt{
    white-space: nowrap;
    overflow-x: hidden;
    text-overflow: ellipsis;
}
.home_baike_all{
    font-size: 2rem;
    position: absolute;
    right: 3rem;
    top: 3.5rem;
    color: #5c5c5c;
}
.home_baike_ul{
    font-size: 2.4rem;
}
.home_baike_li{
	display: flex;
	line-height: 5rem;
}
.home_baijia_box{
    background: #fff;
    padding: 4rem 2rem 9rem;
    overflow: hidden;
    position: relative;
}
.home_baijia_left{
    display: inline-block;
    float: left;
    overflow: hidden;
    
    text-align: center;
    width: 43%;
    margin-right: 2%;
}

.home_baijia_name{
    background: #489dd2;
    color: #fff;
    font-size: 2.4rem;
    height: 4.8rem;
    text-align: center;
    line-height: 4.8rem;
    border-radius: 2.4rem;
    margin-top: 1rem;
    padding: 0 1.5rem;
}

.home_baijia_icon{
    margin-right: 1rem;
}
.home_baijia_right_box{
    display: inline-block;
}
.home_baijia_txt1{
    font-size: 2.4rem;
    color:#148cd7;
}
.home_baijia_txt2{
    font-size: 2rem;
}
.home_li_p{
    margin-top:60px;
    color: #606060;
}
.home_video_icon{
    margin-right: 1rem;
    margin-bottom: -.6rem;
}
.home_video_ul_box{

}
.home_baike_li_span{
	display: inline-table;
    width: 1.2rem;
    height: 1.2rem;
    background: #148cd7;
    margin-right: 1rem;
    border-radius: .6rem;
    position: relative;
    top:1.9rem;
}
.card_number_btn{
    display: inline-block;
    border: .1rem solid #bbb;
    color: #5c5c5c;
    font-size: 2.8rem;
    height: 7rem;
    line-height: 7rem;
    width: 16%;
    text-align: center;
        border-radius: .5rem;
}
.video_box{
    width: 100%;
    height: 100%;
    position: fixed;
    top: 0;
    z-index:30;
    background: url(${ctx}/images/video_btn.png) no-repeat center,#fff;
}
.video_control{
    margin-top: 36%;
	width: 100%;
}
.home_baijia_all{
    font-size: 2rem;
    position: absolute;
    right: 3rem;
    top: 3.5rem;
    color: #5c5c5c;
}
.home_baijia_header{
    text-align: left;
    font-size: 3.2rem;
    font-weight: bold;
    border-bottom: .1rem solid #ccc;
    padding-bottom: 1rem;
}
.home_video_bac_img{

}
.home_baijia_li{
    border-bottom: .1rem solid #eee;
    padding: 2rem 2rem;
    display: flex;
    overflow: hidden;
    text-overflow: ellipsis;
}
.home_baijia_innerBox{
    flex:1;
    position: relative;
}
.home_baijia_smallHeader{
    font-size:3rem;
    color: #000;
    font-weight: bold;
    margin-top: 1rem;
    margin-bottom: 1rem;
        white-space: nowrap;
    overflow-x: hidden;
        text-overflow: ellipsis;
}
.home_baijia_intro{
    font-size:2.4rem;
    color: #5c5c5c;
}
.home_baijia_date{
    font-size:2rem;
    color: #bbb;
    position: absolute;
    bottom: 4.5rem;
}

.home_baijia_article{
    font-size:2.4rem;
    color: #060606;
    position: absolute;
        bottom: 1rem;
    width: 100%;
}

.home_baijia_article_title{
    white-space: nowrap;
    text-overflow: ellipsis;
    width: 78%;
    display: inline-block;
    overflow-x: hidden;
    position: relative;
    padding-left:.5rem;
    float:right;
}
.home_baijia_img{
    width: 18rem;
    height: 23rem;
    border-radius: 1rem;
    margin-right: 2rem;
    flex: none;
}
	
</style>

</head>
<body>
<div class="home_box" style="display:none">
<form action="${ctx}/wechat/" id="home" method="get" class="hanhe_form">
	<input type="hidden" name="query" class="certification_id">
	<input type="hidden" name="id" class="article_id">
	<input type="hidden" name="userTypeId" class="userType_id">
</form>

<div class="card_number_box">
	<input type="text" class="card_number" placeholder="请输入要查询的资格证号">
	<span class="card_number_btn">搜索</span>
</div>

<ul class="home_ul">
	<li class="home_li" style="background: url(${ctx}/images/icon_operator.png) no-repeat center 7%;background-size: 95%;" id="${userType1.id}">
		<p class="home_li_p">${userType1.name}</p>
	</li>
	<li class="home_li" style="background: url(${ctx}/images/icon_teacher.png) no-repeat center 7%;background-size: 95%;" id="${userType2.id}">
		<p class="home_li_p">${userType2.name}</p>
	</li>
	<li class="home_li" style="background: url(${ctx}/images/icon_test.png) no-repeat center 7%;background-size: 95%;">
		<p class="home_li_p">考试</p>
	</li>
	<li class="home_li" style="background: url(${ctx}/images/icon_Sign-up.png) no-repeat center 7%;background-size: 95%;">
		<p class="home_li_p">报名</p>
	</li>
</ul>
<script type="text/javascript">
	$(".home_li").css("marginLeft",($(window).width()-$(".home_li").width()*4)/5);
	function to_details(num){
		
		if(num==0){
			location.href='https://mp.weixin.qq.com/s/X7bna-IEhgOUYC9KFrFkPw'
		}else if(num==1){
			location.href='https://mp.weixin.qq.com/s/NvPBbIGSjhpWf8iPAsY5cA'
		}
	}
</script>

<div class="banner_box">
	<ul class="banner_ul">
		<li class="banner_li" onclick="to_details(0)">
		</li>
		<li class="banner_li" onclick="to_details(1)">
		</li>
		<li class="banner_li">
		</li>
		<li class="banner_li">
		</li>
		<li class="banner_li" onclick="to_details(0)">
		</li>
		<li class="banner_li" onclick="to_details(1)">
		</li>
		<li class="banner_li">
		</li>
		<li class="banner_li">
		</li>
	</ul>
</div>
<div class="home_baike_box">
	<p class="home_baike_header">干&nbsp;&nbsp;&nbsp;货</p>
	<span class="home_baike_all">查看全部></span>
	
	<ul class="home_baike_ul">
		<c:forEach items="${articles}" begin="0" end="4" step="1" var="article">
			<li class="home_baike_li" onclick="home_baike_li('${article.id}')"><span class="home_baike_li_span"></span><span class="home_baike_li_txt">${article.title}</span></li>
		</c:forEach>
	</ul>
</div>

<div class="home_video_box">
	<div class="home_video_header">教学视频</div>
	<span class="home_video_all">查看全部></span>
	<div class="home_video_ul_box">
	
	<ul class="home_video_ul">
	
		<c:forEach items="${videos}" begin="0" end="4" step="1" var="video" varStatus="index">
			<li class="home_video_li" onclick="home_video_li('${video.id}')">
				<div class="home_video_li_box">
					<c:choose>
						<c:when test="${empty video.image}">
							<img alt="" src="${ctx}/images/banner_1.png" class="home_video_li_img">
						</c:when>
						<c:otherwise>
							<img alt="" src="${ctx}/${video.image}" class="home_video_li_img">	 
							<%-- <img alt="" src="${ctx}/images/banner_1.png" class="home_video_li_img">	 --%>
						</c:otherwise>
					</c:choose>
					<img alt="" src="${ctx}/images/video_btn.png" class="video_btn">
				</div>
				<p class="home_video_li_name">${video.name}</p>
			</li>
		</c:forEach>
	</ul>
	<script type="text/javascript">
		var home_video_ul_length=($(".home_video_li").length)*38+4+"rem"; 
		$(".home_video_ul").css("width",home_video_ul_length);
	</script>
	</div>
</div>

<div class="home_baijia_box">
	<p class="home_baijia_header">大咖秀</p>
	<span class="home_baijia_all">查看全部></span>
	<%-- 
	<div class="home_baijia_left" onclick="home_baijia_box('${expert.id}')">
		<c:choose>
			<c:when test="${empty expert.headImg}">
			 	<img alt="" src="${ctx}/images/pic_head_default.png" class="home_baijia_img">
			</c:when>
			<c:otherwise>
				<img alt="" src="${ctx}/${expert.headImg}" class="home_baijia_img">
			</c:otherwise>
		</c:choose>
		 
		<img alt="" src="${ctx}/images/expert_list_small.png" class="home_baijia_img">
		<p class="home_baijia_name">专家：${expert.nickname}</p>
	</div>--%>
<%-- 	<ul class="home_baijia_ul" onclick="home_baijia_box('${expert.id}')">
		<li class="home_baijia_li">
			<img alt="" src="${ctx}/images/icon_expert_list.png" class="home_baijia_icon">
			<div class="home_baijia_right_box">
				<p class="home_baijia_txt1">丰富的职业经验</p>
				<p class="home_baijia_txt2">具有15年的农业种植经验</p>
			</div>
		</li>
		<li class="home_baijia_li">
			<img alt="" src="${ctx}/images/icon_expert_list.png" class="home_baijia_icon">
			<div class="home_baijia_right_box">
				<p class="home_baijia_txt1">丰富的职业经验</p>
				<p class="home_baijia_txt2">具有15年的农业种植经验</p>
			</div>
		</li>
		<li class="home_baijia_li">
			<img alt="" src="${ctx}/images/icon_expert_list.png" class="home_baijia_icon">
			<div class="home_baijia_right_box">
				<p class="home_baijia_txt1">丰富的职业经验</p>
				<p class="home_baijia_txt2">具有15年的农业种植经验</p>
			</div>
		</li>
	</ul> --%>
	
	<ul class="home_baijia_ul">
		<c:forEach items="${experts}" var="expert" varStatus="index">
			<li class="home_baijia_li" onclick="home_baijia_box('${expert.id}')">
				<c:choose>
					<c:when test="${empty expert.headImg}">
					 	<img alt="" src="${ctx}/images/pic_head_default.png" class="home_baijia_img">
					</c:when>
					<c:otherwise>
						<img alt="" src="${ctx}/${expert.headImg}" class="home_baijia_img">
					</c:otherwise>
				</c:choose>
				<div class="home_baijia_innerBox">
					<h1 class="home_baijia_smallHeader">${expert.nickname}·${expert.label}</h1>
					<p class="home_baijia_intro">${expert.resume}</p>
					<p class="home_baijia_date">最近更新：<fmt:formatDate pattern="yyyy-MM-dd" value='${expert.interactTime}'/></p>
					<p class="home_baijia_article">文章 |<span class="home_baijia_article_title">
						<c:choose>
							<c:when test="${empty expert.interactTitle}">
								无
							</c:when>	
							<c:otherwise>
								${expert.interactTitle}
							</c:otherwise>
						</c:choose> 
						</span>
					</p>
				</div>
			</li>
		</c:forEach>
	</ul>
</div>

<div class="video_box" style="display:none">
	<video src="" class="video_control" controls="controls">
		该播放器不支持该视频类型
	</video>
</div>

</div>
<script type="text/javascript">
var setInterval_num=1;
function banner_interval_fn(){
	if(setInterval_num==1){
		$(".banner_ul").css("left",0);
	}
	$(".banner_ul").animate({left: -$(window).width()*setInterval_num}, "slow");
	setInterval_num=setInterval_num+1;
	if(setInterval_num==5){
		setInterval_num=1;
	}
}
$(function(){
	
	var u = navigator.userAgent, app = navigator.appVersion;
    var isAndroid = u.indexOf('Android') > -1 || u.indexOf('Linux') > -1; //g
    if(isAndroid) {
    	//这个是安卓操作系统
    }
    
	var clientHeight = document.documentElement.clientHeight || document.body.clientHeight;
	$(window).on('resize', function (e) {
	    var nowClientHeight = document.documentElement.clientHeight || document.body.clientHeight; 
	    if (clientHeight > nowClientHeight) {
	    	//键盘弹出的事件处理
	    	$('.bottom_navigation_ul').css('position','static'); 
	    }
	    else {
	        //键盘收起的事件处理
	    	$('.bottom_navigation_ul').css('position','fixed'); 
	    } 
	});
	
	
	
	$(".home_box").show();
	
    
	
	$(".banner_ul").width($(window).width()*$(".banner_li").length);
	$(".banner_li,.banner_box").width($(window).width());
	
	
	
	var banner_setInterval=setInterval(banner_interval_fn,5000); 
	
	$('.banner_ul').on('touchstart', function (e) {
        // 判断默认行为是否可以被禁用
        if (e.cancelable) {
            // 判断默认行为是否已经被禁用
            if (!e.defaultPrevented) {
                /* e.preventDefault(); */
            }
        }   
        //触摸开始时获取其X轴和Y轴的坐标
        startX = e.originalEvent.changedTouches[0].pageX,
        startY = e.originalEvent.changedTouches[0].pageY;
        clearInterval(banner_setInterval);
    });
	
	$('.banner_ul').on('touchend', function (e) {            
        // 判断默认行为是否可以被禁用
        if (e.cancelable) {
            // 判断默认行为是否已经被禁用
            if (!e.defaultPrevented) {
                /* e.preventDefault(); */
            }
        }           
        //触摸结束获取其X轴和Y轴的坐标
        moveEndX = e.originalEvent.changedTouches[0].pageX,
        moveEndY = e.originalEvent.changedTouches[0].pageY,
        
        X = moveEndX-startX;

        if ( X > 0 ) {
        	//左滑
        	if(setInterval_num==1){
        		setInterval_num=5;
        	}
        	
        	if(setInterval_num==5){
        		$(".banner_ul").css("left",-$(window).width()*4);
        	}
        	
        	$(".banner_ul").animate({left: -$(window).width()*(setInterval_num-2)}, "slow");
        	
        	setInterval_num=setInterval_num-1;
        	
        	if(setInterval_num==0){
        		setInterval_num=4;
        	}
        	
        }else if(X < 0){
        	//右滑
        	
        	if(setInterval_num==1){
        		$(".banner_ul").css("left",0);
        	}
        	
        	$(".banner_ul").animate({left: -$(window).width()*setInterval_num}, "slow");
        	
        	setInterval_num=setInterval_num+1;
        	if(setInterval_num==5){
        		setInterval_num=1;
        	}
        	
        }
        
        banner_setInterval=setInterval(banner_interval_fn,5000);
	})


	$(".card_number_btn").click(function(){
		if(isVisitor()){
    		return;
    	}
		
		if(!$.trim($(".card_number").val())){
			reminder_box("请输入要查询的资格证号");
			return;
		}
		
		/* 是否是合格的资格证号 */
		if(!isIDCard1.test($.trim($(".card_number").val()))){
			reminder_box("资格证号格式错误");
			return;
		}
		
		$("#home .certification_id").val($.trim($(".card_number").val()));
		$("#home").attr("action","${ctx}/wechat/search").submit();
	});
	$(".home_baijia_all").click(function(){
		location.href = '${ctx}/wechat/families';
	});
	
	$(".home_li").click(function(){
		if(isVisitor()){
    		return;
    	}
		
		if($(this).index()==0){
			$(".userType_id").val($(this).attr("id"));
			$("#home").attr("action","${ctx}/wechat/courses").submit();
		}else if($(this).index()==1){
			$(".userType_id").val($(this).attr("id"));
			$("#home").attr("action","${ctx}/wechat/courses").submit();
		}else if($(this).index()==2){
			$("#home").attr("action","${ctx}/wechat/examCategories").submit();
		}else if($(this).index()==3){
			$("#home").attr("action","${ctx}/wechat/train").submit();
		}
	});
	
	$(".home_video_all").click(function(){
		if(isVisitor()){
    		return;
    	}
		
		$("#home").attr("action","${ctx}/wechat/videos").submit();
	});
	$(".home_baike_all").click(function(){
		if(isVisitor()){
    		return;
    	}
		
		$("#home").attr("action","${ctx}/wechat/wikis").submit();
	});
	
	$(".video_box").click(function(){
		if(isVisitor()){
    		return;
    	}
		$(".video_control").stop();
		$(".video_box").hide();
	});
	
	/* 监听返回键 */
	pushHistory(); 
	window.addEventListener("popstate", function(e) {  //回调函数中实现需要的功能
		if($(".video_box").attr("style")=="display:none"){
			/* 直接关闭窗口 */
			/* WeixinJSBridge.call('closeWindow'); */
			return;
		}else{
			$("#home").attr("action","${ctx}/wechat/home").submit();
			return;
		}
	}, false);
})
var isIDCard1=/^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$|^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X|x)$/;

function home_video_li(id){
	if(isVisitor()){
		return;
	}
	
	location.href="${ctx}/wechat/vedioDetails?id="+id;
}

function home_baike_li(id){
	
	if(isVisitor()){
		return;
	}
	$(".article_id").val(id);
	$("#home").attr("action","${ctx}/wechat/wikiDetails").submit();
}
function home_baijia_box(num){
	if(isVisitor()){
		return;
	}
	
	$(".article_id").val(num);
	$("#home").attr("action","${ctx}/wechat/expert").submit();
}
</script>
<%@ include file="bottom_nav.jsp" %>  
</body>
</html>