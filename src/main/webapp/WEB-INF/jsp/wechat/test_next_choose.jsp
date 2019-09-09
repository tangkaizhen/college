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
.test_next_li{
    margin-bottom: 1.6rem;
    height: 22rem;
    padding-left: 8rem;
}
.test_next_li.index1{
	background: url(${ctx}/images/test_1.jpg) no-repeat center center;
	background-size:100%
}
.test_next_li.index2{
	background: url(${ctx}/images/test_2.jpg) no-repeat center center;
	background-size:100%
}
.test_next_li.index3{
	background: url(${ctx}/images/test_3.jpg) no-repeat center center;
	background-size:100%
}
.test_next_li.index4{
	background: url(${ctx}/images/test_4.jpg) no-repeat center center;
	background-size:100%
}
.test_next_name{
    font-size: 3.6rem;
    margin-bottom: 2rem;
    padding-top: 5rem;
}
.test_next_num{
    font-size: 2.4rem;
    color: #5c5c5c;
    margin-right: 3rem;
}
.test_next_time{
    font-size: 2.4rem;
    color: #5c5c5c;
}
.test_next_pass{
    font-size: 2.4rem;
    color: #5c5c5c;
    margin-top: 2rem;
}
.test_next_pass.index{
    color:#148cd7;
}
</style>
<script type="text/javascript">
$(function(){
	$(".test_next_li").each(function(){
		var li_background_index=($(this).index()+1)%4;
		if(li_background_index==1){
			$(this).addClass("index1");
		}else if(li_background_index==2){
			$(this).addClass("index2");
		}else if(li_background_index==3){
			$(this).addClass("index3");
		}else if(li_background_index==0){
			$(this).addClass("index4");
		}
	});
	
	
})
function test_next_li(e,id){
	$.ajax({
		   type: "POST",
		   url: "${ctx}/wechat/api/checkExam.json",
		   dataType: "json",
		   data: {examId:id},
		   success: function(msg){
			   if(msg.status==1){
						if($.trim($(e).find(".test_next_name").text())=="综合测试"){
							/* 这是综测 */
							/* 首先要判断每个单元测试是不是通过 */
							var isPass=true;
							$(".test_next_li").each(function(){
								if($.trim($(this).find(".test_next_name").text())!="综合测试"){
									if($.trim($(this).find(".test_next_pass").text())=="未通过测试"){
										isPass=false;
									}
								}
							});
							
							if(isPass){
								$(".paper_id").val(id);
								$("#test_next").attr("action","${ctx}/wechat/test").submit();
							}else{
								reminder_box("还有单元测试未完成，请先完成单元测试");
								return;
							}
							
						}else{
							/* 这是单元测试 */
							$(".paper_id").val(id);
							$("#test_next").attr("action","${ctx}/wechat/test").submit();
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
<form action="${ctx}/wechat/" method="get" id="test_next">
	<input type="hidden" name="id" class="paper_id">
	<!-- <input type="hidden" name="id" class="paper_id">
	<input type="hidden" name="id" class="paper_id"> -->
</form>
<ul class="test_next_ul">
	<c:forEach items="${exams}" var="exam" varStatus="index">
		<c:choose>
			<c:when test="${exam.courseCategory=='综合测试'}">
				<li class="test_next_li" onclick="test_next_li(this,'${exam.id}')" exam_id="${exam.id}">
					<h1 class="test_next_name">${exam.courseCategory}</h1>
					<span class="test_next_num">题数：${exam.totalCount}题</span>
					<span class="test_next_time">时长：${exam.setTime}min</span>
					<c:choose>
						<c:when test="${exam.passExam}">
							<p class="test_next_pass index">已通过测试</p>
						</c:when>
						<c:otherwise>
							<p class="test_next_pass">未通过测试</p>
						</c:otherwise>
					</c:choose>
				</li>
			</c:when>
			<c:otherwise>
				<li class="test_next_li" onclick="test_next_li(this,'${exam.id}')" exam_id="${exam.id}">
					<h1 class="test_next_name">${exam.courseCategory}</h1>
					<span class="test_next_num">题数：${exam.totalCount}题</span>
					<span class="test_next_time">时长：${exam.setTime}min</span>
					<c:choose>
						<c:when test="${exam.passExam}">
							<p class="test_next_pass index">已通过测试</p>
						</c:when>
						<c:otherwise>
							<p class="test_next_pass">未通过测试</p>
						</c:otherwise>
					</c:choose>
				</li>
			</c:otherwise>
		</c:choose>
		
	</c:forEach>	
</ul>
</body>
</html>