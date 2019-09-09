<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
<style>
.back_right_box{
    background: #fafafa;
        font-size: 16px;
}
.course_manage_header{
    width: 100%;
    border-bottom: 1px solid #ccc;
    font-size: 20px;
    padding: 6px 0 6px 23px;
    background: #fff;
}
.course_manage_btn_box{
	width: 100%;
    height: 63px;
}
.course_manage_btn_next{
    float: right;
    border: 1px solid #ccc;
    height: 29px;
    width: 73px;
    margin-right: 24px;
    margin-top: 17px;
    text-align: center;
    line-height: 29px;
    border-radius: 4px;
    cursor: pointer;
    
}
.course_manage_btn_fore{
    float: right;
    border: 1px solid #ccc;
    height: 29px;
    width: 73px;
    margin-right: 24px;
    margin-top: 17px;
    text-align: center;
    line-height: 29px;
    border-radius: 4px;
        cursor: pointer;
}
.course_manage_btn_type_box{
    float: right;
    border: 1px solid #ccc;
    height: 29px;
    width: 145px;
    margin-right: 24px;
    margin-top: 17px;
    text-align: center;
    border-radius: 4px;
    position: relative;
        cursor: pointer;
    background: url(${ctx}/images/triangle.png) no-repeat 97% center;    
}
.course_manage_btn_type_value{
    display: inline-block;
    margin-top: 3px;
    width: 100%;
    text-align: left;
    padding-left: 8%;
}
.course_manage_btn_type_ul{
    position: absolute;
    width: 100%;
    border: 1px solid #ccc;
    top: 27px;
    background: #fff;
    z-index: 3;
    display: none;
}
.course_manage_btn_type_li{
    border-bottom: 1px solid #ccc;
    line-height: 30px;
}
.course_manage_btn_arg_type_box{
    float: right;
    border: 1px solid #ccc;
    height: 29px;
    width: 145px;
    margin-right: 24px;
    margin-top: 17px;
    text-align: center;
    border-radius: 4px;
    position: relative;
        cursor: pointer;
    background: url(${ctx}/images/triangle.png) no-repeat 97% center;    
}
.course_manage_btn_arg_type_value{
    display: inline-block;
    margin-top: 3px;
    width: 100%;
    text-align: left;
    padding-left: 8%;
}
.course_manage_btn_arg_type_ul{
    position: absolute;
    width: 100%;
    border: 1px solid #ccc;
    top: 27px;
    background: #fff;
    z-index: 3;
    display: none;
}
.course_manage_btn_arg_type_li{
    border-bottom: 1px solid #ccc;
    line-height: 30px;
}
.course_manage_btn_iden_type_box{
    float: right;
    border: 1px solid #ccc;
    height: 29px;
    width: 145px;
    margin-right: 24px;
    margin-top: 17px;
    text-align: center;
    border-radius: 4px;
    position: relative;
        cursor: pointer;
    background: url(${ctx}/images/triangle.png) no-repeat 97% center;    
}
.course_manage_btn_iden_type_value{
    display: inline-block;
    margin-top: 3px;
    width: 100%;
    text-align: left;
    padding-left: 8%;
}
.course_manage_btn_iden_type_ul{
    position: absolute;
    width: 100%;
    border: 1px solid #ccc;
    top: 27px;
    background: #fff;
    z-index: 3;
    display: none;
}
.course_manage_btn_iden_type_li{
    border-bottom: 1px solid #ccc;
    line-height: 30px;
}
.course_manage_btn_add{
    float: right;
    height: 29px;
    width: 88px;
    margin-right: 24px;
        cursor: pointer;
    margin-top: 17px;
    text-align: center;
    line-height: 29px;
    border-radius: 4px;
    background: #FF9C30;
    color: #fff;
}
.course_manage_content_box{
    width: 98%;
    background: #fff;
    margin-left: 1%;
    border: 1px solid #ccc;
    border-radius: 4px;
}
.course_manage_content_box{

}
.course_manage_content_header_ul{
    overflow: hidden;
    font-size: 16px;
    font-weight: bold;
    border-bottom: 1px solid #ccc;
}
.course_manage_content_header_li{
	float: left;
    text-align: center;
    border-right: 1px solid;
    height: 50px;
    line-height: 50px;
}
.course_manage_content_header_li:first-child{
    width: 7%;
}
.course_manage_content_header_li:first-child+li{
    width: 13%;
}
.course_manage_content_header_li:first-child+li+li{
    width: 10%;
}
.course_manage_content_header_li:first-child+li+li+li{
    width: 11%;
}
.course_manage_content_header_li:first-child+li+li+li+li{
    width: 16%;
}
.course_manage_content_header_li:first-child+li+li+li+li+li{
    width: 10%;
}
.course_manage_content_header_li:first-child+li+li+li+li+li+li{
    width: 17%;
}
.course_manage_content_header_li:first-child+li+li+li+li+li+li+li{
    width: 15%;
    border-right:none
}
.course_manage_content_ul_box{

}
.course_manage_content_ul{
	overflow: hidden;
    font-size: 16px;
    border-bottom: 1px solid #ccc;
}
.course_manage_content_li{
	float: left;
    text-align: center;
    border-right: 1px solid;
    height: 70px;
    line-height: 70px;
    
    white-space: nowrap;
    overflow-x: hidden;
    text-overflow: ellipsis;
}
.course_manage_content_li:first-child{
	width: 7%;
}
.course_manage_content_li:first-child+li{
	width: 13%;
	overflow: hidden;
    text-overflow: ellipsis;
}
.course_manage_content_li:first-child+li+li{
	width: 10%;
    
}
.course_manage_content_li:first-child+li+li+li{
	width: 11%;
    
}
.course_manage_content_li:first-child+li+li+li+li{
	width: 16%;
	overflow: hidden;
    text-overflow: ellipsis;
    
}
.course_manage_content_li:first-child+li+li+li+li+li{
	width: 10%;
    
}
.course_manage_content_li:first-child+li+li+li+li+li+li{
	width: 17%;
    
}
.course_manage_content_li:first-child+li+li+li+li+li+li+li{
	width: 14%;
	border-right:none;
    font-size: 13px;
}
.course_manage_content_li_btn1{
	background: rgba(255, 156, 48, 1);
    color: #fff;
    padding: 3px 8px;
    border-radius: 2px;
    cursor:pointer
}
.course_manage_content_li_btn1.index{
    background: #ccc;
}
.course_manage_content_li_btn2{
    background: #139FD2;
    color: #fff;
    padding: 3px 8px;
    border-radius: 2px;
    margin: 0 12px;
    cursor:pointer
}
.course_manage_content_li_btn3{
    background: #139FD2;
    color: #fff;
    padding: 3px 8px;
    border-radius: 2px;
    cursor:pointer
}
</style>
<script type="text/javascript">
$(function(){
	/* $(".back_nav_li").eq(1).find(".back_article_header").addClass("index");
	$(".back_nav_li").eq(1).find(".back_article_ul").show();
	$(".back_nav_li").eq(1).find(".back_article_li").eq(0).addClass("index");
 	 */
	$(".course_manage_btn_type_value").click(function(){
		$(".course_manage_btn_iden_type_ul").hide();
		$(".course_manage_btn_arg_type_ul").hide();
		
		/* 首先看看身份和机型有没有筛选 */
		if($.trim($(".course_manage_btn_iden_type_value").text())=="按身份筛选"){
			reminder_box("请选择身份");
			return;
		}
		if($.trim($(".course_manage_btn_arg_type_value").text())=="按机型选择"){
			reminder_box("请选择机型");
			return;
		}
		
		var html='';
		$.ajax({
			   type: "POST",
			   url: "${ctx}/api/getCourseCategories.json",
			   dataType: "json",
			   data: {userTypeId:$(".course_manage_btn_iden_type_value").attr("id"),uavTypeId:$(".course_manage_btn_arg_type_value").attr("id")},
			   success: function(msg){
				   console.log(msg.data);
				   if(msg.status==1){
					   if(msg.data.length>0){
							   html+='<li class="course_manage_btn_type_li" onclick="course_manage_btn_type_li(this,0)">全部</li>';
						   for(var i=0;i<msg.data.length;i++){
							   html+='<li class="course_manage_btn_type_li" onclick="course_manage_btn_type_li(this,'+msg.data[i].id+')">'+msg.data[i].name+'</li>';
							}
						   /* 根据机型和身份查找对应的课程类别 */
							$(".course_manage_btn_type_ul").html(html);
							$(".course_manage_btn_type_ul").toggle();
					   }else{
						   reminder_box("没有对应的课程！！");
						   return;
					   }
				   }else{
				   }
			   }
			})
	});
	
 	$(".course_manage_btn_arg_type_value").click(function(){
 		$(".course_manage_btn_type_ul").hide();
		$(".course_manage_btn_iden_type_ul").hide();
		$(".course_manage_btn_arg_type_ul").toggle();
	});
	
	$(".course_manage_btn_iden_type_value").click(function(){
		$(".course_manage_btn_type_ul").hide();
		$(".course_manage_btn_arg_type_ul").hide();
		$(".course_manage_btn_iden_type_ul").toggle();
	});
	
	$(".course_manage_btn_add").click(function(){
		$("#course_manage_home").attr("action","${ctx}/admin/course/add_course_manage.page").submit();
	});
	$(".course_man age_content_li_btn2").click(function(){
		$("#course_manage_home").attr("action","${ctx}/admin/course/add_course_manage.page").submit();
	});
	$(".confirm_box_close,.confirm_li.cancel").click(function(){
		$(".confirm_box").hide();
		$(".bg").hide();
	});
})
function course_manage_btn_type_li(e,id){
	var course_manage_type_value=$.trim($(e).text());
	$(".course_manage_btn_type_value").text(course_manage_type_value).attr("id",id);
	$(".course_manage_btn_type_ul").toggle();
	
	$(".courseCategoryId").val(id);
	$("#course_manage_home").attr("action","${ctx}/admin/course/course_manage.page").submit();
}
function course_manage_btn_arg_type_li(e,id){
	var course_manage_type_value=$.trim($(e).text());
	$(".course_manage_btn_arg_type_value").text(course_manage_type_value).attr("id",id);
	$(".course_manage_btn_arg_type_ul").toggle();
	
	$(".uavTypeId").val(id);
	$("#course_manage_home").attr("action","${ctx}/admin/course/course_manage.page").submit();
}
function course_manage_btn_iden_type_li(e,id){
	var course_manage_type_value=$.trim($(e).text());
	$(".course_manage_btn_iden_type_value").text(course_manage_type_value).attr("id",id);
	$(".course_manage_btn_iden_type_ul").toggle();
	
	$(".userTypeId").val(id);
	$("#course_manage_home").attr("action","${ctx}/admin/course/course_manage.page").submit();
}
function course_manage_content_li_btn3(id){
	$(".confirm_box").show();
	$(".bg").show();
	$(".confirm_header").text("您确认删除该课程吗？");
	
	$(".confirm_li.confirm").on("click",function(){
		$.ajax({
			   type: "POST",
			   url: "${ctx}/admin/course/deleteCourse.json",
			   dataType: "json",
			   data: {id:id},
			   success: function(msg){
				   if(msg.status==1){
						location.reload();
				   }else{
					   reminder_box(msg.msg);
				   }
			   }
		})
	});
}

function course_manage_content_li_btn2(id){
	$(".course_id").val(id);
	$("#course_manage_home").attr("action","${ctx}/admin/course/add_course_manage.page").submit();
}
function pageQuery(num){
	$(".pageNum").val(num);
	$("#course_manage_home").attr("action","${ctx}/admin/course/course_manage.page").submit();
}
</script>
<form action="" method="post" id="course_manage_home">
	<input type="hidden" name="id" value="${id}" class="course_id">
	<input type="hidden" name="userTypeId" value="${userTypeId}" class="userTypeId">
	<input type="hidden" name="uavTypeId" value="${uavTypeId}" class="uavTypeId">
	<input type="hidden" name="courseCategoryId" value="${courseCategoryId}" class="courseCategoryId">
	<input type="hidden" name="pageNum" class="pageNum">
</form>
<div class="back_right_box">
	<h1 class="course_manage_header">课程管理</h1>
	<div class="course_manage_btn_box">
		
		<ul class="page_box">
            	<c:if test="${page != null}">
            		<c:if test="${!page.isFirstPage}">
             		<li class="first_page" onclick="pageQuery(1)">首页</li>
                 </c:if>
		<c:if test="${page.hasPreviousPage}">
                    <li class="fore_page" onclick="pageQuery('${page.prePage}')">前一页</li>
                 </c:if>
                 <c:forEach items="${page.navigatepageNums}" var="nav">
                     <c:if test="${nav == page.pageNum}">
                     	<li class="page_num index">${nav}</li>
                     </c:if>
                     <c:if test="${nav != page.pageNum}">
                         <li class="page_num" onclick="pageQuery('${nav}')">${nav}</li>
                     </c:if>
                 </c:forEach>
                 <c:if test="${page.hasNextPage}">
                     <li class="next_page" onclick="pageQuery('${page.nextPage}')">下一页</li>
                 </c:if>
                 <c:if test="${!page.isLastPage}">
                  <li class="last_page" onclick="pageQuery('${page.pages}')">尾页</li>
                 </c:if>
                </c:if>
            </ul>
		<div class="course_manage_btn_type_box">
			<c:choose>
				<c:when test="${empty courseCategoryName}">
					<span class="course_manage_btn_type_value">按课程类别筛选</span>
				</c:when>
				<c:otherwise>
					<span class="course_manage_btn_type_value" id="${courseCategoryId}">${courseCategoryName}</span>
				</c:otherwise>
			</c:choose>
			<ul class="course_manage_btn_type_ul">
				
			</ul>
		</div>
		<div class="course_manage_btn_arg_type_box">
			<c:choose>
				<c:when test="${empty uavTypeId}">
					<span class="course_manage_btn_arg_type_value">按机型选择</span>
				</c:when>
				<c:otherwise>
					<c:forEach items="${uavTypes}" var="uavType">
						<c:if test="${uavType.id==uavTypeId}">
							<span class="course_manage_btn_arg_type_value" id="${uavTypeId}">${uavType.name}</span>
						</c:if>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			<ul class="course_manage_btn_arg_type_ul">
					<li class="course_manage_btn_arg_type_li" onclick="course_manage_btn_arg_type_li(this,'')">全部</li>
				<c:forEach items="${uavTypes}" var="uavType">
					<li class="course_manage_btn_arg_type_li" onclick="course_manage_btn_arg_type_li(this,'${uavType.id}')">${uavType.name}</li>
				</c:forEach>	
			</ul>
		</div>
		
		<div class="course_manage_btn_iden_type_box">
			<c:choose>
				<c:when test="${empty userTypeId}">
					<span class="course_manage_btn_iden_type_value">按身份筛选</span>
				</c:when>
				<c:otherwise>
					<c:forEach items="${userTypes}" var="userType">
						<c:if test="${userType.id==userTypeId}">
							<span class="course_manage_btn_iden_type_value" id="${userTypeId}">${userType.name}</span>
						</c:if>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			<ul class="course_manage_btn_iden_type_ul">
					<li class="course_manage_btn_iden_type_li" onclick="course_manage_btn_iden_type_li(this,'')">全部</li>
				<c:forEach items="${userTypes}" var="userType">
					<li class="course_manage_btn_iden_type_li" onclick="course_manage_btn_iden_type_li(this,'${userType.id}')">${userType.name}</li>
				</c:forEach>
			</ul>
		</div>
		<span class="course_manage_btn_add">添加课程</span>
	</div>

	<div class="course_manage_content_box">
		<ul class="course_manage_content_header_ul">
			<li class="course_manage_content_header_li">序号</li>
			<li class="course_manage_content_header_li">课程名称</li>
			<li class="course_manage_content_header_li">机型</li>
			<li class="course_manage_content_header_li">身份</li>
			<li class="course_manage_content_header_li">课程类别</li>
			<li class="course_manage_content_header_li">发布者</li>
			<li class="course_manage_content_header_li">最近更新</li>
			<li class="course_manage_content_header_li">操作</li>
		</ul>
		<div class="course_manage_content_ul_box">
			<c:forEach items="${courses}" var="course" varStatus="status">
				<ul class="course_manage_content_ul">
					<li class="course_manage_content_li">${status.index+1}</li>
					<li class="course_manage_content_li">${course.title}</li>
					<li class="course_manage_content_li">${course.uavTypeName}</li>
					<li class="course_manage_content_li">${course.userTypeName}</li>
					<li class="course_manage_content_li">${course.courseCategory}</li>
					<li class="course_manage_content_li">${course.operator}</li>
					<li class="course_manage_content_li"><fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${course.operateTime}" /></li>
					<li class="course_manage_content_li">
						<span class="course_manage_content_li_btn2" onclick="course_manage_content_li_btn2('${course.id}')">编辑</span>
						<span class="course_manage_content_li_btn3" onclick="course_manage_content_li_btn3('${course.id}')">删除</span>
					</li>
				</ul>
			</c:forEach>
		</div>
	</div>
</div>

