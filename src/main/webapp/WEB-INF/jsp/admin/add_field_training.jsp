<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
<style>
.ckeditor{
    padding: 10px;
    font-size: 16px;
    resize:none
}
.back_right_box{
    background: #fafafa;
        font-size: 16px;
}
.field_training_header{
    width: 100%;
    border-bottom: 1px solid #ccc;
    font-size: 20px;
    padding: 6px 0 6px 23px;
    background: #fff;
}
.field_training_btn_box{
    font-size: 16px;
    margin-left: 1%;
    margin: 12px 1%;
}
.field_training_btn_back{
	display: inline-block;
    cursor: pointer;
}
.field_training_btn_back_img{
    width: 15px;
    margin-right: 7px;
}
.field_training_btn_back_txt{

}
.add_field_training_content{
	background: #fff;
    width: 98%;
    margin-left: 1%;
    font-size: 20px;
    padding-bottom: 35px;
}
.add_field_training_header_box{
    width: 60%;
    margin-left: 20%;
    padding-top: 60px;
}
.add_field_training_header_name{
    display: inline-block;
    margin-right: 6px;
}
.add_field_training_header_name_value{
    width: 43%;
    border: 1px solid #ccc;
    font-size: 16px;
    height: 30px;
    border-radius: 4px;
    padding-left: 14px;
    cursor: pointer;
}
.add_field_training_type_box{
    width: 60%;
    margin-left: 20%;
    padding-top: 29px;
    cursor: pointer;
}
.add_field_training_type_name{
    display: inline-block;
    width: 10%;
    text-align: right;
    margin-right: 3%;
}
.add_field_training_type_select{
	background: url(${ctx}/images/triangle.png) no-repeat 93% center; 
	    display: inline-block;
    position: relative;
    width: 14%;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 16px;
    height: 28px;
}
.add_field_training_type_select_name{
	display: inline-block;
    width: 100%;
    padding-left: 10%;
    margin-top: 3px;
}
.add_field_training_type_select_ul{
    position: absolute;
    width: 100%;
    text-align: center;
    border: 1px solid #ccc;
    top: 27px;
    background: #fff;
    z-index: 10;
    display: none;
}
.add_field_training_type_select_li{
    border-bottom: 1px solid #ccc;
    height: 29px;
    line-height: 29px;
}
.add_field_training_type_author{
    float: right;
    margin-right: 3%;
}
.add_field_training_type_author_value{
    background: #ddd;
    border: 1px solid #ccc;
    width: 21%;
    text-align: center;
    font-size: 16px;
    padding: 3px 0;
    display: inline-block;
}
.add_field_training_cover_box{
    width: 60%;
    margin-left: 20%;
    padding-top: 29px;
}
.add_field_training_cover_name{
    display: inline-block;
    width: 10%;
    text-align: right;
    margin-right: 3%;
}
.add_pic{
    margin-bottom: -49px;
    cursor: pointer;
}
.add_field_training_article_box{
    width: 60%;
    margin-left: 20%;
    padding-top: 22px;
}
.add_field_training_article_name{
    display: inline-block;
    text-align: right;
    margin-right: 10px;
    float: left;
}
.add_field_training_article_content{
    display: inline-block;
    width: 86%;
}
.add_field_training_article_edite{
    width: 100%;
    height: 350px;
    margin-bottom: 22px;
}
.add_field_training_save{
    background: #139FD2;
    color: #fff;
    border: none;
    font-size: 16px;
    padding: 4px 10px;
    border-radius: 4px;
    cursor: pointer;
}
.add_field_training_money_name_value{
    float: right;
    width: 32%;
    border: 1px solid #ccc;
    font-size: 16px;
    height: 30px;
    border-radius: 4px;
    padding-left: 14px;
    cursor: pointer;
}
.add_field_training_money_name{
    float: right;
    margin-right: 12px;
}
.ckeditor{
	width: 100%;
	height:100%
}
</style>
<script type="text/javascript">
$(function(){
	/* $(".back_nav_li").eq(3).find(".back_article_header").addClass("index");
	$(".back_nav_li").eq(3).find(".back_article_ul").show();
	$(".back_nav_li").eq(3).find(".back_article_li").eq(0).addClass("index"); */
	
	$(".add_field_training_type_select_name").click(function(){
		$(".add_field_training_type_select_ul").toggle();
	});
	
	$(".field_training_btn_back").click(function(){
		$("#field_training_home").attr("action","${ctx}/admin/training/field_training.page").submit();
	});
})
function add_field_training_type_select_li(e){
	var field_training_type_value=$.trim($(e).text());
	$(".add_field_training_type_select_name").text(field_training_type_value);
	$(".add_field_training_type_select_ul").toggle();
}
</script>
<form action="" method="post" id="field_training_home">
	<input type="hidden" value="${trainingCourse.id}" class="training_id">
</form>
<div class="back_right_box">
	<h1 class="field_training_header">实操培训</h1>
	<div class="field_training_btn_box">
		<div class="field_training_btn_back"><img alt="" src="${ctx}/images/icon_back.png" class="field_training_btn_back_img"><span class="field_training_btn_back_txt">返回></span></div>
		<c:choose>
			<c:when test="${empty trainingCourse}">
				<span>添加培训内容</span>
			</c:when>
			<c:otherwise>
				<span>编辑培训内容</span>
			</c:otherwise>
		</c:choose>
	</div>
	
	<div class="add_field_training_content">
		<div class="add_field_training_header_box">
			<span class="add_field_training_header_name">培训主题</span>
			<input type="text" class="add_field_training_header_name_value" maxlength="20" value="${trainingCourse.name}" placeholder="请输入培训主题">
			<input class="add_field_training_money_name_value" value="${trainingCourse.trainingFee}" placeholder="请输入培训费用" maxlength="250" >
			<span class="add_field_training_money_name">培训费用</span>
		</div>
		<div class="add_field_training_article_box">
			<span class="add_field_training_article_name">培训内容</span>
			<div class="add_field_training_article_content">
				<div class="add_field_training_article_edite">
					<textarea maxlength="25000" class="ckeditor">${trainingCourse.trainingContent}</textarea>
				</div>
				<input type="button" class="add_field_training_save" value="提交保存">
			</div>
		</div>
</div>
<script type="text/javascript">
$(function(){
	$(".add_field_training_save").click(function(){
		/* 检查数据有效性 */
		var value=$.trim($(".add_field_training_header_name_value").val());
		if(value==""){
			reminder_box("请输入培训主题");
			return;
		}
		value=$.trim($(".add_field_training_money_name_value").val());
		if(value==""){
			reminder_box("请输入培训费用");
			return;
		}
		
		value=$.trim($(".ckeditor").val()); 
		if(value==""){
			reminder_box("请输入培训的内容");
			return;
		}
		
		/* 保存和编辑的方法 */
		var data;
		if($.trim($(".training_id").val())==""){
			data = {
					name:$.trim($(".add_field_training_header_name_value").val()),
					trainingContent:$.trim($(".ckeditor").val()),
					trainingFee:$.trim($(".add_field_training_money_name_value").val())
				}
		}else{
			data = {
					id:$.trim($(".training_id").val()),
					name:$.trim($(".add_field_training_header_name_value").val()),
					trainingContent:$.trim($(".ckeditor").val()),
					trainingFee:$.trim($(".add_field_training_money_name_value").val())
				}
		}
		$.ajax({
            type: "POST",
            url: "${ctx}/admin/training/saveTrainingCourse.json",
            dataType: "json",
            data: data,
            success: function(msg) {
                if(msg.status==1){
                	if($.trim($(".training_id").val())==""){
                		reminder_box("保存成功！");
                	}else{
                		reminder_box("编辑成功！");
                	}
                	setTimeout(function(){
                		location.href="${ctx}/admin/training/field_training.page";
                	},1500);
                }else{
                	reminder_box(msg.msg);
                }
            }
		});
	});
})
</script>
