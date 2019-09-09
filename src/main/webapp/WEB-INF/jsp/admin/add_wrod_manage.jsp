<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
<style>
.back_right_box{
    background: #fafafa;
        font-size: 16px;
}
.wrod_header{
    width: 100%;
    border-bottom: 1px solid #ccc;
    font-size: 20px;
    padding: 6px 0 6px 23px;
    background: #fff;
}
.wrod_btn_box{
    font-size: 16px;
    margin-left: 1%;
    margin: 12px 1%;
}
.wrod_btn_back{
	display: inline-block;
    cursor: pointer;
}
.wrod_btn_back_img{
    width: 15px;
    margin-right: 7px;
}
.wrod_btn_back_txt{

}
.add_wrod_manage_content{
	background: #fff;
    width: 98%;
    margin-left: 1%;
    font-size: 20px;
    padding: 3% 15%;
}

.wrod_manage_btn_type_box{
    font-size: 16px;
    display: inline-block;
    border: 1px solid #ccc;
    height: 29px;
    width: 145px;
    margin-right: 24px;
    margin-top: 17px;
    text-align: center;
    border-radius: 4px;
    position: relative;
        cursor: pointer;
    background: url(${ctx}/images/triangle.png) no-repeat 97% center;    
}
.wrod_manage_btn_type_value{
    display: inline-block;
    margin-top: 3px;
    width: 100%;
    text-align: left;
    padding-left: 8%;
}
.wrod_manage_btn_type_ul{
    position: absolute;
    width: 100%;
    border: 1px solid #ccc;
    top: 27px;
    background: #fff;
    z-index: 3;
    display: none;
}
.wrod_manage_btn_type_li{
    border-bottom: 1px solid #ccc;
    line-height: 30px;
}
.wrod_manage_btn_arg_type_box{
        font-size: 16px;
    display: inline-block;
    border: 1px solid #ccc;
    height: 29px;
    width: 145px;
    margin-right: 24px;
    margin-top: 17px;
    text-align: center;
    border-radius: 4px;
    position: relative;
        cursor: pointer;
    background: url(${ctx}/images/triangle.png) no-repeat 97% center;    
}
.wrod_manage_btn_arg_type_value{
    display: inline-block;
    margin-top: 3px;
    width: 100%;
    text-align: left;
    padding-left: 8%;
}
.wrod_manage_btn_arg_type_ul{
    position: absolute;
    width: 100%;
    border: 1px solid #ccc;
    top: 27px;
    background: #fff;
    z-index: 3;
    display: none;
}
.wrod_manage_btn_arg_type_li{
    border-bottom: 1px solid #ccc;
    line-height: 30px;
}
.wrod_manage_btn_iden_type_box{
        font-size: 16px;
    display: inline-block;
    border: 1px solid #ccc;
    height: 29px;
    width: 145px;
    margin-right: 24px;
    margin-top: 17px;
    text-align: center;
    border-radius: 4px;
    position: relative;
        cursor: pointer;
    background: url(${ctx}/images/triangle.png) no-repeat 97% center;    
}
.wrod_manage_btn_iden_type_value{
    display: inline-block;
    margin-top: 3px;
    width: 100%;
    text-align: left;
    padding-left: 8%;
}
.wrod_manage_btn_iden_type_ul{
    position: absolute;
    width: 100%;
    border: 1px solid #ccc;
    top: 27px;
    background: #fff;
    z-index: 3;
    display: none;
}
.wrod_manage_btn_iden_type_li{
    border-bottom: 1px solid #ccc;
    line-height: 30px;
}
.wrod_manage_btn_course_type_box{
        font-size: 16px;
    display: inline-block;
    border: 1px solid #ccc;
    height: 29px;
    width: 145px;
    margin-right: 24px;
    margin-top: 17px;
    text-align: center;
    border-radius: 4px;
    position: relative;
        cursor: pointer;
    background: url(${ctx}/images/triangle.png) no-repeat 97% center;    
    margin-left: 8.3%;
}
.wrod_manage_btn_course_type_value{
    display: inline-block;
    margin-top: 3px;
    width: 100%;
    text-align: left;
    padding-left: 8%;
}
.wrod_manage_btn_course_type_ul{
    position: absolute;
    width: 100%;
    border: 1px solid #ccc;
    top: 27px;
    background: #fff;
    z-index: 3;
    display: none;
}
.wrod_manage_btn_course_type_li{
    border-bottom: 1px solid #ccc;
    line-height: 30px;
}

.wrod_content1{

}
.wrod_content_name{
    width: 10%;
    text-align: right;
    font-size: 20px;
    margin-right: 8px;
}
.wrod_content_value{
	border: 1px solid #ccc;
    font-size: 16px;
    height: 30px;
    border-radius: 4px;
    padding-left: 14px;
    cursor: pointer;
    width: 56%;
}
.wrod_content_publish{
    float: right;
    margin-right: 1%;
}
.wrod_content_publish_name{
    float: right;
    background: #ddd;
    border: 1px solid #ccc;
    width: 21%;
    text-align: center;
    font-size: 16px;
    padding: 3px 0;
}
.wrod_manage_btn_type_box{

}
.wrod_manage_btn_type_value{

}
.wrod_content_header{
	font-size: 20px;
    margin: 33px 0;
}
.wrod_content_ul{

}
.wrod_content_li{
    margin-bottom: 35px;
}
.wrod_content_checkbox{
    width: 20px;
    height: 20px;
    background: #fff;
    cursor: pointer;
    margin-right: 6%;
}

.wrod_content_text{
    border: 1px solid #ccc;
    font-size: 16px;
    height: 30px;
    border-radius: 4px;
    padding-left: 14px;
    cursor: pointer;
    width: 56%;
}

.wrod_content_submit_btn{
    background: #139FD2;
    color: #fff;
    border: none;
    font-size: 16px;
    padding: 4px 10px;
    border-radius: 4px;
    cursor: pointer;
    margin-left: 8.2%;
}
</style>
<script type="text/javascript">
$(function(){
	/* $(".back_nav_li").eq(2).find(".back_article_header").addClass("index");
	$(".back_nav_li").eq(2).find(".back_article_ul").show();
	$(".back_nav_li").eq(2).find(".back_article_li").eq(1).addClass("index"); */
	
	if($.trim($(".wrod_manage_btn_course_type_value").text())=="单选题"||$.trim($(".wrod_manage_btn_course_type_value").text())=="判断题"){
		$(".wrod_content_checkbox").off("click");
		$(".wrod_content_checkbox").each(function(){
			$(this).on("click",function(){
				$(this).parents(".wrod_content_li").siblings().find(".wrod_content_checkbox").prop("checked",false);
			});
		});
	}
	
	$(".add_wrod_manage_type_select_name").click(function(){
		$(".add_wrod_manage_type_select_ul").toggle();
	});
	
	$(".wrod_btn_back").click(function(){
		$("#wrod_home").attr("action","${ctx}/admin/exam/wrod_manage.page").submit();
	});
	
	$(".wrod_manage_btn_type_value").click(function(){
		
		$(".wrod_manage_btn_course_type_ul").hide();
		$(".wrod_manage_btn_iden_type_ul").hide();
		$(".wrod_manage_btn_arg_type_ul").hide();
		
		/* 首先看看身份和机型有没有筛选 */
		if($.trim($(".wrod_manage_btn_iden_type_value").text())=="按身份筛选"){
			reminder_box("请选择身份");
			return;
		}
		if($.trim($(".wrod_manage_btn_arg_type_value").text())=="按机型选择"){
			reminder_box("请选择机型");
			return;
		}
		
		var html='';
		$.ajax({
			   type: "POST",
			   url: "${ctx}/api/getCourseCategories.json",
			   dataType: "json",
			   data: {userTypeId:$(".wrod_manage_btn_iden_type_value").attr("id"),uavTypeId:$(".wrod_manage_btn_arg_type_value").attr("id")},
			   success: function(msg){
				   if(msg.status==1){
					   if(msg.data.length>0){
							   html+='<li class="wrod_manage_btn_type_li" onclick="wrod_manage_btn_type_li(this,0)">全部</li>';
						   for(var i=0;i<msg.data.length;i++){
							   html+='<li class="wrod_manage_btn_type_li" onclick="wrod_manage_btn_type_li(this,'+msg.data[i].id+')">'+msg.data[i].name+'</li>';
							}
						   /* 根据机型和身份查找对应的课程类别 */
							$(".wrod_manage_btn_type_ul").html(html);
							$(".wrod_manage_btn_type_ul").toggle();
					   }else{
						   reminder_box("没有对应的课程！！");
						   return;
					   }
				   }else{
				   }
			   }
			})
			
	});
	
 	$(".wrod_manage_btn_arg_type_value").click(function(){
 		
 		$(".wrod_manage_btn_course_type_ul").hide();
		$(".wrod_manage_btn_iden_type_ul").hide();
		$(".wrod_manage_btn_type_ul").hide();
		$(".wrod_manage_btn_arg_type_ul").toggle();
		
	});
	
	$(".wrod_manage_btn_iden_type_value").click(function(){
		$(".wrod_manage_btn_course_type_ul").hide();
		$(".wrod_manage_btn_type_ul").hide();
		$(".wrod_manage_btn_arg_type_ul").hide();
		$(".wrod_manage_btn_iden_type_ul").toggle();
	});
	$(".wrod_manage_btn_course_type_value").click(function(){
		$(".wrod_manage_btn_iden_type_ul").hide();
		$(".wrod_manage_btn_type_ul").hide();
		$(".wrod_manage_btn_arg_type_ul").hide();
		$(".wrod_manage_btn_course_type_ul").toggle();
	});
	
	/* 如果是试题编辑，根据答案，将对应的答案勾选上 */
	if("${examQuestion}"){
		
		/* 表示是编辑状态 */
		var answer="${examQuestion.answer}";
		var answer_arr=answer.split("");
		for(var i=0;i<answer_arr.length;i++){
			if(answer_arr[i]=="A"){
				$(".wrod_content_checkbox").eq(0).prop("checked",true);
			}else if(answer_arr[i]=="B"){
				$(".wrod_content_checkbox").eq(1).prop("checked",true);
				
			}else if(answer_arr[i]=="C"){
				$(".wrod_content_checkbox").eq(2).prop("checked",true);
				
			}else if(answer_arr[i]=="D"){
				$(".wrod_content_checkbox").eq(3).prop("checked",true);
				
			}
		}
	}
	
	$(".wrod_content_submit_btn").click(function(){
		
		var wrod_content_value=$.trim($(".wrod_content_value").val());
		if(wrod_content_value==""){
			reminder_box("请输入试题名称");
			return;
		}
		var wrod_course_value=$.trim($(".wrod_manage_btn_course_type_value").text());
		if(wrod_course_value=="按题型筛选"){
			reminder_box("请选择题型");
			return;
		}
		var wrod_iden_value=$.trim($(".wrod_manage_btn_iden_type_value").text());
		if(wrod_iden_value=="按身份筛选"){
			reminder_box("请选择身份");
			return;
		}
		var wrod_arg_value=$.trim($(".wrod_manage_btn_arg_type_value").text());
		if(wrod_arg_value=="按机型选择"){
			reminder_box("请选择机型");
			return;
		}
		var wrod_manage_btn_type_value=$.trim($(".wrod_manage_btn_type_value").text());
		if(wrod_manage_btn_type_value=="按课程类别筛选"){
			reminder_box("请选择课程类别");
			return;
		}
		
		/* 这时候判断是判断题还是选择题 */
		var ishasselect=false;
		var isnull=false;
		
		var answer="";
		
		if(wrod_course_value=="判断题"){
			$(".wrod_content_checkbox").slice(0,2).each(function(index){
				if($(this).is(':checked')){
					ishasselect=true;
					if(index==0){
						answer="A";
					}else{
						answer="B";
					}
				}
			});
			
			$(".wrod_content_text").slice(0,2).each(function(){
				if($.trim($(this).val())==""){
					isnull=true;
				}
			});
			
		}else{
			
			$(".wrod_content_checkbox").each(function(index){
				if($(this).is(':checked')){
					ishasselect=true;
					if(index==0){
						answer+="A";
					}else if(index==1){
						answer+="B";
					}else if(index==2){
						answer+="C";
					}else if(index==3){
						answer+="D";
					}
					
				}
			});
			$(".wrod_content_text").each(function(){
				if($.trim($(this).val())==""){
					isnull=true;
				}
			});
		}
		
		if(!ishasselect){
			reminder_box("请选择正确答案");
			return;
		}
		if(isnull){
			reminder_box("请输入完整的选项内容");
			return;
		}
		
		/* 保存试题 */
		var userTypeId =$(".wrod_manage_btn_iden_type_value").attr("id");
		var uavTypeId =$(".wrod_manage_btn_arg_type_value").attr("id");
		var courseCategoryId =$(".wrod_manage_btn_type_value").attr("id");
		var type =$(".wrod_manage_btn_course_type_value").attr("id");
		
		var option1="";
		var option2="";
		var option3="";
		var option4="";
		
		/* 这时候就要分单选多选还是判断 */
		if(wrod_course_value=="判断题"){
			
			option1 =$.trim($(".wrod_content_text").eq(0).val());
			option2 =$.trim($(".wrod_content_text").eq(1).val());
			
		}else{
			
			option1 =$.trim($(".wrod_content_text").eq(0).val());
			option2 =$.trim($(".wrod_content_text").eq(1).val());
			option3 =$.trim($(".wrod_content_text").eq(2).val());
			option4 =$.trim($(".wrod_content_text").eq(3).val());
		}
		
		var data;
		if($.trim($(".question_id").val())==""){
			data = {
					userTypeId: userTypeId,
					uavTypeId: uavTypeId,
					courseCategoryId: courseCategoryId,
					type: type,
		            question: $(".wrod_content_value").val(),
		            option1:option1,
		            option2:option2,
		            option3:option3,
		            option4:option4,
		            answer:answer
				}
		}else{
			data = {
					id:$.trim($(".question_id").val()),
					userTypeId: userTypeId,
					uavTypeId: uavTypeId,
					courseCategoryId: courseCategoryId,
					type: type,
		            question: $(".wrod_content_value").val(),
		            option1:option1,
		            option2:option2,
		            option3:option3,
		            option4:option4,
		            answer:answer
				}
		}
		$.ajax({
            type: "POST",
            url: "${ctx}/admin/exam/saveExamQuestion.json",
            dataType: "json",
            data: data,
            success: function(msg) {
                if(msg.status==1){
                	if($.trim($(".question_id").val())==""){
                		reminder_box("保存成功！");
                	}else{
                		reminder_box("编辑成功！");
                	}
                	setTimeout(function(){
                		location.href="${ctx}/admin/exam/wrod_manage.page";
                	},1500);
                }else{
                		reminder_box(msg.msg);
                }
            }
		});
		
	});
})
function add_wrod_manage_type_select_li(e){
	var wrod_type_value=$.trim($(e).text());
	$(".add_wrod_manage_type_select_name").text(wrod_type_value);
	$(".add_wrod_manage_type_select_ul").toggle();
}

function wrod_manage_btn_type_li(e,id){
	var wrod_manage_type_value=$.trim($(e).text());
	$(".wrod_manage_btn_type_value").text(wrod_manage_type_value).attr("id",id);
	$(".wrod_manage_btn_type_ul").toggle();
	
	if(wrod_manage_type_value=="单选题"||wrod_manage_type_value=="判断题"){
		$(".wrod_content_checkbox").on("click",function(){
			$(this).siblings().prop("checked",false);
		});
	}
}
function wrod_manage_btn_arg_type_li(e,id){
	var wrod_manage_type_value=$.trim($(e).text());
	$(".wrod_manage_btn_arg_type_value").text(wrod_manage_type_value).attr("id",id);
	$(".wrod_manage_btn_arg_type_ul").toggle();
}
function wrod_manage_btn_iden_type_li(e,id){
	var wrod_manage_type_value=$.trim($(e).text());
	$(".wrod_manage_btn_iden_type_value").text(wrod_manage_type_value).attr("id",id);
	$(".wrod_manage_btn_iden_type_ul").toggle();
}
function wrod_manage_btn_course_type_li(e,id){
	$(".wrod_content_checkbox").prop("checked",false);
	
	var wrod_manage_type_value=$.trim($(e).text());
	$(".wrod_manage_btn_course_type_value").text(wrod_manage_type_value).attr("id",id);
	$(".wrod_manage_btn_course_type_ul").toggle();
	
	/* 这时候需要判断是选择题还是判断题 */
	if(wrod_manage_type_value=="判断题"){
		$(".wrod_content_li").eq(2).hide();
		$(".wrod_content_li").eq(3).hide();
	}else{
		$(".wrod_content_li").eq(2).show();
		$(".wrod_content_li").eq(3).show();
	}
	
	if($.trim($(".wrod_manage_btn_course_type_value").text())=="单选题"||$.trim($(".wrod_manage_btn_course_type_value").text())=="判断题"){
		$(".wrod_content_checkbox").off("click");
		$(".wrod_content_checkbox").each(function(){
			$(this).on("click",function(){
				$(this).parents(".wrod_content_li").siblings().find(".wrod_content_checkbox").prop("checked",false);
			});
		});
	}else{
		$(".wrod_content_checkbox").off("click");
	}
	
}
</script>
<form action="" method="post" id="wrod_home">
	<input type="hidden" value="${examQuestion.id}" class="question_id">
	<input type="hidden" value="${examQuestion.answer}" class="question_id">
</form>
<div class="back_right_box">
	<h1 class="wrod_header">试题管理</h1>
	<div class="wrod_btn_box">
		<div class="wrod_btn_back"><img alt="" src="${ctx}/images/icon_back.png" class="wrod_btn_back_img"><span class="wrod_btn_back_txt">返回></span></div>
		<c:choose>
			<c:when test="${empty examQuestion}">
				<span>添加试题</span>
			</c:when>
			<c:otherwise>
				<span>编辑试题</span>
			</c:otherwise>
		</c:choose>
	</div>

	<div class="add_wrod_manage_content">
		<div class="wrod_content1">
			<span class="wrod_content_name">试题名称</span>
			<input type="text" placeholder="请输入试题名称" maxlength="200" value="${examQuestion.question}" class="wrod_content_value">
			<span class="wrod_content_publish_name">超级管理员</span>
			<span class="wrod_content_publish">发布者</span>
		</div>
		
		<div class="wrod_manage_btn_course_type_box">
			<c:choose>
				<c:when test="${empty examQuestion}">
					<span class="wrod_manage_btn_course_type_value">按题型筛选</span>
				</c:when>
				<c:otherwise>
					<c:choose>
						<c:when test="${examQuestion.type==1}">
							<span class="wrod_manage_btn_course_type_value" id="1">单选题</span>
						</c:when>
						<c:when test="${examQuestion.type==2}">
							<span class="wrod_manage_btn_course_type_value" id="2">多选题</span>
						</c:when>
						<c:when test="${examQuestion.type==3}">
							<span class="wrod_manage_btn_course_type_value" id="3">判断题</span>
						</c:when>
						<c:otherwise>
							<span class="wrod_manage_btn_course_type_value" id="1">单选题</span>
						</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>
			<ul class="wrod_manage_btn_course_type_ul">
				<li class="wrod_manage_btn_course_type_li" onclick="wrod_manage_btn_course_type_li(this,1)">单选题</li>
				<li class="wrod_manage_btn_course_type_li" onclick="wrod_manage_btn_course_type_li(this,2)">多选题</li>
				<li class="wrod_manage_btn_course_type_li" onclick="wrod_manage_btn_course_type_li(this,3)">判断题</li>
			</ul>
		</div>
		<div class="wrod_manage_btn_iden_type_box">
			<c:choose>
				<c:when test="${empty examQuestion}">
					<span class="wrod_manage_btn_iden_type_value">按身份筛选</span>
				</c:when>
				<c:otherwise>
					<span class="wrod_manage_btn_iden_type_value" id="${examQuestion.userTypeId}">${examQuestion.userType}</span>
				</c:otherwise>
			</c:choose>
			<ul class="wrod_manage_btn_iden_type_ul">
				<c:forEach items="${userTypes}" var="userType" varStatus="status">
					<li class="wrod_manage_btn_iden_type_li" onclick="wrod_manage_btn_iden_type_li(this,'${userType.id}')">${userType.name}</li>
				</c:forEach>	
			</ul>
		</div>
		<div class="wrod_manage_btn_arg_type_box">
			<c:choose>
				<c:when test="${empty examQuestion}">
					<span class="wrod_manage_btn_arg_type_value">按机型选择</span>
				</c:when>
				<c:otherwise>
					<span class="wrod_manage_btn_arg_type_value" id="${examQuestion.uavTypeId}">${examQuestion.uavType}</span>
				</c:otherwise>
			</c:choose>
			<ul class="wrod_manage_btn_arg_type_ul">
				<c:forEach items="${uavTypes}" var="uavType" varStatus="status">
					<li class="wrod_manage_btn_arg_type_li" onclick="wrod_manage_btn_arg_type_li(this,'${uavType.id}')">${uavType.name}</li>
				</c:forEach>	
			</ul>
		</div>
		<div class="wrod_manage_btn_type_box">
			<c:choose>
				<c:when test="${empty examQuestion}">
					<span class="wrod_manage_btn_type_value">按课程类别筛选</span>
				</c:when>
				<c:otherwise>
					<span class="wrod_manage_btn_type_value" id="${examQuestion.courseCategoryId}">${examQuestion.courseCategory}</span>
				</c:otherwise>
			</c:choose>
			<ul class="wrod_manage_btn_type_ul">
				<c:forEach items="${courseCategories}" var="courseCategory" varStatus="status">
					<li class="wrod_manage_btn_type_li" onclick="wrod_manage_btn_type_li(this,'${courseCategory.id}')">${courseCategory.name}</li>
				</c:forEach>	
			</ul>
		</div>
		
		<h1 class="wrod_content_header">设置选项和正确答案</h1>
		<ul class="wrod_content_ul">
			<li class="wrod_content_li">
				<input type="checkbox" class="wrod_content_checkbox">
				<input type="text" maxlength="100" value="${examQuestion.option1}" class="wrod_content_text" placeholder="请输入选项内容">
			</li>
			<li class="wrod_content_li">
				<input type="checkbox" class="wrod_content_checkbox">
				<input type="text" maxlength="100" value="${examQuestion.option2}" class="wrod_content_text" placeholder="请输入选项内容">
			</li>
			
			<%-- <c:if test="${not empty examQuestion.option3}"> --%>
				<li class="wrod_content_li">
					<input type="checkbox" class="wrod_content_checkbox">
					<input type="text" maxlength="100" value="${examQuestion.option3}" class="wrod_content_text" placeholder="请输入选项内容">
				</li>
				<li class="wrod_content_li">
					<input type="checkbox" class="wrod_content_checkbox">
					<input type="text" maxlength="100" value="${examQuestion.option4}" class="wrod_content_text" placeholder="请输入选项内容">
				</li>
			<%-- </c:if> --%>
		</ul>
		<input type="button" class="wrod_content_submit_btn" value="提交保存">
	</div>
</div>
