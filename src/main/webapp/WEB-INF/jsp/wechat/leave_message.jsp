<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="common.jsp"%>
<title>汉和学院</title>
<style type="text/css">
body{
    background: #eee;
}
.leave_message_header{
    font-size: 2.4rem;
    margin: 3rem 2rem;
}
.leave_message_box{
    background: #fff;
    width: 96%;
    margin-left: 2%;
    height: 40rem;
    margin-bottom: 48%;
    margin-top: 2rem;
}
.leave_message_content{
    width: 100%;
    height: 90%;
    border: none;
    font-size: 2.9rem;
    color:#000;
    padding: 1.5rem;
}
.leave_message_font_num{
    width: 100%;
    height: 10%;
    border-top: .1rem solid #ccc;
    padding-top: .8rem;
}
.leave_message_font_txt{
    text-align: right;
    font-size: 1.9rem;
    color: #ccc;
    height: 100%;
    padding-right: 1rem;
}
.leave_message_font_num_value{

}
.leave_message_submit{
	position: fixed;
    width: 100%;
    bottom: 0;
    text-align: center;
    font-size: 2.4rem;
    background:#148cd7;
    color: #fff;
    font-size: 3rem;
    height: 7rem;
    line-height: 7rem;
}
</style>
<script type="text/javascript">
$(function(){
	var clientHeight = document.documentElement.clientHeight || document.body.clientHeight;
	$(window).on('resize', function (e) {
	    var nowClientHeight = document.documentElement.clientHeight || document.body.clientHeight;
	    if (clientHeight > nowClientHeight) {
	        //键盘弹出的事件处理
	    	$('.leave_message_submit').css('position','static'); 
	    }
	    else {
	        //键盘收起的事件处理
	    	$('.leave_message_submit').css('position','fixed'); 
	    } 
	});
	
	$(".leave_message_content").on("input",function(){
		var font_num=$.trim($(this).val()).length;
		if(200-font_num==0){
			$(".leave_message_font_num_value").text(0);
		}else{
			$(".leave_message_font_num_value").text(200-font_num);
		}
	});
	
	$(".leave_message_submit").click(function(){
		if($.trim($(".leave_message_content").val())){
			$.ajax({
				   type: "POST",
				   url: "/college/wechat/api/addComment.json",
				   dataType: "json",
				   data: {userId:"${user.id}",articleId:"${id}",comment:$.trim($(".leave_message_content").val())},
				   success: function(msg){
						if(msg.status==1){
							reminder_box("留言信息保存成功");
							setTimeout(function(){
								$("#leave_message_home").attr("action","${ctx}/wechat/wikiDetails").submit();
							},2000);
						}else{
							reminder_box(msg.msg);
						}
				   }
			})
		}else{
			reminder_box("请输入留言信息");
			return;
		}
	});
})
</script>
</head>
<body>
<form action="${ctx}/wechat/" id="leave_message_home" method="get">
	<input type="hidden" name="id" value="${id}" class="article_id">
</form>
<div class="leave_message_box">
	<textarea rows="" maxlength="200" cols="" placeholder="请输入留言信息" class="leave_message_content"></textarea>
	<div class="leave_message_font_num">
		<p class="leave_message_font_txt">您还可以输入<span class="leave_message_font_num_value">200</span>字</p>
	</div>
</div>
<div class="leave_message_submit">提交留言</div>
</body>
</html>