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
}
.paper_manage_btn_course_type_value{
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
.paper_content_num{
    margin-right: 15px;
}
.paper_content_num_value{
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
    margin-left:44%;
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
    overflow: hidden;
}
.paper_type_li{
    float: left;
    width: 31%;
    margin-right: 1%;
    border: 1px solid #eee;
}
.paper_type_header{
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
.paper_type_ul_list{
    overflow: hidden;
}
.paper_type_li_list{
    float: left;
    width: 32%;
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
.single_bottom{
    font-size: 13px;
    float: right;
    padding: 10px;
}
.single_bottom_total{

}
.single_bottom_select{

}
.judge_bottom{
	font-size: 13px;
    float: right;
    padding: 10px;
}
.judge_bottom_total{

}
.judge_bottom_select{

}
.multiple_bottom{
	font-size: 13px;
    float: right;
    padding: 10px;
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
.delete_paper{
	background: #139FD2;
    color: #fff;
    border: none;
    font-size: 16px;
    padding: 4px 10px;
    border-radius: 4px;
    cursor: pointer;
    margin-left: 97%;
    margin-bottom: 20px;
}
.paper_topic_txt_num{
    font-size: 16px;
    color: #000;
    display: inline-block;
    float: left;
}
.delete_confirm_box{
    position: fixed;
    z-index: 4;
    background: #fff;
    top: 33%;
    width: 26%;
    left: 37%;
    border-radius: 6px;
    text-align: center;
    font-size: 20px;
}
.delete_confirm_header{
margin: 36px 0 73px;
}
.delete_confirm_ul{
    overflow: hidden;
    color: #fff;
    font-size: 16px;
    margin-left: 33%;
    width: 38%;
    margin-bottom: 26px;
}
.delete_confirm_li{
    float: left;
    background: #139FD2;
    font-size: 16px;
    width: 42%;
    padding: 6px 0;
    margin-right: 8%;
    border-radius: 5px;
    cursor: pointer;
}
.delete_confirm_close{
    position: absolute;
    right: 20px;
    top: 9px;
    cursor: pointer; 
}
</style>
<script type="text/javascript">
$(function(){
	/* $(".back_nav_li").eq(2).find(".back_article_header").addClass("index");
	$(".back_nav_li").eq(2).find(".back_article_ul").show();
	$(".back_nav_li").eq(2).find(".back_article_li").eq(0).addClass("index"); */
	
	$(".paper_btn_back").click(function(){
		$("#paper_home").attr("action","${ctx}/admin/paper_manage").submit();
	});
	
	/* 加载需要编辑的试卷 */
	onload_paper();
	
	$(".delete_confirm_li").eq(1).click(function(){
		$(".bg").hide();
		$(".delete_confirm_box").hide();
	})
})
/* 添加试题的方法 */
function paper_content_add_btn(){
	/* 这是单选题 */
	var paper_html='';
	
		paper_html+='<ul class="paper_type_ul">';
		paper_html+='<li class="paper_type_li">';
		paper_html+='<h1 class="paper_type_header">单选题</h1>';
		paper_html+='<ul class="paper_topic_ul">';
			for(var i=0;i<10;i++){
				paper_html+='<li class="paper_topic_li">';
				paper_html+='<input type="checkbox" class="paper_topic_select_single" onclick="paper_topic_select(this,\'single\')"><span class="paper_topic_txt">sdfgthrthrtyhjtyjtyj</span>';
				paper_html+='</li>';
			}
		paper_html+='</ul>';
		paper_html+='<div class="single_bottom"><span class="single_bottom_total">共10题</span>/已选<span class="single_bottom_select">0</span>题</div>';
		paper_html+='</li>';
		paper_html+='<li class="paper_type_li">';
		paper_html+='<h1 class="paper_type_header">多选题</h1>';
		paper_html+='<ul class="paper_topic_ul">';
			for(var j=0;j<10;j++){
				paper_html+='<li class="paper_topic_li">';
				paper_html+='<input type="checkbox" class="paper_topic_select_multiple" onclick="paper_topic_select(this,\'multiple\')"><span class="paper_topic_txt">sdfgthrthrtyhjtyjtyj</span>';
				paper_html+='</li>';
			}
		paper_html+='</ul>';
		paper_html+='<div class="multiple_bottom"><span class="multiple_bottom_total">共10题</span>/已选<span class="multiple_bottom_select">0</span>题</div>';
		paper_html+='</li>';
		paper_html+='<li class="paper_type_li">';
		paper_html+='<h1 class="paper_type_header">判断题</h1>';
		paper_html+='<ul class="paper_topic_ul">';
			for(var k=0;k<10;k++){
				paper_html+='<li class="paper_topic_li">';
				paper_html+='<input type="checkbox" class="paper_topic_select_judge" onclick="paper_topic_select(this,\'judge\')"><span class="paper_topic_txt">sdfgthrthrtyhjtyjtyj</span>';
				paper_html+='</li>';
			}
		paper_html+='</ul>';
		paper_html+='<div class="judge_bottom"><span class="judge_bottom_total">共100题</span>/已选<span class="judge_bottom_select">0</span>题</div>';
		paper_html+='</li>';
		paper_html+='</ul>';
		paper_html+='<input type="button" class="add_paper_save" onclick="add_paper_save(this)" value="提交保存">';
		$(".add_paper_manage_inner_content1").html(paper_html);
}
function onload_paper(){
	var list_htm="";
	list_htm+='<input type="button" class="delete_paper" onclick="delete_paper(this)" value="删除">';
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
function add_paper_save(e){
	/* 首先检查是否选择到足够的题数 */
	var set_num=$.trim($(".paper_content_num_value").val());
	var has_select_num=$.trim($(".single_bottom_select").text())*1+$.trim($(".multiple_bottom_select").text())*1+$.trim($(".judge_bottom_select").text())*1;
	if(set_num>has_select_num){
		reminder_box("您还没有选择足够的题数");
		return;
	}
	/* 增加保存这套试卷的方法 */
	alert("增加保存这套试卷的方法");
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

function delete_paper(e){
	$(".bg").show();
	$(".delete_confirm_box").show();
}

</script>
<form action="" method="post" id="paper_home">
	
</form>
<div class="back_right_box">
	<h1 class="paper_header">试卷管理</h1>
	<div class="paper_btn_box">
		<div class="paper_btn_back"><img alt="" src="${ctx}/images/icon_back.png" class="paper_btn_back_img"><span class="paper_btn_back_txt">返回></span></div><span>编辑试卷</span>
	</div>

	<div class="add_paper_manage_content">
		<h1 class="paper_content_header">基础设置</h1>
		<div class="add_paper_manage_inner_content">
			<div class="paper_content1">
				<span class="paper_content_name">试卷名称</span><input type="text" style="background:#ccc" placeholder="请输入试卷名称" value="5" readonly="readonly" class="paper_content_value">
				<span class="paper_content_publish_name">超级管理员</span>
				<span class="paper_content_publish">发布者</span>
			</div>
			
			<div class="paper_content_box">
				<span class="paper_content_name">试卷时长</span><input style="background:#ccc" value="5" readonly="readonly" type="text" placeholder="请输入试卷时长" class="paper_content_time">
				<span class="paper_content_num">试卷题数</span><input style="background:#ccc" value="5" readonly="readonly" type="text" placeholder="请输入试卷题数" class="paper_content_num_value">
				<span class="paper_content_grade">每题分值</span><input style="background:#ccc" value="5" readonly="readonly" type="text" placeholder="请输入每题分值" class="paper_content_grade_value">
				<input type="text" placeholder="请输入合格分值" style="background:#ccc" value="5" readonly="readonly" class="paper_content_qualified_value"><span class="paper_content_qualified">合格分值</span>
			</div>
			
			<div class="paper_manage_btn_course_type_box" style="background:#ccc">
				<span class="paper_manage_btn_course_type_value">自测</span>
				<ul class="paper_manage_btn_course_type_ul">
					<li class="paper_manage_btn_course_type_li" onclick="paper_manage_btn_course_type_li(this)">全部</li>
					<li class="paper_manage_btn_course_type_li" onclick="paper_manage_btn_course_type_li(this)">自测</li>
					<li class="paper_manage_btn_course_type_li" onclick="paper_manage_btn_course_type_li(this)">综测</li>
				</ul>
			</div>
			
			<div class="paper_manage_btn_iden_type_box" style="background:#ccc">
				<span class="paper_manage_btn_iden_type_value">教员</span>
				<ul class="paper_manage_btn_iden_type_ul">
					<li class="paper_manage_btn_iden_type_li" onclick="paper_manage_btn_iden_type_li(this)">全部</li>
					<li class="paper_manage_btn_iden_type_li" onclick="paper_manage_btn_iden_type_li(this)">教员</li>
					<li class="paper_manage_btn_iden_type_li" onclick="paper_manage_btn_iden_type_li(this)">操作员</li>
				</ul>
			</div>
			<div class="paper_manage_btn_arg_type_box" style="background:#ccc">
				<span class="paper_manage_btn_arg_type_value">金星一号</span>
				<ul class="paper_manage_btn_arg_type_ul">
					<li class="paper_manage_btn_arg_type_li" onclick="paper_manage_btn_arg_type_li(this)">金星一号</li>
					<li class="paper_manage_btn_arg_type_li" onclick="paper_manage_btn_arg_type_li(this)">水星一号</li>
				</ul>
			</div>
			<div class="paper_manage_btn_type_box" style="background:#ccc">
				<span class="paper_manage_btn_type_value">无人机基础</span>
				<ul class="paper_manage_btn_type_ul">
					<li class="paper_manage_btn_type_li" onclick="paper_manage_btn_type_li(this)">无人机基础</li>
					<li class="paper_manage_btn_type_li" onclick="paper_manage_btn_type_li(this)">无人机操作基础</li>
					<li class="paper_manage_btn_type_li" onclick="paper_manage_btn_type_li(this)">质保专业知识</li>
				</ul>
			</div>
			<div  class="paper_manage_btn_box">
				<input type="button" class="paper_content_add_btn index" onclick="paper_content_add_btn()" value="添加考题">
			</div>
		</div>
		<h1 class="paper_content_header">添加考题</h1>
		<div class="add_paper_manage_inner_content1">
		
			<!-- <ul class="paper_type_ul">
				<li class="paper_type_li">
					<h1 class="paper_type_header">单选题</h1>
					<ul class="paper_topic_ul">
						<li class="paper_topic_li">
							<input type="checkbox" class="paper_topic_select_single" onclick="paper_topic_select(this,'single')"><span class="paper_topic_txt">sdfgthrthrtyhjtyjtyj</span>
						</li>
					</ul>
					<div class="single_bottom"><span class="single_bottom_total">共100题</span>/已选<span class="single_bottom_select">0</span>题</div>
				</li>
				
				<li class="paper_type_li">
					<h1 class="paper_type_header">多选题</h1>
					<ul class="paper_topic_ul">
						<li class="paper_topic_li">
							<input type="checkbox" class="paper_topic_select_multiple" onclick="paper_topic_select(this,'multiple')"><span class="paper_topic_txt">sdfgthrthrtyhjtyjtyj</span>
						</li>
					</ul>
					<div class="multiple_bottom"><span class="multiple_bottom_total">共100题</span>/已选<span class="multiple_bottom_select">0</span>题</div>
				</li>
				<li class="paper_type_li">
					<h1 class="paper_type_header">判断题</h1>
					<ul class="paper_topic_ul">
						<li class="paper_topic_li">
							<input type="checkbox" class="paper_topic_select_judge" onclick="paper_topic_select(this,'judge')"><span class="paper_topic_txt">sdfgthrthrtyhjtyjtyj</span>
						</li>
					</ul>
					<div class="judge_bottom"><span class="judge_bottom_total">共100题</span>/已选<span class="judge_bottom_select">0</span>题</div>
				</li>
			</ul> -->
		</div>
		
		<h1 class="paper_content_header">已有考题</h1>
		<div class="add_paper_manage_inner_content2">
			<!-- <ul class="paper_type_ul_list">
				<li class="paper_type_li_list">
					<h1 class="paper_type_header_list">单选题</h1>
					<ul class="paper_topic_ul_list">
						<li class="paper_topic_li_list">
							<span class="paper_topic_txt_num_list">1,</span><span class="paper_topic_txt_list">sdfgthrthrtyhjtyjtyj</span>
						</li>
					</ul>
				</li>
				
				<li class="paper_type_li_list">
					<h1 class="paper_type_header_list">多选题</h1>
					<ul class="paper_topic_ul_list">
						<li class="paper_topic_li_list">
							<span class="paper_topic_txt_num_list">1,</span><span class="paper_topic_txt_list">sdfgthrthrtyhjtyjtyj</span>
						</li>
					</ul>
				</li>
				<li class="paper_type_li_list">
					<h1 class="paper_type_header_list">判断题</h1>
					<ul class="paper_topic_ul_list">
						<li class="paper_topic_li_list">
							<span class="paper_topic_txt_num_list">1,</span><span class="paper_topic_txt_list">sdfgthrthrtyhjtyjtyj</span>
						</li>
					</ul>
				</li>
			</ul> -->
		</div>
	</div>
</div>


<div class="delete_confirm_box" style="display:none">
	<h1 class="delete_confirm_header">是否删除此套考题</h1>
	<ul class="delete_confirm_ul">
		<li class="delete_confirm_li">确定</li>
		<li class="delete_confirm_li">返回</li>
	</ul>
</div>