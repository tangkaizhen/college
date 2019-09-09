<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="common.jsp"%>
<%@ include file="wei_xin_t.jsp"%>
<title>汉和学院</title>
<style type="text/css">
body{
    background: #eee;
}
.my_details_top{
    height: 20rem;
    background: #fff;
    line-height: 20rem;
    padding-left: 7rem;
    margin-bottom: 2rem;
}
.my_details_top_txt{
    font-size: 3rem;
    margin-right: 6rem;
}
.my_details_top_img {
	width: 10rem;
	height: 10rem;
	border-radius: 5rem;
	margin-bottom: -3.5rem;
}
.my_details_name_box{
    background: #fff;
    height: 7rem;
    line-height: 7rem;
    padding-left: 7rem;
}
.my_details_name{
    font-size: 3rem;
    margin-right: 6rem;
}
.my_details_name_value{
    border: none;
    font-size: 3rem;
}
.my_details_save{
    font-size: 3rem;
    position: fixed;
    bottom: 0;
    text-align: center;
    width: 100%;
    background:#148cd7;
    color: #fff;
    height: 7rem;
    line-height: 7rem;
}
</style>
<script type="text/javascript">
$(function(){
	$(".my_details_save").click(function () {
        var value=$.trim($(".my_details_name_value").val());
        if(value==""){
            reminder_box("请输入真实姓名");
            return;
        }
		upload_image(saveDetails);
	})

	function saveDetails() {
		$.ajax({
			type: "POST",
			url: "${ctx}/wechat/api/saveDetails.json",
			dataType: "json",
			data: {id:'${user.id}',name:$.trim($(".my_details_name_value").val()),headImg:$("#headImg").val()},
			success: function(msg){
				if(msg.status==1){
					reminder_box("修改成功");
                    setTimeout(function(){
                        location.href="${ctx}/wechat/mine";
                    },1000);
				}else{
					reminder_box(msg.msg);
				}
			}
		})
	}
})
</script>
</head>
<body>
<div class="my_details_top">
	<span class="my_details_top_txt">头像</span>
	<c:choose>
		<c:when test="${empty user.headImg}">
			<img alt="" src="${ctx}/images/my_head.png" class="my_details_top_img" onclick="choose_image($('.my_details_top_img'),$('#headImg'))">
		</c:when>
		<c:otherwise>
			<img alt="" src="${ctx}/${user.headImg}" class="my_details_top_img" onclick="choose_image($('.my_details_top_img'),$('#headImg'))">
		</c:otherwise>
	</c:choose>
	<input type="hidden" id="headImg">
</div>
<div class="my_details_name_box">
	<span class="my_details_name">姓名</span>
	<input type="text"  maxlength="20" value="${user.name}" class="my_details_name_value">
</div>
<div class="my_details_save" onclick="saveDetails()">保存</div>
</body>
</html>