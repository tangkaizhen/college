<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
<style>
.back_right_box{
    background: #fafafa;
        font-size: 16px;
}
.paper_header{
    width: 100%;
    border-bottom: 1px solid #ccc;
    font-size: 20px;
    padding: 6px 0 6px 23px;
    background: #fff;
}
.paper_btn_box{
    font-size: 16px;
    margin-left: 1%;
    margin: 12px 1%;
}
.paper_btn_back{
	display: inline-block;
    cursor: pointer;
}
.paper_btn_back_img{
    width: 15px;
    margin-right: 7px;
}
.paper_btn_back_txt{

}
.add_paper_manage_content{
	background: #fff;
    width: 98%;
    margin-left: 1%;
    font-size: 20px;
}

.paper_manage_btn_type_box{
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
.paper_manage_btn_type_value{
    display: inline-block;
    margin-top: 3px;
    width: 100%;
    text-align: left;
    padding-left: 8%;
        overflow-x: hidden;
    white-space: nowrap;
}
.paper_manage_btn_type_ul{
    position: absolute;
    width: 100%;
    border: 1px solid #ccc;
    top: 27px;
    background: #fff;
    z-index: 3;
    display: none;
}
.paper_manage_btn_type_li{
    border-bottom: 1px solid #ccc;
    line-height: 30px;
}
.paper_manage_btn_arg_type_box{
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
.paper_manage_btn_arg_type_value{
    display: inline-block;
    margin-top: 3px;
    width: 100%;
    text-align: left;
    padding-left: 8%;
     overflow-x: hidden;
    white-space: nowrap;
}
.paper_manage_btn_arg_type_ul{
    position: absolute;
    width: 100%;
    border: 1px solid #ccc;
    top: 27px;
    background: #fff;
    z-index: 3;
    display: none;
}
.paper_manage_btn_arg_type_li{
    border-bottom: 1px solid #ccc;
    line-height: 30px;
}
.paper_manage_btn_iden_type_box{
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
.paper_manage_btn_iden_type_value{
    display: inline-block;
    margin-top: 3px;
    width: 100%;
    text-align: left;
    padding-left: 8%;
    overflow-x: hidden;
    white-space: nowrap;
}
.paper_manage_btn_iden_type_ul{
    position: absolute;
    width: 100%;
    border: 1px solid #ccc;
    top: 27px;
    background: #fff;
    z-index: 3;
    display: none;
}
.paper_manage_btn_iden_type_li{
    border-bottom: 1px solid #ccc;
    line-height: 30px;
}
.paper_manage_btn_course_type_box{
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
    margin-left: 7.7%;
        top: -4px;
}
.paper_manage_btn_course_type_value,.paper_manage_btn_course_type_value1{
    display: inline-block;
    margin-top: 3px;
    width: 100%;
    text-align: left;
    padding-left: 8%;
}
.paper_manage_btn_course_type_ul{
    position: absolute;
    width: 100%;
    border: 1px solid #ccc;
    top: 27px;
    background: #fff;
    z-index: 3;
    display: none;
}
.paper_manage_btn_course_type_li{
    border-bottom: 1px solid #ccc;
    line-height: 30px;
}

.paper_content1{
    margin-bottom: 20px;
}
.paper_content_name{
    width: 10%;
    text-align: right;
    font-size: 20px;
    margin-right: 8px;
}
.paper_content_value{
	border: 1px solid #ccc;
    font-size: 16px;
    height: 30px;
    border-radius: 4px;
    padding-left: 14px;
    cursor: pointer;
    width: 56%;
}
.paper_content_publish{
    float: right;
    margin-right: 1%;
}
.paper_content_publish_name{
    float: right;
    background: #ddd;
    border: 1px solid #ccc;
    width: 21%;
    text-align: center;
    font-size: 16px;
    padding: 3px 0;
}
.paper_manage_btn_type_box{

}
.paper_manage_btn_type_value{

}
.paper_content_header{
	font-size: 20px;
    margin: 33px 0;
}

.paper_content_submit_btn{
    background: #139FD2;
    color: #fff;
    border: none;
    font-size: 16px;
    padding: 4px 10px;
    border-radius: 4px;
    cursor: pointer;
    margin-left: 27%;
    width: 15%;
    margin-bottom: 21px;
}
.paper_content_submit_btn.index{
	background:#ccc
}
.paper_content_header{
    font-size: 16px;
    margin: 20px 0;
    background: #D3F3FF;
    color: #000;
    font-weight: bold;
    padding: 7px 0 18px 11px;
}
.add_paper_manage_inner_content{
    padding: 0 15%;
}
.paper_content_box{

}
.paper_content_time{
    border: 1px solid #ccc;
    font-size: 16px;
    height: 30px;
    border-radius: 4px;
    padding-left: 14px;
    cursor: pointer;
    width: 14%;
    margin-right: 12px;
}
.paper_content_num,.paper_content_num2,.paper_content_num3{
    margin-right: 15px;
}
.paper_content_num_value,.paper_content_num_value2,.paper_content_num_value3{
	border: 1px solid #ccc;
    font-size: 16px;
    height: 30px;
    border-radius: 4px;
    padding-left: 14px;
    cursor: pointer;
    width: 14%;
    margin-right: 12px;
}
.paper_content_grade{
	margin-right: 14px;
}
.paper_content_grade_value{
    border: 1px solid #ccc;
    font-size: 16px;
    height: 30px;
    border-radius: 4px;
    padding-left: 14px;
    cursor: pointer;
    width: 14%;
    margin-right: 12px;
}
.paper_content_qualified_value{
    border: 1px solid #ccc;
    font-size: 16px;
    height: 30px;
    border-radius: 4px;
    padding-left: 14px;
    cursor: pointer;
    width: 14%;
    float: right;
}
.paper_content_qualified{
    float: right;
    margin-right: 11px;
}

.paper_content_add_btn{
    background: #ccc;
    color: #fff;
    border: none;
    font-size: 16px;
    padding: 4px 10px;
    border-radius: 4px;
    cursor: pointer;
    margin-left: 8.2%;
    width: 15%;
}
.paper_content_add_btn.index{
    background:#FF9800;
}
.paper_manage_btn_box{
	margin-top: 40px;
}
.add_paper_manage_inner_content1,.add_paper_manage_inner_content2{
    padding: 0 1%;
    margin-bottom: 30px;
}
.paper_type_ul{
   height: 290px;
}
.paper_type_li{
    float: left;
    width: 31%;
    margin-right: 1%;
    border: 1px solid #eee;
    height: 290px;
}
.paper_type_header{
    font-size: 16px;
    background: #eee;
    text-align: center;
    color: #000;
    font-weight: bold;
    height: 40px;
    line-height: 40px;
}
.paper_topic_ul_list{
    padding: 8px 16px;
    overflow-y: auto;
    height: 270px;
    border-bottom: 1px solid #eee;
}
.paper_topic_li_list{
    margin-bottom: 11px;
}
.paper_type_ul_list{
    overflow: hidden;
    margin-bottom: 12px;
}
.paper_type_li_list{
    float: left;
    width: 31%;
    margin-right: 1%;
    border: 1px solid #eee;
    
}
.paper_type_header_list{
    font-size: 16px;
    background: #eee;
    text-align: center;
    padding: 8px 0;
    color: #000;
    font-weight: bold;
}
.paper_topic_ul_list{
    padding: 8px 16px;
    overflow-y: auto;
    height: 270px;
    border-bottom: 1px solid #eee;
}
.paper_topic_li_list{
    margin-bottom: 11px;
}
.paper_topic_ul{
    overflow-y: auto;
    height: 210px;
    padding: 5px;
}
.paper_topic_select,.paper_topic_select_judge,.paper_topic_select_multiple,.paper_topic_select_single{
	margin-right: 12px;
    cursor: pointer;
    width: 15px;
    height: 15px;
    float: left;
    margin-top: 4px;
}
.paper_topic_txt{
    font-size: 16px;
    color: #000;
    display: inline-block;
    width: 86%;
    overflow-x: hidden;
    text-overflow: ellipsis;
}
.paper_topic_txt_list{
    font-size: 16px;
    color: #000;
    display: inline-block;
    width: 86%;
    overflow-x: hidden;
    text-overflow: ellipsis;
}
.single_bottom,.multiple_bottom,.judge_bottom{
    font-size: 13px;
    float: right;
    height: 35px;
    width: 100%;
    text-align: right;
    border-top: 1px solid #ccc;
    line-height: 35px;
    padding-right: 9px;
}
.single_bottom_total{

}
.single_bottom_select{

}
.judge_bottom_total{

}
.paper_topic_txt_num_list{
    font-size: 16px;
    float: left;
}
.add_paper_save{
	background: #139FD2;
    color: #fff;
    border: none;
    font-size: 16px;
    padding: 4px 10px;
    border-radius: 4px;
    cursor: pointer;
    margin: 30px 44%;
}
.paper_topic_txt_num{
    font-size: 16px;
    color: #000;
    display: inline-block;
    float: left;
}
.delete_paper{
    text-align: center;
    font-size: 16px;
    background: #139FD2;
    color: #fff;
    padding: 2px 9px;
    border-radius: 3px;
    cursor: pointer;
    margin-bottom: 13px;
    width: 8%;
    margin-left: 92%;
}
</style>
<script type="text/javascript">
var paper_config_id=0;
$(function(){
	$(".confirm_box_close,.confirm_li.cancel").click(function(){
		$(".confirm_box").hide();
		$(".bg").hide();
	});
	
	$(".paper_btn_back").click(function(){
		$("#paper_home").attr("action","${ctx}/admin/exam/paper_manage.page").submit();
	});
	
	$(".paper_manage_btn_type_value").click(function(){
		$(".paper_manage_btn_course_type_ul").hide();
		$(".paper_manage_btn_iden_type_ul").hide();
		$(".paper_manage_btn_arg_type_ul").hide();
		
		/* 首先看看身份和机型有没有筛选 */
		if($.trim($(".paper_manage_btn_iden_type_value").text())=="按身份筛选"){
			reminder_box("请选择身份");
			return;
		}
		if($.trim($(".paper_manage_btn_arg_type_value").text())=="按机型选择"){
			reminder_box("请选择机型");
			return;
		}
		var html='';
		$.ajax({
			   type: "POST",
			   url: "${ctx}/api/getCourseCategories.json",
			   dataType: "json",
			   data: {userTypeId:$(".paper_manage_btn_iden_type_value").attr("id"),uavTypeId:$(".paper_manage_btn_arg_type_value").attr("id")},
			   success: function(msg){
				   console.log(msg.data);
				   if(msg.status==1){
					   if(msg.data.length>0){
						   for(var i=0;i<msg.data.length;i++){
							   html+='<li class="paper_manage_btn_type_li" onclick="paper_manage_btn_type_li(this,'+msg.data[i].id+')">'+msg.data[i].name+'</li>';
							}
						   /* 根据机型和身份查找对应的课程类别 */
							$(".paper_manage_btn_type_ul").html(html);
							$(".paper_manage_btn_type_ul").toggle();
					   }else{
						   reminder_box("没有对应的课程！！");
						   return;
					   }
				   }else{
				   }
			   }
			})
		
	});
	
	
 	$(".paper_manage_btn_arg_type_value").click(function(){
 		$(".paper_manage_btn_course_type_ul").hide();
 		$(".paper_manage_btn_iden_type_ul").hide();
 		$(".paper_manage_btn_type_ul").hide();
 		$(".paper_manage_btn_type_value").text("按课程类别筛选").removeAttr("id");
		$(".paper_manage_btn_arg_type_ul").toggle();
	});
	
	$(".paper_manage_btn_iden_type_value").click(function(){
		$(".paper_manage_btn_type_value").text("按课程类别筛选").removeAttr("id");
		$(".paper_manage_btn_course_type_ul").hide();
		$(".paper_manage_btn_type_ul").hide();
		$(".paper_manage_btn_arg_type_ul").hide();
			
		$(".paper_manage_btn_iden_type_ul").toggle();
	});
	$(".paper_manage_btn_course_type_value").click(function(){
		$(".paper_manage_btn_type_value").text("按课程类别筛选").removeAttr("id");
		$(".paper_manage_btn_type_ul").hide();
		$(".paper_manage_btn_iden_type_ul").hide();
		$(".paper_manage_btn_arg_type_ul").hide();
		
		$(".paper_manage_btn_course_type_ul").toggle();
	});
	
	
	$(".paper_content_submit_btn").click(function(){
		
		var paper_content_value=$.trim($(".paper_content_value").val());
		if(paper_content_value==""){
			reminder_box("请输入试卷名称");
			return;
		}
		
		paper_content_value=$.trim($(".paper_content_time").val());
		if(paper_content_value==""){
			reminder_box("请输入试卷时长");
			return;
		}
		paper_content_value=$.trim($(".paper_content_num_value").val());
		if(paper_content_value==""){
			reminder_box("请输入单选题数");
			return;
		}
		paper_content_value=$.trim($(".paper_content_num_value2").val());
		if(paper_content_value==""){
			reminder_box("请输入多选题数");
			return;
		}
		paper_content_value=$.trim($(".paper_content_num_value3").val());
		if(paper_content_value==""){
			reminder_box("请输入判断题数");
			return;
		}
		
		
		/* paper_content_value=$.trim($(".paper_content_grade_value").val());
		if(paper_content_value==""){
			reminder_box("请输入每题分值");
			return;
		}
		paper_content_value=$.trim($(".paper_content_qualified_value").val());
		if(paper_content_value==""){
			reminder_box("请输入合格分值");
			return;
		} */
		
		var paper_course_value=$.trim($(".paper_manage_btn_course_type_value").text());
		if(paper_course_value=="按试卷类型筛选"){
			reminder_box("按试卷类型筛选");
			return;
		}
		var paper_iden_value=$.trim($(".paper_manage_btn_iden_type_value").text());
		if(paper_iden_value=="按身份筛选"){
			reminder_box("请选择身份");
			return;
		}
		var paper_arg_value=$.trim($(".paper_manage_btn_arg_type_value").text());
		if(paper_arg_value=="按机型选择"){
			reminder_box("请选择机型");
			return;
		}
		
		var examQuestions_data={};
		if(paper_course_value=="自测"){
			var paper_manage_btn_type_value=$.trim($(".paper_manage_btn_type_value").text());
			if(paper_manage_btn_type_value=="按课程类别筛选"){
				reminder_box("请选择课程类别");
				return;
			}
			
			examQuestions_data={
					userTypeId:$.trim($(".paper_manage_btn_iden_type_value").attr("id")),
					uavTypeId:$.trim($(".paper_manage_btn_arg_type_value").attr("id")),
					courseCategoryId:$.trim($(".paper_manage_btn_type_value").attr("id"))
			}
		}else{
			examQuestions_data={
					userTypeId:$.trim($(".paper_manage_btn_iden_type_value").attr("id")),
					uavTypeId:$.trim($(".paper_manage_btn_arg_type_value").attr("id")),
			}
		}
		
		var data = {
				name: $.trim($(".paper_content_value").val()),
				setTime:$.trim($(".paper_content_time").val()),
				singleCount:$.trim($(".paper_content_num_value").val()),
				multiCount:$.trim($(".paper_content_num_value2").val()),
				judgeCount:$.trim($(".paper_content_num_value3").val()),
				type:$(".paper_manage_btn_course_type_value").attr("id"),
				userTypeId:$.trim($(".paper_manage_btn_iden_type_value").attr("id")),
				uavTypeId:$.trim($(".paper_manage_btn_arg_type_value").attr("id")),
				courseCategoryId:$.trim($(".paper_manage_btn_type_value").attr("id")),
			}
		$.ajax({
			   type: "POST",
			   url: "${ctx}/admin/exam/saveExamConfig.json",
			   dataType: "json",
			   data:data,
			   success: function(msg){
				   if(msg.status==1){
					   $("#paper_home").attr("action","${ctx}/admin/exam/paper_manage.page").submit();					   
					   
					   /* 设置各个选择只读 */
						/* $(".paper_content_value,.paper_content_time,.paper_content_num_value").attr("readonly","readonly").css("background","#ccc");
						$(".paper_manage_btn_course_type_value,.paper_manage_btn_iden_type_value,.paper_manage_btn_arg_type_value,.paper_manage_btn_type_value").off("click");
						$(".paper_manage_btn_course_type_box,.paper_manage_btn_iden_type_box,.paper_manage_btn_arg_type_box,.paper_manage_btn_type_box").css("background","#ccc");
						$(".paper_content_submit_btn").addClass("index").off("click");
						
						paper_config_id=msg.data; */
						
						
						/* 添加試卷 */
						/* $(".paper_content_add_btn").addClass("index").on("click",function(){
							paper_content_add(examQuestions_data);
						}); */
				   }else{
					   reminder_box(msg.msg);
				   }
			   }
			})
	});
})
/* 这是编辑的时候出现的添加试题的方法 */
function paper_add_btn(e){
	var examQuestions_data={};
	if($.trim($(".paper_manage_btn_course_type_value1").text())=="自测"){
		examQuestions_data={
				userTypeId:$.trim($(".paper_manage_btn_iden_type_value").attr("id")),
				uavTypeId:$.trim($(".paper_manage_btn_arg_type_value").attr("id")),
				courseCategoryId:$.trim($(".paper_manage_btn_type_value").attr("id"))
		}
	}else{
		examQuestions_data={
				userTypeId:$.trim($(".paper_manage_btn_iden_type_value").attr("id")),
				uavTypeId:$.trim($(".paper_manage_btn_arg_type_value").attr("id")),
		}
	}
	
	paper_content_add(examQuestions_data);
}
/* 添加试卷初始方法 */
function paper_content_add(examQuestions_data){
	$.ajax({
		   type: "POST",
		   url: "${ctx}/admin/exam/getExamQuestions.json",
		   dataType: "json",
		   data:examQuestions_data,
		   success: function(msg){
			   if(msg.status==1){
				   var exam_arr=msg.data;
				   if(exam_arr.length>0){
					   /* 将不同的试题归入不同的数组 */
					   var single=[];
					   var multiple=[];
					   var judge=[];
					   for(var j=0;j<exam_arr.length;j++){
						   if(exam_arr[j].type==1){
							   single.push(exam_arr[j]);
						   }else if(exam_arr[j].type==2){
							   multiple.push(exam_arr[j]);
						   }else if(exam_arr[j].type==3){
							   judge.push(exam_arr[j]);
						   }
					   }
					   
					   /* 添加试题的方法 */
					   paper_content_add_btn(single,multiple,judge);
				   }else{
					   reminder_box("无对应的试题");
			   		}
			   }else{
				   reminder_box(msg.msg);
			   }
		   }
		})
}


/* 添加试题的方法 */
function paper_content_add_btn(arr1,arr2,arr3){
	var paper_html='';
	
		paper_html+='<ul class="paper_type_ul">';
		paper_html+='<li class="paper_type_li">';
		paper_html+='<h1 class="paper_type_header">单选题</h1>';
		paper_html+='<ul class="paper_topic_ul">';
		if(arr1.length>0){
			for(var i=0;i<arr1.length;i++){
				paper_html+='<li class="paper_topic_li">';
				paper_html+='<input type="checkbox" class="paper_topic_select_single" onclick="paper_topic_select(this,\'single\')"><span class="paper_topic_txt" id="'+arr1[i].id+'">'+arr1[i].question+'</span>';
				paper_html+='</li>';
			}
		}
		
				
		paper_html+='</ul>';
		
		paper_html+='<div class="single_bottom"><span class="single_bottom_total">共'+arr1.length+'题</span>/已选<span class="single_bottom_select">0</span>题</div>';
		paper_html+='</li>';
		
		paper_html+='<li class="paper_type_li">';
		paper_html+='<h1 class="paper_type_header">多选题</h1>';
		paper_html+='<ul class="paper_topic_ul">';
		if(arr2.length>0){
			for(var j=0;j<arr2.length;j++){
				paper_html+='<li class="paper_topic_li">';
				paper_html+='<input type="checkbox" class="paper_topic_select_multiple" onclick="paper_topic_select(this,\'multiple\')"><span class="paper_topic_txt" id="'+arr2[j].id+'">'+arr2[j].question+'</span>';
				paper_html+='</li>';
			}
		}
		
				
		paper_html+='</ul>';
		paper_html+='<div class="multiple_bottom"><span class="multiple_bottom_total">共'+arr2.length+'题</span>/已选<span class="multiple_bottom_select">0</span>题</div>';
		paper_html+='</li>';
		paper_html+='<li class="paper_type_li">';
		paper_html+='<h1 class="paper_type_header">判断题</h1>';
		paper_html+='<ul class="paper_topic_ul">';
		
		for(var k=0;k<arr3.length;k++){
			paper_html+='<li class="paper_topic_li">';
			paper_html+='<input type="checkbox" class="paper_topic_select_judge" onclick="paper_topic_select(this,\'judge\')"><span class="paper_topic_txt" id="'+arr3[k].id+'">'+arr3[k].question+'</span>';
			paper_html+='</li>';
		}
		
		paper_html+='</ul>';
		paper_html+='<div class="judge_bottom"><span class="judge_bottom_total">共'+arr3.length+'题</span>/已选<span class="judge_bottom_select">0</span>题</div>';
		paper_html+='</li>';
		paper_html+='</ul>';
		
		if($.trim($(".paper_id").val())){
			paper_html+='<input type="button" class="add_paper_save" onclick="add_paper_save(this,'+$.trim($(".paper_id").val())+')" value="提交保存">';
		}else{
			paper_html+='<input type="button" class="add_paper_save" onclick="add_paper_save(this,'+paper_config_id+')" value="提交保存">';
		}
		
		$(".add_paper_manage_inner_content1").html(paper_html);
}
function add_paper_save(e,id){
	
	/* 首先检查是否选择到足够的题数 */
	var set_num=$.trim($(".paper_content_num_value").val());
	var has_select_num=$.trim($(".single_bottom_select").text())*1+$.trim($(".multiple_bottom_select").text())*1+$.trim($(".judge_bottom_select").text())*1;
	if(set_num>has_select_num){
		reminder_box("您还没有选择足够的题数");
		return;
	}
	
	var questionIds='';
	$(".paper_topic_select_single").each(function(){
		if($(this).is(':checked')){
			questionIds+=$(this).siblings().attr("id")+',';
		}
	});
	$(".paper_topic_select_multiple").each(function(){
		if($(this).is(':checked')){
			questionIds+=$(this).siblings().attr("id")+',';
		}
	});
	$(".paper_topic_select_judge").each(function(){
		if($(this).is(':checked')){
			questionIds+=$(this).siblings().attr("id")+',';
		}
	});
	questionIds=questionIds.substring(0,questionIds.length-1);
	/* 增加保存这套试卷的方法 */
	$.ajax({
		   type: "POST",
		   url: "${ctx}/admin/exam/saveExamPaper.json",
		   dataType: "json",
		   data:{examId:id,questionIds:questionIds},
		   success: function(msg){
			   if(msg.status==1){
				   $(".paper_id").val(id);
				   $("#paper_home").attr("action","${ctx}/admin/exam/add_paper_manage.page").submit();
			   }else{
				   reminder_box(msg.msg);
			   }
		   }
		})
	
		return;
	var list_htm="";
	
		list_htm+='<ul class="paper_type_ul_list">';
		list_htm+='<li class="paper_type_li_list">';
		list_htm+='<h1 class="paper_type_header_list">单选题</h1>';
		list_htm+='<ul class="paper_topic_ul_list">';
		for(var i=0;i<10;i++){
			list_htm+='<li class="paper_topic_li_list">';
			list_htm+='<span class="paper_topic_txt_num_list">1,</span><span class="paper_topic_txt_list">sdfgthrthrtyhjtyjtyj</span>';
			list_htm+='</li>';
		}
		list_htm+='</ul>';
		list_htm+='</li>';
	
		list_htm+='<li class="paper_type_li_list">';
		list_htm+='<h1 class="paper_type_header_list">多选题</h1>';
		list_htm+='<ul class="paper_topic_ul_list">';
		for(var i=0;i<10;i++){
			list_htm+='<li class="paper_topic_li_list">';
			list_htm+='<span class="paper_topic_txt_num_list">1,</span><span class="paper_topic_txt_list">sdfgthrthrtyhjtyjtyj</span>';
			list_htm+='</li>';
		}
		list_htm+='</ul>';
		list_htm+='</li>';
		list_htm+='<li class="paper_type_li_list">';
		list_htm+='<h1 class="paper_type_header_list">判断题</h1>';
		list_htm+='<ul class="paper_topic_ul_list">';
		for(var i=0;i<10;i++){
			list_htm+='<li class="paper_topic_li_list">';
			list_htm+='<span class="paper_topic_txt_num_list">1,</span><span class="paper_topic_txt_list">sdfgthrthrtyhjtyjtyj</span>';
			list_htm+='</li>';
		}
		list_htm+='</ul>';
		list_htm+='</li>';
		list_htm+='</ul>';
		
		$(".add_paper_manage_inner_content2").append(list_htm);
}

function paper_manage_btn_type_li(e,id){
	var paper_manage_type_value=$.trim($(e).text());
	$(".paper_manage_btn_type_value").text(paper_manage_type_value).attr("id",id);
	$(".paper_manage_btn_type_ul").toggle();
}
function paper_manage_btn_arg_type_li(e,id){
	var paper_manage_type_value=$.trim($(e).text());
	$(".paper_manage_btn_arg_type_value").text(paper_manage_type_value).attr("id",id);
	$(".paper_manage_btn_arg_type_ul").toggle();
}
function paper_manage_btn_iden_type_li(e,id){
	var paper_manage_type_value=$.trim($(e).text());
	$(".paper_manage_btn_iden_type_value").text(paper_manage_type_value).attr("id",id);
	$(".paper_manage_btn_iden_type_ul").toggle();
}
function paper_manage_btn_course_type_li(e,id){
	var paper_manage_type_value=$.trim($(e).text());
	if(paper_manage_type_value=="自测"){
		$(".paper_manage_btn_type_box").show();
	}else{
		$(".paper_manage_btn_type_box").hide();
	}
	$(".paper_manage_btn_course_type_value").text(paper_manage_type_value).attr("id",id);
	$(".paper_manage_btn_course_type_ul").toggle();
}
function paper_topic_select(e,type){
	/* 首先需要判断题数有没有选择够数 */
	var set_num=$.trim($(".paper_content_num_value").val());
	
	var num=0;
	var dom_str=".paper_topic_select_"+type;
	$(dom_str).each(function(){
		if($(this).is(":checked")){
			++num;
		}
	});
	dom_str="."+type+"_bottom_select";
	
	$(dom_str).text(num);
	/* 计算已经选择的题目数 */
	var has_select_num=$.trim($(".single_bottom_select").text())*1+$.trim($(".multiple_bottom_select").text())*1+$.trim($(".judge_bottom_select").text())*1;
	
	if(set_num<has_select_num){
		if($(e).is(":checked")){
			reminder_box("您已达到选择题目数的上限");
			$(e).prop("checked",false);
			$(dom_str).text(--num);
		}
	}
	
	
	
}

function delete_paper(id){
	/* 删除某一套试卷 */
	$(".confirm_box").show();
	$(".bg").show();
	$(".confirm_header").text("您确认删除该试卷吗？");
	
	$(".confirm_li.confirm").on("click",function(){
		$.ajax({
			   type: "POST",
			   url: "${ctx}/admin/exam/deleteExamPaper.json",
			   dataType: "json",
			   data: {id:id},
			   success: function(msg){
				   if(msg.status==1){
					   $("#paper_home").attr("action","${ctx}/admin/exam/add_paper_manage.page").submit();
				   }else{
					   reminder_box(msg.msg);
				   }
			   }
		})
	});
	
}


</script>
<form action="" method="post" id="paper_home">
	<input type="hidden" name="id" value="${exam.id}" class="paper_id">
	<input type="hidden" value="${examPapers}" class="paper_content">
</form>
<div class="back_right_box">
	<h1 class="paper_header">试卷管理</h1>
	<div class="paper_btn_box">
		<div class="paper_btn_back"><img alt="" src="${ctx}/images/icon_back.png" class="paper_btn_back_img"><span class="paper_btn_back_txt">返回></span></div>
		<c:choose>
			<c:when test="${empty exam}">
				<span>添加试卷</span>
			</c:when>
			<c:otherwise>
				<span>编辑试卷</span>
			</c:otherwise>
		</c:choose>
		
	</div>

	<div class="add_paper_manage_content">
		<h1 class="paper_content_header">基础设置</h1>
		<div class="add_paper_manage_inner_content">
			<div class="paper_content1">
				<span class="paper_content_name">试卷名称</span>
				<c:choose>
					<c:when test="${empty exam}">
						<input type="text" maxlength="20" placeholder="请输入试卷名称" class="paper_content_value">
					</c:when>
					<c:otherwise>
						<input type="text" maxlength="20" value="${exam.name}" style="background:#ccc" readonly="readonly" placeholder="请输入试卷名称" class="paper_content_value">
					</c:otherwise>
				</c:choose>
				
				<span class="paper_content_publish_name">超级管理员</span>
				<span class="paper_content_publish">发布者</span>
			</div>
			
			<div class="paper_content_box">
				<span class="paper_content_name">试卷时长</span>
				<c:choose>
					<c:when test="${empty exam}">
						<input type="number" value="${exam.setTime}" placeholder="请输入试卷时长" class="paper_content_time">
					</c:when>
					<c:otherwise>
						<input type="number" value="${exam.setTime}" style="background:#ccc" readonly="readonly" placeholder="请输入试卷时长" class="paper_content_time">
					</c:otherwise>
				</c:choose>
				
				
				<span class="paper_content_num">单选题数</span>
				<c:choose>
					<c:when test="${empty exam}">
						<input type="number" value="${exam.singleCount}" placeholder="请输入单选题数" class="paper_content_num_value">
					</c:when>
					<c:otherwise>
						<input type="number" value="${exam.singleCount}" style="background:#ccc" readonly="readonly" placeholder="请输入单选题数" class="paper_content_num_value">
					</c:otherwise>
				</c:choose>
				<span class="paper_content_num2">多选题数</span>
				<c:choose>
					<c:when test="${empty exam}">
						<input type="number" value="${exam.multiCount}" placeholder="请输入多选题数" class="paper_content_num_value2">
					</c:when>
					<c:otherwise>
						<input type="number" value="${exam.multiCount}" style="background:#ccc" readonly="readonly" placeholder="请输入多选题数" class="paper_content_num_value2">
					</c:otherwise>
				</c:choose>
				<span class="paper_content_num3">判断题数</span>
				<c:choose>
					<c:when test="${empty exam}">
						<input type="number" value="${exam.judgeCount}" placeholder="请输入判断题数" class="paper_content_num_value3">
					</c:when>
					<c:otherwise>
						<input type="number" value="${exam.judgeCount}" style="background:#ccc" readonly="readonly" placeholder="请输入判断题数" class="paper_content_num_value3">
					</c:otherwise>
				</c:choose>
				
				<%-- <span class="paper_content_grade">每题分值</span>
				<c:choose>
					<c:when test="${empty exam}">
						<input type="number" value="${exam.perMark}" placeholder="请输入每题分值" class="paper_content_grade_value">
					</c:when>
					<c:otherwise>
						<input type="number" value="${exam.perMark}" style="background:#ccc" readonly="readonly" placeholder="请输入每题分值" class="paper_content_grade_value">
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${empty exam}">
						<input type="number" placeholder="请输入合格分值" value="${exam.passMark}" class="paper_content_qualified_value">
					</c:when>
					<c:otherwise>
						<input type="number" placeholder="请输入合格分值" style="background:#ccc" readonly="readonly" value="${exam.passMark}" class="paper_content_qualified_value">
					</c:otherwise>
				</c:choose>
				<span class="paper_content_qualified">合格分值</span> --%>
			</div>
			
			
				<c:choose>
					<c:when test="${empty exam}">
						<div class="paper_manage_btn_course_type_box">
							<span class="paper_manage_btn_course_type_value">按试卷类型筛选</span>
							<ul class="paper_manage_btn_course_type_ul">
								<li class="paper_manage_btn_course_type_li" onclick="paper_manage_btn_course_type_li(this,1)">自测</li>
								<li class="paper_manage_btn_course_type_li" onclick="paper_manage_btn_course_type_li(this,2)">综测</li>
							</ul>
						</div>
					</c:when>
					<c:otherwise>
						<div class="paper_manage_btn_course_type_box" style="background:#ccc">
							<c:choose>
								<c:when test="${exam.type==1}">
									<span style="background:#ccc" class="paper_manage_btn_course_type_value1">自测</span>
								</c:when>
								<c:otherwise>
									<span style="background:#ccc" class="paper_manage_btn_course_type_value1">综测</span>
								</c:otherwise>
							</c:choose>
						</div>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${empty exam}">
						<div class="paper_manage_btn_iden_type_box">
							<span class="paper_manage_btn_iden_type_value">按身份筛选</span>
							<ul class="paper_manage_btn_iden_type_ul">
								<c:forEach items="${userTypes}" var="userType" varStatus="status">
									<li class="paper_manage_btn_iden_type_li" onclick="paper_manage_btn_iden_type_li(this,'${userType.id}')">${userType.name}</li>
								</c:forEach>	
							</ul>
						</div>
					</c:when>
					<c:otherwise>
						<div class="paper_manage_btn_iden_type_box" style="background:#ccc">
							<span class="paper_manage_btn_iden_type_value" id="${exam.userTypeId}">${exam.userType}</span>
						</div>
					</c:otherwise>
				</c:choose>
					
					
				<c:choose>
					<c:when test="${empty exam}">
						<div class="paper_manage_btn_arg_type_box">
							<span class="paper_manage_btn_arg_type_value">按机型选择</span>
							<ul class="paper_manage_btn_arg_type_ul">
								<c:forEach items="${uavTypes}" var="uavType" varStatus="status">
									<li class="paper_manage_btn_arg_type_li" onclick="paper_manage_btn_arg_type_li(this,'${uavType.id}')">${uavType.name}</li>
								</c:forEach>	
							</ul>
						</div>
					</c:when>
					<c:otherwise>
						<div class="paper_manage_btn_arg_type_box" style="background:#ccc">
							<span class="paper_manage_btn_arg_type_value" id="${exam.uavTypeId}">${exam.uavType}</span>
						</div>
					</c:otherwise>
				</c:choose>
			
			<c:choose>
					<c:when test="${empty exam}">
						<div class="paper_manage_btn_type_box">
							<span class="paper_manage_btn_type_value">按课程类别筛选</span>
							<ul class="paper_manage_btn_type_ul">
								<c:forEach items="${courseCategories}" var="courseCategory" varStatus="status">
									<li class="paper_manage_btn_type_li" onclick="paper_manage_btn_type_li(this,'${courseCategory.id}')">${courseCategory.name}</li>
								</c:forEach>	
							</ul>
						</div>
					</c:when>
					<c:when test="${not empty exam.courseCategory}">
						<div class="paper_manage_btn_type_box" style="background:#ccc">
							<span class="paper_manage_btn_type_value" id="${exam.courseCategoryId}">${exam.courseCategory}</span>
						</div>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
				
			<div  class="paper_manage_btn_box">
				<c:choose>
					<c:when test="${empty exam}">
						<input type="button" class="paper_content_submit_btn" value="提交保存">
						<!-- <input type="button" class="paper_content_add_btn" value="添加考题"> -->
					</c:when>
					<c:otherwise>
						<input type="button" disabled="disabled" style="background:#ccc" class="paper_content_submit_btn" value="提交保存">
						<!-- <input type="button" class="paper_content_add_btn index" onclick="paper_add_btn(this)" value="添加考题"> -->
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		
		<c:choose>
			<c:when test="${empty exam}">
			</c:when>
			<c:otherwise>
				<h1 class="paper_content_header">添加考题</h1> 
			</c:otherwise>
		</c:choose>
		<div class="add_paper_manage_inner_content1">
			<!-- 这是新增加的选中试题 -->
			
		</div>
		<div class="add_paper_manage_inner_content2">
			<!-- 这是已经增加的选中试题 -->
			<c:forEach items="${examPapers}" var="examPaper" varStatus="status">
			
				<div class="delete_paper" onclick="delete_paper('${examPaper.id}')">删除</div>
				
				<ul class="paper_type_ul_list">
					<li class="paper_type_li_list">
						<h1 class="paper_type_header_list">单选题</h1>
						<ul class="paper_topic_ul_list">
							<c:forEach items="${examPaper.questions}" var="question" varStatus="question_status">
								<c:if test="${question.type ==1}">
									<li class="paper_topic_li_list">
										<span class="paper_topic_txt_num_list">${question_status.index+1}、</span><span class="paper_topic_txt_list">${question.question}</span>
									</li>
								</c:if>
							</c:forEach>
						</ul>
					</li>
					
					<li class="paper_type_li_list">
						<h1 class="paper_type_header_list">多选题</h1>
						<ul class="paper_topic_ul_list">
							<c:forEach items="${examPaper.questions}" var="question" varStatus="question_status">
								<c:if test="${question.type ==2}">
									<li class="paper_topic_li_list">
										<span class="paper_topic_txt_num_list">${question_status.index+1}、</span><span class="paper_topic_txt_list">${question.question}</span>
									</li>
								</c:if>
							</c:forEach>
						</ul>
					</li>
					<li class="paper_type_li_list">
						<h1 class="paper_type_header_list">判断题</h1>
						<ul class="paper_topic_ul_list">
							<c:forEach items="${examPaper.questions}" var="question" varStatus="question_status">
								<c:if test="${question.type ==3}">
									<li class="paper_topic_li_list">
										<span class="paper_topic_txt_num_list">${question_status.index+1}、</span><span class="paper_topic_txt_list">${question.question}</span>
									</li>
								</c:if>
							</c:forEach>
						</ul>
					</li>
				</ul>
			</c:forEach>
		</div>
	</div>
</div>
