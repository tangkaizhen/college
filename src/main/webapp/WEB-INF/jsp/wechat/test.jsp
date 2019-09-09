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
.test_top{
    height: 8rem;
    line-height: 8rem;
    font-size: 2.4rem;
    padding-left: 4rem;
    background: #fff;
}
.test_time{

}
.test_time_value{

}
.exercises_li_header{
	font-size: 2.7rem;
	max-height: 100000rem;
}
.test_submit{
    background:#148cd7;
    color: #fff;
    text-align: center;
    width: 10rem;
    display: inline-block;
    height: 5rem;
    line-height: 5rem;
    float: right;
    margin-top: 1.3rem;
    margin-right: 3rem;
}
.test_btn_ul{
    position: fixed;
    bottom: 0;
    background: #eee;
    border-top: .1rem solid #ccc;
    width: 100%;
    padding: 1rem 0;
    overflow: hidden;
}
.test_btn_li{
    float: left;
    width: 33.3%;
    text-align: center;
    font-size: 2.8rem;
    color: rgb(92,92,92);
    border-right: .1rem solid #ccc;
    padding: 1rem 0;
}
.test_btn_li.index{
	color:#148cd7
}
.test_btn_li.num{

}

.test_btn_li_img{
    float: left;
    margin-left: 13%;
    margin-top: -.4rem;
}
.exercises_ul{
    background: #fff;
    margin-top: 2rem;
    padding-left: 4rem;
    font-size: 2.8rem;
}
.exercises_li{
	padding: 2rem 0;
}
.exercises_li_index{
    margin-right: 1rem;
}
.exercises_li_type{
    color:#148cd7;
    margin-left: 1rem;
}
.exercises_li_content{
    line-height: 4rem;
}
.exercises_answer_ul{
    margin-top: 3rem;
    font-size: 2.5rem;
}
.exercises_answer_li{
	background: url(${ctx}/images/icon_selected_no.png) no-repeat left center;
	padding-left: 4.5rem;
    margin-bottom: 4rem;
    font-size: 2.4rem;
    max-height: 4000000rem;
    line-height: 4rem;
}
.exercises_answer_li.multiple{
	background: url(${ctx}/images/icon_selected_no2.png) no-repeat left center;
	padding-left: 4.5rem;
    margin-bottom: 4rem;
    font-size: 2.4rem;
    max-height: 4000000rem;
    line-height: 4rem;
}
.exercises_answer_li.index{
	background: url(${ctx}/images/icon_selected_yes.png) no-repeat left center;
}

.exercises_answer_li.multiple.index{
	background: url(${ctx}/images/icon_selected_yes2.png) no-repeat left center;
	padding-left: 4.5rem;
    margin-bottom: 4rem;
    font-size: 2.4rem;
    height: 4rem;
    line-height: 4rem;
}
</style>
<script type="text/javascript">
$(function(){
	$.ajax({
		   type: "POST",
		   url: "${ctx}/wechat/api/startTest.json",
		   dataType: "json",
		   data: {examId:'${examId}'},
		   success: function(msg){
			   if(msg.status==1){
				   console.log(msg);
				   $(".test_box").show()
				   
				   /* setTime是以分钟作为单位的 */
				   var setTime=msg.data.setTime;
				   setTime=setTime*60;
				   countDown(setTime);
				   
				   $(".examPaper_id").val(msg.data.id);
				   $(".set_time").val(msg.data.setTime);
				   
				   var questionList=msg.data.questionList;
				   if(questionList.length>0){
					   /* 进行底部的样式初始化 */
					   $('.test_btn_li_index').show();
					   $(".page_index").text("1");
					   $(".page_total").text(questionList.length);
					   if(questionList.length>1){
						   $(".test_btn_li.next").addClass("index");
					   }
					   
					   var html='';
					   for(var i=0;i<questionList.length;i++){
						   console.log(questionList);
						   
						   /* 开始添加考题 */
						   
						   if(i==0){
							   html+='<li class="exercises_li" id="'+questionList[i].examQuestion.id+'">';
						   }else{
							   html+='<li class="exercises_li" id="'+questionList[i].examQuestion.id+'" style="display:none">';
						   }
						   
						   html+='<p class="exercises_li_header"><span class="exercises_li_index">'+(i+1)+'</span>、<span class="exercises_li_type">';
						   if(questionList[i].examQuestion.type==1){
							   html+='[单选题]';
						   }else if(questionList[i].examQuestion.type==2){
							   html+='[多选题]';
						   }else if(questionList[i].examQuestion.type==3){
							   html+='[判断题]';
						   }
						   html+='</span><span class="exercises_li_content">'+questionList[i].examQuestion.question+'</span></p>';
						   html+='<ul class="exercises_answer_ul">';
						   if(questionList[i].examQuestion.type==3){
							   /* 表示判断题 */
							   html+='<li class="exercises_answer_li" onclick="exercises_answer_li(this,3)">'+questionList[i].examQuestion.option1+'</li>';
							   html+='<li class="exercises_answer_li" onclick="exercises_answer_li(this,3)">'+questionList[i].examQuestion.option2+'</li>';
						   }else if(questionList[i].examQuestion.type==2){
							   /* 多选 */
							   html+='<li class="exercises_answer_li multiple" onclick="exercises_answer_li(this,2)">'+questionList[i].examQuestion.option1+'</li>';
							   html+='<li class="exercises_answer_li multiple" onclick="exercises_answer_li(this,2)">'+questionList[i].examQuestion.option2+'</li>';
							   html+='<li class="exercises_answer_li multiple" onclick="exercises_answer_li(this,2)">'+questionList[i].examQuestion.option3+'</li>';
							   html+='<li class="exercises_answer_li multiple" onclick="exercises_answer_li(this,2)">'+questionList[i].examQuestion.option4+'</li>';
						   }else if(questionList[i].examQuestion.type==1){
							   /* 单选 */
							   html+='<li class="exercises_answer_li" onclick="exercises_answer_li(this,1)">'+questionList[i].examQuestion.option1+'</li>';
							   html+='<li class="exercises_answer_li" onclick="exercises_answer_li(this,1)">'+questionList[i].examQuestion.option2+'</li>';
							   html+='<li class="exercises_answer_li" onclick="exercises_answer_li(this,1)">'+questionList[i].examQuestion.option3+'</li>';
							   html+='<li class="exercises_answer_li" onclick="exercises_answer_li(this,1)">'+questionList[i].examQuestion.option4+'</li>';
						   }
						   html+='</ul>';
						   html+='</li>';
					   }
					   $(".exercises_ul").html(html);
				   }
				   
			   }else{
				   reminder_box(msg.msg);
			   }
		   }
	})
	$(".exercises_answer_li").click(function(){
		$(this).addClass("index").siblings().removeClass("index");
	});
	$(".confirm_box_close,.confirm_li.cancel").click(function(){
		$(".bg").hide();
		$(".confirm_box").hide();
	});
	
	$(".test_btn_li").click(function(){
		var value=$.trim($(this).text());
		
		if(value=='上一题'){
			if(1*$.trim($(".page_index").text())>2){
				/* 表示可以点击 */
				$(".exercises_li").eq(1*$.trim($(".page_index").text())-2).show().siblings().hide();
				$(".page_index").text(1*$.trim($(".page_index").text())-1);
			}else if(1*$.trim($(".page_index").text())>1){
				/* 这时候表示第二题 */
				$(".exercises_li").eq(1*$.trim($(".page_index").text())-2).show().siblings().hide();
				$(".page_index").text(1*$.trim($(".page_index").text())-1);
				$(this).removeClass("index");
			}else{
				$(this).removeClass("index");
				reminder_box("已经到达第一题");
			}
			
			if(1*$.trim($(".page_index").text())<1*$.trim($(".page_total").text())){
				$(".next").addClass("index");
			}
			
		}else if(value=='下一题'){
			if(1*$.trim($(".page_total").text())>1){
				$(".fore").addClass("index");
			}
			
			if(1*$.trim($(".page_index").text())<1*$.trim($(".page_total").text())){
				$(".exercises_li").eq(1*$.trim($(".page_index").text())).show().siblings().hide();
				$(".page_index").text(1*$.trim($(".page_index").text())+1);
				$(this).addClass("index");
				
				if(1*$.trim($(".page_index").text())==1*$.trim($(".page_total").text())){
					$(this).removeClass("index");
				}
			}else if(1*$.trim($(".page_index").text())==1*$.trim($(".page_total").text())){
				$(this).removeClass("index");
				reminder_box("已经到达最后一题");
			}
		}	
	});
	
	
	/* 这是点击交卷时候 */
	$(".test_submit").click(function(){
		
		/* 首先检查是否全部做完 */
		var notCompleteNum=0;
		$(".exercises_li").each(function(){
			var Choose=false;
			$(this).find(".exercises_answer_li").each(function(){
				if($(this).hasClass("index")){
					Choose=true;
				}
			});
			
			if(!Choose){
				notCompleteNum++;
			}
		})
		
		$(".bg").show();
		$(".confirm_box").show();
		if(1*notCompleteNum>0){
			/* 表示还有题目还没做完 */
			$(".confirm_header").text("您还有"+notCompleteNum+"道题还没有做完，确定提交？")
		}else{
			/* 全部做完 */
			$(".confirm_header").text("确定交卷吗？")			
		}
		
		$(".confirm_li.confirm").on("click",function(){
			/* 计算用了多少秒 */
			var total_time=1*$.trim($(".set_time").val())*60;
			var residue_time_arr=$.trim($(".test_time_value").text()).split(":");
			var residue_time=60*60*residue_time_arr[0]+60*residue_time_arr[1]+1*residue_time_arr[2];
			
			var cost_time=total_time-residue_time;
			$(".costTime").val(cost_time);
			
			joint_answer();
			$("#test").attr("action","${ctx}/wechat/testResult").submit();
		});
		
		/* 开始跳转 */
	});
	
	/* 监听返回键 */
	pushHistory(); 
	window.addEventListener("popstate", function(e) {
		
			if(location.href.indexOf("uavTypeId")>-1){
				/* 从重新考试过来 */
				var userTypeId=0;
				var uavTypeId=0;
				var param_arr1=location.href.split("&");
							
				for(var i=0;i<param_arr1.length;i++){
					var param_arr2=param_arr1[i].split("=");
					if(param_arr2[0]=="userTypeId"){
						userTypeId=param_arr2[1]
					}
					if(param_arr2[0]=="uavTypeId"){
						uavTypeId=param_arr2[1]
					}
				}
				
				$(".userTypeId").val(userTypeId);
				$(".uavTypeId").val(uavTypeId);
				history.go(-5);
				
				//$("#test").attr("action","${ctx}/wechat/exams").submit();
				
			}else{
				/* 从考试大类过来 */
				history.go(-1);
			}
	}, false);
	
})

/* 拼接和计算答案 */
function joint_answer(){
	
	/* 拼接答案 */
	var records='';
	$(".exercises_li").each(function(){
		records+=$(this).attr("id")+'-';
		$(this).find(".exercises_answer_li").each(function(){
			if($(this).hasClass("index")){
				if($(this).index()==0){
					records+='A';
				}else if($(this).index()==1){
					records+='B';
				}else if($(this).index()==2){
					records+='C';
				}else if($(this).index()==3){
					records+='D';
				}
			}
		});
			records+=',';
	});
	records=records.substring(0,records.length-1);
	$(".records").val(records);
}
//单纯分钟和秒倒计时
//带天数的倒计时
function countDown(times){
  var timer=null;
  timer=setInterval(function(){
    var hour=0,
      minute=0,
      second=0;//时间默认值
    if(times > 0){
      hour = Math.floor(times / (60 * 60));
      minute = Math.floor(times / 60) - (hour * 60);
      second = Math.floor(times) - (hour * 60 * 60) - (minute * 60);
    }else{
    	clearInterval(timer);
    }
    if (hour <= 9) hour = '0' + hour;
    if (minute <= 9) minute = '0' + minute;
    if (second <= 9) second = '0' + second;
    //
    $(".test_time_value").text(hour+":"+minute+":"+second);
    if(hour==0&&minute==0&&second==0){
    	$(".costTime").val(1*$.trim($(".set_time").val())*60);
    	joint_answer();
    	$("#test").attr("action","${ctx}/wechat/testResult").submit();
    }
    times--;
  },1000);
}

function exercises_answer_li(e,type){
	if(type==2){
		$(e).toggleClass("index");
	}else{
		$(e).toggleClass("index");
		if($(e).hasClass("index")){
			$(e).siblings().removeClass("index");
		}
	}
}
</script>
</head>
<body>
<form action="${ctx}/wechat/" id="test">
	<input type="hidden" value="${examPaperId}" name="examPaperId" class="examPaper_id">
	<input type="hidden" value="${setTime}" name="setTime" class="set_time">
	<input type="hidden" value="${costTime}" name="costTime" class="costTime">
	<input type="hidden" value="${records}" name="records" class="records">
	
	<input type="hidden" value="${repeat}" name="repeat">
	
	<input type="hidden" name="userTypeId" class="userTypeId">
	<input type="hidden" name="uavTypeId" class="uavTypeId">
</form>

<div class="test_box" style="display:none">
<div class="test_top">
	<span class="test_time">考试剩余时间：<span class="test_time_value">00:00:00</span></span>
	<span class="test_submit">交卷</span>
</div>

<ul class="exercises_ul">
	<!-- <li class="exercises_li">
		<p class="exercises_li_header"><span class="exercises_li_index">1</span>,<span class="exercises_li_type">[单选题]</span><span class="exercises_li_content">单选题单选题单选题单选题单选题单选题单选题单选题？</span></p>
		<ul class="exercises_answer_ul">
			<li class="exercises_answer_li index">选项一号</li>
			<li class="exercises_answer_li">选项二号</li>
			<li class="exercises_answer_li">选项三号</li>
			<li class="exercises_answer_li">选项四号</li>
		</ul>
	</li> -->
</ul>
<ul class="test_btn_ul">

	<li class="test_btn_li fore">
		上一题
	</li>
	<li class="test_btn_li next">
		下一题
	</li>
	
	<li class="test_btn_li num">
		<%--<img alt="" src="${ctx}/images/icon_amount.png" class="test_btn_li_img">--%>
		<span class="test_btn_li_index" style="display:none"><span class="page_index"></span>/<span class="page_total"></span>题</span>
	</li>
</ul>
</div>
</body>
</html>