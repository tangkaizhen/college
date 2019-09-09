<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
<script type="text/javascript" src="${ctx}/js/jquery.md5.js"></script>
<style>
.back_right_box{
    background: #fafafa;
        font-size: 16px;
}
.manager_manage_header{
    width: 100%;
    border-bottom: 1px solid #ccc;
    font-size: 20px;
    padding: 6px 0 6px 23px;
    background: #fff;
}
.manager_manage_btn_box{
    font-size: 16px;
    margin-left: 1%;
    margin: 12px 1%;
}
.manager_manage_btn_back{
	display: inline-block;
    cursor: pointer;
}
.manager_manage_btn_back_img{
    width: 15px;
    margin-right: 7px;
}
.manager_manage_btn_back_txt{

}
.add_manager_manage_content{
	background: #fff;
    width: 98%;
    margin-left: 1%;
    font-size: 20px;
    padding-bottom: 35px;
}
.add_manager_manage_header_box{
    width: 45%;
    margin-left: 25%;
    padding-top: 50px;
    overflow: hidden;
}
.add_manager_manage_header_name{
    display: inline-block;
    width: 17%;
    text-align: right;
}
.add_manager_manage_header_name_value{
	float: right;
    width: 79%;
    border: 1px solid #ccc;
    font-size: 16px;
    height: 30px;
    border-radius: 4px;
    padding-left: 14px;
    cursor: pointer;
}
.add_manager_manage_type_box{
    width: 60%;
    margin-left: 20%;
    padding-top: 29px;
    cursor: pointer;
}
.add_manager_manage_type_name{
    display: inline-block;
    width: 10%;
    text-align: right;
    margin-right: 3%;
}
.add_manager_manage_type_select{
	background: url(${ctx}/images/triangle.png) no-repeat 93% center; 
	    display: inline-block;
    position: relative;
    width: 14%;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 16px;
    height: 28px;
}
.add_manager_manage_type_select_name{
	display: inline-block;
    width: 100%;
    padding-left: 10%;
    margin-top: 3px;
}
.add_manager_manage_type_select_ul{
    position: absolute;
    width: 100%;
    text-align: center;
    border: 1px solid #ccc;
    top: 27px;
    background: #fff;
    z-index: 10;
    display: none;
}
.add_manager_manage_type_select_li{
    border-bottom: 1px solid #ccc;
    height: 29px;
    line-height: 29px;
}
.add_manager_manage_type_author{
    float: right;
    margin-right: 3%;
}
.add_manager_manage_type_author_value{
    float: right;
    background: #ddd;
    border: 1px solid #ccc;
    width: 21%;
    text-align: center;
    font-size: 16px;
    padding: 3px 0;
}
.add_manager_manage_cover_box{
    width: 60%;
    margin-left: 20%;
    padding-top: 29px;
}
.add_manager_manage_cover_name{
    display: inline-block;
    width: 10%;
    text-align: right;
    margin-right: 3%;
}
.add_pic{
    margin-bottom: -49px;
    cursor: pointer;
}
.add_manager_manage_article_box{
    width: 60%;
    margin-left: 20%;
    padding-top: 76px;
}
.add_manager_manage_article_name{
    display: inline-block;
    width: 10%;
    text-align: right;
    margin-right: 4%;
    float: left;
}
.add_manager_manage_article_content{
    display: inline-block;
    width: 86%;
}
.add_manager_manage_article_edite{
    width: 100%;
    height: 350px;
    margin-bottom: 22px;
}
.add_manager_manage_save{
    background: #139FD2;
    color: #fff;
    border: none;
    font-size: 16px;
    padding: 4px 10px;
    border-radius: 4px;
    cursor: pointer;
    margin-left: 48%;
}

.add_manager_manage_ul{
    float: right;
    width: 79%;
    font-size: 16px;
    margin-top: 6px;
}
.add_manager_manage_li{
    margin-bottom: 23px;
}
.add_manager_manage_checkbox{
    margin-right: 7px;
    width: 16px;
    height: 16px;
    top: 2px;
    position: relative;
    cursor: pointer;
}
.add_manager_manage_checkbox_value{
	color: #000;
}


</style>
<script type="text/javascript">
function isSelect(p1,p2){
	console.log(p1+p2);
}
$(function(){
	/* $(".back_nav_li").eq(5).find(".back_article_header").addClass("index");
	$(".back_nav_li").eq(5).find(".back_article_ul").show();
	$(".back_nav_li").eq(5).find(".back_article_li").eq(0).addClass("index"); */
	
	$(".manager_manage_btn_back").click(function(){
		$("#manager_manage_home").attr("action","${ctx}/admin/user/manager_manage.page").submit();
	});
	
	if("${admin}"){
		$(".roleList").each(function(){
			var role_list_value=$(this).val();
			
			$(".add_manager_manage_checkbox_value").each(function(){
				if($.trim($(this).text())==role_list_value){
					$(this).siblings().prop({checked:true});
				}
			});
		});
	}
	
	$(".add_manager_manage_save").click(function(){
		var value=$.trim($(".account").val());
		if(value==""){
			reminder_box("请输入管理员的账号");
			return;
		}
		value=$.trim($(".nickname").val());
		if(value==""){
			reminder_box("请输入管理员的昵称");
			return;
		}
		if('${admin.id}'=='') {
            value=$.trim($(".password").val());
            if(value==""&&$(".admin_id").val()==""){
                reminder_box("请输入管理员的密码");
                return;
            }
            if(value.length<6){
                reminder_box("管理员的密码要大于等于6位");
                return;
            }
            if(value.length>12){
                reminder_box("管理员的密码要小于等于12位");
                return;
            }
		}

		var roleIds='';
		var ifhasnotselect=true;
		$(".add_manager_manage_checkbox").each(function(){
			if($(this).is(":checked")){
				ifhasnotselect=false;
				roleIds+=$(this).attr("id")+",";
			}
		});
		if(ifhasnotselect){
			reminder_box("请选择管理员权限");
			return;
		}
		
		/* 去掉最后一个， */
		roleIds=roleIds.substring(0,roleIds.length-1);
		var data;
		if($.trim($(".admin_id").val())==""){
			data = {
					nickname:$.trim($(".nickname").val()),
					name: $.trim($(".account").val()),
					password:$.md5($.trim($(".password").val())),
					roleIds:roleIds
				}
		}else{
			data = {
					id:$.trim($(".admin_id").val()),
					nickname:$.trim($(".nickname").val()),
					name:$.trim($(".account").val()),
					roleIds:roleIds
				}
		}
		$.ajax({
            type: "POST",
            url: "${ctx}/admin/user/saveAdmin.json",
            dataType: "json",
            data: data,
            success: function(msg) {
                if(msg.status==1){
                	if($.trim($(".admin_id").val())==""){
                		reminder_box("保存成功！");
                	}else{
                		reminder_box("编辑成功！");
                	}
                	setTimeout(function(){
                		location.href="${ctx}/admin/user/manager_manage.page";
                	},1500);
                }else{
                	reminder_box(msg.msg);
                }
            }
		});
		
	});
})
</script>
<form action="" method="post" id="manager_manage_home">
	<input type="hidden" value="${admin.id}" class="admin_id">
</form>
<c:forEach items="${admin.roleList}" var="roleSelect">
	<input type="hidden" value="${roleSelect.name}" name="roleList" class="roleList">
</c:forEach>
<div class="back_right_box">
	<h1 class="manager_manage_header">管理员</h1>
	<div class="manager_manage_btn_box">
		<div class="manager_manage_btn_back"><img alt="" src="${ctx}/images/icon_back.png" class="manager_manage_btn_back_img"><span class="manager_manage_btn_back_txt">返回></span></div>
		<c:choose>
			<c:when test="${empty admin}">
				<span>添加管理员</span>
			</c:when>
			<c:otherwise>
				<span>编辑管理员</span>
			</c:otherwise>
		</c:choose>
	</div>
	
	<div class="add_manager_manage_content">
		<div class="add_manager_manage_header_box">
			<span class="add_manager_manage_header_name">账号</span>
			<c:choose>
				<c:when test="${empty admin}">
					<input type="text" maxlength="25" class="add_manager_manage_header_name_value account" placeholder="请输入管理员的账号">
				</c:when>
				<c:otherwise>
					<input type="text" style="background:#ccc" readonly value="${admin.name}" class="add_manager_manage_header_name_value account" placeholder="请输入管理员的账号">
				</c:otherwise>
			</c:choose>
			
		</div>
		<div class="add_manager_manage_header_box">
			<span class="add_manager_manage_header_name">昵称</span>
			<c:choose>
				<c:when test="${empty admin}">
					<input type="text" maxlength="25" class="add_manager_manage_header_name_value nickname" placeholder="请输入管理员的昵称">
				</c:when>
				<c:otherwise>
					<input type="text" style="background:#ccc" readonly value="${admin.nickname}" class="add_manager_manage_header_name_value nickname" placeholder="请输入管理员的昵称">
				</c:otherwise>
			</c:choose>
			
		</div>
		
		<c:if test="${empty admin}">
			<div class="add_manager_manage_header_box">
				<span class="add_manager_manage_header_name">密码</span>
				<input type="number" value="${admin.password}" maxlength="6" class="add_manager_manage_header_name_value password" placeholder="请输入管理员的密码(仅限数字)">
			</div>
		</c:if>
		
		<div class="add_manager_manage_header_box">
			<span class="add_manager_manage_header_name">权限选择</span>
			
			<ul class="add_manager_manage_ul">
				<c:forEach items="${roles}" var="role">
					<li class="add_manager_manage_li">
						<input type="checkbox" class="add_manager_manage_checkbox" id="${role.id}">
						<span class="add_manager_manage_checkbox_value">${role.name}</span>
					</li>
				</c:forEach>	
			</ul>
		</div>
		<input type="button" class="add_manager_manage_save" value="提交保存">
</div>

