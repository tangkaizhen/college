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
	background: #fafafa;
}
.test_result_box{
    text-align: center;
    padding-top: 6rem;
    background: #fff;
    padding-bottom: 2rem;
    margin-bottom: 2rem;
}
.test_result_header{
    font-size: 3.6rem;
    color: #5c5c5c;
    margin-bottom:3rem;
}
.test_result_txt1{
    font-size:2.4rem;
    color: #5c5c5c;
    margin-bottom: 1rem;
}
.test_result_txt2{
    font-size:2.4rem;
    color: #5c5c5c;
    margin-bottom: 4rem;
}
.test_result_txt3{
    font-size: 2.6rem;
    color: #ff0000;
    margin-bottom: 4rem;
}
.test_result_btn{
    color: #148cd7;
    font-size: 2.8rem;
    border: .1rem solid#148cd7;
    width: 24rem;
    height: 5rem;
    line-height: 5rem;
    border-radius: 3.2rem;
    display: inline-block;
}

.test_result_error{
    background: #fff;
    padding: 0 1rem;
}
.test_result_error_header{
    font-size: 2.6rem;
    padding: 1rem 0 1rem 2rem;
}
.test_result_error_ul{

}
.test_result_li{
    border-top: .1rem solid #ccc;
    padding: 4rem 3rem 4rem 3rem;
    line-height: 3rem;
    font-size: 1.6rem;
}
.test_result_error_header_box{
}
.error_num{
}
.error_type{
    color: #148cd7;
}
.error_content{
}
.test_result_header.index{
    color:#148cd7;
}
.error_option_li{
    padding-left: 5rem;
    line-height: 6rem;
    background: url(${ctx}/images/icon_selected_no.png) no-repeat left center;
}
.error_option_li.multiple{
    padding-left: 5rem;
    line-height: 6rem;
    background: url(${ctx}/images/icon_selected_no2.png) no-repeat left center;
}

.error_option_li.index1{
    background: url(${ctx}/images/icon_selected_yes.png) no-repeat left center;
}
.error_option_li.multiple.index1{
    background: url(${ctx}/images/icon_selected_yes2.png) no-repeat left center;
}

.error_option_li.index2{
    background: url(${ctx}/images/icon_selected_wrong.png) no-repeat left center;
}

.error_option_li.multiple.index2{
    background: url(${ctx}/images/icon_selected_wrong2.png) no-repeat left center;
}
.test_result_back{
	color:#148cd7;
    display: inline-block;
}
.error_option_ul{
	font-size: 1.9rem;
}
</style>

<script type="text/javascript">
var u = navigator.userAgent, app = navigator.appVersion;
var isAndroid = u.indexOf('Android') > -1 || u.indexOf('Linux') > -1; //g
$(function(){
	if (isAndroid) {
		$(".test_result_li").css("fontSize","1.6rem");
		$(".test_result_error_header").css("fontSize","2rem");
	}
	
	$.ajax({
		   type: "POST",
		   url: "${ctx}/wechat/api/handInExamPaper.json",
		   dataType: "json",
		   data: {userId:"${user.id}",examPaperId:"${examPaperId}",costTime:"${costTime}",records:"${records}"},
		   success: function(msg){
				   console.log(msg);
			   if(msg.status==1){
				   $(".test_result_outter_box").show();
				   $(".userTypeId").val(msg.data.userTypeId);
				   $(".uavTypeId").val(msg.data.uavTypeId);
				   
				   if(msg.data.success){
					   $(".test_result_header").text("考试通过").addClass("index");
				   }else{
					   $(".test_result_header").text("考试未通过").removeClass("index");
				   }
				   
				   $(".test_result_txt1").text("共"+msg.data.totalNum+"道题");
				   $(".test_result_txt2").text("答对"+msg.data.passNum+"道题");
				   $(".exam_id").val(msg.data.examId);
				   
				   var question_list=msg.data.questionList;
				   var html='';
				   if(question_list.length>0){
					
				   for(var i=0;i<question_list.length;i++){
					   
					   html+='<li class="test_result_li" id='+question_list[i].questionId+'>';
					   html+='<div class="test_result_error_header_box">';
					   html+='<span class="error_num">'+question_list[i].questionNumber+',</span>';
					   if(question_list[i].examQuestion.type==1){
						   html+='<span class="error_type">[单选题]</span>';
						   html+='<span class="error_content">'+question_list[i].examQuestion.question+'?</span>';
						   html+='</div>';
						   html+='<ul class="error_option_ul">';
						   html+='<li class="error_option_li">';
						   html+=question_list[i].examQuestion.option1;
						   html+='</li>';
						   html+='<li class="error_option_li">';
						   html+=question_list[i].examQuestion.option2;
						   html+='</li>';
						   html+='<li class="error_option_li">';
						   html+=question_list[i].examQuestion.option3;
						   html+='</li>';
						   html+='<li class="error_option_li">';
						   html+=question_list[i].examQuestion.option4;
						   html+='</li>';
						   html+='</ul>';
					   }else if(question_list[i].examQuestion.type==2){
						   html+='<span class="error_type">[多选题]</span>';
						   html+='<span class="error_content">'+question_list[i].examQuestion.question+'?</span>';
						   html+='</div>';
						   html+='<ul class="error_option_ul">';
						   html+='<li class="error_option_li multiple">';
						   html+=question_list[i].examQuestion.option1;
						   html+='</li>';
						   html+='<li class="error_option_li multiple">';
						   html+=question_list[i].examQuestion.option2;
						   html+='</li>';
						   html+='<li class="error_option_li multiple">';
						   html+=question_list[i].examQuestion.option3;
						   html+='</li>';
						   html+='<li class="error_option_li multiple">';
						   html+=question_list[i].examQuestion.option4;
						   html+='</li>';
						   html+='</ul>';
					   }else if(question_list[i].examQuestion.type==3){
						   html+='<span class="error_type">[判断题]</span>';
						   html+='<span class="error_content">'+question_list[i].examQuestion.question+'?</span>';
						   html+='</div>';
						   html+='<ul class="error_option_ul">';
						   html+='<li class="error_option_li">';
						   html+=question_list[i].examQuestion.option1;
						   html+='</li>';
						   html+='<li class="error_option_li">';
						   html+=question_list[i].examQuestion.option2;
						   html+='</li>';
						   html+='</ul>';
					   }
					   html+='</li>';
				   }
				   
				   }
				   
				   $(".test_result_error_ul").html(html);
				   
				   for(var j=0;j<question_list.length;j++){
					   var q_id=question_list[j].questionId;
					   var userAnswer=question_list[j].userAnswer;
					   var answer=question_list[j].examQuestion.answer;
					   console.log(question_list[j].examQuestion.type);
					   $(".test_result_li").each(function(){
						   if($(this).attr("id")==q_id){
							   /* 开始赋值用户的选中的答案 */
							   if(userAnswer!=''){
								   /* 首先对答案进行拆分 */
								   var userAnswer_arr=userAnswer.split("");
									for(var k=0;k<userAnswer_arr.length;k++){
										
										if(userAnswer_arr[k]=='A'){
											$(this).find(".error_option_li").eq(0).addClass("index2")
										}else if(userAnswer_arr[k]=='B'){
											$(this).find(".error_option_li").eq(1).addClass("index2")
										}else if(userAnswer_arr[k]=='C'){
											$(this).find(".error_option_li").eq(2).addClass("index2")
										}else if(userAnswer_arr[k]=='D'){
											$(this).find(".error_option_li").eq(3).addClass("index2")
										}
										
										
									}
								   
							   }
							   
							   /* 开始赋值正确的答案 */
							   /* 首先对答案进行拆分 */
							   var answer_arr=answer.split("");
								for(var k=0;k<answer_arr.length;k++){
									if(answer_arr[k]=='A'){
										$(this).find(".error_option_li").eq(0).removeClass("index2").addClass("index1")
									}else if(answer_arr[k]=='B'){
										$(this).find(".error_option_li").eq(1).removeClass("index2").addClass("index1")
									}else if(answer_arr[k]=='C'){
										$(this).find(".error_option_li").eq(2).removeClass("index2").addClass("index1")
									}else if(answer_arr[k]=='D'){
										$(this).find(".error_option_li").eq(3).removeClass("index2").addClass("index1")
									}
								}
						   }
					   });
				   }
			   }else{
				   
			   }
		   }
	})
	
	$(".test_result_btn").click(function(){
	    var repeat = '${repeat}'?'${repeat}':0;
	    $(".repeat").val(parseInt(repeat)+1);
		$("#text_home").attr("action","${ctx}/wechat/test").submit();
	});
	$(".test_result_back").click(function(){
		$("#text_home").attr("action","${ctx}/wechat/exams").submit();
	});

	/* 监听返回键 */
	pushHistory();
    window.addEventListener("popstate", function(e) {  //回调函数中实现需要的功能
        var repeat = '${repeat}'?'${repeat}':0;
        // 回退记录：(repeat+1)*2+repeat
        history.go(-(3*parseInt(repeat)+2));
    }, false);
})
</script>
</head>
<body>
<form action="${ctx}/wechat/" id="text_home" method="get">
	<input type="hidden" name="id" class="exam_id">
	<input type="hidden" name="userTypeId" class="userTypeId">
	<input type="hidden" name="uavTypeId" class="uavTypeId">
	<input type="hidden" value="${examPaperId}" name="examPaperId" class="examPaper_id">
	<input type="hidden" value="${setTime}" name="setTime" class="set_time">
	<input type="hidden" value="${costTime}" name="costTime" class="costTime">
	<input type="hidden" value="${records}" name="records" class="records">
	<input type="hidden" value="${repeat}" name="repeat" class="repeat">
</form>
<div class="test_result_outter_box" style="display:none">
<div class="test_result_box">
	<p class="test_result_header">考试未通过</p>
	<p class="test_result_txt1"></p>
	<p class="test_result_txt2"></p>
	<span class="test_result_btn">重新测试</span>
</div>

<div class="test_result_error">
	<h1 class="test_result_error_header">错题解析</h1>
	<ul class="test_result_error_ul">
		<!-- <li class="test_result_li">
			<div class="test_result_error_header_box">
				<span class="error_num">1</span>,
				<span class="error_type">[单选题]</span>
				<span class="error_content">sfvfsvdfbdgfbdfbdfbv?</span>
			</div>
			<ul class="error_option_ul">
				<li class="error_option_li">
						选项一号
				</li>
				<li class="error_option_li">
						选项二号
				</li>
				<li class="error_option_li index1">
						选项三号
				</li>
				<li class="error_option_li index2">
						选项四号
				</li>
			</ul>
		</li> -->
	</ul>
</div>
</div>
</body>
</html>