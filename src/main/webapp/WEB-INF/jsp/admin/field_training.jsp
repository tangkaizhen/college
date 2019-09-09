<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
<style>
.back_right_box{
    background: #fafafa;
        font-size: 16px;
}
.field_training_header{
    width: 100%;
    border-bottom: 1px solid #ccc;
    font-size: 20px;
    padding: 6px 0 6px 23px;
    background: #fff;
}
.field_training_btn_box{
	width: 100%;
    height: 63px;
}
.field_training_btn_next{
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
.field_training_btn_fore{
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
.field_training_btn_type_box{
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
.field_training_btn_type_value{
    display: inline-block;
    margin-top: 3px;
    width: 100%;
    text-align: left;
    padding-left: 8%;
}
.field_training_btn_type_ul{
    position: absolute;
    width: 100%;
    border: 1px solid #ccc;
    top: 27px;
    background: #fff;
    z-index: 3;
    display: none;
}
.field_training_btn_type_li{
    border-bottom: 1px solid #ccc;
    line-height: 30px;
}
.field_training_btn_add{
    float: right;
    height: 29px;
    width: 124px;
    margin-right: 24px;
        cursor: pointer;
    margin-top: 17px;
    text-align: center;
    line-height: 29px;
    border-radius: 4px;
    background: #FF9C30;
    color: #fff;
}
.field_training_content_box{
    width: 98%;
    background: #fff;
    margin-left: 1%;
    border: 1px solid #ccc;
    border-radius: 4px;
}
.field_training_content_box{

}
.field_training_content_header_ul{
    overflow: hidden;
    font-size: 16px;
    font-weight: bold;
    border-bottom: 1px solid #ccc;
}
.field_training_content_header_li{
	float: left;
    text-align: center;
    border-right: 1px solid;
    height: 50px;
    line-height: 50px;
}
.field_training_content_header_li:first-child{
    width: 46%;
}
.field_training_content_header_li:first-child+li{
    width: 9%;
}

.field_training_content_header_li:first-child+li+li{
    width:17%;
}
.field_training_content_header_li:first-child+li+li+li{
    width: 15%;
}
.field_training_content_header_li:first-child+li+li+li+li{
    width: 12%;
    border-right:none
}
.field_training_content_ul_box{

}
.field_training_content_ul{
	overflow: hidden;
    font-size: 16px;
    border-bottom: 1px solid #ccc;
}
.field_training_content_li{
	float: left;
    text-align: center;
    border-right: 1px solid;
    height: 70px;
    line-height: 70px;
    
    white-space: nowrap;
    overflow-x: hidden;
    text-overflow: ellipsis;
}
.field_training_content_li:first-child{
	width: 46%;
	overflow: hidden;
    text-overflow: ellipsis;
}
.field_training_content_li:first-child+li{
	width: 9%;
	
}
.field_training_content_li:first-child+li+li{
	width: 17%;
    
}
.field_training_content_li:first-child+li+li+li{
	width: 15%;
    
}
.field_training_content_li:first-child+li+li+li+li{
	width: 12%;
	border-right:none;
    font-size: 13px;
}
.field_training_content_li_btn1{
	background: rgba(255, 156, 48, 1);
    color: #fff;
    padding: 3px 8px;
    border-radius: 2px;
    cursor:pointer
}
.field_training_content_li_btn1.index{
    background: #ccc;
}
.field_training_content_li_btn2{
    background: #139FD2;
    color: #fff;
    padding: 3px 8px;
    border-radius: 2px;
    margin: 0 12px;
    cursor:pointer
}
.field_training_content_li_btn3{
    background: #139FD2;
    color: #fff;
    padding: 3px 8px;
    border-radius: 2px;
    cursor:pointer
}
</style>
<script type="text/javascript">
function pageQuery(num){
	$(".pageNum").val(num);
	$("#field_training_home").attr("action","${ctx}/admin/training/field_training.page").submit();
}
$(function(){
	/* $(".back_nav_li").eq(3).find(".back_article_header").addClass("index");
	$(".back_nav_li").eq(3).find(".back_article_ul").show();
	$(".back_nav_li").eq(3).find(".back_article_li").eq(0).addClass("index"); */
	
	$(".field_training_btn_type_value").click(function(){
		$(".field_training_btn_type_ul").toggle();
	});
	
	$(".field_training_btn_add").click(function(){
		$("#field_training_home").attr("action","${ctx}/admin/training/add_field_training.page").submit();
	});
	
	$(".confirm_box_close,.confirm_li.cancel").click(function(){
		$(".confirm_box").hide();
		$(".bg").hide();
	});
})
function field_training_btn_type_li(e){
	var field_training_type_value=$.trim($(e).text());
	$(".field_training_btn_type_value").text(field_training_type_value);
	$(".field_training_btn_type_ul").toggle();
}
function field_training_content_li_btn2(e,id){
	$(".training_id").val(id);
	$("#field_training_home").attr("action","${ctx}/admin/training/add_field_training.page").submit();
}
function field_training_content_li_btn3(e,id){
	$(".confirm_box").show();
	$(".bg").show();
	$(".confirm_header").text("您确认删除该实操培训吗？");
	
	$(".confirm_li.confirm").on("click",function(){
		$.ajax({
			   type: "POST",
			   url: "${ctx}/admin/training/deleteTrainingCourse.json",
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
</script>
<form action="" method="post" id="field_training_home">
	<input type="hidden" name="id" class="training_id">
	<input type="hidden" name="pageNum" class="pageNum">
</form>

<div class="back_right_box">
	<h1 class="field_training_header">实操培训</h1>
	<div class="field_training_btn_box">
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
		<span class="field_training_btn_add">添加培训内容</span>
	</div>

	<div class="field_training_content_box">
		<ul class="field_training_content_header_ul">
			<li class="field_training_content_header_li">培训主题</li>
			<li class="field_training_content_header_li">培训费用</li>
			<li class="field_training_content_header_li">作者</li>
			<li class="field_training_content_header_li">发布时间</li>
			<li class="field_training_content_header_li">操作</li>
		</ul>
		
		<div class="field_training_content_ul_box">
			<c:forEach items="${trainingCourses}" var="trainingCourse" varStatus="status">
				<ul class="field_training_content_ul">
					<li class="field_training_content_li">${trainingCourse.name}</li>
					<li class="field_training_content_li">${trainingCourse.trainingFee}</li>
					<li class="field_training_content_li">${trainingCourse.operator}</li>
					<li class="field_training_content_li"><fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${trainingCourse.operateTime}" /></li>
					<li class="field_training_content_li">
						<span class="field_training_content_li_btn2" onclick="field_training_content_li_btn2(this,'${trainingCourse.id}')">编辑</span>
						<span class="field_training_content_li_btn3" onclick="field_training_content_li_btn3(this,'${trainingCourse.id}')">删除</span>
					</li>
				</ul>
			</c:forEach>	
		</div>
	</div>
</div>

