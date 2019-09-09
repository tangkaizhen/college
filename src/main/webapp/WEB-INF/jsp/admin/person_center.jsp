<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
<script type="text/javascript" src="${ctx}/js/jquery.md5.js"></script>
<style>
.back_right_box{
    background: #fafafa;
        font-size: 16px;
        padding-top: 84px;
}
.person_center_header{
    width: 100%;
    border-bottom: 1px solid #ccc;
    font-size: 20px;
    padding: 6px 0 6px 23px;
    background: #fff;
}
.person_center_content{
    width: 98%;
    margin-left: 1%;
    background: #fff;
    padding: 95px 0;
}
.person_center_inner_content{
    width: 50%;
    margin-left: 25%;
    font-size: 20px;
}
.person_center_account_name{
    display: inline-block;
    width: 16%;
    text-align: right;
}
.person_center_account{
    overflow: hidden;
    margin-bottom: 40px;
}
.person_center_account_name{

}
.person_center_account_value{
    width: 81%;
    float: right;
    font-size: 16px;
    border: 1px solid #ccc;
    height: 31px;
    padding-left: 11px;
}
.person_center_nickname{
    overflow: hidden;
    margin-bottom: 40px;
}
.person_center_nickname_name{
    display: inline-block;
    width: 16%;
    text-align: right;
}
.person_center_nickname_value{
    width: 81%;
    float: right;
    font-size: 16px;
    border: 1px solid #ccc;
    height: 31px;
    padding-left: 11px;
}
.person_center_pass{
    overflow: hidden;
    margin-bottom: 40px;
}
.person_center_pass_name{
    display: inline-block;
    width: 16%;
    text-align: right;
}
.person_center_pass_value{
    width: 81%;
    float: right;
    font-size: 16px;
    border: 1px solid #ccc;
    height: 31px;
    padding-left: 11px;
}
.person_center_newPass{
    overflow: hidden;
    margin-bottom: 40px;
}
.person_center_newPass_name{
    display: inline-block;
    width: 16%;
    text-align: right;
}
.person_center_newPass_value,.person_center_newPass_value1{
    width: 81%;
    float: right;
    font-size: 16px;
    border: 1px solid #ccc;
    height: 31px;
    padding-left: 11px;
}
.person_center_save{
    background: #139FD2;
    color: #fff;
    border: none;
    font-size: 16px;
    width: 20%;
    height: 34px;
    border-radius: 4px;
    margin: 0 auto;
    margin-left: 40%;
}
</style>
<script type="text/javascript">
$(function(){
	$(".person_center_save").click(function(){
        if($.trim($(".person_center_pass_value").val())==""){
            reminder_box("请输入原密码");
            return;
        }
		if($.trim($(".person_center_newPass_value").val())==""){
        	reminder_box("请输入新密码");
            return;
        }
		if($.trim($(".person_center_newPass_value1").val())==""){
        	reminder_box("请再次输入新密码");
            return;
        }
		if($.trim($(".person_center_newPass_value").val())!=$.trim($(".person_center_newPass_value1").val())){
        	reminder_box("两次新密码输入不一致");
            return;
        }
		
        data = {
		    password:$.md5($.trim($(".person_center_pass_value").val())),
			newPassword:$.md5($.trim($(".person_center_newPass_value").val()))
		}
		$.ajax({
			type: "POST",
			url: "${ctx}/admin/modifyPwd.json",
			dataType: "json",
			data: data,
			success: function(msg) {
				if(msg.status==1){
					reminder_box("修改成功");
				}else{
                    reminder_box(msg.msg);
				}
			}
		});
	});
})

</script>
<form action="" method="post" id="person_center_home">
	
</form>
<div class="back_right_box">
	<div class="person_center_content">
		<div class="person_center_inner_content">
			<div class="person_center_account">
				<sapn class="person_center_account_name">账号</sapn>
				<input class="person_center_account_value" value="${admin.name}" readonly type="text" placeholder="请输入账号">
			</div>
			<div class="person_center_nickname">
				<sapn class="person_center_nickname_name">昵称</sapn>
				<input class="person_center_nickname_value" value="${admin.nickname}" readonly type="text" placeholder="请输入昵称">
			</div>
			<div class="person_center_pass">
				<sapn class="person_center_pass_name">密码</sapn>
				<input class="person_center_pass_value" type="password" placeholder="请输入原密码">
			</div>
			<div class="person_center_newPass">
				<sapn class="person_center_newPass_name">修改密码</sapn>
				<input class="person_center_newPass_value" type="password" placeholder="请输入新密码(仅限数字)">
			</div>
			<div class="person_center_newPass">
				<sapn class="person_center_newPass_name">确认密码</sapn>
				<input class="person_center_newPass_value1" type="password" placeholder="请再次输入新密码(仅限数字)">
			</div>
			
			<input type="submit" class="person_center_save" value="提交保存">
		</div>
	</div>
</div>
