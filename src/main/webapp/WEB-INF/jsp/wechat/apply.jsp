<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="common.jsp"%>
<script src="${ctx}/js/LAreaData1.js" type="text/javascript"></script>
<title>汉和学院</title>
<style type="text/css">
body{
	background: #f2f2f2;
}
.apply_header_ul{
    overflow: hidden;
    width: 100%;
    border-bottom: .1rem solid #eee;
    background: #f2f2f2;
    position: fixed;
    top: 0;
    padding-bottom: 1rem;
}
.apply_header_li{
    width: 50%;
    float: left;
    text-align: center;
    height: 6rem;
    font-size: 2.5rem;
    line-height: 6rem;
        background: #fff;
}
.apply_header_li.index{
	background:#148cd7;
	color: #fff;
    font-size: 3rem;
    font-weight: bold;
}
.apply_ul{
    padding: 0 1rem;
    margin-top:6rem;
    background:#fff;
}
.apply_li{

}
.apply_type_ul{
    line-height: 6rem;
}
.apply_type_li{
	border-bottom: .1rem solid #bbb;
    padding-top: 2.4rem;
    padding-bottom: 3rem;
    padding-left: 3rem;
    font-size: 2.8rem;
}
.apply_type_li_header{
    font-size:3rem;
    color:#148cd7;
    font-weight: bold;
}
.apply_content_ul{

}
.apply_select_box{
        font-size: 2.8rem;
    color: rgb(92,92,92);
    background: #fff;
    top: 7rem;
    position: fixed;
    width: 100%;
    padding-top: 1rem;
    padding-bottom: 1rem;
    border-bottom: .1rem solid #bbb;
}
.apply_select_province_box{
    border: .1rem solid #ccc;
    position: relative;
    display: inline-block;
    width: 40%;
    margin: 0 7%;
    padding: 1rem 2rem;
    background: url(${ctx}/images/down.png) no-repeat 95% center;
}
.apply_select_province_box.index{
	background: url(${ctx}/images/up.png) no-repeat 95% center;
}
.apply_select_province_value{
	display: inline-block;
    width: 100%;
    font-size: 2.4rem;
}
.apply_select_province_ul{
    position: absolute;
    background: #fff;
    width: 100%;
    text-align: center;
    border: .1rem solid #ccc;
    font-size: 2rem;
    left: 0;
    top: 5rem;
    height: 25rem;
    overflow-y: auto;
}
.apply_select_province_li{
    border-bottom: .1rem solid #ccc;
    padding: 1rem 0;
    font-size: 2.2rem;
}
.apply_select_type_box{
    position: relative;
    display: inline-block;
    width: 40%;
    border: .1rem solid #ccc;
    padding: 1rem 2rem;
    background: url(${ctx}/images/down.png) no-repeat 95% center;
}
.apply_select_type_box.index{
    background: url(${ctx}/images/up.png) no-repeat 95% center;

}
.apply_select_type_value{
	display: inline-block;
    width: 100%;
    font-size: 2.4rem;
}
.apply_select_type_ul{
    position: absolute;
    background: #fff;
    width: 100%;
    text-align: center;
    border: .1rem solid #ccc;
    font-size: 2rem;
    left: 0;
    top: 5rem;
    max-height: 25rem;
    overflow-y: auto;
}
.apply_select_type_li{
    border-bottom: .1rem solid #ccc;
    padding: 1rem 0;
    font-size: 2.2rem;
}

.apply_branch_ul{
    padding-top: 7rem;
}
.apply_branch_li{
    border-bottom: .1rem solid #ccc;
    line-height: 5rem;
    padding: 2rem;
    height: 23rem;
}
.apply_branch_li_name{
    font-weight: bold;
    font-size: 2.8rem;
}
.apply_branch_li_position{
    font-size: 2.4rem;
    white-space: nowrap;
    width: 90%;
    text-overflow: ellipsis;
    overflow-x: hidden;
}
.apply_branch_li_type{
    font-size: 2.4rem;
    color: rgb(224,65,2);
}
.apply_branch_li_type_value{
    color: #000;
}
.apply_branch_li_date{
    font-size: 2.4rem;
    color: rgb(224,65,2);
}
.apply_branch_li_date_value{
    color: #000;
}
</style>
<script type="text/javascript">
var u = navigator.userAgent, app = navigator.appVersion;
var isAndroid = u.indexOf('Android') > -1 || u.indexOf('Linux') > -1; //g
$(function(){
	
	if (isAndroid) {
	       //这个是安卓操作系统
	       $(".apply_branch_li_name,.apply_type_li_header").css("fontSize",2.6+"rem")
	       $(".apply_type_li_smallHeader,.apply_content_li,.apply_branch_li_position,.apply_branch_li_type,.apply_branch_li_date").css("fontSize",2+"rem")
	}    
	/* 加载各省份 */
	var province_html='';
		province_html+='<li class="apply_select_province_li" onclick="apply_select_province_li(this)">全部省份</li>';
	for(var i=0;i<LAreaData.length;i++){
		province_html+='<li class="apply_select_province_li" onclick="apply_select_province_li(this)">'+LAreaData[i].name+'</li>';
    }
	$(".apply_select_province_ul").html(province_html);
	
	
	$(".apply_header_li").click(function(e){
		$(this).addClass("index").siblings().removeClass("index");
		if($.trim($(this).text())=="实操培训介绍"){
			$(".apply_li").eq(0).show();
			$(".apply_li").eq(1).hide();
			$(".apply_select_box").hide();
			/* $(".apply_ul").css("marginTop",6+"rem"); */
		}else{
			/* $(".apply_ul").css("marginTop",12+"rem"); */
			$(".apply_select_box").show();
			$(".apply_li").eq(1).show();
			$(".apply_li").eq(0).hide();
		}
	});
	
	$(".apply_select_province_value").click(function(){
		$(".apply_select_province_box").toggleClass("index");
		$(".apply_select_province_ul").toggle();
		$(".apply_select_type_ul").hide();
		$(".apply_select_type_box").removeClass("index");
	});
	$(".apply_select_type_value").click(function(){
		$(".apply_select_type_box").toggleClass("index");
		$(".apply_select_type_ul").toggle();
		
		$(".apply_select_province_ul").hide();
		$(".apply_select_province_box").removeClass("index");
	});
	
	
	
})

function apply_select_province_li(e){
	$(".apply_select_province_value").click();
	if($.trim($(e).text())=="全部省份"){
		$(".province").val("");
	}else{
		$(".province").val($.trim($(e).text()));
	}
	
	$(".apply_select_province_value").text($.trim($(e).text()));
	search_site();
}

function apply_select_type_li(e){
	$(".apply_select_type_value").click();
	$(".trainingType").val($.trim($(e).text()));
	$(".apply_select_type_value").text($.trim($(e).text()));
	search_site();
}

function search_site(){
	$.ajax({
		   type: "POST",
		   url: "${ctx}/wechat/api/getTrainingSites.json",
		   dataType: "json",
		   data: {trainingType:$.trim($(".trainingType").val()),province:$.trim($(".province").val())},
		   success: function(msg){
			   if(msg.status==1){
				  console.log(msg);
				  var html='';
				  if(msg.data.length>0){
					  for(i=0;i<msg.data.length;i++){
						  html+='<li class="apply_branch_li" onclick="apply_branch_li('+msg.data[i].id+')">';
						  html+='<h1 class="apply_branch_li_name">'+msg.data[i].name+'</h1>';
						  html+='<p class="apply_branch_li_position">'+msg.data[i].province+'/'+msg.data[i].city+'/'+msg.data[i].address+'</p>';
						  html+='<p class="apply_branch_li_type">培训类型：<span class="apply_branch_li_type_value">'+msg.data[i].trainingType+'</span></p>';
						  html+='<p class="apply_branch_li_date">开班时间：<span class="apply_branch_li_date_value">'+msg.data[i].trainingStartDate+'~'+msg.data[i].trainingEndDate+'</span></p>';
						  html+='</li>';
					  }
				  }
				  $(".apply_branch_ul").html(html);
				  
				  if (isAndroid) {
				       //这个是安卓操作系统
				       $(".apply_branch_li_name,.apply_type_li_header").css("fontSize",2.6+"rem")
				       $(".apply_type_li_smallHeader,.apply_content_li,.apply_branch_li_position,.apply_branch_li_type,.apply_branch_li_date").css("fontSize",2+"rem")
				    }
			   }else{
				   reminder_box(msg.msg);
			   }
		   }
	})
}
function apply_branch_li(id){
	$(".trainingSite_id").val(id);
	$("#apply_home").attr("action","${ctx}/wechat/trainingSite").submit();
}
</script>
</head>
<body>
<form action="${ctx}/admin/" id="apply_home" method="get">
	<input type="hidden" name="province" class="province">
	<input type="hidden" name="trainingType" class="trainingType">
	<input type="hidden" name="id" class="trainingSite_id">
</form>

<ul class="apply_header_ul">
	<li class="apply_header_li index">
		实操培训介绍
	</li>
	<li class="apply_header_li">
		培训网点介绍
	</li>
</ul>
<div class="apply_select_box" style="display:none">
<div class="apply_select_province_box">
	<span class="apply_select_province_value">选择省份</span>
	
	<ul class="apply_select_province_ul" style="display:none">
		<!-- <li class="apply_select_province_li" onclick="apply_select_province_li(this)">江苏省</li> -->
	</ul>
</div>
<div class="apply_select_type_box">
	<span class="apply_select_type_value">培训类型</span>
	
		<ul class="apply_select_type_ul" style="display:none">
			<c:forEach items="${trainingTypes}" var="trainingType">
				<li class="apply_select_type_li" onclick="apply_select_type_li(this,'${trainingType.id}')">${trainingType.name}</li>
			</c:forEach>	
		</ul>
	</div>
</div>
<ul class="apply_ul">
	<li class="apply_li">
		<ul class="apply_type_ul">
			<c:forEach items="${trainingCourses}" var="trainingCourse">
				<li class="apply_type_li">
					<h1 class="apply_type_li_header">${trainingCourse.name}</h1>
					<h1 class="apply_type_li_smallHeader">培训费用</h1>
					<ul class="apply_content_ul">
						<li class="apply_content_li">${trainingCourse.trainingFee}</li>
					</ul>
					<h1 class="apply_type_li_smallHeader">培训内容</h1>
					<ul class="apply_content_ul">
						<li class="apply_content_li">${trainingCourse.trainingContent}</li>
					</ul>
				</li>
			</c:forEach>	
		</ul>
	</li>
	<li class="apply_li" style="display:none">
		<ul class="apply_branch_ul">
			<c:forEach items="${trainingSites}" var="trainingSite">
				<li class="apply_branch_li" onclick="apply_branch_li('${trainingSite.id}')">
					<h1 class="apply_branch_li_name">${trainingSite.name}</h1>
					<p class="apply_branch_li_position">${trainingSite.province}/${trainingSite.city}/${trainingSite.address}</p>
					<p class="apply_branch_li_type">培训类型：<span class="apply_branch_li_type_value">${trainingSite.trainingType}</span></p>
					<p class="apply_branch_li_date">开班时间：<span class="apply_branch_li_date_value"><fmt:formatDate pattern="yyyy-MM-dd" type="date" dateStyle="medium" timeStyle="medium" value="${trainingSite.trainingStartDate}" />~<fmt:formatDate pattern="yyyy-MM-dd" type="date" dateStyle="medium" timeStyle="medium" value="${trainingSite.trainingEndDate}" /></span></p>
				</li>
			</c:forEach>	
		</ul>
	</li>
</ul>
</body>
</html>