<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
<script type="text/javascript" src="${ctx}/js/ajaxfileupload.js"></script>
<style>
.back_right_box{
    background: #fafafa;
        font-size: 16px;
}
.wrod_manage_header{
    width: 100%;
    border-bottom: 1px solid #ccc;
    font-size: 20px;
    padding: 6px 0 6px 23px;
    background: #fff;
}
.wrod_manage_btn_box{
	width: 100%;
    height: 63px;
}
.wrod_manage_btn_next{
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
.wrod_manage_btn_fore{
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
.wrod_manage_btn_type_box{
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
.wrod_manage_btn_type_value{
    display: inline-block;
    margin-top: 3px;
    width: 100%;
    text-align: left;
    padding-left: 8%;
}
.wrod_manage_btn_type_ul{
    position: absolute;
    width: 100%;
    border: 1px solid #ccc;
    top: 27px;
    background: #fff;
    z-index: 3;
    display: none;
}

.wrod_manage_btn_type_li{
    border-bottom: 1px solid #ccc;
    line-height: 30px;
}

.wrod_manage_btn_arg_type_box{
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
.wrod_manage_btn_arg_type_value{
    display: inline-block;
    margin-top: 3px;
    width: 100%;
    text-align: left;
    padding-left: 8%;
}
.wrod_manage_btn_arg_type_ul{
    position: absolute;
    width: 100%;
    border: 1px solid #ccc;
    top: 27px;
    background: #fff;
    z-index: 3;
    display: none;
}
.wrod_manage_btn_arg_type_li{
    border-bottom: 1px solid #ccc;
    line-height: 30px;
}
.wrod_manage_btn_iden_type_box{
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
.wrod_manage_btn_iden_type_value{
    display: inline-block;
    margin-top: 3px;
    width: 100%;
    text-align: left;
    padding-left: 8%;
}
.wrod_manage_btn_iden_type_ul{
    position: absolute;
    width: 100%;
    border: 1px solid #ccc;
    top: 27px;
    background: #fff;
    z-index: 3;
    display: none;
}
.wrod_manage_btn_iden_type_li{
    border-bottom: 1px solid #ccc;
    line-height: 30px;
}
.wrod_manage_btn_course_type_box{
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
.wrod_manage_btn_course_type_value{
    display: inline-block;
    margin-top: 3px;
    width: 100%;
    text-align: left;
    padding-left: 8%;
}
.wrod_manage_btn_course_type_ul{
    position: absolute;
    width: 100%;
    border: 1px solid #ccc;
    top: 27px;
    background: #fff;
    z-index: 3;
    display: none;
}
.wrod_manage_btn_course_type_li{
    border-bottom: 1px solid #ccc;
    line-height: 30px;
}
.wrod_manage_btn_add{
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
.wrod_manage_btn_import_add{
    height: 29px;
    width: 88px;
    cursor: pointer;
    text-align: center;
    line-height: 29px;
    border-radius: 4px;
    background: #FF9C30;
    color: #fff;
    display: inline-block;
}
.wrod_manage_content_box{
    width: 98%;
    background: #fff;
    margin-left: 1%;
    border: 1px solid #ccc;
    border-radius: 4px;
}
.wrod_manage_content_box{

}
.wrod_manage_content_header_ul{
    overflow: hidden;
    font-size: 16px;
    font-weight: bold;
    border-bottom: 1px solid #ccc;
}
.wrod_manage_content_header_li{
	float: left;
    text-align: center;
    border-right: 1px solid;
    height: 50px;
    line-height: 50px;
}
.wrod_manage_content_header_li:first-child{
    width: 7%;
}
.wrod_manage_content_header_li:first-child+li{
    width: 20%;
}
.wrod_manage_content_header_li:first-child+li+li{
    width: 10%;
}
.wrod_manage_content_header_li:first-child+li+li+li{
    width: 11%;
}
.wrod_manage_content_header_li:first-child+li+li+li+li{
    width: 9%;
}
.wrod_manage_content_header_li:first-child+li+li+li+li+li{
    width: 18%;
}
.wrod_manage_content_header_li:first-child+li+li+li+li+li+li{
    width: 9%;
}
.wrod_manage_content_header_li:first-child+li+li+li+li+li+li+li{
    width: 15%;
    border-right:none
}
.wrod_manage_content_ul_box{

}
.wrod_manage_content_ul{
	overflow: hidden;
    font-size: 16px;
    border-bottom: 1px solid #ccc;
}
.wrod_manage_content_li{
	float: left;
    text-align: center;
    border-right: 1px solid;
    height: 70px;
    line-height: 70px;
    
    white-space: nowrap;
    overflow-x: hidden;
    text-overflow: ellipsis;
}
.wrod_manage_content_li:first-child{
	width: 7%;
}
.wrod_manage_content_li:first-child+li{
	width: 20%;
	overflow: hidden;
    text-overflow: ellipsis;
}
.wrod_manage_content_li:first-child+li+li{
	width: 10%;
    
}
.wrod_manage_content_li:first-child+li+li+li{
	width: 11%;
    
}
.wrod_manage_content_li:first-child+li+li+li+li{
	width: 9%;
	overflow: hidden;
    text-overflow: ellipsis;
    
}
.wrod_manage_content_li:first-child+li+li+li+li+li{
	width: 18%;
    
}
.wrod_manage_content_li:first-child+li+li+li+li+li+li{
	width: 9%;
    
}
.wrod_manage_content_li:first-child+li+li+li+li+li+li+li{
	width: 15%;
	border-right:none;
    font-size: 13px;
}
.wrod_manage_content_li_btn1{
	background: rgba(255, 156, 48, 1);
    color: #fff;
    padding: 3px 8px;
    border-radius: 2px;
    cursor:pointer
}
.wrod_manage_content_li_btn1.index{
    background: #ccc;
}
.wrod_manage_content_li_btn2{
    background: #139FD2;
    color: #fff;
    padding: 3px 8px;
    border-radius: 2px;
    margin: 0 12px;
    cursor:pointer
}
.wrod_manage_content_li_btn3{
    background: #139FD2;
    color: #fff;
    padding: 3px 8px;
    border-radius: 2px;
    cursor:pointer
}
.wrod_manage_btn_import_box{
    float: right;
    height: 29px;
    width: 88px;
    position: relative;
    margin-top: 17px;
    margin-right: 24px;
}
#cover_img{
	height: 100%;
    width: 100%;
    z-index: 3;
    position: absolute;
    left: 0;
    opacity: 0;
    filter:alpha(opacity=0);
    top: 0;
}
</style>
<script type="text/javascript">
$(function(){
	/* $(".back_nav_li").eq(2).find(".back_article_header").addClass("index");
	$(".back_nav_li").eq(2).find(".back_article_ul").show();
	$(".back_nav_li").eq(2).find(".back_article_li").eq(1).addClass("index"); */
 	
	$(".wrod_manage_btn_type_value").click(function(){
		
		$(".wrod_manage_btn_course_type_ul").hide();
		$(".wrod_manage_btn_iden_type_ul").hide();
		$(".wrod_manage_btn_arg_type_ul").hide();
		
		/* 首先看看身份和机型有没有筛选 */
		if($.trim($(".wrod_manage_btn_iden_type_value").text())=="按身份筛选"){
			reminder_box("请选择身份");
			return;
		}
		if($.trim($(".wrod_manage_btn_arg_type_value").text())=="按机型选择"){
			reminder_box("请选择机型");
			return;
		}
		
		var html='';
		$.ajax({
			   type: "POST",
			   url: "${ctx}/api/getCourseCategories.json",
			   dataType: "json",
			   data: {userTypeId:$(".wrod_manage_btn_iden_type_value").attr("id"),uavTypeId:$(".wrod_manage_btn_arg_type_value").attr("id")},
			   success: function(msg){
				   if(msg.status==1){
					   if(msg.data.length>0){
							   html+='<li class="wrod_manage_btn_type_li" onclick="wrod_manage_btn_type_li(this,0)">全部</li>';
						   for(var i=0;i<msg.data.length;i++){
							   html+='<li class="wrod_manage_btn_type_li" onclick="wrod_manage_btn_type_li(this,'+msg.data[i].id+')">'+msg.data[i].name+'</li>';
							}
						   /* 根据机型和身份查找对应的课程类别 */
							$(".wrod_manage_btn_type_ul").html(html);
							$(".wrod_manage_btn_type_ul").toggle();
					   }else{
						   reminder_box("没有对应的课程！！");
						   return;
					   }
				   }else{
				   }
			   }
			})
			
	});
	
 	$(".wrod_manage_btn_arg_type_value").click(function(){
 		$(".wrod_manage_btn_course_type_ul").hide();
		$(".wrod_manage_btn_iden_type_ul").hide();
		$(".wrod_manage_btn_type_ul").hide();
		$(".wrod_manage_btn_arg_type_ul").toggle();
	});
	
	$(".wrod_manage_btn_iden_type_value").click(function(){
		$(".wrod_manage_btn_course_type_ul").hide();
		$(".wrod_manage_btn_arg_type_ul").hide();
		$(".wrod_manage_btn_type_ul").hide();
		$(".wrod_manage_btn_iden_type_ul").toggle();
	});
	$(".wrod_manage_btn_course_type_value").click(function(){
		$(".wrod_manage_btn_iden_type_ul").hide();
		$(".wrod_manage_btn_arg_type_ul").hide();
		$(".wrod_manage_btn_type_ul").hide();
		$(".wrod_manage_btn_course_type_ul").toggle();
	});
	
	$(".wrod_manage_btn_add").click(function(){
		$("#wrod_manage_home").attr("action","${ctx}/admin/exam/add_wrod_manage.page").submit();
	});
	
	$(".confirm_box_close,.confirm_li.cancel").click(function(){
		$(".confirm_box").hide();
		$(".bg").hide();
	});
})
function wrod_manage_btn_type_li(e,id){
	var wrod_manage_type_value=$.trim($(e).text());
	$(".wrod_manage_btn_type_value").text(wrod_manage_type_value);
	$(".wrod_manage_btn_type_ul").toggle();
	
	$(".courseCategory_id").val(id);
	$("#wrod_manage_home").attr("action","${ctx}/admin/exam/wrod_manage.page").submit();
}
function wrod_manage_btn_arg_type_li(e,id){
	var wrod_manage_type_value=$.trim($(e).text());
	$(".wrod_manage_btn_arg_type_value").text(wrod_manage_type_value);
	$(".wrod_manage_btn_arg_type_ul").toggle();
	
	$(".uavType_id").val(id);
	$("#wrod_manage_home").attr("action","${ctx}/admin/exam/wrod_manage.page").submit();
}
function wrod_manage_btn_iden_type_li(e,id){
	var wrod_manage_type_value=$.trim($(e).text());
	$(".wrod_manage_btn_iden_type_value").text(wrod_manage_type_value);
	$(".wrod_manage_btn_iden_type_ul").toggle();
	
	$(".userType_id").val(id);
	$("#wrod_manage_home").attr("action","${ctx}/admin/exam/wrod_manage.page").submit();
}
function wrod_manage_btn_course_type_li(e,id){
	var wrod_manage_type_value=$.trim($(e).text());
	$(".wrod_manage_btn_course_type_value").text(wrod_manage_type_value);
	$(".wrod_manage_btn_course_type_ul").toggle();
	
	$(".type_id").val(id);
	$("#wrod_manage_home").attr("action","${ctx}/admin/exam/wrod_manage.page").submit();
}
function wrod_manage_content_li_btn2(e,id){
	$(".question_id").val(id);
	$("#wrod_manage_home").attr("action","${ctx}/admin/exam/add_wrod_manage.page").submit();
}

/* 删除试题 */
function wrod_manage_content_li_btn3(e,id){
	$(".confirm_box").show();
	$(".bg").show();
	$(".confirm_header").text("您确认删除该试题吗？");
	
	$(".confirm_li.confirm").on("click",function(){
		$.ajax({
			   type: "POST",
			   url: "${ctx}/admin/exam/deleteExamQuestion.json",
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
function pageQuery(num){
	$(".pageNum").val(num);
	$("#wrod_manage_home").attr("action","${ctx}/admin/exam/wrod_manage.page").submit();
}
function ajaxImportExcel(e) {
    $.ajaxFileUpload({
        url: '${ctx}/admin/exam/importExamQuestions.json', //服务器端请求地址
        secureuri: false, //是否需要安全协议，一般设置为false
        fileElementId: $(e).attr("id"), //文件上传域的ID
        dataType: 'json', //返回值类型 一般设置为json
        enctype: 'multipart/form-data',//注意一定要有该参数
        success: function (result, status)  //服务器成功响应处理函数
        {
            reminder_box(result.msg);
            if (result.status==1) {
                setTimeout(function(){
                    $("#wrod_manage_home").attr("action","${ctx}/admin/exam/wrod_manage.page").submit();
                },1500);
			}
        },
        error: function (data, status, e)//服务器响应失败处理函数
        {
            reminder_box(e);
        }
    })
}
</script>
<form action="" method="post" id="wrod_manage_home">
	<input type="hidden" name="pageNum" class="pageNum">
	<input name="id" type="hidden" value="${question.id}" class="question_id">
	<input name="type" type="hidden" value="${type}" class="type_id">
	<input name="userTypeId" type="hidden" value="${userTypeId}" class="userType_id">
	<input name="uavTypeId" type="hidden" value="${uavTypeId}" class="uavType_id">
	<input name="courseCategoryId" type="hidden" value="${courseCategoryId}" class="courseCategory_id">
</form>
<div class="back_right_box">
	<h1 class="wrod_manage_header">试题管理</h1>
	<div class="wrod_manage_btn_box">
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
	                    <li class="total_num">共${page.total}条</li>
                    </c:if>
                </ul>
		
		<div class="wrod_manage_btn_type_box">
			<c:choose>
				<c:when test="${empty courseCategoryId||courseCategoryId==0}">
					<span class="wrod_manage_btn_type_value">按课程类别筛选</span>
				</c:when>
				<c:otherwise>
					<c:forEach items="${courseCategories}" var="courseCategory">
						<c:if test="${courseCategory.id==courseCategoryId}">
							<span class="wrod_manage_btn_type_value" id="${courseCategoryId}">${courseCategory.name}</span>
						</c:if>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			<ul class="wrod_manage_btn_type_ul">
					<%-- <li class="wrod_manage_btn_type_li" onclick="wrod_manage_btn_type_li(this)">全部</li>
				<c:forEach items="${courseCategories}" var="courseCategory" varStatus="status">
					<li class="wrod_manage_btn_type_li" onclick="wrod_manage_btn_type_li(this,'${courseCategory.id}')">${courseCategory.name}</li>
				</c:forEach>	 --%>
			</ul>
			
		</div>
		<div class="wrod_manage_btn_arg_type_box">
			<c:choose>
				<c:when test="${empty uavTypeId}">
					<span class="wrod_manage_btn_arg_type_value">按机型选择</span>
				</c:when>
				<c:otherwise>
					<c:forEach items="${uavTypes}" var="uavType">
						<c:if test="${uavType.id==uavTypeId}">
							<span class="wrod_manage_btn_arg_type_value" id="${uavTypeId}">${uavType.name}</span>
						</c:if>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			<ul class="wrod_manage_btn_arg_type_ul">
					<li class="wrod_manage_btn_arg_type_li" onclick="wrod_manage_btn_arg_type_li(this)">全部</li>
				<c:forEach items="${uavTypes}" var="uavType" varStatus="status">
					<li class="wrod_manage_btn_arg_type_li" onclick="wrod_manage_btn_arg_type_li(this,'${uavType.id}')">${uavType.name}</li>
				</c:forEach>	
			</ul>
		</div>
		<div class="wrod_manage_btn_iden_type_box">
			<c:choose>
				<c:when test="${empty userTypeId}">
					<span class="wrod_manage_btn_iden_type_value">按身份筛选</span>
				</c:when>
				<c:otherwise>
					<c:forEach items="${userTypes}" var="userType">
						<c:if test="${userType.id==userTypeId}">
							<span class="wrod_manage_btn_iden_type_value" id="${userTypeId}">${userType.name}</span>
						</c:if>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			<ul class="wrod_manage_btn_iden_type_ul">
				<li class="wrod_manage_btn_iden_type_li" onclick="wrod_manage_btn_iden_type_li(this)">全部</li>
				<c:forEach items="${userTypes}" var="userType" varStatus="status">
					<li class="wrod_manage_btn_iden_type_li" onclick="wrod_manage_btn_iden_type_li(this,'${userType.id}')">${userType.name}</li>
				</c:forEach>	
			</ul>
		</div>
		
		<div class="wrod_manage_btn_course_type_box">
			<c:choose>
				<c:when test="${empty type}">
					<span class="wrod_manage_btn_course_type_value">按题型筛选</span>
				</c:when>
				<c:otherwise>
					<c:choose>
						<c:when test="${type==1}">
							<span class="wrod_manage_btn_course_type_value" id="1">单选题</span>
						</c:when>
						<c:when test="${type==2}">
							<span class="wrod_manage_btn_course_type_value" id="2">多选题</span>
						</c:when>
						<c:when test="${type==3}">
							<span class="wrod_manage_btn_course_type_value" id="3">判断题</span>
						</c:when>
						<c:otherwise>
							<span class="wrod_manage_btn_course_type_value" id="1">全部</span>
						</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>
		
			<ul class="wrod_manage_btn_course_type_ul">
				<li class="wrod_manage_btn_course_type_li" onclick="wrod_manage_btn_course_type_li(this,0)">全部</li>
				<li class="wrod_manage_btn_course_type_li" onclick="wrod_manage_btn_course_type_li(this,1)">单选题</li>
				<li class="wrod_manage_btn_course_type_li" onclick="wrod_manage_btn_course_type_li(this,2)">多选题</li>
				<li class="wrod_manage_btn_course_type_li" onclick="wrod_manage_btn_course_type_li(this,3)">判断题</li>
			</ul>
		</div>
		<div class="wrod_manage_btn_import_box">
			<span class="wrod_manage_btn_import_add">批量导入</span>
			<input type="file" id="cover_img" name="file" accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel" onchange="ajaxImportExcel(this)">
		</div>
		<span class="wrod_manage_btn_add">添加试题</span>
	</div>

	<div class="wrod_manage_content_box">
		<ul class="wrod_manage_content_header_ul">
			<li class="wrod_manage_content_header_li">序号</li>
			<li class="wrod_manage_content_header_li">试题名称</li>
			<li class="wrod_manage_content_header_li">题型</li>
			<li class="wrod_manage_content_header_li">机型</li>
			<li class="wrod_manage_content_header_li">身份</li>
			<li class="wrod_manage_content_header_li">课程类别</li>
			<li class="wrod_manage_content_header_li">发布者</li>
			<li class="wrod_manage_content_header_li">操作</li>
		</ul>
		<div class="wrod_manage_content_ul_box">
			<c:forEach items="${examQuestions}" var="examQuestion" varStatus="status">
				<ul class="wrod_manage_content_ul">
					<li class="wrod_manage_content_li">${status.index+1}</li>
					<li class="wrod_manage_content_li">${examQuestion.question}</li>
					<c:choose>
						<c:when test="${examQuestion.type==1}">
							<li class="wrod_manage_content_li">单选题</li>
						</c:when>
						<c:when test="${examQuestion.type==2}">
							<li class="wrod_manage_content_li">多选题</li>
						</c:when>
						<c:when test="${examQuestion.type==3}">
							<li class="wrod_manage_content_li">判断题</li>
						</c:when>
						<c:otherwise>
							<li class="wrod_manage_content_li">全部</li>
						</c:otherwise>
					</c:choose>
					
					<li class="wrod_manage_content_li">${examQuestion.uavType}</li>
					<li class="wrod_manage_content_li">${examQuestion.userType}</li>
					<li class="wrod_manage_content_li">${examQuestion.courseCategory}</li>
					<li class="wrod_manage_content_li">${examQuestion.operator}</li>
					<li class="wrod_manage_content_li">
						<span class="wrod_manage_content_li_btn2" onclick="wrod_manage_content_li_btn2(this,'${examQuestion.id}')">编辑</span>
						<span class="wrod_manage_content_li_btn3" onclick="wrod_manage_content_li_btn3(this,'${examQuestion.id}')">删除</span>
					</li>
				</ul>
			</c:forEach>	
		</div>
	</div>
</div>

