<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
<script type="text/javascript" src="${ctx}/js/ckeditor/ckeditor.js"></script> 
<style>
.back_right_box{
    background: #fafafa;
        font-size: 16px;
}
.study_instruction_header{
    width: 100%;
    border-bottom: 1px solid #ccc;
    font-size: 20px;
    padding: 6px 0 6px 23px;
    background: #fff;
}
.study_instruction_btn_box{
    font-size: 16px;
    margin-left: 1%;
    margin: 12px 1%;
}
.study_instruction_btn_back{
	display: inline-block;
    cursor: pointer;
}
.study_instruction_btn_back_img{
    width: 15px;
    margin-right: 7px;
}
.study_instruction_btn_back_txt{

}
.add_study_instruction_content{
	background: #fff;
    width: 98%;
    margin-left: 1%;
    font-size: 20px;
    padding-bottom: 35px;
}
.add_study_instruction_header_box{
    width: 60%;
    margin-left: 20%;
    padding-top: 60px;
}
.add_study_instruction_header_name{
    display: inline-block;
    width: 10%;
    text-align: right;
}
.add_study_instruction_header_name_value{
	float: right;
    width: 86%;
    border: 1px solid #ccc;
    font-size: 16px;
    height: 30px;
    border-radius: 4px;
    padding-left: 14px;
    cursor: pointer;
}
.add_study_instruction_type_box{
    width: 60%;
    margin-left: 20%;
    padding-top: 29px;
    cursor: pointer;
}
.add_study_instruction_type_name{
    display: inline-block;
    width: 10%;
    text-align: right;
    margin-right: 3%;
}
.add_study_instruction_type_select{
	background: url(${ctx}/images/triangle.png) no-repeat 93% center; 
	    display: inline-block;
    position: relative;
    width: 14%;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 16px;
    height: 28px;
}
.add_study_instruction_type_select_name{
	display: inline-block;
    width: 100%;
    padding-left: 10%;
    margin-top: 3px;
}
.add_study_instruction_type_select_ul{
    position: absolute;
    width: 100%;
    text-align: center;
    border: 1px solid #ccc;
    top: 27px;
    background: #fff;
    z-index: 10;
    display: none;
}
.add_study_instruction_type_select_li{
    border-bottom: 1px solid #ccc;
    height: 29px;
    line-height: 29px;
}
.add_study_instruction_type_author{
    float: right;
    margin-right: 3%;
}
.add_study_instruction_type_author_value{
    background: #ddd;
    border: 1px solid #ccc;
    width: 21%;
    text-align: center;
    font-size: 16px;
    padding: 3px 0;
    display: inline-block;
}
.add_study_instruction_cover_box{
    width: 60%;
    margin-left: 20%;
    padding-top: 29px;
}
.add_study_instruction_cover_name{
    display: inline-block;
    width: 10%;
    text-align: right;
    margin-right: 3%;
}
.add_pic{
    margin-bottom: -49px;
    cursor: pointer;
}
.add_study_instruction_article_box{
    width: 60%;
    margin-left: 20%;
    padding-top: 22px;
}
.add_study_instruction_article_name{
    display: inline-block;
    width: 10%;
    text-align: right;
    margin-right: 4%;
    float: left;
}
.add_study_instruction_article_content{
    display: inline-block;
    width: 86%;
}
.add_study_instruction_article_edite{
    width: 100%;
    height: 350px;
    margin-bottom: 22px;
}
.add_study_instruction_save{
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
	height:100%;
}
</style>
<script type="text/javascript">
$(function(){
	/* $(".back_nav_li").eq(0).find(".back_article_header").addClass("index");
	$(".back_nav_li").eq(0).find(".back_article_ul").show();
	$(".back_nav_li").eq(0).find(".back_article_li").eq(3).addClass("index"); */
	
	$(".add_study_instruction_type_select_name").click(function(){
		$(".add_study_instruction_type_select_ul").toggle();
	});
	
	$(".study_instruction_btn_back").click(function(){
		$("#study_instruction_home").attr("action","${ctx}/admin/knowledge/study_instruction.page").submit();
	});
})
function add_study_instruction_type_select_li(e){
	var study_instruction_type_value=$.trim($(e).text());
	$(".add_study_instruction_type_select_name").text(study_instruction_type_value);
	$(".add_study_instruction_type_select_ul").toggle();
}
</script>

<form action="${ctx}/admin/knowledge/study_instruction_home.page" id="study_instruction_home">
	<input type="hidden" value="${guideline.id}" class="guideline_id">
	<input type="hidden" value="${guideline.content}" class="guideline_content">
</form>
<div class="back_right_box">
	<h1 class="study_instruction_header">学习指引</h1>
	<div class="study_instruction_btn_box">
		<div class="study_instruction_btn_back"><img alt="" src="${ctx}/images/icon_back.png" class="study_instruction_btn_back_img"><span class="study_instruction_btn_back_txt">返回></span></div><span>学习指引</span>
	</div>
	
	<div class="add_study_instruction_content">
		<div class="add_study_instruction_header_box">
			<span class="add_study_instruction_header_name">题目</span>
			<input maxlength="20" type="text" class="add_study_instruction_header_name_value" value="${guideline.title}" placeholder="请输入题目">
		</div>
		<div class="add_study_instruction_article_box">
			<span class="add_study_instruction_article_name">内容</span>
			<div class="add_study_instruction_article_content">
				<div class="add_study_instruction_article_edite">
					<c:choose>
						<c:when test="${empty guideline.content}">
							<textarea maxlength="50000" id="TextArea1" class="ckeditor"></textarea>
						</c:when>
						<c:otherwise>
							<textarea maxlength="50000" id="TextArea1" class="ckeditor">${guideline.content}</textarea>
						</c:otherwise>
					</c:choose>
					
				</div>
				<input type="button" class="add_study_instruction_save" value="提交保存">
			</div>
		</div>
</div>


<script type="text/javascript">
var maxlength =25000;
$(function(){
	var _editor=CKEDITOR.replace('TextArea1');
	$(".add_course_manage_article_edite").css("opacity",1);
	
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
	
	
	
	$(".add_study_instruction_save").click(function(){
		/* 检查数据有效性 */
		var value=$.trim($(".add_study_instruction_header_name_value").val());
		if(value==""){
			reminder_box("请输入学习指引的题目");
			return;
		}
		
		if(value.length<2){
			reminder_box("指引的标题至少大于两个字符");
			return;
		}
		
		value=$.trim(getContent()); 
		if(value==""){
			reminder_box("请输入学习指引的内容");
			return;
		}
		
		if(value.length<2){
			reminder_box("指引的内容至少大于两个字符");
			return;
		}
		
		
		var data;
		if($.trim($(".guideline_id").val())==""){
			data = {
		            title: $(".add_study_instruction_header_name_value").val(),
		            content:value,
				}
		}else{
			data = {
					id:$.trim($(".guideline_id").val()),
		            title: $(".add_study_instruction_header_name_value").val(),
		            content:value,
				}
		}
		
		$.ajax({
            type: "POST",
            url: "${ctx}/admin/knowledge/saveGuideline.json",
            dataType: "json",
            data: data,
            success: function(msg) {
                if(msg.status==1){
                	if($.trim($(".guideline_id").val())==""){
                		reminder_box("保存成功！");
                	}else{
                		reminder_box("编辑成功！");
                	}
                	setTimeout(function(){
                		location.href="${ctx}/admin/knowledge/study_instruction.page";
                	},1500);
                }else{
                	
                		reminder_box(msg.msg);
                	
                }
            }
		});
		
		
	});
})
</script>
