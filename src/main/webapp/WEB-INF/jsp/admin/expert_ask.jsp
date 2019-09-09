<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
<style>
.back_right_box{
    background: #fafafa;
        font-size: 16px;
}
.expert_ask_header{
    width: 100%;
    border-bottom: 1px solid #ccc;
    font-size: 20px;
    padding: 6px 0 6px 23px;
    background: #fff;
}
.expert_ask_btn_box{
	width: 100%;
    height: 63px;
}
.expert_ask_btn_next{
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
.expert_ask_btn_fore{
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
.expert_ask_btn_type_box{
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
.expert_ask_btn_type_value{
    display: inline-block;
    margin-top: 3px;
    width: 100%;
    text-align: left;
    padding-left: 8%;
}
.expert_ask_btn_type_ul{
    position: absolute;
    width: 100%;
    border: 1px solid #ccc;
    top: 27px;
    background: #fff;
    z-index: 3;
    display: none;
}
.expert_ask_btn_type_li{
    border-bottom: 1px solid #ccc;
    line-height: 30px;
}
.expert_ask_btn_add{
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
.expert_ask_content_box{
    width: 98%;
    background: #fff;
    margin-left: 1%;
    border: 1px solid #ccc;
    border-radius: 4px;
}
.expert_ask_content_box{

}
.expert_ask_content_header_ul{
    overflow: hidden;
    font-size: 16px;
    font-weight: bold;
    border-bottom: 1px solid #ccc;
}
.expert_ask_content_header_li{
	float: left;
    text-align: center;
    border-right: 1px solid;
    height: 50px;
    line-height: 50px;
}
.expert_ask_content_header_li:first-child{
    width: 7%;
}
.expert_ask_content_header_li:first-child+li{
    width: 60%;
}
.expert_ask_content_header_li:first-child+li+li{
    width: 10%;
}
.expert_ask_content_header_li:first-child+li+li+li{
    width: 11%;
}
.expert_ask_content_header_li:first-child+li+li+li+li{
    width: 11%;
    border-right:none
}
.expert_ask_content_ul_box{

}
.expert_ask_content_ul{
	overflow: hidden;
    font-size: 16px;
    border-bottom: 1px solid #ccc;
}
.expert_ask_content_li{
	float: left;
    text-align: center;
    border-right: 1px solid;
}
.expert_ask_content_li:first-child{
	width: 7%;
}
.expert_ask_content_li:first-child+li{
	width: 60%;
    line-height: 25px;
    text-align: left;
    font-size: 16px;
    padding:0 12px;
}
.expert_ask_content_li:first-child+li+li{
	width: 10%;
    
}
.expert_ask_content_li:first-child+li+li+li{
	width: 11%;
    
}
.expert_ask_content_li:first-child+li+li+li+li{
	width: 11%;
	border-right:none;
    font-size: 13px;
}
.expert_ask_content_li_btn0,.expert_ask_content_li_btn1{
	padding: 3px 8px;
    border-radius: 2px;
    cursor: pointer;
    border: 1px solid #ccc;
}
.expert_ask_content_li_btn0.index1,.expert_ask_content_li_btn1.index1{
    background: #1CAF15;
    color: #fff;
}
.expert_ask_content_li_btn0.index2,.expert_ask_content_li_btn1.index2{
    background: #aaa;
    color: #fff;
}
.expert_ask_content_li_btn2{
    background: #FF9C30;
    color: #fff;
    padding: 3px 8px;
    border-radius: 2px;
    margin: 0 12px;
    cursor:pointer
}
.expert_ask_content_li_btn2.index{
    background: #aaa;
}
.expert_ask_content_li_btn3{
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
.expert_ask_header_box{
        color: #139FD2;
    margin-bottom: 4px;
}
.expert_ask_name{

}
.expert_ask_date{

}
.expert_ask_content{
	
}
.expert_ask_img{
	width: 6rem;
}
.expert_ask_img_box{
	margin: 10px 0;
	width: 6rem;
	overflow: hidden;
	height: 6rem;
}
.expert_ask_img.index{
	width: 16rem;
	z-index: 10;
	
	position: absolute;
}
.expert_reply_header{
    color: #139FD2;
    margin-bottom: 4px;
}
.expert_popout{
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
.expert_popout_header{

}
.expert_popout_ask_content{
    width: 100%;
    border: 1px solid #ccc;
    border-radius: 7px;
    height: auto;
    padding: 12px;
    margin: 10px 0;
    font-size: 16px;
}
.expert_popout_reply_content{
    width: 100%;
    border: 1px solid #ccc;
    border-radius: 7px;
    height: 120px;
    margin: 10px 0;
    font-size: 16px;
}
.expert_popout_ul{
    font-size: 16px;
    overflow: hidden;
    margin-left: 35%;
    width: 30%;
    margin-top: 28px;
}
.expert_popout_li{
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
.expert_popout_li:first-child{
	margin-right: 4%;
}
</style>
<script type="text/javascript">
$(function(){
	/* $(".back_nav_li").eq(4).find(".back_article_header").addClass("index");
	$(".back_nav_li").eq(4).find(".back_article_ul").show();
	$(".back_nav_li").eq(4).find(".back_article_li").eq(0).addClass("index"); */
	
	$(".expert_ask_btn_type_value").click(function(){
		$(".expert_ask_btn_type_ul").toggle();
	});
	$(".expert_audit_btn_type_value").click(function(){
		$(".expert_audit_btn_type_ul").toggle();
	});
	$(".expert_reply_btn_type_value").click(function(){
		$(".expert_reply_btn_type_ul").toggle();
	});
	
	$(".expert_ask_content_ul").each(function(){
		var height=$(this).find(".expert_ask_content_li").eq(1).height();
		$(this).find(".expert_ask_content_li").height(height);
		$(this).find(".expert_ask_content_li").not($(this).find(".expert_ask_content_li").eq(1)).css("lineHeight",height+"px");
	});

    $(".confirm_box_close,.confirm_li.cancel").click(function(){
        $(".confirm_box").hide();
        $(".bg").hide();
    });
})
function expert_ask_btn_type_li(e,id){
	var expert_ask_type_value=$.trim($(e).text());
	$(".expert_ask_btn_type_value").text(expert_ask_type_value);
	$(".expert_ask_btn_type_ul").toggle();
    $(".expertId").val(id);
    $("#expert_ask_home").attr("action","${ctx}/admin/qa/expert/expert_ask.page").submit();
}
function expert_audit_btn_type_li(e,state){
	var expert_audit_type_value=$.trim($(e).text());
	$(".expert_audit_btn_type_value").text(expert_audit_type_value);
	$(".expert_audit_btn_type_ul").toggle();
    $(".state").val(state);
    $("#expert_ask_home").attr("action","${ctx}/admin/qa/expert/expert_ask.page").submit();
}
function expert_reply_btn_type_li(e,replyFlag){
	var expert_reply_type_value=$.trim($(e).text());
	$(".expert_reply_btn_type_value").text(expert_reply_type_value);
	$(".expert_reply_btn_type_ul").toggle();
    $(".replyFlag").val(replyFlag);
    $("#expert_ask_home").attr("action","${ctx}/admin/qa/expert/expert_ask.page").submit();
}
function expert_ask_content_li_btn2(e,id,content){
	$(".expert_popout,.bg").show()
	$(".expert_popout .expert_popout_ask_content").html(content);
	$("#save_replay").on("click",function(){
        $.ajax({
            type: "POST",
            url: "${ctx}/admin/qa/expert/addReply.json",
            dataType: "json",
            data: {id:id,replyContent:$.trim($(".expert_popout_reply_content").val())},
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
function expert_popout_back(){
	$(".expert_popout,.bg").hide()
}
/* 通过 */
function audit_success(id){
    $(".confirm_box").show();
    $(".bg").show();
    $(".confirm_header").text("您确认通过该专家提问吗？");

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
    $(".confirm_header").text("您确认拒绝该专家提问吗？");

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
    $(".confirm_header").text("您确认删除该专家提问吗？");

    $(".confirm_li.confirm").off('click').on("click",function(){
        $.ajax({
            type: "POST",
            url: "${ctx}/admin/qa/expert/delete.json",
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
    $("#expert_ask_home").attr("action","${ctx}/admin/qa/expert/expert_ask.page").submit();
}

function expert_ask_img(e) {
	$(e).toggleClass("index");
}
</script>
<form action="" method="post" id="expert_ask_home">
	<input type="hidden" name="id" class="qa_id">
	<input type="hidden" name="pageNum" class="pageNum">
	<input type="hidden" name="state" class="state" value="${state}">
	<input type="hidden" name="replyFlag" class="replyFlag" value="${replyFlag}">
	<input type="hidden" name="expertId" class="expertId" value="${expertId}">
</form>

<div class="back_right_box">
	<h1 class="expert_ask_header">专家问答</h1>
	<div class="expert_ask_btn_box">
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
		<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_QA')">
			<div class="expert_ask_btn_type_box">
				<span class="expert_ask_btn_type_value">
					<c:choose>
						<c:when test="${empty expertId}">
							全部专家
						</c:when>
						<c:otherwise>
							<c:forEach items="${experts}" var="expert">
								<c:if test="${expert.id==expertId}">
									${expert.nickname}
								</c:if>
							</c:forEach>
						</c:otherwise>
					</c:choose>

				</span>
				<ul class="expert_ask_btn_type_ul">
						<li class="expert_ask_btn_type_li" onclick="expert_ask_btn_type_li(this)">全部专家</li>
					<c:forEach items="${experts}" var="expert">
						<li class="expert_ask_btn_type_li" onclick="expert_ask_btn_type_li(this,'${expert.id}')">${expert.nickname}</li>
					</c:forEach>
				</ul>
			</div>
		</sec:authorize>
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

	<div class="expert_ask_content_box">
		<ul class="expert_ask_content_header_ul">
			<li class="expert_ask_content_header_li">序号</li>
			<li class="expert_ask_content_header_li">问题</li>
			<li class="expert_ask_content_header_li">审核状态</li>
			<li class="expert_ask_content_header_li">审核</li>
			<li class="expert_ask_content_header_li">操作</li>
		</ul>
		<div class="expert_ask_content_ul_box">
			<c:forEach items="${qas}" var="qa" varStatus="status">
				<ul class="expert_ask_content_ul">
					<li class="expert_ask_content_li">${status.index+1}</li>
					<li class="expert_ask_content_li">
						<p class="expert_ask_header_box"><span class="expert_ask_name">用户：${qa.userName}</span><span class="expert_ask_date"><fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${qa.createTime}" /></span></p>
						<p class="expert_ask_content">${qa.comment}</p>
						<c:if test="${not empty qa.image}">
							<div class="expert_ask_img_box">
								<img src="${ctx}/${qa.image}" class="expert_ask_img" onclick="expert_ask_img(this)">
							</div>

						</c:if>
						<c:if test="${not empty qa.replyContent}">
							<p class="expert_reply_header"><span class="expert_reply_name">专家：${qa.replyName}</span><span class="expert_reply_date"><fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${qa.replyTime}" /></span></p>
							<p class="expert_reply_content">${qa.replyContent}</p>
						</c:if>
					</li>
					<li class="expert_ask_content_li">
						<c:choose>
							<c:when test="${qa.state==1}">审核中</c:when>
							<c:when test="${qa.state==2}">通过</c:when>
							<c:when test="${qa.state==3}">拒绝</c:when>
						</c:choose>
					</li>
					<li class="expert_ask_content_li">
						<c:choose>
							<c:when test="${qa.state==1}">
								<span class="expert_ask_content_li_btn0" onclick="audit_success('${qa.id}')">通过</span>
								<span class="expert_ask_content_li_btn1" onclick="audit_fail('${qa.id}')">拒绝</span>
							</c:when>
							<c:when test="${qa.state==2}">
								<span class="expert_ask_content_li_btn0 index1">通过</span>
								<span class="expert_ask_content_li_btn1 index2" onclick="audit_fail('${qa.id}')">拒绝</span>
							</c:when>
							<c:otherwise>
								<span class="expert_ask_content_li_btn0 index2" onclick="audit_success('${qa.id}')">通过</span>
								<span class="expert_ask_content_li_btn1 index1">拒绝</span>
							</c:otherwise>
						</c:choose>
					</li>
					<li class="expert_ask_content_li">
						<c:choose>
							<c:when test="${qa.replyFlag}">
								<span class="expert_ask_content_li_btn2 index">已回复</span>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${qa.state!=3}">
										<span class="expert_ask_content_li_btn2" onclick="expert_ask_content_li_btn2(this,'${qa.id}','${qa.comment}')">回复</span>
									</c:when>
									<c:otherwise>
										<span class="expert_ask_content_li_btn2 index">回复</span>
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
						<span class="expert_ask_content_li_btn3" onclick="remove('${qa.id}')">删除</span>
					</li>
				</ul>
			</c:forEach>
		</div>
	</div>
</div>

<div class="expert_popout" style="display:none">
	<h1 class="expert_popout_header">问题内容</h1>
	<div class="expert_popout_ask_content"></div>
	<h1 class="expert_popout_header">回复内容</h1>
	<textarea rows="" cols="" class="expert_popout_reply_content" placeholder="请输入回复的内容"></textarea>
	<ul class="expert_popout_ul">
		<li class="expert_popout_li" id="save_replay">提交保存</li>
		<li class="expert_popout_li" onclick="expert_popout_back()">返回</li>
	</ul>
</div>
