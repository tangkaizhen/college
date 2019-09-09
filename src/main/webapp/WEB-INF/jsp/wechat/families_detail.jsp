<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="common.jsp"%>
<title>汉和学院</title>
<style type="text/css">
.families_detail_top{
	width: 100%;
    height: 32rem;
    position: relative;
    color: #fff;
}
.families_detail_top_img{
    position: absolute;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    z-index: -1;
}
.families_detail_name_box{
    font-size: 4rem;
    margin-bottom: .6rem;
    padding-left: 2rem;
    position: absolute;
    top: 22rem;
    font-weight: bold;
}
.families_detail_name{

}
.families_detail_introduce{

}
.families_detail_name_desc{
    color: #fff;
    font-size: 2.5rem;
    padding-left: 2rem;
    position: absolute;
    top:27.5rem;
    white-space: nowrap;
    text-overflow: ellipsis;
    overflow-x: hidden;
    width: 90%;
}
.families_detail_txt{
    padding: 0 2rem;
    margin: 1rem 0;
    position: relative;
    line-height:2;
}
.families_detail_txt.shrink{
	height: 10rem;
        overflow: hidden;
}
.families_detail_btn_box{
    border-top: .1rem solid #ccc;
    border-bottom: .1rem solid #ccc;
    margin-top: 2rem;
    padding: 1.5rem 1.5rem 0 0;
    margin-bottom: 2rem;
    width: 94%;
    margin-left: 3%;
}
.families_detail_btn_ul{
    overflow: hidden;
    font-weight: bold;
    display: inline-block;
    margin-left: 3rem;
}
.families_detail_btn_li{
    float: left;
    font-size: 2.4rem;
    margin-right: 4rem;
    padding-bottom: 1rem;
}
.families_detail_btn_li.index{
    color:#148cd7;
    border-bottom: .4rem solid #148cd7;
}
.quiz{
    float: right;
    margin-top: -.6rem;
    border-radius: .5rem;
}
.families_detail_content_ul{
	width: 94%;
    margin-left: 3%;
}
.families_detail_content_li{

}
.families_detail_dynamic_ul{

}
.families_detail_dynamic_li{
    border-bottom: .1rem solid #ccc;
    padding: 1.5rem 0;
    overflow: hidden;
}
.families_detail_dynamic_img{
    width: 20rem;
    height: 12rem;
    margin-left:1rem;
        float: left;
    margin-right: 2rem;
}
.families_detail_dynamic_right{
    display: inline-block;
    width: 50%;
    margin-top: 2rem;
}
.families_detail_dynamic_header{
	overflow-x: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    font-size: 2.4rem;
    margin-bottom: 4rem;
}
.families_detail_dynamic_date{
    font-size: 2rem;
    color: #ccc;
}
.families_detail_dynamic_read{
    font-size: 2rem;
    color: #ccc;
    float: right;
}
.families_detail_dot{
    margin: 0 1rem;
}
.families_detail_txt_desc{
	position: absolute;
    right:-.2rem;
    top: 3.3rem;
    background: #fff;
    color:#148cd7;
    text-align: center;
}
.to_up{
	margin-left: 47%;
	transform: rotate(180deg);
}
.to_up.index{
	transform: rotate(0deg);
}
.families_detail_problem_ul{

}
.families_detail_problem_li{
	border-bottom: .1rem solid #ccc;
    padding-bottom: 3rem;
        padding-top: 1rem;
}
.families_detail_problem_ask{
    margin-bottom:3rem;
    padding: 1rem 1rem;
}
.families_detail_ask_title{
    width:5rem;
    height:5rem;
    border-radius:2.5rem;
     float: left;
    margin-right: 3rem;
    margin-top: -.6rem;
}
.families_detail_problem_ask_txt{
	overflow: hidden;
    font-size: 2.4rem;
    line-height:4rem;
    position:relative;
    max-height:100000px;
}
.families_detail_problem_ask_txt.index{
	height: 11rem;
	overflow: hidden;
}
.families_detail_problem_answer{
    padding: 1rem 1rem;
}
.families_detail_answer_title{
    width: 5rem;
    height:5rem;
    border-radius:2.5rem;
    float: left;
    margin-right: 3rem;
    margin-top: -.6rem;
}

.families_detail_problem_answer_txt{
	overflow: hidden;
    font-size: 2.4rem;
    line-height:4rem;
    position: relative;
    max-height:100000px;
}

.families_detail_problem_answer_txt.index{
	height: 11rem;
	overflow: hidden;
	/* -webkit-line-clamp: 2;
	-webkit-box-orient: vertical */
}
.families_detail_problem_ask_desc{
    position: absolute;
    right: .6rem;
    top: 2.8rem;
    background: #fff;
    color:#148cd7;
    font-size: 2.4rem;
    width: 5.5rem;
    text-align: center;
}
.families_detail_problem_ask_up{
    margin-left: 50%;
    margin-top: -5%;
    transform: rotate(180deg);
}
.families_detail_problem_answer_up{
	margin-left: 50%;
    transform: rotate(180deg);
}
.families_detail_problem_ask_up.index,.families_detail_problem_answer_up.index{
	transform: rotate(0deg);
}
</style>
<script type="text/javascript">

isHasDynamic=true;
var expert_type=0;
var p_num=2;

$(function(){	
	/* 这是滚动加载 */	
	/* 这是滚动加载，当页面滑到下面的时候，开始加载 */
	/* 当前页面列表显示的是第几页 */
 	$(document).scroll(function(){
		//屏幕高度
		var w_height=$(window).height();
		//整个文档高度
		var d_height=$(document).height();
		//滚动高度
		var s_height=$(window).scrollTop();
		
		/* 当滚动到快接近底部时候，实施加载  */
		if(w_height+s_height+1>=d_height){
			if(expert_type==2){
				if(p_num!=1){
					onload_ask(expert_type,p_num,true);
				}
				
			}else{
				if(p_num!=1){
					onload_dynamic(expert_type,p_num,true);
				}
				
			}
			
			
		}
		
	});
 	
	if($(".families_detail_txt").height()<100){
		$(".to_up").hide();
	}else{
		$(".to_up").show();
		$(".families_detail_txt").addClass("shrink");
	}
	
	
   /* $(".families_detail_problem_ask_txt").each(function(i){
	
   }); */  
	
	$(".to_up").click(function(){
		if($(this).hasClass("index")){
			$(".to_up").removeClass("index");
			$(".families_detail_txt").addClass("shrink");
		}else{
			$(".to_up").addClass("index");
			$(".families_detail_txt").removeClass("shrink");
		}
		
	});
	
	
	$(".families_detail_btn_li").click(function(){
		$(".families_detail_dynamic_ul").html("");
		
		p_num=1;
		
		$(this).addClass("index").siblings().removeClass("index");
		var families_detail_btn_value=$.trim($(this).text());
		
		if(families_detail_btn_value=="动态"){
			$(".families_detail_content_li").eq(0).show().siblings().hide();
			
			expert_type=0;
			isHasDynamic=true;
			onload_dynamic(expert_type,p_num,false);
			 
		}else if(families_detail_btn_value=="文章"){
			
			$(".families_detail_content_li").eq(1).show().siblings().hide();
			expert_type=1;
			isHasDynamic=true;
			onload_dynamic(expert_type,p_num,false);
			
		}else{
			expert_type=2;
			isHasDynamic=true;
			$(".families_detail_content_li").eq(2).show().siblings().hide(); 
			
			onload_ask(expert_type,p_num,false)
		}
		
	});
	
	/* $(".families_detail_problem_ask_desc").click(function(){
		$(this).hide();
		$(this).parents(".families_detail_problem_li").find(".families_detail_problem_ask_up").show();
		$(this).parents(".families_detail_problem_answer_txt").removeClass("index");
		$(this).parents(".families_detail_problem_li").find(".families_detail_problem_ask_txt").removeClass("index");
	}); */
	
	/* $(".families_detail_problem_ask_up").click(function(){
		
		$(this).parents(".families_detail_problem_li").find(".families_detail_problem_ask_desc").show();
		$(this).hide();
		$(this).parents(".families_detail_problem_li").find(".families_detail_problem_answer_txt").addClass("index");
		$(this).parents(".families_detail_problem_li").find(".families_detail_problem_ask_txt").addClass("index");
	}); */
	
	$(".quiz").click(function(){
		$("#expert_home").attr("action","${ctx}/wechat/askQuestion").submit();
	});
	
	/* 监听返回键 */
	/* pushHistory(); 
	window.addEventListener("popstate", function(e) {  //回调函数中实现需要的功能
			$("#expert_home").attr("action","${ctx}/wechat/families").submit();
	}, false); */
	
	add_ask_des_btn();
})
function add_ask_des_btn(){
	/* 给问答增加缩进的按钮 */
	$(".families_detail_problem_ask_txt").each(function(i){
		console.log($(this).height());
		
		if($(this).height()>90){
			$(this).addClass("index");
			$(this).parents(".families_detail_problem_li").find(".families_detail_problem_ask_up").show();
		}else{
			$(this).removeClass("index");
			$(this).parents(".families_detail_problem_li").find(".families_detail_problem_ask_up").hide();
		}
	})
	
	/* 给问答增加缩进的按钮 */
	$(".families_detail_problem_answer_txt").each(function(i){
		if($(this).height()>90){
			$(this).addClass("index");
			$(this).parents(".families_detail_problem_li").find(".families_detail_problem_answer_up").show();
		}else{
			$(this).removeClass("index");
			$(this).parents(".families_detail_problem_li").find(".families_detail_problem_answer_up").hide();
		}
	})
}
function families_detail_problem_ask_up(e){
	$(e).parents(".families_detail_problem_li").find(".families_detail_problem_ask_txt").toggleClass("index");
	
	$(e).toggleClass("index");
}
function families_detail_problem_answer_up(e){
	$(e).parents(".families_detail_problem_li").find(".families_detail_problem_answer_txt").toggleClass("index");
	
	$(e).toggleClass("index");
}

/* 计算行数的 */
function countLines(ele) {
 var styles = window.getComputedStyle(ele, null);
 var lh = parseInt(styles.lineHeight, 10);
 var h = parseInt(styles.height, 10);
 var lc = Math.round(h / lh);
 return lc;
}

/* 这是点击动态文章跳转 */
function moment_li(id){
	$(".expert_id").val(id);
	$("#expert_home").attr("action","${ctx}/wechat/wikiDetails").submit();
}

/* 这是滚动加载专家动态 */
function onload_dynamic(type,pageNum,isScroll){
	var html='';
	$.ajax({
		   type: "POST",
		   url: "${ctx}/wechat/api/moments.json",
		   dataType: "json",
		   data: {expertId:"${expert.id}",type:type,pageNum:pageNum},
		   success: function(msg){
			   if(msg.status==1){
				   var html='';
				   if(msg.data.length>0){
					   isHasDynamic=true;
					   p_num++;
					   
					   for(var i=0;i<msg.data.length;i++){
						   
						   	if(msg.data[i].type==1){
						   		
						   		/* 这是文章 */
							    html+='<li class="families_detail_dynamic_li" onclick="moment_li('+msg.data[i].id+')">';
								html+='<img alt="" src="${ctx}/'+msg.data[i].coverImg+'" class="families_detail_dynamic_img">';
								//html+='<img alt="" src="${ctx}/images/banner_1.png" class="families_detail_dynamic_img">';
								html+='<div  class="families_detail_dynamic_right">';
								html+='<h1 class="families_detail_dynamic_header">'+msg.data[i].title+'</h1>';
								html+='<span class="families_detail_dynamic_date">'+msg.data[i].createTime+'</span>';
								html+='<span class="families_detail_dynamic_read">'+msg.data[i].readSize+'次阅读</span>';
								html+='</div>';
								html+='</li>';
							
						   	}else if(msg.data[i].type==2){
						   	   /* 这是问答 */	
						   	   html+='<li class="families_detail_problem_li">';
							   html+='<div class="families_detail_problem_ask">';
							   if(msg.data[i].userHeadImg){
								   html+='<img alt="" src="${ctx}/'+msg.data[i].userHeadImg+'" class="families_detail_ask_title">';
							   }else{
								   html+='<img alt="" src="${ctx}/images/my_head_small.png" class="families_detail_ask_title">';
							   }
							   html+='<p class="families_detail_problem_ask_txt" id="families_detail_problem_ask_txt">'+msg.data[i].comment+'</p>';
							   html+='</div>';
							   html+='<img alt="" src="/college/images/to_up.png" style="" onclick="families_detail_ask_ask_up(this)" class="families_detail_problem_ask_up">';
							   html+='<div class="families_detail_problem_answer">';
							   if(msg.data[i].expertHeadImg){
								   html+='<img alt="" src="${ctx}/'+msg.data[i].expertHeadImg+'" class="families_detail_ask_title">';
							   }else{
								   html+='<img alt="" src="${ctx}/images/my_head_small.png" class="families_detail_ask_title">';
							   }
							   
							   //html+='<img alt="" src="${ctx}/images/my_head_small.png" class="families_detail_answer_title">';
							   html+='<p class="families_detail_problem_answer_txt">'+msg.data[i].replyContent;
							   html+='</p>';
							   html+='</div>';
							   html+='<img alt="" src="/college/images/to_up.png" style="" onclick="families_detail_problem_answer_up(this)" class="families_detail_problem_answer_up">';
							   html+='</li>';
						   		
						   	}
						   	
					   }
					   
					   if(isScroll){
							$(".families_detail_dynamic_ul").eq(type).append(html);
					   }else{
							$(".families_detail_dynamic_ul").eq(type).html(html);
					   }
					   add_ask_des_btn()
					   
				   }else{
					   isHasDynamic=false;
				   }
				   	
				   
			   }else{
				   reminder_box(msg.msg);
			   }
		   }
	})
	
	
}

/* 这是滚动加载专家问答 */
function onload_ask(type,pageNum,isScroll){
	$.ajax({
		   type: "POST",
		   url: "${ctx}/wechat/api/moments.json",
		   dataType: "json",
		   data: {expertId:"${expert.id}",type:type,pageNum:pageNum},
		   success: function(msg){
			   if(msg.status==1){
				   var html='';
				   if(msg.data.length>0){
					   isHasDynamic=true;
					   p_num++;
					   
					   for(var i=0;i<msg.data.length;i++){
							
							   html+='<li class="families_detail_problem_li">';
							   html+='<div class="families_detail_problem_ask">';
							   if(msg.data[i].userHeadImg){
								   html+='<img alt="" src="${ctx}/'+msg.data[i].userHeadImg+'" class="families_detail_ask_title">';
							   }else{
								   html+='<img alt="" src="${ctx}/images/my_head_small.png" class="families_detail_ask_title">';
							   }
							   
							   //html+='<img alt="" src="${ctx}/images/my_head_small.png" class="families_detail_ask_title">';
							   html+='<p class="families_detail_problem_ask_txt" id="families_detail_problem_ask_txt">'+msg.data[i].comment+'</p>';
							   html+='</div>';
							   html+='<img alt="" src="${ctx}/images/to_up.png" onclick="families_detail_problem_ask_up(this)" style="display:none" class="families_detail_problem_ask_up">';
							   html+='<div class="families_detail_problem_answer">';
							   if(msg.data[i].expertHeadImg){
								   html+='<img alt="" src="${ctx}/'+msg.data[i].expertHeadImg+'" class="families_detail_answer_title">';
							   }else{
								   html+='<img alt="" src="${ctx}/images/my_head_small.png" class="families_detail_answer_title">';
							   }
							   //html+='<img alt="" src="${ctx}/images/my_head_small.png" class="families_detail_answer_title">';
							   html+='<p class="families_detail_problem_answer_txt">'+msg.data[i].replyContent;
							   html+='</p>';
							   html+='</div>';
							   html+='<img alt="" src="/college/images/to_up.png" style="" onclick="families_detail_problem_answer_up(this)" class="families_detail_problem_answer_up">';
							   html+='</li>';
							   
					   }
					   
					   if(isScroll){
							$(".families_detail_problem_ul").append(html);
					   }else{
							$(".families_detail_problem_ul").html(html);
					   }
					   
					   add_ask_des_btn()
				   }else{
					   isHasDynamic=false;
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
<form action="${ctx}/wechat/" id="expert_home" method="get">
	<input type="hidden" name="id" value="${expert.id}" class="expert_id">
</form>
<div class="families_detail_top">
	
	<img alt="" src="${ctx}/${expert.bannerImg}" class="families_detail_top_img">
	<%-- <img alt="" src="${ctx}/images/expert_banner_big.png" class="families_detail_top_img"> --%>
	
	<p class="families_detail_name_box">
		<span class="families_detail_name">${expert.nickname}</span><span class="families_detail_dot">·</span><span class="families_detail_introduce">${expert.label}</span>
	</p>
	<p class="families_detail_name_desc">${expert.resume}</p>
</div>	
<div class="families_detail_txt" id="target">
	${expert.details}
</div>
<img alt="" src="${ctx}/images/to_up.png" style="display:none" class="to_up"> 
<div class="families_detail_btn_box">
	<ul class="families_detail_btn_ul">
		<li class="families_detail_btn_li index">动态</li>
		<li class="families_detail_btn_li">文章</li>
		<li class="families_detail_btn_li">问答</li>
	</ul>
	<img alt="" src="${ctx}/images/quiz.jpg" class="quiz">
</div>

<ul class="families_detail_content_ul">
	<li class="families_detail_content_li">
			<ul class="families_detail_dynamic_ul">
			
				<c:forEach items="${moments}" var="moment" >
					<c:choose>
						<c:when test="${moment.type==1}">
							<li class="families_detail_dynamic_li" onclick="moment_li('${moment.id}')">
							    <img alt="" src="${ctx}/${moment.coverImg}" class="families_detail_dynamic_img"> 
								<%-- <img alt="" src="${ctx}/images/banner_1.png" class="families_detail_dynamic_img"> --%>
								<div  class="families_detail_dynamic_right">
									<h1 class="families_detail_dynamic_header">${moment.title}</h1>
									<span class="families_detail_dynamic_date"><fmt:formatDate type="both" pattern="yyyy-MM-dd" value='${moment.createTime}'/></span>
									<span class="families_detail_dynamic_read">${moment.readSize}次阅读</span>
								</div>
							</li>
						</c:when>
						<c:when test="${moment.type==2}">
							
							<li class="families_detail_problem_li">
							   <div class="families_detail_problem_ask">
							   	   <c:choose>
							   	   		<c:when test="${empty moment.userHeadImg}">
							   	   			<img alt="" src="${ctx}/images/my_head_small.png" class="families_detail_ask_title">
							   	   		</c:when>
							   	   		<c:otherwise>
							   	   			<img alt="" src="${ctx}/${moment.userHeadImg}" class="families_detail_ask_title">
							   	   		</c:otherwise>
							   	   </c:choose>	
								   <p class="families_detail_problem_ask_txt" id="families_detail_problem_ask_txt">${moment.comment}</p>
							   </div>
							   <img alt="" src="${ctx}/images/to_up.png" onclick="families_detail_problem_ask_up(this)" style="display:none" class="families_detail_problem_ask_up">
							   <div class="families_detail_problem_answer">
						   	   			<img alt="" src="${ctx}/${moment.expertHeadImg}" class="families_detail_answer_title">
								   
								   <p class="families_detail_problem_answer_txt">${moment.replyContent}</p>
							   </div>
							   <img alt="" src="${ctx}/images/to_up.png" style="display:none" onclick="families_detail_problem_answer_up(this)" class="families_detail_problem_answer_up">
							</li>
						</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose>
				</c:forEach>	
			</ul>
	</li>
	
	<li class="families_detail_content_li" style="display:none">
		<ul class="families_detail_dynamic_ul">
			<%-- <li class="families_detail_dynamic_li">
				<img alt="" src="${ctx}/images/banner_1.png" class="families_detail_dynamic_img">
				<div  class="families_detail_dynamic_right">
					<h1 class="families_detail_dynamic_header">用的农机植保知识给你最实用的农机植保知识给你最实用的农机植保知识给你最实用的农机植保知识给你最实用的农机植保知识给你最实用的农机植保知识给用的农机植保知识给你最实用的农机植保知识给你最实用的农机植保知识给你最实用的农机植保知识给你最实用的农机植保知识给你最实用的农机植保知识给</h1>
					<span class="families_detail_dynamic_date">2017-2-2</span>
					<span class="families_detail_dynamic_read">10次阅读</span>
				</div>
			</li>--%>
		</ul> 
	</li>
	<li class="families_detail_content_li" style="display:none">
		<ul class="families_detail_problem_ul">
			<%-- <li class="families_detail_problem_li">
				<div class="families_detail_problem_ask">
					<img alt="" src="${ctx}/images/my_head_small.png" class="families_detail_ask_title">
					<p class="families_detail_problem_ask_txt" id="families_detail_problem_ask_txt">知识你最实用的农机植保知识给你最实用的农机植保知</p>
				</div>
				<div class="families_detail_problem_answer">
					<img alt="" src="${ctx}/images/my_head_small.png" class="families_detail_answer_title">
					<p class="families_detail_problem_answer_txt">你最实用的农机植保知
						<img alt="" src="${ctx}/images/ask_more.png" class="families_detail_problem_ask_desc">
					</p>
				</div>
				
				<img alt="" src="${ctx}/images/to_up.png" style="display:none" class="families_detail_problem_ask_up">
			</li> --%>
			<%-- <li class="families_detail_problem_li">
				<div class="families_detail_problem_ask">
					<img alt="" src="${ctx}/images/my_head_small.png" class="families_detail_ask_title">
					<p class="families_detail_problem_ask_txt">的的最实用的农机植保知</p>
				</div>
				<div class="families_detail_problem_answer">
					<img alt="" src="${ctx}/images/my_head_small.png" class="families_detail_answer_title">
					<p class="families_detail_problem_answer_txt">
						你最实用的农机植保知识给你最实用的农机植保知识给你最实用的农机植保你最实用的农机植保知识给你最实用的农机植保知识给你最你最实用的农机植保知识给你最实用的农机植保知识给你最你最实用的农机植保知识给你最实用的农机植保知识给你最你最实用的农机植保知识给你最实用的农机植保知识给你最知你最实用的农机植保知识给你最实用的农机植保知识给你最实用的农机植保知你最实用的农机植保知识给你最实用的农机植保知识给你最实用的农机植保知你最实用的农机植保知识给你最实用的农机植保知识给你最实用的农机植保知
						<img alt="" src="${ctx}/images/ask_more.png" class="families_detail_problem_ask_desc">
					</p>
				</div>
				<img alt="" src="${ctx}/images/to_up.png" style="display:none" class="families_detail_problem_ask_up">
			</li> --%>
		</ul>
	</li>
</ul>

</body>
</html>