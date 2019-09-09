<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
<script src="${ctx}/js/LAreaData1.js" type="text/javascript"></script>
<script type="text/javascript" src="${ctx}/js/jquery.md5.js"></script>
<style>
.back_right_box{
    background: #fafafa;
        font-size: 16px;
}
.training_net_header{
    width: 100%;
    border-bottom: 1px solid #ccc;
    font-size: 20px;
    padding: 6px 0 6px 23px;
    background: #fff;
}
.training_net_btn_box{
	width: 100%;
    height: 63px;
}
.training_net_btn_next{
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
.training_net_btn_fore{
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
.training_net_btn_type_box{
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
.training_net_btn_type_value{
    display: inline-block;
    margin-top: 3px;
    width: 100%;
    text-align: left;
    padding-left: 8%;
}
.training_net_btn_type_ul{
    position: absolute;
    width: 100%;
    border: 1px solid #ccc;
    top: 27px;
    background: #fff;
    z-index: 3;
    display: none;
}
.training_net_btn_type_li{
    border-bottom: 1px solid #ccc;
    line-height: 30px;
}
.training_net_btn_add{
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
.training_net_content_box{
    width: 98%;
    background: #fff;
    margin-left: 1%;
    border: 1px solid #ccc;
    border-radius: 4px;
}
.training_net_content_box{

}
.training_net_content_header_ul{
    overflow: hidden;
    font-size: 16px;
    font-weight: bold;
    border-bottom: 1px solid #ccc;
}
.training_net_content_header_li{
	float: left;
    text-align: center;
    border-right: 1px solid;
    height: 50px;
    line-height: 50px;
}
.training_net_content_header_li:first-child{
    width: 11%;
}
.training_net_content_header_li:first-child+li{
    width:11%;
}

.training_net_content_header_li:first-child+li+li{
    width:10%;
}
.training_net_content_header_li:first-child+li+li+li{
    width: 7%;
}
.training_net_content_header_li:first-child+li+li+li+li{
    width: 15%;
}
.training_net_content_header_li:first-child+li+li+li+li+li{
    width: 12%;
}
.training_net_content_header_li:first-child+li+li+li+li+li+li{
    width: 8%;
}
.training_net_content_header_li:first-child+li+li+li+li+li+li+li{
    width: 10%;
}
.training_net_content_header_li:first-child+li+li+li+li+li+li+li+li{
    width: 15%;
    border-right:none
}
.training_net_content_ul_box{

}
.training_net_content_ul{
	overflow: hidden;
    font-size: 16px;
    border-bottom: 1px solid #ccc;
}
.training_net_content_li{
	float: left;
    text-align: center;
    border-right: 1px solid;
    height: 70px;
    line-height: 70px;
    
    white-space: nowrap;
    overflow-x: hidden;
    text-overflow: ellipsis;
}
.training_net_content_li:first-child{
	width: 11%;
	overflow: hidden;
    text-overflow: ellipsis;
}
.training_net_content_li:first-child+li{
	width: 11%;
	overflow: hidden;
    text-overflow: ellipsis;
}
.training_net_content_li:first-child+li+li{
	width: 10%;
    overflow: hidden;
    text-overflow: ellipsis;
}
.training_net_content_li:first-child+li+li+li{
	width: 7%;
    overflow: hidden;
    text-overflow: ellipsis;
}
.training_net_content_li:first-child+li+li+li+li{
	width: 15%;
    overflow: hidden;
    text-overflow: ellipsis;
}
.training_net_content_li:first-child+li+li+li+li+li{
	width: 12%;
    overflow: hidden;
    text-overflow: ellipsis;
}
.training_net_content_li:first-child+li+li+li+li+li+li{
	width: 8%;
    overflow: hidden;
    text-overflow: ellipsis;
}
.training_net_content_li:first-child+li+li+li+li+li+li+li{
	width: 10%;
    overflow: hidden;
    text-overflow: ellipsis;
}
.training_net_content_li:first-child+li+li+li+li+li+li+li+li{
	width: 15%;
	border-right:none;
    font-size: 13px;
}
.training_net_content_li_btn1{
	background: rgba(255, 156, 48, 1);
    color: #fff;
    padding: 3px 8px;
    border-radius: 2px;
    cursor:pointer
}
.training_net_content_li_btn1.index{
    background: #ccc;
}
.training_net_content_li_btn2{
    background: #139FD2;
    color: #fff;
    padding: 3px 8px;
    border-radius: 2px;
    margin: 0 12px;
    cursor:pointer
}
.training_net_content_li_btn3{
    background: #139FD2;
    color: #fff;
    padding: 3px 8px;
    border-radius: 2px;
	margin: 0 12px;
    cursor:pointer
}
.training_net_content_li_btn4{
	background: #139FD2;
	color: #fff;
	padding: 3px 8px;
	border-radius: 2px;
	cursor:pointer
}
.wrod_manage_btn_pro_type_box{
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
.wrod_manage_btn_pro_type_value{
    display: inline-block;
    margin-top: 3px;
    width: 100%;
    text-align: left;
    padding-left: 8%;
}
.wrod_manage_btn_pro_type_ul{
    position: absolute;
    width: 100%;
    border: 1px solid #ccc;
    top: 27px;
    background: #fff;
    z-index: 3;
    display: none;
    height: 214px;
    overflow-y: auto;
}
.wrod_manage_btn_pro_type_li{
    border-bottom: 1px solid #ccc;
    line-height: 30px;
}
</style>
<script type="text/javascript">
$(function(){
	/* $(".back_nav_li").eq(3).find(".back_article_header").addClass("index");
	$(".back_nav_li").eq(3).find(".back_article_ul").show();
	$(".back_nav_li").eq(3).find(".back_article_li").eq(1).addClass("index"); */
	
	$(".training_net_btn_type_value").click(function(){
		$(".training_net_btn_type_ul").toggle();
	});
	
	$(".training_net_btn_add").click(function(){
		$("#training_net_home").attr("action","${ctx}/admin/training/add_training_net.page").submit();
	});
	
	$(".wrod_manage_btn_pro_type_value").click(function(){
		$(".wrod_manage_btn_pro_type_ul").toggle();
	});
	
	$(".confirm_box_close,.confirm_li.cancel").click(function(){
		$(".confirm_box").hide();
		$(".bg").hide();
	});
	
	/* 加载省份 */
	/* 加载各省份 */
	
	var province_html='';
	province_html+='<li class="wrod_manage_btn_pro_type_li" onclick="wrod_manage_btn_pro_type_li(this)">全部</li>';
	for(var i=0;i<LAreaData.length;i++){
		province_html+='<li class="wrod_manage_btn_pro_type_li" onclick="wrod_manage_btn_pro_type_li(this)">'+LAreaData[i].name+'</li>';
    }
	$(".wrod_manage_btn_pro_type_ul").html(province_html);
})
function wrod_manage_btn_pro_type_li(e){
	var wrod_manage_type_value=$.trim($(e).text());
	$(".wrod_manage_btn_pro_type_value").text(wrod_manage_type_value);
	$(".wrod_manage_btn_pro_type_ul").toggle();
	$(".training_net_p").val(wrod_manage_type_value);
	$("#training_net_home").attr("action","${ctx}/admin/training/training_net.page").submit();
}
function training_net_btn_type_li(e){
	var training_net_type_value=$.trim($(e).text());
	$(".training_net_btn_type_value").text(training_net_type_value);
	$(".training_net_btn_type_ul").toggle();
}
function training_net_content_li_btn2(e,id){
	$(".training_net_id").val(id);
	$("#training_net_home").attr("action","${ctx}/admin/training/add_training_net.page").submit();
}
function training_net_content_li_btn3(e,id){
	$(".confirm_box").show();
	$(".bg").show();
	$(".confirm_header").text("您确认删除该网点吗？");
	
	$(".confirm_li.confirm").off('click').on("click",function(){
		$.ajax({
			   type: "POST",
			   url: "${ctx}/admin/training/deleteTrainingSite.json",
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
function training_net_content_li_btn4(e,id) {
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
            url: "${ctx}/admin/training/resetMasterPwd.json",
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
function pageQuery(num){
	$(".pageNum").val(num);
	$("#training_net_home").attr("action","${ctx}/admin/training/training_net.page").submit();
}
</script>
<form action="" method="post" id="training_net_home">
	<input type="hidden" name="id" class="training_net_id">
	<input type="hidden" name="pageNum" class="pageNum">
	<input type="hidden" name="province" class="training_net_p">
</form>

<div class="back_right_box">
	<h1 class="training_net_header">培训网点</h1>
	<div class="training_net_btn_box">
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
		<div class="wrod_manage_btn_pro_type_box">
			<span class="wrod_manage_btn_pro_type_value">
				<c:choose>
					<c:when test="${empty province}">按省份筛选</c:when>
					<c:otherwise>${province}</c:otherwise>
				</c:choose>
			</span>
			<ul class="wrod_manage_btn_pro_type_ul">
				
			</ul>
		</div>
		
		<span class="training_net_btn_add">添加培训网点</span>
	</div>

	<div class="training_net_content_box">
		<ul class="training_net_content_header_ul">
			<li class="training_net_content_header_li">培训类型</li>
			<li class="training_net_content_header_li">培训点名称</li>
			<li class="training_net_content_header_li">费用说明</li>
			<li class="training_net_content_header_li">省份</li>
			<li class="training_net_content_header_li">详细地址</li>
			<li class="training_net_content_header_li">开班时间</li>
			<li class="training_net_content_header_li">联系人</li>
			<li class="training_net_content_header_li">联系方式</li>
			<li class="training_net_content_header_li">操作</li>
		</ul>
		<div class="training_net_content_ul_box">
			<c:forEach items="${trainingSites}" var="trainingSite" varStatus="status">
				<ul class="training_net_content_ul">
					<li class="training_net_content_li">${trainingSite.trainingType}</li>
					<li class="training_net_content_li">${trainingSite.name}</li>
					<li class="training_net_content_li">${trainingSite.feeDescription}</li>
					<li class="training_net_content_li">${trainingSite.province}</li>
					<li class="training_net_content_li">${trainingSite.address}</li>
					<li class="training_net_content_li"><fmt:formatDate type="date" value="${trainingSite.trainingStartDate}" />~<fmt:formatDate type="date" value="${trainingSite.trainingEndDate}" /></li>
					<li class="training_net_content_li">${trainingSite.contactName1}</li>
					<li class="training_net_content_li">${trainingSite.contactPhone1}</li>
					<li class="training_net_content_li">
						<span class="training_net_content_li_btn2" onclick="training_net_content_li_btn2(this,'${trainingSite.id}')">编辑</span>
						<span class="training_net_content_li_btn3" onclick="training_net_content_li_btn3(this,'${trainingSite.id}')">删除</span>
						<span class="training_net_content_li_btn4" onclick="training_net_content_li_btn4(this,'${trainingSite.id}')">重置密码</span>
					</li>
				</ul>
			</c:forEach>	
		</div>
	</div>
</div>

