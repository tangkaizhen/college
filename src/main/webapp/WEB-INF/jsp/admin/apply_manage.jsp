<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
<script src="${ctx}/js/LAreaData1.js" type="text/javascript"></script>
<style>
.back_right_box{
    background: #fafafa;
        font-size: 16px;
}
.apply_manage_header{
    width: 100%;
    border-bottom: 1px solid #ccc;
    font-size: 20px;
    padding: 6px 0 6px 23px;
    background: #fff;
}
.apply_manage_btn_box{
	width: 100%;
    height: 63px;
}
.apply_manage_btn_next{
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
.apply_manage_btn_fore{
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
.apply_manage_btn_type_box{
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
.apply_manage_btn_type_value{
    display: inline-block;
    margin-top: 3px;
    width: 100%;
    text-align: left;
    padding-left: 8%;
}
.apply_manage_btn_type_ul{
    position: absolute;
    width: 100%;
    border: 1px solid #ccc;
    top: 27px;
    background: #fff;
    z-index: 3;
    display: none;
}
.apply_manage_btn_type_li{
    border-bottom: 1px solid #ccc;
    line-height: 30px;
}
.apply_manage_btn_add{
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
.apply_manage_content_box{
    width: 98%;
    background: #fff;
    margin-left: 1%;
    border: 1px solid #ccc;
    border-radius: 4px;
}
.apply_manage_content_box{

}
.apply_manage_content_header_ul{
    overflow: hidden;
    font-size: 16px;
    font-weight: bold;
    border-bottom: 1px solid #ccc;
}
.apply_manage_content_header_li{
	float: left;
    text-align: center;
    border-right: 1px solid;
    height: 50px;
    line-height: 50px;
}
.apply_manage_content_header_li:first-child{
    width: 5%;
}
.apply_manage_content_header_li:first-child+li{
    width: 7%;
}
.apply_manage_content_header_li:first-child+li+li{
    width: 11%;
}
.apply_manage_content_header_li:first-child+li+li+li{
    width: 15%;
}
.apply_manage_content_header_li:first-child+li+li+li+li{
    width: 7%;
}
.apply_manage_content_header_li:first-child+li+li+li+li+li{
    width: 15%;
}
.apply_manage_content_header_li:first-child+li+li+li+li+li+li{
    width: 10%;
}
.apply_manage_content_header_li:first-child+li+li+li+li+li+li+li{
    width: 15%;
}
.apply_manage_content_header_li:first-child+li+li+li+li+li+li+li+li{
    width: 7%;
}
.apply_manage_content_header_li:first-child+li+li+li+li+li+li+li+li+li{
    width: 7%;
    border-right:none
}
.apply_manage_content_ul_box{

}
.apply_manage_content_ul{
	overflow: hidden;
    font-size: 16px;
    border-bottom: 1px solid #ccc;
}
.apply_manage_content_li{
	float: left;
    text-align: center;
    border-right: 1px solid;
    height: 70px;
    line-height: 70px;
    white-space: nowrap;
    overflow-x: hidden;
    text-overflow: ellipsis;
}
.apply_manage_content_li:first-child{
	width: 5%;
}
.apply_manage_content_li:first-child+li{
	width: 7%;
    overflow: hidden;
    text-overflow: ellipsis;
}
.apply_manage_content_li:first-child+li+li{
	width: 11%;
    overflow: hidden;
    text-overflow: ellipsis;
}
.apply_manage_content_li:first-child+li+li+li{
	width: 15%;
    overflow: hidden;
    text-overflow: ellipsis;
}
.apply_manage_content_li:first-child+li+li+li+li{
	width: 7%;
    overflow: hidden;
    text-overflow: ellipsis;
}
.apply_manage_content_li:first-child+li+li+li+li+li{
	width: 15%;
    overflow: hidden;
    text-overflow: ellipsis;
}
.apply_manage_content_li:first-child+li+li+li+li+li+li{
	width: 10%;
    overflow: hidden;
    text-overflow: ellipsis;
}
.apply_manage_content_li:first-child+li+li+li+li+li+li+li{
    width: 15%;
    overflow-y: auto;
    text-overflow: ellipsis;
    line-height: 25px;
    text-align: left;
    padding: 13px;
    white-space: normal;
}

.apply_manage_content_li:first-child+li+li+li+li+li+li+li+li{
	width: 7%;
}
.apply_manage_content_li:first-child+li+li+li+li+li+li+li+li+li{
	width: 7%;
	border-right:none;
    font-size: 13px;
}
.apply_manage_content_li_btn1{
	background: rgba(255, 156, 48, 1);
    color: #fff;
    padding: 3px 8px;
    border-radius: 2px;
    cursor:pointer
}
.apply_manage_content_li_btn1.index{
    background: #ccc;
}
.apply_manage_content_li_btn2{
    background: #139FD2;
    color: #fff;
    padding: 3px 8px;
    border-radius: 2px;
    margin: 0 12px;
    cursor:pointer
}
.apply_manage_content_li_btn3{
    background: #139FD2;
    color: #fff;
    padding: 3px 10px;
    border-radius: 2px;
    margin: 0 12px;
    cursor:pointer
}
.apply_manage_content_li_btn4{
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
.apply_spare_txt{
    width: 91%;
    border: none;
    font-size: 16px;
    color: #555;
    height: 32px;
    padding-left: 5px;
    text-align: center;
    outline: none;
}
.apply_manage_content_li_grade{

}
</style>
<script type="text/javascript">
$(function(){
	/* $(".back_nav_li").eq(5).find(".back_article_header").addClass("index");
	$(".back_nav_li").eq(5).find(".back_article_ul").show();
	$(".back_nav_li").eq(5).find(".back_article_li").eq(3).addClass("index"); */
	
	$(".wrod_manage_btn_pro_type_value").click(function(){
		$(".wrod_manage_btn_pro_type_ul").toggle();
	});
	$(".apply_spare_txt").on("blur",function(){
		console.log($(this).val().trim());
		console.log($(this).attr("oldvalue"));
		console.log($(this).val().trim()==$(this).attr("oldvalue"));
		console.log(!$(this).val().trim());
		if($(this).val().trim()==$(this).attr("oldvalue")||!$(this).val().trim()){
			console.log(1)
			return;
			
		}else{
			console.log(2)
		}
		
		var id=$(this).attr("id");
		var name =$(this).attr("name");
		var spare=$.trim($(this).val());
        $(".confirm_box").show();
        $(".bg").show();
        $(".confirm_header").text("您确认为报名人员["+name+"]添加备注？");

        $(".confirm_li.confirm").off('click').on("click",function(){
            $.ajax({
                type: "POST",
                url: "${ctx}/admin/user/site/saveSpare.json",
                dataType: "json",
                data: {id:id, spare:spare},
                success: function(msg){
                    if(msg.status==1){
                        location.reload();
                    }else{
                        reminder_box(msg.msg);
                    }
                }
            })
        });
        $(".confirm_box_close,.confirm_li.cancel").click(function(){
            $(".apply_spare_txt").val("");
            $(".confirm_box").hide();
            $(".bg").hide();
        });
	});
	/* 加载省份 */
	/* 加载各省份 */
	
	var province_html='';
	province_html+='<li class="wrod_manage_btn_pro_type_li" onclick="wrod_manage_btn_pro_type_li(this)">全部</li>';
	for(var i=0;i<LAreaData.length;i++){
		province_html+='<li class="wrod_manage_btn_pro_type_li" onclick="wrod_manage_btn_pro_type_li(this)">'+LAreaData[i].name+'</li>';
    }
	$(".wrod_manage_btn_pro_type_ul").html(province_html);

    $(".confirm_box_close,.confirm_li.cancel").click(function(){
        $(".confirm_box").hide();
        $(".bg").hide();
    });
})
function wrod_manage_btn_pro_type_li(e){
	var wrod_manage_type_value=$.trim($(e).text());
	$(".wrod_manage_btn_pro_type_value").text(wrod_manage_type_value);
	$(".wrod_manage_btn_pro_type_ul").toggle();
    $(".province").val(wrod_manage_type_value);
    $("#apply_manage_home").attr("action","${ctx}/admin/user/site/apply_manage.page").submit();
}
/* 删除 */
function remove(id){
    $(".confirm_box").show();
    $(".bg").show();
    $(".confirm_header").text("您确认删除该报名人员吗？");

    $(".confirm_li.confirm").off('click').on("click",function(){
        $.ajax({
            type: "POST",
            url: "${ctx}/admin/user/site/deleteApplicant.json",
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
    $("#expert_manage_home").attr("action","${ctx}/admin/user/site/apply_manage.page").submit();
}
</script>
<form action="" method="post" id="apply_manage_home">
	<input type="hidden" name="id" class="apply_id">
	<input type="hidden" name="pageNum" class="pageNum">
	<input type="hidden" name="province" class="province" value="${province}">
</form>

<div class="back_right_box">
	<h1 class="apply_manage_header">报名人员</h1>
	<div class="apply_manage_btn_box">
		
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
                    </c:if>
                </ul>
		<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_USER')">
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
		</sec:authorize>
	</div>
	<div class="apply_manage_content_box">
		<ul class="apply_manage_content_header_ul">
			<li class="apply_manage_content_header_li">序号</li>
			<li class="apply_manage_content_header_li">姓名</li>
			<li class="apply_manage_content_header_li">手机号</li>
			<li class="apply_manage_content_header_li">培训点名称</li>
			<li class="apply_manage_content_header_li">省份</li>
			<li class="apply_manage_content_header_li">详细地址</li>
			<li class="apply_manage_content_header_li">报名时间</li>
			<li class="apply_manage_content_header_li">成绩</li>
			<li class="apply_manage_content_header_li">备注</li>
			<li class="apply_manage_content_header_li">操作</li>
		</ul>
		<div class="apply_manage_content_ul_box">
			<c:forEach items="${enrolments}" var="enrolment" varStatus="status">
				<ul class="apply_manage_content_ul">
					<li class="apply_manage_content_li">${status.index+1}</li>
					<li class="apply_manage_content_li">${enrolment.name}</li>
					<li class="apply_manage_content_li">${enrolment.phone}</li>
					<li class="apply_manage_content_li">${enrolment.trainingSite.name}</li>
					<li class="apply_manage_content_li">${enrolment.trainingSite.province}</li>
					<li class="apply_manage_content_li">${enrolment.trainingSite.city}${enrolment.trainingSite.address}</li>
					<li class="apply_manage_content_li"><fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${enrolment.createTime}" /></li>
<%-- 					<li class="apply_manage_content_li">${enrolment.spare}</li> --%>
					<li class="apply_manage_content_li">
						<c:forEach items="${enrolment.userExamResults}" var="userExamResult">
							<p class="apply_manage_content_li_grade">
								${userExamResult.key}: 
								<c:forEach items="${userExamResult.value}" var="value">
								${value},
								</c:forEach>
							</p>
						</c:forEach>
					</li>
					<!--点击添加备注  -->
					<li class="apply_manage_content_li">
						<input type="text" class="apply_spare_txt" id="${enrolment.id}" name="${enrolment.name}" oldValue="${enrolment.spare}" placeholder="点击添加备注" value="${enrolment.spare}" maxlength="100">
					</li>
					<li class="apply_manage_content_li">
						<span class="apply_manage_content_li_btn3" onclick="remove('${enrolment.id}')">删除</span>
					</li>
				</ul>
			</c:forEach>
		</div>
	</div>
</div>

