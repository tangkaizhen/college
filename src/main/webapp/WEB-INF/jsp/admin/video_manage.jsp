<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
<style>
.back_right_box{
    background: #fafafa;
        font-size: 16px;
}
.video_mange_header{
    width: 100%;
    border-bottom: 1px solid #ccc;
    font-size: 20px;
    padding: 6px 0 6px 23px;
    background: #fff;
}
.video_mange_btn_box{
	width: 100%;
    height: 63px;
}
.video_mange_btn_next{
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
.video_mange_btn_fore{
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
.video_mange_btn_type_box{
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
.video_mange_btn_type_value{
    display: inline-block;
    margin-top: 3px;
    width: 100%;
    text-align: left;
    padding-left: 8%;
}
.video_mange_btn_type_ul{
    position: absolute;
    width: 100%;
    border: 1px solid #ccc;
    top: 27px;
    background: #fff;
    z-index: 3;
    display: none;
}
.video_mange_btn_type_li{
    border-bottom: 1px solid #ccc;
    line-height: 30px;
}
.video_mange_btn_add{
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
.video_mange_content_box{
    width: 98%;
    background: #fff;
    margin-left: 1%;
    border: 1px solid #ccc;
    border-radius: 4px;
}
.video_mange_content_box{

}
.video_mange_content_header_ul{
    overflow: hidden;
    font-size: 16px;
    font-weight: bold;
    border-bottom: 1px solid #ccc;
}
.video_mange_content_header_li{
	float: left;
    text-align: center;
    border-right: 1px solid;
    height: 50px;
    line-height: 50px;
}
.video_mange_content_header_li:first-child{
    width: 7%;
}
.video_mange_content_header_li:first-child+li{
    width: 21%;
}
.video_mange_content_header_li:first-child+li+li{
    width: 35%;
}
.video_mange_content_header_li:first-child+li+li+li{
    width: 11%;
}
.video_mange_content_header_li:first-child+li+li+li+li{
    width: 11%;
}
.video_mange_content_header_li:first-child+li+li+li+li+li{
    width: 15%;
    border-right:none
}
.video_mange_content_ul_box{

}
.video_mange_content_ul{
	overflow: hidden;
    font-size: 16px;
    border-bottom: 1px solid #ccc;
}
.video_mange_content_li{
	float: left;
    text-align: center;
    border-right: 1px solid;
    height: 70px;
    line-height: 70px;
    white-space: nowrap;
    overflow-x: hidden;
    text-overflow: ellipsis;
}
.video_mange_content_li:first-child{
width: 7%;
}
.video_mange_content_li:first-child+li{
width: 21%;
}
.video_mange_content_li:first-child+li+li{
	width: 35%;
    overflow: hidden;
    text-overflow: ellipsis;
}
.video_mange_content_li:first-child+li+li+li{
width: 11%;
}
.video_mange_content_li:first-child+li+li+li+li{
width: 11%;
}
.video_mange_content_li:first-child+li+li+li+li+li{
width: 15%;
border-right:none;
font-size: 13px;
}
.video_mange_content_li_btn1{
	background: rgba(255, 156, 48, 1);
    color: #fff;
    padding: 3px 8px;
    border-radius: 2px;
    cursor:pointer
}
.video_mange_content_li_btn1.index{
    background: #ccc;
}
.video_mange_content_li_btn2{
    background: #139FD2;
    color: #fff;
    padding: 3px 8px;
    border-radius: 2px;
    cursor:pointer
}
.video_mange_content_li_btn3,.video_mange_content_li_btn4,.video_mange_content_li_btn5{
    background: #139FD2;
    color: #fff;
    padding: 3px 8px;
    border-radius: 2px;
    cursor:pointer
}
.video_mange_content_li_btn4.index{
	background: #ccc
}
.video_mange_content_li_btn5.index{
	background: #ccc
}
</style>
<script type="text/javascript">
$(function(){
	/* $(".back_nav_li").eq(0).find(".back_article_header").addClass("index");
	$(".back_nav_li").eq(0).find(".back_article_ul").show();
	$(".back_nav_li").eq(0).find(".back_article_li").eq(1).addClass("index"); */
	
	$(".video_mange_btn_type_value").click(function(){
		$(".video_mange_btn_type_ul").toggle();
	});
	
	$(".video_mange_btn_add").click(function(){
		$("#video_mange_home").attr("action","${ctx}/admin/knowledge/add_video_manage.page").submit();
	});
	
	$(".confirm_box_close,.confirm_li.cancel").click(function(){
		$(".confirm_box").hide();
		$(".bg").hide();
	});
})
function video_mange_btn_type_li(e,id){
	var video_mange_type_value=$.trim($(e).text());
	$(".video_mange_btn_type_value").text(video_mange_type_value);
	$(".video_mange_btn_type_ul").toggle();
	$(".uavType_id").val(id);
	$("#video_mange_home").attr("action","${ctx}/admin/knowledge/video_manage.page").submit();
	
}
/* 编辑方法 */
function video_mange_content_li_btn2(e,id){
	$(".video_id").val(id);
	$("#video_mange_home").submit();
}
/* 删除方法 */
function video_mange_content_li_btn3(e,id){
	$(".confirm_box").show();
	$(".bg").show();
	$(".confirm_header").text("您确认删除该视频吗？");
	
	$(".confirm_li.confirm").on("click",function(){
		$.ajax({
			   type: "POST",
			   url: "${ctx}/admin/knowledge/deleteVideo.json",
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
	$("#video_mange_home").attr("action","${ctx}/admin/knowledge/video_manage.page").submit();
	
}

function video_mange_content_li_btn4(e,id){
	var last_id=$(e).parents(".video_mange_content_ul").prev().attr("id");
	$.ajax({
		   type: "POST",
		   url: "${ctx}/admin/knowledge/upDownVideo.json",
		   dataType: "json",
		   data: {upId:last_id,downId:id},
		   success: function(msg){
			   if(msg.status==1){
					location.reload();
			   }else{
				   reminder_box(msg.msg);
			   }
		   }
	})
	
}

function video_mange_content_li_btn5(e,id){
	var next_id=$(e).parents(".video_mange_content_ul").next().attr("id");
	$.ajax({
		   type: "POST",
		   url: "${ctx}/admin/knowledge/upDownVideo.json",
		   dataType: "json",
		   data: {upId:id,downId:next_id},
		   success: function(msg){
			   if(msg.status==1){
					location.reload();
			   }else{
				   reminder_box(msg.msg);
			   }
		   }
	})
}
</script>
<form action="${ctx}/admin/knowledge/add_video_manage.page" id="video_mange_home">
	<input type="hidden" name="id" class="video_id">
	<input type="hidden" name="uavTypeId" value="${uavTypeId}" class="uavType_id">
	<input type="hidden" name="pageNum" class="pageNum">
	
	<input type="hidden" value="${categoryId}" name="categoryId" class="category_id">
</form>

<div class="back_right_box">
	<h1 class="video_mange_header">视频管理</h1>
	<div class="video_mange_btn_box">
		<%-- <ul class="page_box">
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
                </ul> --%>
		<div class="video_mange_btn_type_box">
			
			<c:choose>
				<c:when test="${empty uavTypeId}">
					<span class="video_mange_btn_type_value">按机型选择</span>
				</c:when>
				<c:otherwise>
					<c:forEach items="${uavTypes}" var="uavType">
						<c:if test="${uavType.id==uavTypeId}">
							<span class="video_mange_btn_type_value">${uavType.name}</span>
						</c:if>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			
			
			
			<ul class="video_mange_btn_type_ul">
					<li class="video_mange_btn_type_li" onclick="video_mange_btn_type_li(this)">全部</li>
				<c:forEach items="${uavTypes}" var="uavType">
					<li class="video_mange_btn_type_li" onclick="video_mange_btn_type_li(this,'${uavType.id}')">${uavType.name}</li>
				</c:forEach>	
			</ul>
		</div>
		<span class="video_mange_btn_add">添加视频</span>
	</div>

	<div class="video_mange_content_box">
		<ul class="video_mange_content_header_ul">
			<li class="video_mange_content_header_li">序号</li>
			<li class="video_mange_content_header_li">视频名称</li>
			<li class="video_mange_content_header_li">机型</li>
			<li class="video_mange_content_header_li">发布者</li>
			<li class="video_mange_content_header_li">最近更新</li>
			<li class="video_mange_content_header_li">操作</li>
		</ul>
		<div class="video_mange_content_ul_box">
			<c:forEach items="${videos}" var="video" varStatus="status">
				<ul class="video_mange_content_ul" id="${video.id}">
					<li class="video_mange_content_li">${status.index+1}</li>
					<li class="video_mange_content_li">${video.name}</li>
					<li class="video_mange_content_li">${video.uavType}</li>
					<li class="video_mange_content_li">${video.operator}</li>
					<li class="video_mange_content_li"><fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${video.operateTime}" /></li>
					<li class="video_mange_content_li">
						<span class="video_mange_content_li_btn2" onclick="video_mange_content_li_btn2(this,'${video.id}')">编辑</span>
						<span class="video_mange_content_li_btn3" onclick="video_mange_content_li_btn3(this,'${video.id}')">删除</span>
						<c:choose>
							<c:when test="${status.index==0}">
								<span class="video_mange_content_li_btn4 index">上移</span>
								<span class="video_mange_content_li_btn5" onclick="video_mange_content_li_btn5(this,'${video.id}')">下移</span>
							</c:when>
							<c:when test="${status.last}">
								<span class="video_mange_content_li_btn4" onclick="video_mange_content_li_btn4(this,'${video.id}')">上移</span>
								<span class="video_mange_content_li_btn5 index">下移</span>
							</c:when>
							<c:otherwise>
								<span class="video_mange_content_li_btn4" onclick="video_mange_content_li_btn4(this,'${video.id}')">上移</span>
								<span class="video_mange_content_li_btn5" onclick="video_mange_content_li_btn5(this,'${video.id}')">下移</span>
							</c:otherwise>
						</c:choose>					
							
					</li>
				</ul>
			</c:forEach>	
		</div>
	</div>
</div>

