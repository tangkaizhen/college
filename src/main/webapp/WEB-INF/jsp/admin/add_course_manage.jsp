<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
<style>
.course_manage_btn_type_box{
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
    font-size: 16px;
    display: inline-block;
}
.course_manage_btn_type_value{
    white-space: nowrap;
    overflow-x: hidden;
    display: inline-block;
    margin-top: 3px;
    width: 100%;
    text-align: left;
    padding-left: 8%;
}
.course_manage_btn_type_ul{
    position: absolute;
    width: 100%;
    border: 1px solid #ccc;
    top: 27px;
    background: #fff;
    z-index: 3;
    display: none;
}
.course_manage_btn_type_li{
    border-bottom: 1px solid #ccc;
    line-height: 30px;
}
.course_manage_btn_arg_type_box{
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
    font-size: 16px;  
        display: inline-block;
}
.course_manage_btn_arg_type_value{
    display: inline-block;
    margin-top: 3px;
    width: 100%;
    text-align: left;
    padding-left: 8%;
        white-space: nowrap;
    overflow-x: hidden;
}
.course_manage_btn_arg_type_ul{
    position: absolute;
    width: 100%;
    border: 1px solid #ccc;
    top: 27px;
    background: #fff;
    z-index: 3;
    display: none;
}
.course_manage_btn_arg_type_li{
    border-bottom: 1px solid #ccc;
    line-height: 30px;
}
.course_manage_btn_iden_type_box{
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
    font-size: 16px;  
    display: inline-block;
    margin-left: 28%;
}
.course_manage_btn_iden_type_value{
    display: inline-block;
    margin-top: 3px;
    width: 100%;
    text-align: left;
    padding-left: 8%;
    white-space: nowrap;
    overflow-x: hidden;
}
.course_manage_btn_iden_type_ul{
    position: absolute;
    width: 100%;
    border: 1px solid #ccc;
    top: 27px;
    background: #fff;
    z-index: 3;
    display: none;
}
.course_manage_btn_iden_type_li{
    border-bottom: 1px solid #ccc;
    line-height: 30px;
}
.back_right_box{
    background: #fafafa;
        font-size: 16px;
}
.baike_header{
    width: 100%;
    border-bottom: 1px solid #ccc;
    font-size: 20px;
    padding: 6px 0 6px 23px;
    background: #fff;
}
.baike_btn_box{
    font-size: 16px;
    margin-left: 1%;
    margin: 12px 1%;
}
.baike_btn_back{
	display: inline-block;
    cursor: pointer;
}
.baike_btn_back_img{
    width: 15px;
    margin-right: 7px;
}
.baike_btn_back_txt{

}
.add_baike_content{
	background: #fff;
    width: 98%;
    margin-left: 1%;
    font-size: 20px;
    padding-bottom: 35px;
}
.add_baike_header_box{
    width: 60%;
    margin-left: 20%;
    padding-top: 60px;
}
.add_baike_header_name{
    display: inline-block;
    width: 10%;
    text-align: right;
}
.add_baike_header_name_value{
	float: right;
    width: 86%;
    border: 1px solid #ccc;
    font-size: 16px;
    height: 30px;
    border-radius: 4px;
    padding-left: 14px;
    cursor: pointer;
}
.add_baike_type_box{
    width: 60%;
    margin-left: 20%;
    padding-top: 29px;
    cursor: pointer;
}
.add_baike_type_name{
    display: inline-block;
    width: 10%;
    text-align: right;
    margin-right: 3%;
}
.add_baike_type_select{
	background: url(${ctx}/images/triangle.png) no-repeat 93% center; 
	    display: inline-block;
    position: relative;
    width: 14%;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 16px;
    height: 28px;
}
.add_baike_type_select_name{
	display: inline-block;
    width: 100%;
    padding-left: 10%;
    margin-top: 3px;
}
.add_baike_type_select_ul{
    position: absolute;
    width: 100%;
    text-align: center;
    border: 1px solid #ccc;
    top: 27px;
    background: #fff;
    z-index: 10;
    display: none;
}
.add_baike_type_select_li{
    border-bottom: 1px solid #ccc;
    height: 29px;
    line-height: 29px;
}
.add_baike_type_author{
    display: inline-block;
    width: 10%;
    text-align: right;
}
.add_baike_type_author_value{
    display: inline-block;
    background: #ddd;
    border: 1px solid #ccc;
    width: 21%;
    text-align: center;
    font-size: 16px;
    padding: 3px 0;
    margin-left: 3%;
}
.add_baike_cover_box{
    width: 60%;
    margin-left: 20%;
    padding-top: 29px;
}
.add_baike_cover_name{
    display: inline-block;
    width: 10%;
    text-align: right;
    margin-right: 3%;
}
.add_pic{
    margin-bottom: -49px;
    cursor: pointer;
}
.add_baike_article_box{
    width: 60%;
    margin-left: 20%;
    padding-top: 19px;
}
.add_baike_article_name{
    display: inline-block;
    width: 10%;
    text-align: right;
    margin-right: 4%;
    float: left;
}
.add_baike_article_content{
    display: inline-block;
    width: 86%;
}
.add_baike_article_edite{
    width: 100%;
    height: 350px;
    margin-bottom: 22px;
    
    opacity:0;
    filter:alpha(opacity=0);
}
.add_baike_save{
    background: #139FD2;
    color: #fff;
    border: none;
    font-size: 16px;
    padding: 4px 10px;
    border-radius: 4px;
    cursor: pointer;
}
.ckeditor{
	width: 100%;
	height:100%
}
</style>
<script type="text/javascript">
$(function(){
	/* $(".back_nav_li").eq(1).find(".back_article_header").addClass("index");
	$(".back_nav_li").eq(1).find(".back_article_ul").show();
	$(".back_nav_li").eq(1).find(".back_article_li").eq(0).addClass("index"); */
	
	$(".add_baike_type_select_name").click(function(){
		$(".add_baike_type_select_ul").toggle();
	});
	
	$(".baike_btn_back").click(function(){
		$("#baike_home").attr("action","${ctx}/admin/course/course_manage.page").submit();
	});
	
	$(".course_manage_btn_type_value").click(function(){
		$(".course_manage_btn_iden_type_ul").hide();
		$(".course_manage_btn_arg_type_ul").hide();
		
		/* 首先看看身份和机型有没有筛选 */
		if($.trim($(".course_manage_btn_iden_type_value").text())=="按身份筛选"){
			reminder_box("请选择身份");
			return;
		}
		if($.trim($(".course_manage_btn_arg_type_value").text())=="按机型选择"){
			reminder_box("请选择机型");
			return;
		}
		var html='';
		$.ajax({
			   type: "POST",
			   url: "${ctx}/api/getCourseCategories.json",
			   dataType: "json",
			   data: {userTypeId:$(".course_manage_btn_iden_type_value").attr("id"),uavTypeId:$(".course_manage_btn_arg_type_value").attr("id")},
			   success: function(msg){
				   console.log(msg.data);
				   if(msg.status==1){
					   if(msg.data.length>0){
						   for(var i=0;i<msg.data.length;i++){
							   html+='<li class="course_manage_btn_type_li" onclick="course_manage_btn_type_li(this,'+msg.data[i].id+')">'+msg.data[i].name+'</li>';
							}
						   /* 根据机型和身份查找对应的课程类别 */
							$(".course_manage_btn_type_ul").html(html);
							$(".course_manage_btn_type_ul").toggle();
					   }else{
						   reminder_box("没有对应的课程！！");
						   return;
					   }
				   }else{
				   }
			   }
			})
			
		
	});
	$(".course_manage_btn_arg_type_value").click(function(){
		$(".course_manage_btn_iden_type_ul").hide();
		$(".course_manage_btn_type_ul").hide();
		$(".course_manage_btn_arg_type_ul").toggle();
	});
	$(".course_manage_btn_iden_type_value").click(function(){
		$(".course_manage_btn_type_ul").hide();
		$(".course_manage_btn_arg_type_ul").hide();
		$(".course_manage_btn_iden_type_ul").toggle();
	});
})
function add_baike_type_select_li(e){
	var baike_type_value=$.trim($(e).text());
	$(".add_baike_type_select_name").text(baike_type_value);
	$(".add_baike_type_select_ul").toggle();
}
function course_manage_btn_type_li(e,id){
	var course_manage_type_value=$.trim($(e).text());
	$(".course_manage_btn_type_value").text(course_manage_type_value).attr("id",id);
	$(".course_manage_btn_type_ul").toggle();
}
function course_manage_btn_arg_type_li(e,id){
	var course_manage_type_value=$.trim($(e).text());
	$(".course_manage_btn_arg_type_value").text(course_manage_type_value).attr("id",id);
	$(".course_manage_btn_arg_type_ul").toggle();
}
function course_manage_btn_iden_type_li(e,id){
	/* 要将课程类别还原 */
	$(".course_manage_btn_type_value").text("按课程类别筛选").removeAttr("id");
	var course_manage_type_value=$.trim($(e).text());
	$(".course_manage_btn_iden_type_value").text(course_manage_type_value).attr("id",id);
	$(".course_manage_btn_iden_type_ul").toggle();
}
</script>

<form action="${ctx}/admin/course/baike.page" id="baike_home">
	<input type="hidden" value="${course.id}" class="course_id">
</form>

<div class="back_right_box">
	<h1 class="baike_header">课程管理</h1>
	<div class="baike_btn_box">
		<div class="baike_btn_back"><img alt="" src="${ctx}/images/icon_back.png" class="baike_btn_back_img"><span class="baike_btn_back_txt">返回></span></div>
		<c:choose>
			<c:when test="${empty course}">
				<span>添加课程</span>
			</c:when>
			<c:otherwise>
				<span>编辑课程</span>
			</c:otherwise>
		</c:choose>
	</div>
	
	<div class="add_baike_content">
		<div class="add_baike_header_box">
			<span class="add_baike_header_name">课程名称</span>
			<input type="text" maxlength="20" class="add_baike_header_name_value" value="${course.title}" placeholder="请输入课程名称">
		</div>
		<div class="add_baike_type_box">
			<span class="add_baike_type_author">发布者</span>
			<span class="add_baike_type_author_value">汉和学院</span>
		</div>
		
		<div class="course_manage_btn_iden_type_box">
			<c:choose>
				<c:when test="${empty course}">
					<span class="course_manage_btn_iden_type_value">按身份筛选</span>
				</c:when>
				<c:otherwise>
					<span class="course_manage_btn_iden_type_value" id="${course.userTypeId}">${course.userTypeName}</span>
				</c:otherwise>
			</c:choose>
		
			<ul class="course_manage_btn_iden_type_ul">
				<c:forEach items="${userTypes}" var="userType">
					<li class="course_manage_btn_iden_type_li" onclick="course_manage_btn_iden_type_li(this,'${userType.id}')">${userType.name}</li>
				</c:forEach>
			</ul>
		</div>
		<div class="course_manage_btn_arg_type_box">
			<c:choose>
				<c:when test="${empty course}">
					<span class="course_manage_btn_arg_type_value">按机型选择</span>
				</c:when>
				<c:otherwise>
					<span class="course_manage_btn_arg_type_value" id="${course.uavTypeId}">${course.uavTypeName}</span>
				</c:otherwise>
			</c:choose>
			<ul class="course_manage_btn_arg_type_ul">
				<c:forEach items="${uavTypes}" var="uavType">
					<li class="course_manage_btn_arg_type_li" onclick="course_manage_btn_arg_type_li(this,'${uavType.id}')">${uavType.name}</li>
				</c:forEach>	
			</ul>
		</div>
		
		<div class="course_manage_btn_type_box">
			<c:choose>
				<c:when test="${empty course}">
					<span class="course_manage_btn_type_value">按课程类别筛选</span>
				</c:when>
				<c:otherwise>
					<span class="course_manage_btn_type_value" id="${course.courseCategoryId}">${course.courseCategory}</span>
				</c:otherwise>
			</c:choose>
			<ul class="course_manage_btn_type_ul">
			</ul>
		</div>
		
		<div class="add_baike_article_box">
			<span class="add_baike_article_name">内容</span>
			<div class="add_baike_article_content">
				<div class="add_baike_article_edite">
					<textarea id="TextArea1" class="ckeditor">${course.content}</textarea>
				</div>
				<input type="button" class="add_baike_save" value="提交保存">
			</div>
		</div>
</div>


<script type="text/javascript">
var maxlength =25000;
$(function(){
	
	var _editor=CKEDITOR.replace('TextArea1');
	/* if($.trim($(".course_content").val())!=''){
		setContent($.trim($(".course_content").val()));
	} */
	$(".add_baike_article_edite").css("opacity",1);
	
	_editor.on('key',function(event){
	     var oldhtml = _editor.document.getBody().getHtml();
	     var description = oldhtml.replace(/<.*?>/ig,"");
	     var etop = $("#cke_1_top");
	     var _slen = maxlength-description.length;
	     
	     var canwrite = $("<label id='canwrite'>还可以输入200字</label>");
	     
	     if(etop.find("#canwrite").length<1){
	         canwrite.css({border:'1px #f1f1f1 solid','line-height':'28px',color:'#999'});
	         etop.prepend(canwrite);
	     }
	     
	     var _label = etop.find("#canwrite");
	     
	     if(description.length>maxlength){
	         //alert("最多可以输入"+maxlength+"个文字，您已达到最大字数限制");
	         _editor.setData(oldhtml);
	         _label.html("还可以输入0字");
	     }else{
	         _label.html("还可以输入"+_slen+"字");
	     }
	 });
	
	$(".add_baike_save").click(function(){
		/* 检查数据有效性 */
		var value=$.trim($(".add_baike_header_name_value").val());
		if(value==""){
			reminder_box("请输入课程的名称");
			return;
		}
		
		if(value.length<2){
			reminder_box("课程的名称至少大于两个字符");
			return;
		}
		
		value=$.trim($(".course_manage_btn_iden_type_value").text());
		if(value=="按身份筛选"){
			reminder_box("请选择身份");
			return;
		}
		value=$.trim($(".course_manage_btn_arg_type_value").text());
		if(value=="按机型选择"){
			reminder_box("请选择机型");
			return;
		}
		value=$.trim($(".course_manage_btn_type_value").text());
		if(value=="按课程类别筛选"){
			reminder_box("请选择课程类别");
			return;
		}
		
		value=$.trim(getContent()); 
		if(value==""){
			reminder_box("请输入课程的内容");
			return;
		}
		
		var courseCategoryId =$(".course_manage_btn_type_value").attr("id");
		var data;
		if($.trim($(".course_id").val())==""){
			data = {
					courseCategoryId: courseCategoryId,
		            author: $(".add_baike_type_author_value").text(),
		            title: $(".add_baike_header_name_value").val(),
		            content: getContent(),
				}
		}else{
			data = {
					id:$.trim($(".course_id").val()),
					courseCategoryId: courseCategoryId,
		            author: $(".add_baike_type_author_value").text(),
		            title: $(".add_baike_header_name_value").val(),
		            content: getContent(),
				}
		}
		$.ajax({
            type: "POST",
            url: "${ctx}/admin/course/saveCourse.json",
            dataType: "json",
            data: data,
            success: function(msg) {
                if(msg.status==1){
                	if($.trim($(".course_id").val())==""){
                		reminder_box("保存成功！");
                	}else{
                		reminder_box("编辑成功！");
                	}
                	setTimeout(function(){
                		location.href="${ctx}/admin/course/course_manage.page";
                	},1500);
                }else{
                		reminder_box(msg.msg);
                }
            }
		});
		
	});
})
</script>
<script type="text/javascript" src="${ctx}/js/ckeditor/ckeditor.js"></script>
