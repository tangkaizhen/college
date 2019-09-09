<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="common.jsp"%>
<title>汉和学院</title>
<style type="text/css">
.my_problem_ul{
   padding: 0 2rem 2rem;
}
.my_problem_li{
	border-bottom: .1rem solid #ccc;
    padding-bottom: 3rem;
    padding-top: 2rem;
}
.my_problem_ask{
    margin-bottom:3rem;
    padding: 1rem 1rem;
}
.my_ask_title{
    width: 5rem;
    height:5rem;
    border-radius:2.5rem;
     float: left;
    margin-right: 3rem;
    margin-top: -.6rem;
}
.my_problem_ask_txt{
    font-size: 2.5rem;
    line-height: 5rem;
    position:relative;
    width: 88%;
    margin-left: 12%;
}

.my_problem_answer{
    padding: 1rem 1rem 0;
    overflow: hidden;
}
.my_answer_title{
    width: 5rem;
    height: 5rem;
    border-radius: 2.5rem;
    float: left;
    margin-right: 3rem;
    margin-top: -.6rem;
}
.my_problem_answer_txt{
    font-size: 2.5rem;
    line-height:5rem;
    position: relative;
    width: 88%;
    margin-left: 12%;
}
/* .my_problem_answer_txt.index{
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical
} */
.my_problem_ask_desc{
    position: absolute;
    right: .6rem;
    top: 2.8rem;
    background: #fff;
    color:#148cd7;
    font-size: 2.4rem;
    width: 5.5rem;
    text-align: center;
}
.my_problem_ask_up{
    margin-left: 50%;
}
.my_problem_ask_name{
    font-size: 2.4rem;
    margin: .1rem 0 1rem;
}
.my_problem_answer_name{
    font-size: 2.4rem;
    margin: .1rem 0 1rem;
}
</style>
<script type="text/javascript">
$(function(){
	var u = navigator.userAgent, app = navigator.appVersion;
    var isAndroid = u.indexOf('Android') > -1 || u.indexOf('Linux') > -1; //g
    if (isAndroid) {
       //这个是安卓操作系统
       $(".my_problem_answer_txt,.my_problem_ask_txt").css("fontSize",14)
    }
	
	$(".my_problem_answer_txt").each(function(i){
		if(countLines(this)<=3){
			$(".my_problem_ask_desc").hide();
		}else{
			$(".my_problem_ask_desc").show();
			$(this).addClass("index");
		}
	});
	
	$(".my_problem_ask_desc").click(function(){
		$(this).hide();
		$(this).parents(".my_problem_li").find(".my_problem_ask_up").show();
		$(this).parents(".my_problem_answer_txt").removeClass("index");
		$(this).parents(".my_problem_li").find(".my_problem_ask_txt").removeClass("index");
	});
	
	$(".my_problem_ask_up").click(function(){
		$(this).parents(".my_problem_li").find(".my_problem_ask_desc").show();
		$(this).hide();
		$(this).parents(".my_problem_li").find(".my_problem_answer_txt").addClass("index");
		$(this).parents(".my_problem_li").find(".my_problem_ask_txt").addClass("index");
	});
	
})
/* 计算行数的 */
function countLines(ele) {
 var styles = window.getComputedStyle(ele, null);
 var lh = parseInt(styles.lineHeight, 10);
 var h = parseInt(styles.height, 10);
 var lc = Math.round(h / lh);
 console.log('line count:', lc, 'line-height:', lh, 'height:', h);
 return lc;
}
</script>
</head>
<body>
<c:choose>
	<c:when test="${empty moments}">
		<div class="pic_empty_img_box pic_empty_img_box1">
			<img alt="" src="${ctx}/images/pic_empty.jpg" class="pic_empty_img">
		</div>
	</c:when>
	
	<c:otherwise>
		<ul class="my_problem_ul">
			<c:forEach items="${moments}" var="moment">
				<li class="my_problem_li">
					<div class="my_problem_ask">
						<c:choose>
							<c:when test="${empty moment.userHeadImg}">
								<img alt="" src="${ctx}/images/my_head_small.png" class="my_ask_title">
							</c:when>
							<c:otherwise>
								<img alt="" src="${ctx}/${moment.userHeadImg}" class="my_ask_title">
							</c:otherwise>
						</c:choose>
						
						<p class="my_problem_ask_name">我</p>
						<p class="my_problem_ask_txt" id="my_problem_ask_txt">${moment.comment}</p>
					</div>
					<div class="my_problem_answer">
						<img alt="" src="${ctx}/${moment.expertHeadImg}" class="my_answer_title">
						<p class="my_problem_answer_name">${moment.expertName}</p>
						<p class="my_problem_answer_txt">${moment.replyContent}
							<%-- <img alt="" src="${ctx}/images/ask_more.png" class="my_problem_ask_desc"> --%>
						</p>
					</div>
		
					<%-- <img alt="" src="${ctx}/images/to_up.png" style="display:none" class="my_problem_ask_up"> --%>
				</li>
			</c:forEach>
		</ul>
	</c:otherwise>
</c:choose>

</body>
</html>