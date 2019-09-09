<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
<style>
.back_right_box{
    background: #fafafa;
        font-size: 16px;
}
.expert_article_header{
    width: 100%;
    border-bottom: 1px solid #ccc;
    font-size: 20px;
    padding: 6px 0 6px 23px;
    background: #fff;
}
.expert_article_btn_box{
	width: 100%;
    height: 63px;
}
.expert_article_btn_next{
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
.expert_article_btn_fore{
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
.expert_article_btn_type_box{
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
.expert_article_btn_type_value{
    display: inline-block;
    margin-top: 3px;
    width: 100%;
    text-align: left;
    padding-left: 8%;
}
.expert_article_btn_type_ul{
    position: absolute;
    width: 100%;
    border: 1px solid #ccc;
    top: 27px;
    background: #fff;
    z-index: 3;
    display: none;
}
.expert_article_btn_type_li{
    border-bottom: 1px solid #ccc;
    line-height: 30px;
}
.expert_article_btn_add{
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
.expert_article_content_box{
    width: 98%;
    background: #fff;
    margin-left: 1%;
    border: 1px solid #ccc;
    border-radius: 4px;
}
.expert_article_content_box{

}
.expert_article_content_header_ul{
    overflow: hidden;
    font-size: 16px;
    font-weight: bold;
    border-bottom: 1px solid #ccc;
}
.expert_article_content_header_li{
	float: left;
    text-align: center;
    border-right: 1px solid;
    height: 50px;
    line-height: 50px;
}
.expert_article_content_header_li:first-child{
    width: 7%;
}
.expert_article_content_header_li:first-child+li{
    width: 33%;
}
.expert_article_content_header_li:first-child+li+li{
    width: 21%;
}
.expert_article_content_header_li:first-child+li+li+li{
    width: 16%;
}
.expert_article_content_header_li:first-child+li+li+li+li{
    width: 23%;
    border-right:none
}
.expert_article_content_ul_box{

}
.expert_article_content_ul{
	overflow: hidden;
    font-size: 16px;
    border-bottom: 1px solid #ccc;
}
.expert_article_content_li{
	float: left;
    text-align: center;
    border-right: 1px solid;
    height: 70px;
    line-height: 70px;
    
    white-space: nowrap;
    overflow-x: hidden;
    text-overflow: ellipsis;
}
.expert_article_content_li:first-child{
	width: 7%;
}
.expert_article_content_li:first-child+li{
	width: 33%;
	overflow: hidden;
    text-overflow: ellipsis;
}
.expert_article_content_li:first-child+li+li{
	width: 21%;
    
}
.expert_article_content_li:first-child+li+li+li{
	width: 16%;
    
}
.expert_article_content_li:first-child+li+li+li+li{
	width: 23%;
	border-right:none;
    font-size: 13px;
}
.expert_article_content_li_btn1{
	background: rgba(255, 156, 48, 1);
    color: #fff;
    padding: 3px 8px;
    border-radius: 2px;
    cursor:pointer
}
.expert_article_content_li_btn1.index{
    background: #ccc;
}
.expert_article_content_li_btn2{
    background: #139FD2;
    color: #fff;
    padding: 3px 8px;
    border-radius: 2px;
    margin: 0 12px;
    cursor:pointer
}
.expert_article_content_li_btn3{
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
	$(".back_nav_li").eq(0).find(".back_article_li").eq(2).addClass("index");*/
	
	$(".expert_article_btn_type_value").click(function(){
		$(".expert_article_btn_type_ul").toggle();
	});
	
	$(".expert_article_btn_add").click(function(){
		$("#expert_article_home").attr("action","${ctx}/admin/knowledge/expert/add_expert_article.page").submit();
	});
	$(".expert_article_content_li_btn2").click(function(){
		$("#expert_article_home").attr("action","${ctx}/admin/knowledge/expert/add_expert_article.page").submit();
	});
	
	$(".confirm_box_close,.confirm_li.cancel").click(function(){
		$(".confirm_box").hide();
		$(".bg").hide();
	});
	
})
function expert_article_btn_type_li(e,id){
	var expert_article_type_value=$.trim($(e).text());
	$(".expert_article_btn_type_value").text(expert_article_type_value);
	$(".expert_article_btn_type_ul").toggle();
	
	$(".expertId").val(id);
	$("#expert_article_home").attr("action","${ctx}/admin/knowledge/expert/expert_article.page").submit();
}
function pageQuery(num){
	$(".pageNum").val(num);
	$("#expert_article_home").attr("action","${ctx}/admin/knowledge/expert/expert_article.page").submit();
}
function expert_article_content_li_btn3(id){
	$(".confirm_box").show();
	$(".bg").show();
	$(".confirm_header").text("您确认删除该专家文章吗？");
	
	$(".confirm_li.confirm").on("click",function(){
		$.ajax({
			   type: "POST",
			   url: "${ctx}/admin/knowledge/deleteExpertArticle.json",
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
function expert_article_content_li_btn2(id){
	$(".article_Id").val(id);
	
	$("#expert_article_home").attr("action","${ctx}/admin/knowledge/add_expert_article.page").submit();
}
</script>
<form action="" method="post" id="expert_article_home">
	<input type="hidden" name="pageNum" class="pageNum">
	<input type="hidden" name="id" class="article_Id">
	<input type="hidden" name="expertId" class="expertId">
</form>

<div class="back_right_box">
	<h1 class="expert_article_header">专家文章</h1>
	<div class="expert_article_btn_box">
		
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
		
		<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_KNOWLEDGE')">
			<div class="expert_article_btn_type_box">
				<c:choose>
					<c:when test="${empty expertId}">
						<span class="expert_article_btn_type_value">全部专家</span>
					</c:when>
					<c:otherwise>
						<c:forEach items="${experts}" var="expert" varStatus="status">
							<c:if test="${expert.id==expertId}">
								<span class="expert_article_btn_type_value">${expert.nickname}</span>
							</c:if>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				
				<ul class="expert_article_btn_type_ul">
						<li class="expert_article_btn_type_li" onclick="expert_article_btn_type_li(this)">全部</li>
					<c:forEach items="${experts}" var="expert">
						<li class="expert_article_btn_type_li" onclick="expert_article_btn_type_li(this,'${expert.id}')">${expert.nickname}</li>
					</c:forEach>
				</ul>
			</div>
		</sec:authorize>
		<span class="expert_article_btn_add">添加文章</span>
	</div>

	<div class="expert_article_content_box">
		<ul class="expert_article_content_header_ul">
			<li class="expert_article_content_header_li">序号</li>
			<li class="expert_article_content_header_li">题目</li>
			<li class="expert_article_content_header_li">发布者</li>
			<li class="expert_article_content_header_li">最近更新</li>
			<li class="expert_article_content_header_li">操作</li>
		</ul>
		<div class="expert_article_content_ul_box">
			<c:forEach items="${expertArticles}" var="expertArticle" varStatus="status">
				<ul class="expert_article_content_ul">
					<li class="expert_article_content_li">${status.index+1}</li>
					<li class="expert_article_content_li">${expertArticle.title}</li>
					<li class="expert_article_content_li">${expertArticle.author}</li>
					<li class="expert_article_content_li"><fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${expertArticle.operateTime}" /></li>
					<li class="expert_article_content_li">
						<span class="expert_article_content_li_btn2" onclick="expert_article_content_li_btn2('${expertArticle.id}')">编辑</span>
						<span class="expert_article_content_li_btn3" onclick="expert_article_content_li_btn3('${expertArticle.id}')">删除</span>
					</li>
				</ul>
			</c:forEach>	
		</div>
	</div>
</div>

