<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
<style>
.back_right_box{
    background: #fafafa;
        font-size: 16px;
}
.study_instruction_header{
    width: 100%;
    border-bottom: 1px solid #ccc;
    font-size: 20px;
    padding: 6px 0 6px 23px;
    background: #fff;
}
.study_instruction_btn_box{
	width: 100%;
    height: 63px;
}
.study_instruction_btn_next{
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
.study_instruction_btn_fore{
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
.study_instruction_btn_type_box{
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
.study_instruction_btn_type_value{
    display: inline-block;
    margin-top: 3px;
    width: 100%;
    text-align: left;
    padding-left: 8%;
}
.study_instruction_btn_type_ul{
    position: absolute;
    width: 100%;
    border: 1px solid #ccc;
    top: 27px;
    background: #fff;
    z-index: 3;
    display: none;
}
.study_instruction_btn_type_li{
    border-bottom: 1px solid #ccc;
    line-height: 30px;
}
.study_instruction_btn_add{
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
.study_instruction_content_box{
    width: 98%;
    background: #fff;
    margin-left: 1%;
    border: 1px solid #ccc;
    border-radius: 4px;
}
.study_instruction_content_box{

}
.study_instruction_content_header_ul{
    overflow: hidden;
    font-size: 16px;
    font-weight: bold;
    border-bottom: 1px solid #ccc;
}
.study_instruction_content_header_li{
	float: left;
    text-align: center;
    border-right: 1px solid;
    height: 50px;
    line-height: 50px;
}
.study_instruction_content_header_li:first-child{
    width: 7%;
}
.study_instruction_content_header_li:first-child+li{
    width: 42%;
}

.study_instruction_content_header_li:first-child+li+li{
    width: 24%;
}
.study_instruction_content_header_li:first-child+li+li+li{
    width: 26%;
    border-right:none
}
.study_instruction_content_ul_box{

}
.study_instruction_content_ul{
	overflow: hidden;
    font-size: 16px;
    border-bottom: 1px solid #ccc;
}
.study_instruction_content_li{
	float: left;
    text-align: center;
    border-right: 1px solid;
    height: 70px;
    line-height: 70px;
    white-space: nowrap;
    overflow-x: hidden;
    text-overflow: ellipsis;
}
.study_instruction_content_li:first-child{
	width: 7%;
}
.study_instruction_content_li:first-child+li{
	width: 42%;
	overflow: hidden;
    text-overflow: ellipsis;
}
.study_instruction_content_li:first-child+li+li{
	width: 24%;
    
}
.study_instruction_content_li:first-child+li+li+li{
	width: 26%;
	border-right:none;
    font-size: 13px;
}
.study_instruction_content_li_btn1{
	background: rgba(255, 156, 48, 1);
    color: #fff;
    padding: 3px 8px;
    border-radius: 2px;
    cursor:pointer
}
.study_instruction_content_li_btn1.index{
    background: #ccc;
}
.study_instruction_content_li_btn2{
    background: #139FD2;
    color: #fff;
    padding: 3px 8px;
    border-radius: 2px;
    margin: 0 12px;
    cursor:pointer
}
.study_instruction_content_li_btn3{
    background: #139FD2;
    color: #fff;
    padding: 3px 8px;
    border-radius: 2px;
    cursor:pointer
}
</style>
<script type="text/javascript">
$(function(){
	/* $(".back_nav_li").eq(0).find(".back_article_header").addClass("index");
	$(".back_nav_li").eq(0).find(".back_article_ul").show();
	$(".back_nav_li").eq(0).find(".back_article_li").eq(3).addClass("index"); */
	
	$(".study_instruction_btn_type_value").click(function(){
		$(".study_instruction_btn_type_ul").toggle();
	});
	
	$(".study_instruction_btn_add").click(function(){
		$("#study_instruction_home").attr("action","${ctx}/admin/knowledge/add_study_instruction.page").submit();
	});
	$(".study_instruction_content_li_btn2").click(function(){
		$("#study_instruction_home").attr("action","${ctx}/admin/knowledge/add_study_instruction.page").submit();
	});
	$(".confirm_box_close,.confirm_li.cancel").click(function(){
		$(".confirm_box").hide();
		$(".bg").hide();
	});
	
})
function study_instruction_btn_type_li(e){
	var study_instruction_type_value=$.trim($(e).text());
	$(".study_instruction_btn_type_value").text(study_instruction_type_value);
	$(".study_instruction_btn_type_ul").toggle();
}

function study_instruction_content_li_btn3(e,id){
	$(".confirm_box").show();
	$(".bg").show();
	$(".confirm_header").text("您确认删除该学习指引吗？");
	
	$(".confirm_li.confirm").on("click",function(){
		$.ajax({
			   type: "POST",
			   url: "${ctx}/admin/knowledge/deleteGuideline.json",
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

function study_instruction_content_li_btn2(id){
	$(".guideline_id").val(id);
	$("#study_instruction_home").submit();
}

function pageQuery(num){
	$(".pageNum").val(num);
	$("#study_instruction_home").attr("action","${ctx}/admin/knowledge/study_instruction.page").submit();
}
</script>
<form action="${ctx}/admin/knowledge/add_study_instruction.page" method="post" id="study_instruction_home">
	<input type="hidden" name="id" class="guideline_id">
	<input type="hidden" name="pageNum" class="pageNum">
</form>

<div class="back_right_box">
	<h1 class="study_instruction_header">学习指引</h1>
	<div class="study_instruction_btn_box">
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
		<span class="study_instruction_btn_add">添加指引</span>
	</div>

	<div class="study_instruction_content_box">
		<ul class="study_instruction_content_header_ul">
			<li class="study_instruction_content_header_li">序号</li>
			<li class="study_instruction_content_header_li">题目</li>
			<li class="study_instruction_content_header_li">最近更新</li>
			<li class="study_instruction_content_header_li">操作</li>
		</ul>
		<div class="study_instruction_content_ul_box">
			<c:forEach items="${guidelines}" var="guideline" varStatus="status">
				<ul class="study_instruction_content_ul">
					<li class="study_instruction_content_li">${status.index+1}</li>
					<li class="study_instruction_content_li">${guideline.title}</li>
					<li class="study_instruction_content_li"><fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${guideline.operateTime}" /></li>
					<li class="study_instruction_content_li">
						<span class="study_instruction_content_li_btn2" onclick="study_instruction_content_li_btn2('${guideline.id}')">编辑</span>
						<span class="study_instruction_content_li_btn3" onclick="study_instruction_content_li_btn3(this,'${guideline.id}')">删除</span>
					</li>
				</ul>
			</c:forEach>	
		</div>
	</div>
</div>

