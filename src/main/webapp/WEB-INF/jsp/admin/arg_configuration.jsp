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
.identity_configuration_li_del{
    font-size: 15px;
    border: 1px solid #ccc;
    padding: 5px 10px;
    border-radius: 6px;
    cursor: pointer;
}
</style>
<script type="text/javascript">
$(function(){
	/* $(".back_nav_li").eq(6).find(".back_article_header").addClass("index");
	$(".back_nav_li").eq(6).find(".back_article_ul").show();
	$(".back_nav_li").eq(6).find(".back_article_li").eq(1).addClass("index"); */
	
	$(".identity_configuration_save").click(function(){
		if($.trim($(".identity_configuration_value").val())==""){
			reminder_box("请输入机型名称");
			return;
		}
		
		
		/* 开始新增加 */
		$.ajax({
		   type: "POST",
		   url: "${ctx}/admin/config/saveUavType.json",
		   dataType: "json",
		   data: {name:$.trim($(".identity_configuration_value").val())},
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
})

function identity_configuration_li_del(id){
	$(".confirm_box").show();
	$(".bg").show();
	$(".confirm_header").text("您确认删除该机型吗？");
	
	$(".confirm_li.confirm").off('click').on("click",function(){
		$.ajax({
			   type: "POST",
			   url: "${ctx}/admin/config/deleteUavType.json",
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
</script>
<form action="" method="post" id="identity_configuration_home">
	
</form>
<div class="back_right_box">
	<h1 class="identity_configuration_header">机型配置</h1>
	
	<div class="identity_configuration_content">
		<span class="identity_configuration_name">机型名称</span><input type="text" placeholder="请输入机型名称" class="identity_configuration_value"><span class="identity_configuration_save">保存</span>
	</div>
	<c:if test="${ not empty uavTypes}">
		<div class="identity_configuration_content list">
			<ul class="identity_configuration_ul">
				<c:forEach items="${uavTypes}" var="uavType">
					<li class="identity_configuration_li">
						<span class="identity_configuration_li_name">身份名称</span>
						<span class="identity_configuration_li_value">${uavType.name}</span>
						<span class="identity_configuration_li_del" onclick="identity_configuration_li_del('${uavType.id}')">删除</span>
					</li>
				</c:forEach>
			</ul>
		</div>
	</c:if>
</div>


