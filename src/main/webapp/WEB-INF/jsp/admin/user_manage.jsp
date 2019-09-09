<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
<style>
.back_right_box{
    background: #fafafa;
        font-size: 16px;
}
.user_manage_header{
    width: 100%;
    border-bottom: 1px solid #ccc;
    font-size: 20px;
    padding: 6px 0 6px 23px;
    background: #fff;
}
.user_manage_btn_box{
	width: 100%;
    height: 63px;
}
.user_manage_btn_next{
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
.user_manage_btn_fore{
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
.user_manage_btn_type_box{
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
.user_manage_btn_type_value{
    display: inline-block;
    margin-top: 3px;
    width: 100%;
    text-align: left;
    padding-left: 8%;
}
.user_manage_btn_type_ul{
    position: absolute;
    width: 100%;
    border: 1px solid #ccc;
    top: 27px;
    background: #fff;
    z-index: 3;
    display: none;
}
.user_manage_btn_type_li{
    border-bottom: 1px solid #ccc;
    line-height: 30px;
}
.user_manage_btn_add{
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
.user_manage_content_box{
    width: 98%;
    background: #fff;
    margin-left: 1%;
    border: 1px solid #ccc;
    border-radius: 4px;
}
.user_manage_content_box{

}
.user_manage_content_header_ul{
    overflow: hidden;
    font-size: 16px;
    font-weight: bold;
    border-bottom: 1px solid #ccc;
}
.user_manage_content_header_li{
	float: left;
    text-align: center;
    border-right: 1px solid;
    height: 50px;
    line-height: 50px;
}
.user_manage_content_header_li:first-child{
    width: 8%;
}
.user_manage_content_header_li:first-child+li{
    width: 22%;
}
.user_manage_content_header_li:first-child+li+li{
    width: 21%;
}
.user_manage_content_header_li:first-child+li+li+li{
    width: 24%;
}
.user_manage_content_header_li:first-child+li+li+li+li{
    width: 25%;
    border-right:none
}
.user_manage_content_ul_box{

}
.user_manage_content_ul{
	overflow: hidden;
    font-size: 16px;
    border-bottom: 1px solid #ccc;
}
.user_manage_content_li{
	float: left;
    text-align: center;
    border-right: 1px solid;
    height: 70px;
    white-space: nowrap;
    overflow-x: hidden;
    text-overflow: ellipsis;
    line-height: 70px;
}
.user_manage_content_li:first-child{
	width: 8%;
}
.user_manage_content_li:first-child+li{
	width: 22%;
    overflow: hidden;
    text-overflow: ellipsis;
}
.user_manage_content_li:first-child+li+li{
	width: 21%;
    overflow: hidden;
    text-overflow: ellipsis;
}
.user_manage_content_li:first-child+li+li+li{
	width: 24%;
    overflow: hidden;
    text-overflow: ellipsis;
}

.user_manage_content_li:first-child+li+li+li+li{
	width: 25%;
	border-right:none;
    font-size: 13px;
}
.user_manage_content_li_btn1{
	background: rgba(255, 156, 48, 1);
    color: #fff;
    padding: 3px 8px;
    border-radius: 2px;
    cursor:pointer
}
.user_manage_content_li_btn1.index{
    background: #ccc;
}
.user_manage_content_li_btn2{
    background: #139FD2;
    color: #fff;
    padding: 3px 8px;
    border-radius: 2px;
    margin: 0 12px;
    cursor:pointer
}
.user_manage_content_li_btn3{
    background: #139FD2;
    color: #fff;
    padding: 3px 33px;
    border-radius: 2px;
    margin: 0 12px;
    cursor:pointer
}
.user_manage_content_li_btn4{
    background: #139FD2;
    color: #fff;
    padding: 3px 8px;
    border-radius: 2px;
    cursor:pointer
}
</style>
<script type="text/javascript">
$(function(){
	/* $(".back_nav_li").eq(5).find(".back_article_header").addClass("index");
	$(".back_nav_li").eq(5).find(".back_article_ul").show();
	$(".back_nav_li").eq(5).find(".back_article_li").eq(2).addClass("index"); */

    $(".confirm_box_close,.confirm_li.cancel").click(function(){
        $(".confirm_box").hide();
        $(".bg").hide();
    });
})
/* 删除 */
function remove(id){

    $(".confirm_box").show();
    $(".bg").show();
    $(".confirm_header").text("您确认删除该用户吗？");

    $(".confirm_li.confirm").off('click').on("click",function(){
        $.ajax({
            type: "POST",
            url: "${ctx}/admin/user/deleteUser.json",
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
/* 翻页 */
function pageQuery(num){
    $(".pageNum").val(num);
    $("#expert_manage_home").attr("action","${ctx}/admin/user/user_manage.page").submit();
}
</script>
<form action="" method="post" id="user_manage_home">
	<input type="hidden" name="id" class="user_id">
	<input type="hidden" name="pageNum" class="pageNum">
</form>

<div class="back_right_box">
	<h1 class="user_manage_header">用户</h1>
	<div class="user_manage_btn_box">
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
	</div>

	<div class="user_manage_content_box">
		<ul class="user_manage_content_header_ul">
			<li class="user_manage_content_header_li">序号</li>
			<li class="user_manage_content_header_li">用户姓名</li>
			<li class="user_manage_content_header_li">账号</li>
			<li class="user_manage_content_header_li">最近登录</li>
			<li class="user_manage_content_header_li">操作</li>
		</ul>
		<div class="user_manage_content_ul_box">
			<c:forEach items="${users}" var="user" varStatus="status">
				<ul class="user_manage_content_ul">
					<li class="user_manage_content_li">${status.index+1}</li>
					<li class="user_manage_content_li">${user.name}</li>
					<li class="user_manage_content_li">${user.phone}</li>
					<li class="user_manage_content_li"><fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${user.updateTime}" /></li>
					<li class="user_manage_content_li">
						<span class="user_manage_content_li_btn3" onclick="remove('${user.id}')">删除</span>
					</li>
				</ul>
			</c:forEach>
		</div>
	</div>
</div>

