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
}
.train_introduce_header_ul{
    overflow: hidden;
    width: 100%;
    border-bottom: .1rem solid #eee;
    background: #f2f2f2;
    position: fixed;
    top: 0;
    padding-bottom: 1rem;
}
.train_introduce_header_li{
    width: 50%;
    float: left;
    background: #fff;
    text-align: center;
    font-weight: bold;
    height: 6rem;
    font-size: 2.5rem;
    line-height: 6rem;
}
.train_introduce_header_li.index{
	background:#148cd7;
	color: #fff;
    font-size: 3rem;
}

.train_introduce_ul{
    margin-top: 7rem;
    margin-bottom: 6rem;
}
.train_introduce_li{

}
.train_class_ul{
    padding: 0 1rem;
}
.train_class_li{
	border-bottom: .1rem solid #ccc;
    font-size: 2.8rem;
    height: 7rem;
    line-height: 7rem;
    padding-left: 3rem;
}
.train_class_li_name{
    margin-right: 1rem;
}
.train_class_li_value{
    font-size:2.2rem;
    color: #5c5c5c;
}
.icon_tel{
    float: right;
    margin-right: 2rem;
    margin-top: 1.5rem;
}
.immediately_apply_txt{
    background: #ccc;
    text-align: center;
    font-size: 2.4rem;
    color: #fff;
    position: fixed;
    width: 60%;
    bottom: 9rem;
    left: 20%;
    height: 6rem;
    line-height: 6rem;
}
.immediately_apply{
	background:#148cd7;
    text-align: center;
    font-size: 3rem;
    color: #fff;
    position: fixed;
    width: 100%;
    bottom: 0;
    left: 0;
    height: 7rem;
    line-height: 7rem;
}
.icon_tel{

}

.train_class_remark_ul{
		
}
.train_class_remark_li{
    border-bottom: .1rem solid #eee;
    padding-left: 4rem;
    line-height: 4rem;
    padding: 2.5rem 0 2.5rem 4rem;
}
.train_class_remark_li_header{
    font-size: 2.3rem;
    font-weight: bold;
    border-left: .3rem solid#148cd7;
    padding-left: 1.5rem;
    height: 2rem;
    line-height: 2rem;
    margin-bottom: 1rem;
}
.train_class_remark_li_txt{
    font-size:2.2rem;
    padding-left: 2rem;
    padding-right: 2rem;
}

.train_select_box{
	position: fixed;
    background: #fff;
    z-index: 4;
    width: 90%;
    left: 5%;
    text-align: center;
    top: 21%;
    border-radius: 1rem;
}
.train_select_header{
    font-size: 4rem;
    margin: 4rem 0 5rem;
}
.train_select_innerbox{
    border: .1rem solid #ccc;
    position: relative;
    font-size: 2.4rem;
    width: 56%;
    margin-left: 22%;
    height: 6rem;
    text-align: left;
    background: url(${ctx}/images/icon_more_.png) no-repeat 95% center;
}
.train_select_innerbox.index{
	background: url(${ctx}/images/icon_more_up.png) no-repeat 95% center;
}
.train_select_value{
    font-size: 3rem;
    display: inline-block;
    width: 73%;
    padding-top: 1rem;
    text-align: center;
    overflow-x: hidden;
}
.train_select_ul{
    position: absolute;
    width: 100%;
    text-align: center;
    top: 6rem;
    border: .1rem solid #000;
    background: #fff;
    max-height: 16rem;
    overflow-y: auto;
}
.train_select_li{
    border-bottom: .1rem solid #ccc;
    font-size: 2.2rem;
    padding: .8rem;
}
.train_select_btn{
	background:#148cd7;
    color: #fff;
    width: 30%;
    font-size: 2.8rem;
    margin-left: 35%;
    height: 6rem;
    line-height: 6rem;
    border-radius: 3rem;
    margin-top: 9rem;
    margin-bottom:2rem;
}
.train_select_close{
    position: absolute;
    right: 2rem;
    top: 1rem;
    font-size: 3rem;
}
.train_class_li.position{
	height: auto;
    line-height: normal;
    padding: 2rem 0 2rem 3rem;
} 
.train_class_li.position .train_class_li_name{
	float:left
}
.train_class_li.position .train_class_li_value{
    width: 64%;
    display: inline-block;
    font-size: 2.2rem;
    color:#5c5c5c
}
</style>
<script type="text/javascript">
$(function(){
	$(".train_introduce_header_li").click(function(){
		$(this).addClass("index").siblings().removeClass("index");
		if($.trim($(this).text())=='开班信息'){
			$(".train_introduce_li").eq(0).show();
			$(".train_introduce_li").eq(1).hide();
		}else{
			$(".train_introduce_li").eq(1).show();
			$(".train_introduce_li").eq(0).hide();
		}
			
	});
	
	$(".immediately_apply").click(function(){
		$.ajax({
			   type: "POST",
			   url: "${ctx}/wechat/api/getAvailableTrainingTypes.json",
			   dataType: "json",
			   data: {userId:"${user.id}",trainingSiteId:$.trim($(".trainingSite_id").val())},
			   success: function(msg){
				   if(msg.status==1){
					  console.log(msg);
					  if(msg.data.length==0){
						  $(".immediately_apply_txt").fadeIn();
							setTimeout(function(){
								$(".immediately_apply_txt").fadeOut();
							},1500);
					  }else{
						  /* 如果没有选择培训类型 */
							$(".bg").show()
							$(".train_select_box").show();
						  	var html='';
						  	for(i=0;i<msg.data.length;i++){
						  		html+='<li class="train_select_li" onclick="train_select_li(this,'+msg.data[i].id+')">'+msg.data[i].name+'</li>';
						  	}
						  	$(".train_select_ul").html(html);
					  }
				   }else{
					   reminder_box(msg.msg);
				   }
			   }
		})
		
	});
	
	$(".train_select_close").click(function(){
		$(".bg").hide();
		$(".train_select_box").hide();
	});
	$(".train_select_innerbox").click(function(){
		$(this).toggleClass("index");
		$(".train_select_ul").toggle();
	});
	
	/* 这是拨打联系电话 */
	$(".icon_tel").click(function(){
		$(".info_box_header").text("联系培训网点");
		$(".info_box_txt").text("拨打培训网点电话？").css("marginBottom","2rem");
		$(".info_box_txt_tel").text($.trim($(".train_class_li_value.tel").eq(0).text())).show();
		$(".info_box_cancel").text("取消");
		$(".info_box_confirm").html('<a href="tel:'+$.trim($(".train_class_li_value.tel").eq(0).text())+'" class="da_btn">确定</a>');
		$(".bg").show(); 
		$(".info_box").show(); 
		
		$(".info_box_cancel").on("click",function(){
			$(".bg").hide(); 
			$(".info_box").hide(); 
		});
		
	});
	
	$(".train_select_btn").click(function(){
		if($.trim($(".train_select_value").text())=="培训类型"){
			reminder_box("请选择培训类型");
			return;
		}
		$(".apply_id").val($(".train_select_value").attr("id"));
		$("#apply_home").attr("action","${ctx}/wechat/applySuccess").submit();
	});
})

function train_select_li(e,id){
	$(".train_select_value").text($.trim($(e).text())).attr("id",id);
}
</script>
</head>
<body>
<form action="${ctx}/wechat/" id="apply_home" method="get">
	<input type="hidden" name="trainingSiteId" value="${trainingSite.id}" class="trainingSite_id">
	<input type="hidden" name="id" value="" class="apply_id">
</form>
<c:if test="${not empty enrolments}">
	<ul class="train_introduce_header_ul">
		<li class="train_introduce_header_li index">
			开班信息
		</li>
		<li class="train_introduce_header_li">
			培训点介绍
		</li>
	</ul>

	<c:forEach items="${enrolments}" var="enrolment" varStatus="index">
		<ul class="train_introduce_ul">
			<li class="train_introduce_li">
				<ul class="train_class_ul">
					<li class="train_class_li">
						<span class="train_class_li_name">开班名称</span>
						<span class="train_class_li_value">${enrolment.trainingSite.name}</span>
					</li>
					<li class="train_class_li">
						<span class="train_class_li_name">培训类型</span>
						<span class="train_class_li_value">${enrolment.trainingSite.trainingType}</span>
					</li>
					<li class="train_class_li">
						<span class="train_class_li_name">培训时间</span>
						<span class="train_class_li_value"><fmt:formatDate pattern="yyyy-MM-dd" type="date" dateStyle="medium" timeStyle="medium" value="${enrolment.trainingSite.trainingStartDate}" />~<fmt:formatDate pattern="yyyy-MM-dd" type="date" dateStyle="medium" timeStyle="medium" value="${enrolment.trainingSite.trainingEndDate}" /></span>
					</li>
					<li class="train_class_li position">
						<span class="train_class_li_name">培训地点</span>
						<span class="train_class_li_value">${enrolment.trainingSite.province}/${enrolment.trainingSite.city}/${enrolment.trainingSite.address}</span>
					</li>
					<%-- <li class="train_class_li">
						<span class="train_class_li_name">联系方式</span>
						<span class="train_class_li_value tel">${enrolment.trainingSite.contactPhone1}</span>
						<img alt="" src="${ctx}/images/icon_tel.jpg" class="icon_tel">
					</li> --%>
				</ul>
				
				<ul class="train_class_remark_ul">
					<li class="train_class_remark_li">
						<h1 class="train_class_remark_li_header">培训说明</h1>
						<p class="train_class_remark_li_txt">${enrolment.trainingSite.trainingDescription}</p>
					</li>
					<li class="train_class_remark_li">
						<h1 class="train_class_remark_li_header">优势说明</h1>
						<p class="train_class_remark_li_txt">${enrolment.trainingSite.advantage}</p>
					</li>
				</ul>
			</li>
			<li class="train_introduce_li" style="display:none">
				<ul class="train_class_ul">
					<li class="train_class_li position">
						<span class="train_class_li_name">培训地点</span>
						<span class="train_class_li_value position">${enrolment.trainingSite.province}/${enrolment.trainingSite.city}/${enrolment.trainingSite.address}</span>
					</li>
					<%-- <li class="train_class_li">
						<span class="train_class_li_name">联系方式</span>
						<span class="train_class_li_value tel">${enrolment.trainingSite.contactPhone1}</span>
						<img alt="" src="${ctx}/images/icon_tel.jpg" class="icon_tel">
					</li> --%>
				</ul>
				
				<ul class="train_class_remark_ul">
					<li class="train_class_remark_li">
						<h1 class="train_class_remark_li_header">培训说明</h1>
						<p class="train_class_remark_li_txt">${enrolment.trainingSite.trainingDescription}</p>
					</li>
					<li class="train_class_remark_li">
						<h1 class="train_class_remark_li_header">费用说明</h1>
						<p class="train_class_remark_li_txt">${enrolment.trainingSite.feeDescription}</p>
					</li>
				</ul>
			</li>
		</ul>
	</c:forEach>	
</c:if>
<c:if test="${empty enrolments}">
	<div class="pic_empty_img_box pic_empty_img_box1">
			<img alt="" src="${ctx}/images/pic_empty.jpg" class="pic_empty_img">
		</div>
</c:if>

<!-- <div class="train_select_box" style="display:none">
	<h1 class="train_select_header">请筛选培训类型</h1>
	<span class="train_select_close">X</span>
	<div class="train_select_innerbox">
		<span class="train_select_value">培训类型</span>
		<ul class="train_select_ul" style="display:none">
			<li class="train_select_li" onclick="train_select_li(this)">培训1</li>
		</ul>
	</div>
	<div class="train_select_btn">确定</div>
</div> -->
<div class="bg" style="display:none"></div>
<p class="immediately_apply_txt" style="display:none">暂无可报名的培训项</p>
<!-- <div class="immediately_apply">立即报名</div> -->
<div class="info_box" style="display:none">
	<h1 class="info_box_header"></h1>
	<p class="info_box_txt"></p>
	<p class="info_box_txt info_box_txt_tel" style="display:none"></p>
	<ul class="info_box_ul">
		<li class="info_box_confirm">
			确定
		</li>
		<li class="info_box_cancel">
			取消
		</li>
	</ul>
</div>
</body>
</html>