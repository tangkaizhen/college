<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
<style>
.error_box{
    text-align: center;
    padding-top: 13%;
}
.icon_error{
    position: relative;
}
.error_txt{
    color: #5d4037;
    font-size: 16px;
    position: relative;
    top: -23px;
    margin-left: 11px;
}
.error_btn{
    display: block;
    color: #fff;
    background: #139fd2;
    font-size: 16px;
    width: 14%;
    height: 33px;
    line-height: 33px;
    border-radius: 5px;
    margin-left: 43%;
    margin-top: 3%;
    cursor: pointer;
}
</style>
<script type="text/javascript">
$(function(){
	$(".error_btn").click(function(){
		history.go(-1);
	});
})

</script>
<form action="" method="post" id="person_center_home">
	
</form>
<div class="error_box">
	<img alt="" src="${ctx}/images/icon_error.png" class="icon_error">
	<span class="error_txt">${error}</span>
	
	<span class="error_btn">返回上一级</span>
</div>