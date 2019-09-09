<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
<style>
.back_right_box{
    background: #fafafa;
        font-size: 16px;
}
.identity_configuration_header{
    width: 100%;
    border-bottom: 1px solid #ccc;
    font-size: 20px;
    padding: 6px 0 6px 23px;
    background: #fff;
}
.identity_configuration_content{
	background: #fff;
    width: 98%;
    margin-left: 1%;
    font-size: 20px;
    padding-bottom: 35px;
    margin-top: 46px;
    padding: 20px 0 35px 21%;
}
.identity_configuration_name{
    font-size: 20px;
    margin-right: 15px;
}
.identity_configuration_value{
	font-size: 16px;
    padding: 5px;
    border-radius: 5px;
    border: 1px solid #ccc;
    width: 37%;
    margin-right: 15px;
        text-align: center;
}
.identity_configuration_save{
    font-size: 16px;
    background: #139FD2;
    color: #fff;
    padding: 4px 10px;
    border-radius: 5px;
    cursor: pointer;
}
.identity_configuration_ul{

}
.identity_configuration_li{
    margin-bottom: 17px;
}
.identity_configuration_li_name{
    margin-right: 15px;
    font-size: 20px;
}
.identity_configuration_li_value{
    font-size: 16px;
    padding: 5px;
    border-radius: 5px;
    border: 1px solid #ccc;
    width: 37%;
    margin-right: 15px;
    background: #ccc;
    display: inline-block;
        text-align: center;
}
.identity_configuration_li_iden,.identity_configuration_li_arg{
	font-size: 16px;
    padding: 5px;
    border-radius: 5px;
    border: 1px solid #ccc;
    width:13%;
    margin-right: 15px;
    background: #ccc;
    display: inline-block;
    text-align: center;
}
.identity_configuration_li_del{
    font-size: 15px;
    border: 1px solid #ccc;
    padding: 5px 10px;
    border-radius: 6px;
    cursor: pointer;
}
.iden_type_name{
    display: inline-block;
    width: 9.5%;
    text-align: right;
    margin-right: 9px;
}
.iden_type_select{
	background: url(${ctx}/images/triangle.png) no-repeat 93% center; 
	    display: inline-block;
    position: relative;
    width: 12%;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 16px;
    height: 28px;
    margin-bottom: 23px;
}
.iden_type_select_name{
	display: inline-block;
    width: 100%;
    padding-left: 10%;
    margin-top: 3px;
}
.iden_type_select_ul{
    position: absolute;
    width: 100%;
    text-align: center;
    border: 1px solid #ccc;
    top: 27px;
    background: #fff;
    z-index: 10;
    display: none;
}
.iden_type_select_li{
    border-bottom: 1px solid #ccc;
    height: 29px;
    line-height: 29px;
    cursor:pointer
}
.arg_type_name{
    display: inline-block;
    width: 10%;
    text-align: right;
    margin-right:10px;
}
.arg_type_select{
	background: url(${ctx}/images/triangle.png) no-repeat 93% center; 
	    display: inline-block;
    position: relative;
    width:12%;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 16px;
    height: 28px;
    margin-right: 66px;
}
.arg_type_select_name{
	display: inline-block;
    width: 100%;
    padding-left: 10%;
    margin-top: 3px;
    
}
.arg_type_select_ul{
    position: absolute;
    width: 100%;
    text-align: center;
    border: 1px solid #ccc;
    top: 27px;
    background: #fff;
    z-index: 10;
    display: none;
}
.arg_type_select_li{
    border-bottom: 1px solid #ccc;
    height: 29px;
    line-height: 29px;
    cursor:pointer
}
</style>
<script type="text/javascript">
$(function(){
	/* $(".back_nav_li").eq(6).find(".back_article_header").addClass("index");
	$(".back_nav_li").eq(6).find(".back_article_ul").show();
	$(".back_nav_li").eq(6).find(".back_article_li").eq(2).addClass("index"); */
	
	$(".identity_configuration_save").click(function(){
		var iden_value=$.trim($(".iden_type_select_name").text());
		
		if(iden_value=="按身份筛选"){
			reminder_box("请筛选身份");
			return;
		}
		
		var arg_value=$.trim($(".arg_type_select_name").text());
		if(arg_value=="按机型筛选"){
			reminder_box("请筛选机型");
			return;
		}
		
		if($.trim($(".identity_configuration_value").val())==""){
			reminder_box("请输入培训类型名称");
			return;
		}
		
		
		/* 开始新增加 */
		$.ajax({
		   type: "POST",
		   url: "${ctx}/admin/config/saveTrainingType.json",
		   dataType: "json",
		   data: {userTypeId:$(".iden_type_select_name").attr("id"),uavTypeId:$(".arg_type_select_name").attr("id"),name:$.trim($(".identity_configuration_value").val())},
		   success: function(msg){
			   console.log(msg);
			   if(msg.status==1){
					location.reload();
			   }else{
				   reminder_box(msg.msg);
			   }
			   }
			})
		});
	
	$(".confirm_box_close,.confirm_li.cancel").click(function(){
		$(".confirm_box").hide();
		$(".bg").hide();
	});
	
	$(".arg_type_select_name").click(function(){
		$(".arg_type_select_ul").toggle();
	});
	
	$(".iden_type_select_name").click(function(){
		$(".iden_type_select_ul").toggle();
	});
})

function identity_configuration_li_del(id){
	$(".confirm_box").show();
	$(".bg").show();
	$(".confirm_header").text("您确认删除该培训类型吗？");
	
	$(".confirm_li.confirm").off('click').on("click",function(){
		$.ajax({
			   type: "POST",
			   url: "${ctx}/admin/config/deleteTrainingType.json",
			   dataType: "json",
			   data: {id:id},
			   success: function(msg){
				   console.log(msg);
				   if(msg.status==1){
						location.reload();
				   }else{
					   reminder_box(msg.msg);
				   }
			   }
		})
	});
}
function iden_type_select_li(e,id){
	var baike_type_value=$.trim($(e).text());
	$(".iden_type_select_name").text(baike_type_value).attr("id",id);
	$(".iden_type_select_ul").toggle();
}
function arg_type_select_li(e,id){
	var baike_type_value=$.trim($(e).text());
	$(".arg_type_select_name").text(baike_type_value).attr("id",id);;
	$(".arg_type_select_ul").toggle();
}
</script>
<form action="" method="post" id="identity_configuration_home">
	
</form>
<div class="back_right_box">
	<h1 class="identity_configuration_header">培训类型配置</h1>
	
	<div class="identity_configuration_content">
			<span class="iden_type_name">身份</span>
			<div class="iden_type_select">
				<span class="iden_type_select_name">按身份筛选</span>
				<ul class="iden_type_select_ul">
					<c:forEach items="${userTypes}" var="userType">
						<li class="iden_type_select_li" onclick="iden_type_select_li(this,'${userType.id}')">${userType.name}</li>
					</c:forEach>
				</ul>
			</div>
			<span class="arg_type_name">机型</span>
			<div class="arg_type_select">
				<span class="arg_type_select_name">按机型筛选</span>
				<ul class="arg_type_select_ul">
					<c:forEach items="${uavTypes}" var="uavType">
						<li class="arg_type_select_li" onclick="arg_type_select_li(this,'${uavType.id}')">${uavType.name}</li>
					</c:forEach>
				</ul>
			</div>
			
		<div>
			<span class="identity_configuration_name">培训类型名称</span><input type="text" placeholder="请输入培训类型名称" class="identity_configuration_value"><span class="identity_configuration_save">保存</span>
		</div>	
	</div>
	<c:if test="${ not empty trainTypes}">
	<div class="identity_configuration_content list">
		<ul class="identity_configuration_ul">
			<c:forEach items="${trainTypes}" var="trainType">
			    <li class="identity_configuration_li">
				    <span class="identity_configuration_li_iden">${trainType.userType}</span>
			        <span class="identity_configuration_li_arg">${trainType.uavType}</span>
					<span class="identity_configuration_li_value">${trainType.name}</span>
					<span class="identity_configuration_li_del" onclick="identity_configuration_li_del('${trainType.id}')">删除</span>
				</li>
			</c:forEach>
		</ul>
	</div>
	</c:if>
</div>


