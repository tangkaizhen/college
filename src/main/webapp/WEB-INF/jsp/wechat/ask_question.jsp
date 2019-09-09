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
html{
	height:94%;
}
body{
    background: #eee;
    height: 100%;
}
.leave_message_header{
    font-size: 2.4rem;
    margin: 3rem 2rem;
}
.leave_message_box{
    background: #fff;
    width: 96%;
    margin-left: 2%;
    height:42%;
    margin-top: 2rem;
    margin-bottom:77%;
}
.leave_message_content{
	background: #fff;
    width: 100%;
    height: 84%;
    border: none;
    font-size: 2.9rem;
    color:#000;
    padding: 2rem;
    
}
.leave_message_font_num{
    width: 100%;
    height: 6rem;
    border-top: .1rem solid #bbb;
    padding-top: .8rem;
    text-align: right;
}
.leave_message_font_txt{
    text-align: right;
    font-size: 2rem;
    color: #ccc;
    height: 100%;
    padding-right: 1rem;
    position: relative;
    top: -1.2rem;
}
.photo_img{
    margin-right: 1rem;
    width: 4rem;
}
.leave_message_submit{
	position: fixed;
    width: 100%;
    bottom: 0;
    text-align: center;
    background:#148cd7;
    color: #fff;
    font-size: 3rem;
    height: 7rem;
    line-height: 7rem;
}
.question_add_img_box{
	height: 5rem;
    width: 5rem;
    display: inline-block;
    position: relative;
    margin-right: 44%;
}
.question_add_img{
	width: 100%;
    height: 100%;
}
.icons_delete_question{
    position: absolute;
    right: -1rem;
    top: 0rem;
    width: 2.3rem;
    z-index: 2;
}
</style>
<script type="text/javascript">
$(function(){
	$(".leave_message_content").on("input",function(){
		var font_num=$.trim($(this).val()).length;
		$(".leave_message_font_num_value").text(500-font_num);
	});
	
	$(".leave_message_submit").click(function(){
		if($.trim($(".leave_message_content").val())){
            upload_image(saveAsking);
		}else{
			reminder_box("请输入提问信息");
			return;
		}
	});

    function saveAsking() {
        $.ajax({
            type: "POST",
            url: "/college/wechat/api/addAsking.json",
            dataType: "json",
            data: {userId:"${user.id}",expertId:"${id}",comment:$.trim($(".leave_message_content").val()),image:$("#image").val()},
            success: function(msg){
                if(msg.status==1){
                    reminder_box("提问信息保存成功");
                    setTimeout(function(){
                        $("#ask_home").attr("action","${ctx}/wechat/expert").submit();
                    },2000);
                }else{
                    reminder_box(msg.msg);
                }
            }
        })
    }

	$(".icons_delete_question").click(function(){
        $('.question_add_img_box').hide();
        $("#image").val("");
	});
	
	/* 监听返回键 */
    /* push_families_detail();
    window.addEventListener("popstate", function(e) {  //回调函数中实现需要的功能
    	$("#ask_home").attr("action","${ctx}/wechat/families_detail").submit();
    }, false); */
    
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
	
})
function push_families_detail() {
    var state = {
        title: "汉和学院",
        url: "#"
    };
    window.history.pushState(state, state.title, state.url);
}

function add_question_img(){
	/* 首先判断有没有已经增加了图片 */
	if($(".question_add_img_box").is(":visible")){
		reminder_box("您只能上传一张图片");
		return;
	}
    choose_image($('.question_add_img'),$('#image'),$(".question_add_img_box"));
}
</script>
</head>
<body>
<form action="${ctx}/wechat/" id="ask_home" method="get">
	<input type="hidden" name="id" value="${id}" class="expert_id">
</form>
<div class="leave_message_box">
	<textarea rows="" maxlength="500" cols="" placeholder="欢迎提问，问题将由作者筛选后公开显示" class="leave_message_content"></textarea>
	<div class="leave_message_font_num">
		<div class="question_add_img_box" style="display:none">
			<img alt="" src="${ctx}/images/icons_delete_question.png" class="icons_delete_question">
			<img alt="" src="${ctx}/images/photo.png" class="question_add_img">
		</div>
		
		<img alt="" src="${ctx}/images/photo.png" class="photo_img" onclick="add_question_img()">
		<span class="leave_message_font_txt">您还可以输入<span class="leave_message_font_num_value">500</span>字</span>
	</div>
	<input type="hidden" id="image">
</div>
<div class="leave_message_submit">提交问题</div>
</body>
</html>