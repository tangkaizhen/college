<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
<style>
.back_right_box{
    background: #fafafa;
        font-size: 16px;
}
.leave_manage_header{
    width: 100%;
    border-bottom: 1px solid #ccc;
    font-size: 20px;
    padding: 6px 0 6px 23px;
    background: #fff;
}
.leave_manage_btn_box{
	width: 100%;
    height: 63px;
}
.expert_ask_btn_type_li{
    border-bottom: 1px solid #ccc;
}
.leave_manage_btn_next{
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
.leave_manage_btn_fore{
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
.leave_manage_btn_type_box{
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
.leave_manage_btn_type_value{
    display: inline-block;
    margin-top: 3px;
    width: 100%;
    text-align: left;
    padding-left: 8%;
}
.leave_manage_btn_type_ul{
    position: absolute;
    width: 100%;
    border: 1px solid #ccc;
    top: 27px;
    background: #fff;
    z-index: 3;
    display: none;
}
.leave_manage_btn_type_li{
    border-bottom: 1px solid #ccc;
    line-height: 30px;
}
.leave_manage_btn_add{
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
.leave_manage_content_box{
    width: 98%;
    background: #fff;
    margin-left: 1%;
    border: 1px solid #ccc;
    border-radius: 4px;
}
.leave_manage_content_box{

}
.leave_manage_content_header_ul{
    overflow: hidden;
    font-size: 16px;
    font-weight: bold;
    border-bottom: 1px solid #ccc;
}
.leave_manage_content_header_li{
	float: left;
    text-align: center;
    border-right: 1px solid;
    height: 50px;
    line-height: 50px;
}
.leave_manage_content_header_li:first-child{
    width: 7%;
}
.leave_manage_content_header_li:first-child+li{
    width: 60%;
}
.leave_manage_content_header_li:first-child+li+li{
    width: 10%;
}
.leave_manage_content_header_li:first-child+li+li+li{
    width: 11%;
}
.leave_manage_content_header_li:first-child+li+li+li+li{
    width: 11%;
    border-right:none
}
.leave_manage_content_ul_box{

}
.leave_manage_content_ul{
	overflow: hidden;
    font-size: 16px;
    border-bottom: 1px solid #ccc;
}
.leave_manage_content_li{
	float: left;
    text-align: center;
    border-right: 1px solid;
}
.leave_manage_content_li:first-child{
	width: 7%;
}
.leave_manage_content_li:first-child+li{
	width: 60%;
    line-height: 25px;
    text-align: left;
    font-size: 16px;
    padding:0 12px;
}
.leave_manage_content_li:first-child+li+li{
	width: 10%;
    
}
.leave_manage_content_li:first-child+li+li+li{
	width: 11%;
    
}
.leave_manage_content_li:first-child+li+li+li+li{
	width: 11%;
	border-right:none;
    font-size: 13px;
}
.leave_manage_content_li_btn0,.leave_manage_content_li_btn1{
	padding: 3px 8px;
    border-radius: 2px;
    cursor: pointer;
    border: 1px solid #ccc;
}
.leave_manage_content_li_btn0.index1,.leave_manage_content_li_btn1.index1{
    background: #1CAF15;
    color: #fff;
}
.leave_manage_content_li_btn0.index2,.leave_manage_content_li_btn1.index2{
    background: #aaa;
    color: #fff;
}
.leave_manage_content_li_btn2{
    background: #FF9C30;
    color: #fff;
    padding: 3px 8px;
    border-radius: 2px;
    margin: 0 12px;
    cursor:pointer
}
.leave_manage_content_li_btn2.index{
    background: #aaa;
}
.leave_manage_content_li_btn3{
    background: #139FD2;
    color: #fff;
    padding: 3px 8px;
    border-radius: 2px;
    cursor:pointer
}
.expert_reply_btn_type_box{
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
.expert_reply_btn_type_value{
    display: inline-block;
    margin-top: 3px;
    width: 100%;
    text-align: left;
    padding-left: 8%;
}
.expert_reply_btn_type_ul{
    position: absolute;
    width: 100%;
    border: 1px solid #ccc;
    top: 27px;
    background: #fff;
    z-index: 3;
    display: none;
}
.expert_reply_btn_type_li{
    border-bottom: 1px solid #ccc;
    line-height: 30px;
}


.expert_audit_btn_type_box{
    float: right;
    border: 1px solid #ccc;
    height: 29px;
    width: 200px;
    margin-right: 24px;
    margin-top: 17px;
    text-align: center;
    border-radius: 4px;
    position: relative;
        cursor: pointer;
    background: url(${ctx}/images/triangle.png) no-repeat 97% center;    
}
.expert_audit_btn_type_value{
    display: inline-block;
    margin-top: 3px;
    width: 100%;
    text-align: left;
    padding-left: 8%;
}
.expert_audit_btn_type_ul{
    position: absolute;
    width: 100%;
    border: 1px solid #ccc;
    top: 27px;
    background: #fff;
    z-index: 3;
    display: none;
}
.expert_audit_btn_type_li{
    border-bottom: 1px solid #ccc;
    line-height: 30px;
}
.leave_manage_header_box{
        color: #139FD2;
    margin-bottom: 4px;
}
.leave_manage_name{

}
.leave_manage_date{

}
.leave_manage_content{

}
.leave_manage_img{
    margin: 10px 0;
}
.expert_reply_header{
    color: #139FD2;
    margin-bottom: 4px;
}
.leave_manage_popout{
    position: fixed;
    left: 25%;
    top: 20%;
    z-index: 5;
    background: #fff;
    width: 50%;
    padding: 10px 30px 30px;
    font-size: 20px;
    border-radius: 6px;
}
.leave_manage_popout_header{

}
.leave_manage_popout_ask_content{
    width: 100%;
    border: 1px solid #ccc;
    border-radius: 7px;
    height: auto;
    padding: 12px;
    margin: 10px 0;
    font-size: 16px;
}
.leave_manage_popout_reply_content{
    width: 100%;
    border: 1px solid #ccc;
    border-radius: 7px;
    height: 120px;
    margin: 10px 0;
    font-size: 16px;
}
.leave_manage_popout_ul{
    font-size: 16px;
    overflow: hidden;
    margin-left: 35%;
    width: 30%;
    margin-top: 28px;
}
.leave_manage_popout_li{
    background: #139FD2;
    float: left;
    color: #fff;
    height: 40px;
    line-height: 40px;
    width: 48%;
    text-align: center;
    border-radius: 6px;
    cursor: pointer;
}
.leave_manage_popout_li:first-child{
	margin-right: 4%;
}
</style>
<script type="text/javascript">
$(function(){
	/* $(".back_nav_li").eq(4).find(".back_article_header").addClass("index");
	$(".back_nav_li").eq(4).find(".back_article_ul").show();
	$(".back_nav_li").eq(4).find(".back_article_li").eq(1).addClass("index"); */
	
	$(".leave_manage_btn_type_value").click(function(){
		$(".leave_manage_btn_type_ul").toggle();
	});
	$(".expert_audit_btn_type_value").click(function(){
		$(".expert_audit_btn_type_ul").toggle();
	});
	$(".expert_reply_btn_type_value").click(function(){
		$(".expert_reply_btn_type_ul").toggle();
	});
	
	$(".leave_manage_content_ul").each(function(){
		var height=$(this).find(".leave_manage_content_li").eq(1).height();
		$(this).find(".leave_manage_content_li").height(height);
		$(this).find(".leave_manage_content_li").not($(this).find(".leave_manage_content_li").eq(1)).css("lineHeight",height+"px");
	});

    $(".confirm_box_close,.confirm_li.cancel").click(function(){
        $(".confirm_box").hide();
        $(".bg").hide();
    });
})
function leave_manage_btn_type_li(e,id){
	var leave_manage_type_value=$.trim($(e).text());
	$(".leave_manage_btn_type_value").text(leave_manage_type_value);
	$(".leave_manage_btn_type_ul").toggle();
    $(".adminId").val(id);
    $("#leave_manage_home").attr("action","${ctx}/admin/qa/leave_manage.page").submit();
}
function expert_audit_btn_type_li(e,state){
	var expert_audit_type_value=$.trim($(e).text());
	$(".expert_audit_btn_type_value").text(expert_audit_type_value);
	$(".expert_audit_btn_type_ul").toggle();
    $(".state").val(state);
    $("#leave_manage_home").attr("action","${ctx}/admin/qa/leave_manage.page").submit();
}
function expert_reply_btn_type_li(e,replyFlag){
	var expert_reply_type_value=$.trim($(e).text());
	$(".expert_reply_btn_type_value").text(expert_reply_type_value);
	$(".expert_reply_btn_type_ul").toggle();
    $(".replyFlag").val(replyFlag);
    $("#leave_manage_home").attr("action","${ctx}/admin/qa/leave_manage.page").submit();
}
function leave_manage_content_li_btn2(e,id,content){
	$(".leave_manage_popout,.bg").show()
    $(".leave_manage_popout .leave_manage_popout_ask_content").html(content);
    $("#save_replay").on("click",function(){
        $.ajax({
            type: "POST",
            url: "${ctx}/admin/qa/addReply.json",
            dataType: "json",
            data: {id:id,replyContent:$.trim($(".leave_manage_popout_reply_content").val())},
            success: function(msg){
                if(msg.status==1){
                    location.reload();
                }else{
                    reminder_box(msg.msg);
                }
            }
        })
    })
}
function leave_manage_popout_save(){
	$(".leave_manage_popout,.bg").hide()
}
function leave_manage_popout_back(){
	$(".leave_manage_popout,.bg").hide()
}
/* 通过 */
function audit_success(id){
    $(".confirm_box").show();
    $(".bg").show();
    $(".confirm_header").text("您确认通过该留言吗？");

    $(".confirm_li.confirm").off('click').on("click",function(){
        $.ajax({
            type: "POST",
            url: "${ctx}/admin/qa/changeState.json",
            dataType: "json",
            data: {id:id,state:2},
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
/* 拒绝 */
function audit_fail(id){
    $(".confirm_box").show();
    $(".bg").show();
    $(".confirm_header").text("您确认拒绝该留言吗？");

    $(".confirm_li.confirm").off('click').on("click",function(){
        $.ajax({
            type: "POST",
            url: "${ctx}/admin/qa/changeState.json",
            dataType: "json",
            data: {id:id,state:3},
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
/* 删除 */
function remove(id){
    $(".confirm_box").show();
    $(".bg").show();
    $(".confirm_header").text("您确认删除该留言吗？");

    $(".confirm_li.confirm").off('click').on("click",function(){
        $.ajax({
            type: "POST",
            url: "${ctx}/admin/qa/delete.json",
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
    $("#leave_manage_home").attr("action","${ctx}/admin/qa/leave_manage.page").submit();
}
</script>
<form action="" method="post" id="leave_manage_home">
	<input type="hidden" name="id" class="comment_id">
	<input type="hidden" name="pageNum" class="pageNum">
	<input type="hidden" name="state" class="state" value="${state}">
	<input type="hidden" name="replyFlag" class="replyFlag" value="${replyFlag}">
	<input type="hidden" name="adminId" class="adminId" value="${adminId}">
</form>

<div class="back_right_box">
	<h1 class="leave_manage_header">留言管理</h1>
	<div class="leave_manage_btn_box">
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
		<div class="leave_manage_btn_type_box">
			<span class="leave_manage_btn_type_value">
				<c:choose>
					<c:when test="${empty adminId}">
						全部管理员
					</c:when>
					<c:otherwise>
						<c:forEach items="${admins}" var="admin">
							<c:if test="${admin.id==adminId}">
								${admin.nickname}
							</c:if>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				</span>
			<ul class="leave_manage_btn_type_ul">
					<li class="expert_ask_btn_type_li" onclick="leave_manage_btn_type_li(this)">全部</li>
				<c:forEach items="${admins}" var="admin">
					<li class="expert_ask_btn_type_li" onclick="leave_manage_btn_type_li(this,'${admin.id}')">${admin.nickname}</li>
				</c:forEach>
			</ul>
		</div>
		<div class="expert_reply_btn_type_box">
			<span class="expert_reply_btn_type_value">
				<c:choose>
					<c:when test="${empty replyFlag}">按回复状态筛选</c:when>
					<c:when test="${replyFlag}">已回复</c:when>
					<c:otherwise>未回复</c:otherwise>
				</c:choose>
			</span>
			<ul class="expert_reply_btn_type_ul">
				<li class="expert_reply_btn_type_li" onclick="expert_reply_btn_type_li(this,0)">未回复</li>
				<li class="expert_reply_btn_type_li" onclick="expert_reply_btn_type_li(this,1)">已回复</li>
			</ul>
		</div>
		<div class="expert_audit_btn_type_box">
			<span class="expert_audit_btn_type_value">
				<c:choose>
					<c:when test="${state==1}">审核中</c:when>
					<c:when test="${state==2}">通过</c:when>
					<c:when test="${state==3}">拒绝</c:when>
					<c:otherwise>按审核状态状态筛选</c:otherwise>
				</c:choose>
			</span>
			<ul class="expert_audit_btn_type_ul">
				<li class="expert_audit_btn_type_li" onclick="expert_audit_btn_type_li(this,0)">全部</li>
				<li class="expert_audit_btn_type_li" onclick="expert_audit_btn_type_li(this,1)">审核中</li>
				<li class="expert_audit_btn_type_li" onclick="expert_audit_btn_type_li(this,2)">通过</li>
				<li class="expert_audit_btn_type_li" onclick="expert_audit_btn_type_li(this,3)">拒绝</li>
			</ul>
		</div>
		
	</div>

	<div class="leave_manage_content_box">
		<ul class="leave_manage_content_header_ul">
			<li class="leave_manage_content_header_li">序号</li>
			<li class="leave_manage_content_header_li">留言内容</li>
			<li class="leave_manage_content_header_li">审核状态</li>
			<li class="leave_manage_content_header_li">审核</li>
			<li class="leave_manage_content_header_li">操作</li>
		</ul>
		<div class="leave_manage_content_ul_box">
			<c:forEach items="${comments}" var="comment" varStatus="status">
				<ul class="leave_manage_content_ul">
					<li class="leave_manage_content_li">${status.index+1}</li>
					<li class="leave_manage_content_li">
						<p class="leave_manage_header_box"><span class="leave_manage_name">用户:${comment.userName}</span>
							<span class="leave_manage_date"><fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${comment.createTime}" /></span>
						</p>
						<p class="leave_manage_content">${comment.comment}</p>
						
							<%-- <p class="expert_reply_header"><span class="expert_reply_name">用户:${comment.replyName}</span>
								<span class="expert_reply_date"><fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${comment.replyTime}" /></span>
							</p>
							<p class="expert_reply_content">${comment.replyContent}</p> --%>
					</li>
					<li class="leave_manage_content_li">
						<c:choose>
							<c:when test="${comment.state==1}">审核中</c:when>
							<c:when test="${comment.state==2}">通过</c:when>
							<c:when test="${comment.state==3}">拒绝</c:when>
						</c:choose>
					</li>
					<li class="leave_manage_content_li">
						<c:choose>
							<c:when test="${comment.state==1}">
								<span class="leave_manage_content_li_btn0" onclick="audit_success('${comment.id}')">通过</span>
								<span class="leave_manage_content_li_btn1" onclick="audit_fail('${comment.id}')">拒绝</span>
							</c:when>
							<c:when test="${comment.state==2}">
								<span class="leave_manage_content_li_btn0 index1">通过</span>
								<span class="leave_manage_content_li_btn1 index2" onclick="audit_fail('${comment.id}')">拒绝</span>
							</c:when>
							<c:otherwise>
								<span class="leave_manage_content_li_btn0 index2" onclick="audit_success('${comment.id}')">通过</span>
								<span class="leave_manage_content_li_btn1 index1">拒绝</span>
							</c:otherwise>
						</c:choose>
					</li>
					<li class="leave_manage_content_li">
						<c:choose>
							<c:when test="${comment.replyFlag}">
								<span class="leave_manage_content_li_btn2 index">已回复</span>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${comment.state!=3}">
										<span class="leave_manage_content_li_btn2" onclick="leave_manage_content_li_btn2(this,'${comment.id}','${comment.comment}')">回复</span>
									</c:when>
									<c:otherwise>
										<span class="leave_manage_content_li_btn2 index">回复</span>
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
						<span class="leave_manage_content_li_btn3" onclick="remove('${comment.id}')">删除</span>
					</li>
				</ul>
			</c:forEach>
		</div>
	</div>
</div>

<div class="leave_manage_popout" style="display:none">
	<h1 class="leave_manage_popout_header">留言内容</h1>
	<div class="leave_manage_popout_ask_content"></div>
	<h1 class="leave_manage_popout_header">回复内容</h1>
	<textarea rows="" cols="" class="leave_manage_popout_reply_content" placeholder="请输入回复的内容"></textarea>
	<ul class="leave_manage_popout_ul">
		<li class="leave_manage_popout_li" id="save_replay">提交保存</li>
		<li class="leave_manage_popout_li" onclick="leave_manage_popout_back()">返回</li>
	</ul>
</div>
