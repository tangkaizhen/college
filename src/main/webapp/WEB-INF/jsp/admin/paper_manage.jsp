<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
<style>
.back_right_box{
    background: #fafafa;
        font-size: 16px;
}
.paper_manage_header{
    width: 100%;
    border-bottom: 1px solid #ccc;
    font-size: 20px;
    padding: 6px 0 6px 23px;
    background: #fff;
}
.paper_manage_btn_box{
	width: 100%;
    height: 63px;
}
.paper_manage_btn_next{
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
.paper_manage_btn_fore{
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
.paper_manage_btn_type_box{
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
.paper_manage_btn_type_value{
    display: inline-block;
    margin-top: 3px;
    width: 100%;
    text-align: left;
    padding-left: 8%;
}
.paper_manage_btn_type_ul{
    position: absolute;
    width: 100%;
    border: 1px solid #ccc;
    top: 27px;
    background: #fff;
    z-index: 3;
    display: none;
}
.paper_manage_btn_type_li{
    border-bottom: 1px solid #ccc;
    line-height: 30px;
}
.paper_manage_btn_arg_type_box{
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
.paper_manage_btn_arg_type_value{
    display: inline-block;
    margin-top: 3px;
    width: 100%;
    text-align: left;
    padding-left: 8%;
}
.paper_manage_btn_arg_type_ul{
    position: absolute;
    width: 100%;
    border: 1px solid #ccc;
    top: 27px;
    background: #fff;
    z-index: 3;
    display: none;
}
.paper_manage_btn_arg_type_li{
    border-bottom: 1px solid #ccc;
    line-height: 30px;
}
.paper_manage_btn_iden_type_box{
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
.paper_manage_btn_iden_type_value{
    display: inline-block;
    margin-top: 3px;
    width: 100%;
    text-align: left;
    padding-left: 8%;
}
.paper_manage_btn_iden_type_ul{
    position: absolute;
    width: 100%;
    border: 1px solid #ccc;
    top: 27px;
    background: #fff;
    z-index: 3;
    display: none;
}
.paper_manage_btn_iden_type_li{
    border-bottom: 1px solid #ccc;
    line-height: 30px;
}
.paper_manage_btn_add{
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
.paper_manage_content_box{
    width: 98%;
    background: #fff;
    margin-left: 1%;
    border: 1px solid #ccc;
    border-radius: 4px;
}
.paper_manage_content_box{

}
.paper_manage_content_header_ul{
    overflow: hidden;
    font-size: 16px;
    font-weight: bold;
    border-bottom: 1px solid #ccc;
}
.paper_manage_content_header_li{
	float: left;
    text-align: center;
    border-right: 1px solid;
    height: 50px;
    line-height: 50px;
}
.paper_manage_content_header_li:first-child{
    width: 7%;
}
.paper_manage_content_header_li:first-child+li{
    width: 13%;
}
.paper_manage_content_header_li:first-child+li+li{
    width: 6%;
}
.paper_manage_content_header_li:first-child+li+li+li{
    width: 5%;
}
.paper_manage_content_header_li:first-child+li+li+li+li{
    width: 7%;
}
.paper_manage_content_header_li:first-child+li+li+li+li+li{
    width: 10%;
}
.paper_manage_content_header_li:first-child+li+li+li+li+li+li{
    width: 22%;
}
.paper_manage_content_header_li:first-child+li+li+li+li+li+li+li{
    width: 9%;
}
.paper_manage_content_header_li:first-child+li+li+li+li+li+li+li+li{
    width: 11%;
}
.paper_manage_content_header_li:first-child+li+li+li+li+li+li+li+li+li{
    width: 9%;
    border-right:none
}
.paper_manage_content_ul_box{

}
.paper_manage_content_ul{
	overflow: hidden;
    font-size: 16px;
    border-bottom: 1px solid #ccc;
}
.paper_manage_content_li{
	float: left;
    text-align: center;
    border-right: 1px solid;
    height: 70px;
    line-height: 70px;
    
    white-space: nowrap;
    overflow-x: hidden;
    text-overflow: ellipsis;
}
.paper_manage_content_li:first-child{
	width: 7%;
}
.paper_manage_content_li:first-child+li{
	width: 13%;
	overflow: hidden;
    text-overflow: ellipsis;
}
.paper_manage_content_li:first-child+li+li{
	width: 6%;
    
}
.paper_manage_content_li:first-child+li+li+li{
	width: 5%;
    
}
.paper_manage_content_li:first-child+li+li+li+li{
	width: 7%;
}
.paper_manage_content_li:first-child+li+li+li+li+li{
	width: 10%;
    
}
.paper_manage_content_li:first-child+li+li+li+li+li+li{
	width: 22%;
    overflow: hidden;
    text-overflow: ellipsis;
}
.paper_manage_content_li:first-child+li+li+li+li+li+li+li{
	width: 9%;
    
}
.paper_manage_content_li:first-child+li+li+li+li+li+li+li+li{
	width: 11%;
    
}
.paper_manage_content_li:first-child+li+li+li+li+li+li+li+li+li{
	width: 9%;
	border-right:none;
    font-size: 13px;
}
.paper_manage_content_li_btn1{
	background: rgba(255, 156, 48, 1);
    color: #fff;
    padding: 3px 8px;
    border-radius: 2px;
    cursor:pointer
}
.paper_manage_content_li_btn1.index{
    background: #ccc;
}
.paper_manage_content_li_btn2{
    background: #139FD2;
    color: #fff;
    padding: 3px 8px;
    border-radius: 2px;
    margin: 0 12px;
    cursor:pointer
}
.paper_manage_content_li_btn3{
    background: #139FD2;
    color: #fff;
    padding: 3px 8px;
    border-radius: 2px;
    cursor:pointer
}
</style>
<script type="text/javascript">
$(function(){
	/* $(".back_nav_li").eq(2).find(".back_article_header").addClass("index");
	$(".back_nav_li").eq(2).find(".back_article_ul").show();
	$(".back_nav_li").eq(2).find(".back_article_li").eq(0).addClass("index"); */
 	
	$(".paper_manage_btn_type_value").click(function(){
		
		$(".paper_manage_btn_course_type_ul").hide();
		$(".paper_manage_btn_iden_type_ul").hide();
		$(".paper_manage_btn_arg_type_ul").hide();
		
		/* 首先看看身份和机型有没有筛选 */
		if($.trim($(".paper_manage_btn_iden_type_value").text())=="按身份筛选"){
			reminder_box("请选择身份");
			return;
		}
		if($.trim($(".paper_manage_btn_arg_type_value").text())=="按机型选择"){
			reminder_box("请选择机型");
			return;
		}
		
		var html='';
		$.ajax({
			   type: "POST",
			   url: "${ctx}/api/getCourseCategories.json",
			   dataType: "json",
			   data: {userTypeId:$(".paper_manage_btn_iden_type_value").attr("id"),uavTypeId:$(".paper_manage_btn_arg_type_value").attr("id")},
			   success: function(msg){
				   console.log(msg);
				   if(msg.status==1){
					   if(msg.data.length>0){
							   html+='<li class="paper_manage_btn_type_li" onclick="paper_manage_btn_type_li(this,0)">全部</li>';
						   for(var i=0;i<msg.data.length;i++){
							   html+='<li class="paper_manage_btn_type_li" onclick="paper_manage_btn_type_li(this,'+msg.data[i].id+')">'+msg.data[i].name+'</li>';
							}
						   /* 根据机型和身份查找对应的课程类别 */
							$(".paper_manage_btn_type_ul").html(html);
							$(".paper_manage_btn_type_ul").toggle();
					   }else{
						   reminder_box("没有对应的课程！！");
						   return;
					   }
				   }else{
				   }
			   }
			})
			
	});
	
 	$(".paper_manage_btn_arg_type_value").click(function(){
 		$(".paper_manage_btn_course_type_ul").hide();
		$(".paper_manage_btn_iden_type_ul").hide();
		$(".paper_manage_btn_type_ul").hide();
		$(".paper_manage_btn_arg_type_ul").toggle();
	});
	
	$(".paper_manage_btn_iden_type_value").click(function(){
		$(".paper_manage_btn_course_type_ul").hide();
		$(".paper_manage_btn_type_ul").hide();
		$(".paper_manage_btn_arg_type_ul").hide();
		$(".paper_manage_btn_iden_type_ul").toggle();
	});
	
	$(".paper_manage_btn_add").click(function(){
		$("#paper_manage_home").attr("action","${ctx}/admin/exam/add_paper_manage.page").submit();
	});
	$(".confirm_box_close,.confirm_li.cancel").click(function(){
		$(".confirm_box").hide();
		$(".bg").hide();
	});
	
})
function paper_manage_btn_type_li(e,id){
	var paper_manage_type_value=$.trim($(e).text());
	$(".paper_manage_btn_type_value").text(paper_manage_type_value).attr("id");
	$(".paper_manage_btn_type_ul").toggle();
	
	$(".courseCategory_id").val(id);
	$("#paper_manage_home").attr("action","${ctx}/admin/exam/paper_manage.page").submit();
}
function paper_manage_btn_arg_type_li(e,id){
	var paper_manage_type_value=$.trim($(e).text());
	$(".paper_manage_btn_arg_type_value").text(paper_manage_type_value).attr("id");
	$(".paper_manage_btn_arg_type_ul").toggle();
	
	$(".uavType_id").val(id);
	$("#paper_manage_home").attr("action","${ctx}/admin/exam/paper_manage.page").submit();
}
function paper_manage_btn_iden_type_li(e,id){
	var paper_manage_type_value=$.trim($(e).text());
	$(".paper_manage_btn_iden_type_value").text(paper_manage_type_value).attr("id");
	$(".paper_manage_btn_iden_type_ul").toggle();
	
	
	$(".userType_id").val(id);
	$("#paper_manage_home").attr("action","${ctx}/admin/exam/paper_manage.page").submit();
	
}
function paper_manage_content_li_btn2(e,id){
	$("#paper_manage_home .exam_id").val(id);
	$("#paper_manage_home").attr("action","${ctx}/admin/exam/add_paper_manage.page").submit();
}

function paper_manage_content_li_btn3(e,id){
	$(".confirm_box").show();
	$(".bg").show();
	$(".confirm_header").text("您确认删除该试卷吗？");
	
	$(".confirm_li.confirm").on("click",function(){
		$.ajax({
			   type: "POST",
			   url: "${ctx}/admin/exam/deleteExamConfig.json",
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
	$("#paper_manage_home").attr("action","${ctx}/admin/exam/paper_manage.page").submit();
}
</script>
<form action="" method="post" id="paper_manage_home">
	<input type="hidden" name="id" class="exam_id">
	<input type="hidden" name="pageNum" class="pageNum">
	<input type="hidden" value="${userTypeId}" name="userTypeId" class="userType_id">
	<input type="hidden" value="${uavTypeId}" name="uavTypeId" class="uavType_id">
	<input type="hidden" value="${courseCategoryId}" name="courseCategoryId" class="courseCategory_id">
</form>
<div class="back_right_box">
	<h1 class="paper_manage_header">试卷管理</h1>
	<div class="paper_manage_btn_box">
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
		<div class="paper_manage_btn_type_box">
			<c:choose>
				<c:when test="${empty courseCategoryId||courseCategoryId==0}">
					<span class="paper_manage_btn_type_value">按课程类别筛选</span>
				</c:when>
				<c:otherwise>
					<c:forEach items="${courseCategories}" var="courseCategory">
						<c:if test="${courseCategory.id==courseCategoryId}">
							<span class="paper_manage_btn_type_value" id="${courseCategoryId}">${courseCategory.name}</span>
						</c:if>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			<ul class="paper_manage_btn_type_ul">
					<%-- <li class="paper_manage_btn_type_li" onclick="paper_manage_btn_type_li(this,'0')">全部</li>
				<c:forEach items="${courseCategories}" var="courseCategory" varStatus="status">
					<li class="paper_manage_btn_type_li" onclick="paper_manage_btn_type_li(this,'${courseCategory.id}')">${courseCategory.name}</li>
				</c:forEach>	 --%>
			</ul>
		</div>
		<div class="paper_manage_btn_arg_type_box">
			<c:choose>
				<c:when test="${empty uavTypeId}">
					<span class="paper_manage_btn_arg_type_value">按机型选择</span>
				</c:when>
				<c:otherwise>
					<c:forEach items="${uavTypes}" var="uavType">
						<c:if test="${uavType.id==uavTypeId}">
							<span class="paper_manage_btn_arg_type_value" id="${uavTypeId}">${uavType.name}</span>
						</c:if>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			<ul class="paper_manage_btn_arg_type_ul">
					<li class="paper_manage_btn_arg_type_li" onclick="paper_manage_btn_arg_type_li(this)">全部</li>
				<c:forEach items="${uavTypes}" var="uavType" varStatus="status">
					<li class="paper_manage_btn_arg_type_li" onclick="paper_manage_btn_arg_type_li(this,'${uavType.id}')">${uavType.name}</li>
				</c:forEach>	
			</ul>
		</div>
		<div class="paper_manage_btn_iden_type_box">
			<c:choose>
				<c:when test="${empty userTypeId}">
					<span class="paper_manage_btn_iden_type_value">按身份筛选</span>
				</c:when>
				<c:otherwise>
					<c:forEach items="${userTypes}" var="userType">
						<c:if test="${userType.id==userTypeId}">
							<span class="paper_manage_btn_iden_type_value" id="${userTypeId}">${userType.name}</span>
						</c:if>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			<ul class="paper_manage_btn_iden_type_ul">
				<li class="paper_manage_btn_iden_type_li" onclick="paper_manage_btn_iden_type_li(this)">全部</li>
				<c:forEach items="${userTypes}" var="userType" varStatus="status">
					<li class="paper_manage_btn_iden_type_li" onclick="paper_manage_btn_iden_type_li(this,'${userType.id}')">${userType.name}</li>
				</c:forEach>	
			</ul>
		</div>
		<span class="paper_manage_btn_add">添加试卷</span>
	</div>

	<div class="paper_manage_content_box">
		<ul class="paper_manage_content_header_ul">
			<li class="paper_manage_content_header_li">序号</li>
			<li class="paper_manage_content_header_li">试卷名称</li>
			<li class="paper_manage_content_header_li">试卷数目</li>
			<li class="paper_manage_content_header_li">题数</li>
			<li class="paper_manage_content_header_li">身份</li>
			<li class="paper_manage_content_header_li">机型</li>
			<li class="paper_manage_content_header_li">课程类别</li>
			<li class="paper_manage_content_header_li">发布者</li>
			<li class="paper_manage_content_header_li">考试时长（分钟）</li>
			<li class="paper_manage_content_header_li">操作</li>
		</ul>
		<div class="paper_manage_content_ul_box">
		<c:forEach items="${exams}" var="exam" varStatus="status">
			<ul class="paper_manage_content_ul">
				<li class="paper_manage_content_li">${status.index+1}</li>
				<li class="paper_manage_content_li">${exam.name}</li>
				<li class="paper_manage_content_li">${exam.size}</li>
				<li class="paper_manage_content_li">${exam.totalCount}</li>
				<li class="paper_manage_content_li">${exam.userType}</li>
				<li class="paper_manage_content_li">${exam.uavType}</li>
				<li class="paper_manage_content_li">${exam.courseCategory}</li>
				<li class="paper_manage_content_li">${exam.operator}</li>
				<li class="paper_manage_content_li">${exam.setTime}</li>
				<li class="paper_manage_content_li">
					<span class="paper_manage_content_li_btn2" onclick="paper_manage_content_li_btn2(this,'${exam.id}')">编辑</span>
					<span class="paper_manage_content_li_btn3" onclick="paper_manage_content_li_btn3(this,'${exam.id}')">删除</span>
				</li>
			</ul>
		</c:forEach>	
		</div>
	</div>
</div>

