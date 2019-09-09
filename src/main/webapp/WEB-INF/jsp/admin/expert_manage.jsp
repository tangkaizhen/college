<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
<script type="text/javascript" src="${ctx}/js/jquery.md5.js"></script>
<style>
.back_right_box{
    background: #fafafa;
        font-size: 16px;
}
.expert_manage_header{
    width: 100%;
    border-bottom: 1px solid #ccc;
    font-size: 20px;
    padding: 6px 0 6px 23px;
    background: #fff;
}
.expert_manage_btn_box{
	width: 100%;
    height: 63px;
}
.expert_manage_btn_next{
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
.expert_manage_btn_fore{
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
.expert_manage_btn_type_box{
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
.expert_manage_btn_type_value{
    display: inline-block;
    margin-top: 3px;
    width: 100%;
    text-align: left;
    padding-left: 8%;
}
.expert_manage_btn_type_ul{
    position: absolute;
    width: 100%;
    border: 1px solid #ccc;
    top: 27px;
    background: #fff;
    z-index: 3;
    display: none;
}
.expert_manage_btn_type_li{
    border-bottom: 1px solid #ccc;
    line-height: 30px;
}
.expert_manage_btn_add{
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
.expert_manage_content_box{
    width: 98%;
    background: #fff;
    margin-left: 1%;
    border: 1px solid #ccc;
    border-radius: 4px;
}
.expert_manage_content_box{

}
.expert_manage_content_header_ul{
    overflow: hidden;
    font-size: 16px;
    font-weight: bold;
    border-bottom: 1px solid #ccc;
}
.expert_manage_content_header_li{
	float: left;
    text-align: center;
    border-right: 1px solid;
    height: 50px;
    line-height: 50px;
}
.expert_manage_content_header_li:first-child{
    width: 4%;
}
.expert_manage_content_header_li:first-child+li{
    width: 8%;
}
.expert_manage_content_header_li:first-child+li+li{
    width: 12%;
}
.expert_manage_content_header_li:first-child+li+li+li{
    width: 19%;
}
.expert_manage_content_header_li:first-child+li+li+li+li{
    width: 25%;
}
.expert_manage_content_header_li:first-child+li+li+li+li+li{
    width: 12%;
}
.expert_manage_content_header_li:first-child+li+li+li+li+li+li{
    width: 19%;
    border-right:none
}
.expert_manage_content_ul_box{

}
.expert_manage_content_ul{
	height: 70px;
    font-size: 16px;
    border-bottom: 1px solid #ccc;
}
.expert_manage_content_li{
	float: left;
    text-align: center;
    border-right: 1px solid;
    height: 70px;
    line-height: 70px;
    white-space: nowrap;
    text-overflow: ellipsis;
}
.expert_manage_content_li:first-child{
	width: 4%;
}
.expert_manage_content_li:first-child+li{
	width: 8%;
    overflow: hidden;
    text-overflow: ellipsis;
}
.expert_manage_content_li:first-child+li+li{
	width: 12%;
    overflow: hidden;
    text-overflow: ellipsis;
}
.expert_manage_content_li:first-child+li+li+li{
	width: 19%;
    overflow: hidden;
    text-overflow: ellipsis;
}
.expert_manage_content_li:first-child+li+li+li+li{
	width: 25%;
    overflow: hidden;
    text-overflow: ellipsis;
}
.expert_manage_content_li:first-child+li+li+li+li+li{
	width: 12%;
    overflow: hidden;
    text-overflow: ellipsis;
}
.expert_manage_content_li:first-child+li+li+li+li+li+li{
	width: 19%;
	border-right:none;
    font-size: 13px;
}
.expert_manage_content_li_btn1{
	background: rgba(255, 156, 48, 1);
    color: #fff;
    padding: 3px 8px;
    border-radius: 2px;
    cursor:pointer
}
.expert_manage_content_li_btn1.index{
    background: #ccc;
}
.expert_manage_content_li_btn2{
    background: #139FD2;
    color: #fff;
    padding: 3px 8px;
    border-radius: 2px;
    margin: 0 12px;
    cursor:pointer
}
.expert_manage_content_li_btn3{
    background: #139FD2;
    color: #fff;
    padding: 3px 8px;
    border-radius: 2px;
    margin: 0 12px;
    cursor:pointer
}
.expert_manage_content_li_btn4{
    background: #139FD2;
    color: #fff;
    padding: 3px 8px;
    border-radius: 2px;
    cursor:pointer
}

.top_box{
	display: inline-block;
    width: 31%;
    position: relative;
}
.top_ul{
    width: 100%;
    position: absolute;
    left: 0;
    top: 25px;
    line-height: normal;
    z-index: 4;
    background: #ccc;
}
.top_li{
    color: #fff;
    border-bottom: 1px solid #fff;
    height: 30px;
    line-height: 30px;
    cursor:pointer
}
.top_box{

}
.baike_content_li_btn1{
	background: url(${ctx}/images/triangle_white.png) no-repeat 97% center,rgba(255, 156, 48, 1); 
    color: #fff;
    border-radius: 2px;
    cursor: pointer;
    width: 100%;
    display: inline-block;
    text-align: left;
    padding-left: 22%;
    height: 24px;
    line-height: 24px;
}
.baike_content_li_btn1.index{
	background: url(${ctx}/images/triangle_white.png) no-repeat 97% center,#ccc;
}
</style>
<script type="text/javascript">
$(function(){
	/* $(".back_nav_li").eq(5).find(".back_article_header").addClass("index");
	$(".back_nav_li").eq(5).find(".back_article_ul").show();
	$(".back_nav_li").eq(5).find(".back_article_li").eq(1).addClass("index"); */
	
	$(".expert_manage_btn_type_value").click(function(){
		$(".expert_manage_btn_type_ul").toggle();
	});
	
	$(".expert_manage_btn_add").click(function(){
		$("#expert_manage_home").attr("action","${ctx}/admin/user/add_expert_manage.page").submit();
	});

    $(".confirm_box_close,.confirm_li.cancel").click(function(){
        $(".confirm_box").hide();
        $(".bg").hide();
    });
})
function expert_manage_btn_type_li(e){
	var expert_manage_type_value=$.trim($(e).text());
	$(".expert_manage_btn_type_value").text(expert_manage_type_value);
	$(".expert_manage_btn_type_ul").toggle();
}

/* 编辑 */
function edit(id){
    $(".expert_id").val(id);
    $("#expert_manage_home").attr("action","${ctx}/admin/user/add_expert_manage.page").submit();
}
/* 删除 */
function remove(id){
    $(".confirm_box").show();
    $(".bg").show();
    $(".confirm_header").text("您确认删除该专家吗？");

    $(".confirm_li.confirm").off('click').on("click",function(){
        $.ajax({
            type: "POST",
            url: "${ctx}/admin/user/deleteExpert.json",
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
/* 重置密码 */
function resetPwd(id){
    $(".pass_confirm_box").show();
    $(".bg").show();
    
    $(".new_pass1").val("");
	$(".new_pass2").val("");
	
    $(".pass_confirm_li.confirm").off('click').on("click",function(){
    	
    	
        /* 首先看看是不是都有密码 */
		var value1=$(".new_pass1").val().trim();
		if(value1){
			if(value1.length<6){
				reminder_box("新密码至少6位");
				return;
			}
		}else{
			reminder_box("请输入新密码");
			return;
		}
		
		var value2=$(".new_pass2").val().trim();
		if(value2){
			if(value2.length<6){
				reminder_box("新密码至少6位");
				return;
			}
		}else{
			reminder_box("请再次输入新密码");
			return;
		}
		
		if(value1!=value2){
			reminder_box("两次密码输入不一样");
			return;
		}
		
		 $(".pass_confirm_box").hide();
	     $(".bg").hide();
    	
        $.ajax({
            type: "POST",
            url: "${ctx}/admin/user/resetPassword.json",
            dataType: "json",
            data: {id:id,password:$.md5(value1)},
            success: function(msg){
                if(msg.status==1){
                    reminder_box("重置成功");
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
    $("#expert_manage_home").attr("action","${ctx}/admin/user/expert_manage.page").submit();
}

function top_box(e,index,id){
	/* 
	index==1表示置顶
	index==-1表示还没有置顶
	*/
	$(e).parents(".top_box").find(".top_ul").toggle();
	
	$(e).parents(".top_box").find(".top_li").on("click",function(){
		$(e).parents(".top_box").find(".top_ul").hide();
		
		var value=$.trim($(this).text());
		
		if(value=="置顶"){
			$.ajax({
				   type: "POST",
				   url: "${ctx}/admin/user/stickExpert.json",
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
		}else if(value=="取消置顶"){
			$.ajax({
				   type: "POST",
				   url: "${ctx}/admin/user/cancelStickExpert.json",
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
		}
		
			
	});
}
</script>
<form action="" method="post" id="expert_manage_home">
	<input type="hidden" name="id" class="expert_id">
	<input type="hidden" name="pageNum" class="pageNum">
</form>

<div class="back_right_box">
	<h1 class="expert_manage_header">专家管理</h1>
	<div class="expert_manage_btn_box">
		
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
		<span class="expert_manage_btn_add">添加专家</span>
	</div>

	<div class="expert_manage_content_box">
		<ul class="expert_manage_content_header_ul">
			<li class="expert_manage_content_header_li">序号</li>
			<li class="expert_manage_content_header_li">专家姓名</li>
			<li class="expert_manage_content_header_li">账号</li>
			<li class="expert_manage_content_header_li">姓名标签</li>
			<li class="expert_manage_content_header_li">一句话简介</li>
			<li class="expert_manage_content_header_li">最近登录</li>
			<li class="expert_manage_content_header_li">操作</li>
		</ul>
		<div class="expert_manage_content_ul_box">
			<c:forEach items="${experts}" var="expert" varStatus="status">
				<ul class="expert_manage_content_ul">
					<li class="expert_manage_content_li">${status.index+1}</li>
					<li class="expert_manage_content_li">${expert.nickname}</li>
					<li class="expert_manage_content_li">${expert.name}</li>
					<li class="expert_manage_content_li">${expert.label}</li>
					<li class="expert_manage_content_li">${expert.resume}</li>
					<li class="expert_manage_content_li"><fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${expert.updateTime}" /></li>
					<li class="expert_manage_content_li">
						<span class="expert_manage_content_li_btn2" onclick="edit('${expert.id}')">编辑</span>
						<span class="expert_manage_content_li_btn3" onclick="remove('${expert.id}')">删除</span>
						<span class="expert_manage_content_li_btn4" onclick="resetPwd('${expert.id}')">重置密码</span>
						
						<!-- 这时候没有置顶 -->
						<div class="top_box">
							<c:choose>
								<c:when test="${expert.flag==1}">
									<span class="baike_content_li_btn1" onclick="top_box(this,1,'${expert.id}')">置顶</span>
								</c:when>	
								<c:otherwise>
									<span class="baike_content_li_btn1 index"  onclick="top_box(this,-1,'${expert.id}')">置顶</span>
								</c:otherwise>
							</c:choose>		
							
							<ul class="top_ul" style="display:none">
								<li class="top_li">置顶</li>
								<li class="top_li">取消置顶</li>
							</ul>
						</div>
					</li>
				</ul>
			</c:forEach>
		</div>
	</div>
</div>

