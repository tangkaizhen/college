<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
<script src="${ctx}/js/LAreaData1.js" type="text/javascript"></script>
<script type="text/javascript" src="${ctx}/js/ajaxfileupload.js"></script>
<style>
.back_right_box{
    background: #fafafa;
        font-size: 16px;
}
.student_manage_header{
    width: 100%;
    border-bottom: 1px solid #ccc;
    font-size: 20px;
    padding: 6px 0 6px 23px;
    background: #fff;
}
.student_manage_btn_box{
	width: 100%;
    height: 63px;
}
.student_manage_btn_next{
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
.student_manage_btn_fore{
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
.student_manage_btn_type_box{
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
.student_manage_btn_type_value{
    display: inline-block;
    margin-top: 3px;
    width: 100%;
    text-align: left;
    padding-left: 8%;
}
.student_manage_btn_type_ul{
    position: absolute;
    width: 100%;
    border: 1px solid #ccc;
    top: 27px;
    background: #fff;
    z-index: 3;
    display: none;
}
.student_manage_btn_type_li{
    border-bottom: 1px solid #ccc;
    line-height: 30px;
}
.student_manage_btn_export,.student_manage_btn_register {
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
.student_manage_content_box{
    width: 98%;
    background: #fff;
    margin-left: 1%;
    border: 1px solid #ccc;
    border-radius: 4px;
}
.student_manage_content_box{

}
.student_manage_content_header_ul{
    overflow: hidden;
    font-size: 16px;
    font-weight: bold;
    border-bottom: 1px solid #ccc;
}
.student_manage_content_header_li{
	float: left;
    text-align: center;
    border-right: 1px solid;
    height: 50px;
    line-height: 50px;
}
.student_manage_content_header_li:first-child{
    width: 5%;
}
.student_manage_content_header_li:first-child+li{
    width:12%;
}
.student_manage_content_header_li:first-child+li+li{
    width: 9%;
}
.student_manage_content_header_li:first-child+li+li+li{
    width: 11%;
}
.student_manage_content_header_li:first-child+li+li+li+li{
    width: 23%;
}
.student_manage_content_header_li:first-child+li+li+li+li+li{
    
    width: 10%;
}
.student_manage_content_header_li:first-child+li+li+li+li+li+li{
    
    width: 16%;
}
.student_manage_content_header_li:first-child+li+li+li+li+li+li+li{
    
    width: 11%;
    border-right:none
}
.student_manage_content_ul_box{

}
.student_manage_content_ul{
	overflow: hidden;
    font-size: 16px;
    border-bottom: 1px solid #ccc;
}
.student_manage_content_li{
	float: left;
    text-align: center;
    border-right: 1px solid;
    height: 70px;
    line-height: 70px;
    white-space: nowrap;
    overflow-x: hidden;
    text-overflow: ellipsis;
}
.student_manage_content_li:first-child{
	width: 5%;
}
.student_manage_content_li:first-child+li{
	width:12%;
    overflow: hidden;
    text-overflow: ellipsis;
}
.student_manage_content_li:first-child+li+li{
	width: 9%;
    overflow: hidden;
    text-overflow: ellipsis;
}
.student_manage_content_li:first-child+li+li+li{
	width: 11%;
    overflow: hidden;
    text-overflow: ellipsis;
}
.student_manage_content_li:first-child+li+li+li+li{
	width:23%;
    overflow: hidden;
    text-overflow: ellipsis;
}
.student_manage_content_li:first-child+li+li+li+li+li{
    width: 10%;
    overflow: hidden;
    text-overflow: ellipsis;
}
.student_manage_content_li:first-child+li+li+li+li+li+li{
	
    width: 16%;
    overflow: hidden;
    text-overflow: ellipsis;
}
.student_manage_content_li:first-child+li+li+li+li+li+li+li{
	
    width: 11%;
	border-right:none;
    font-size: 13px;
}

.student_manage_content_li:first-child+li+li+li+li+li+li+li+li{
	
}
.student_manage_content_li_btn1{
	background: rgba(255, 156, 48, 1);
    color: #fff;
    padding: 3px 8px;
    border-radius: 2px;
    cursor:pointer
}
.student_manage_content_li_btn1.index{
    background: #ccc;
}
.student_manage_content_li_btn2{
    background: #139FD2;
    color: #fff;
    padding: 3px 8px;
    border-radius: 2px;
    margin: 0 12px;
    cursor:pointer
}
.student_manage_content_li_btn3{
    background: #139FD2;
    color: #fff;
    padding: 3px 10px;
    border-radius: 2px;
    margin: 0 12px;
    cursor:pointer
}
.student_manage_content_li_btn4{
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
.student_manage_btn_import_box{
	float: right;
	height: 29px;
	width: 88px;
	position: relative;
	margin-top: 17px;
	margin-right: 24px;
}
.student_manage_btn_import{
	height: 29px;
	width: 88px;
	cursor: pointer;
	text-align: center;
	line-height: 29px;
	border-radius: 4px;
	background: #FF9C30;
	color: #fff;
	display: inline-block;
}
#excel_file{
	height: 100%;
	width: 100%;
	z-index: 3;
	position: absolute;
	left: 0;
	opacity: 0;
	filter:alpha(opacity=0);
	top: 0;
}
.search_btn{
    float: right;
    border: 1px solid #ccc;
    height: 29px;
    margin-top: 17px;
    border-radius: 4px;
    cursor: pointer;
    font-size: 15px;
    padding-left: 8px;
}
.search_btn_img{
	float: right;
    margin-top: 18px;
    margin-right: 20px;
    margin-left: 4px;
    height: 27px;
        cursor: pointer;
}
</style>
<script type="text/javascript">


$(function(){
	$(".search_btn_img").click(function(){
		var keyword=$(".search_btn").val().trim();
    	$(".keyword").val(keyword);
    	$("#student_manage_home").attr("action","${ctx}/admin/user/site/student_manage.page").submit();
	});
	
	/* $(".back_nav_li").eq(5).find(".back_article_header").addClass("index");
	$(".back_nav_li").eq(5).find(".back_article_ul").show();
	$(".back_nav_li").eq(5).find(".back_article_li").eq(4).addClass("index"); */
	
	$(".wrod_manage_btn_pro_type_value").click(function(){
		$(".wrod_manage_btn_pro_type_ul").toggle();
	});
	
	/* 加载省份 */
	/* 加载各省份 */
	
	var province_html='';
	province_html+='<li class="wrod_manage_btn_pro_type_li" onclick="wrod_manage_btn_pro_type_li(this)">全部</li>';
	for(var i=0;i<LAreaData.length;i++){
		province_html+='<li class="wrod_manage_btn_pro_type_li" onclick="wrod_manage_btn_pro_type_li(this)">'+LAreaData[i].name+'</li>';
    }
	$(".wrod_manage_btn_pro_type_ul").html(province_html);
	
	$(".student_manage_btn_register").click(function(){
		$("#student_manage_home").attr("action","${ctx}/admin/user/site/add_student_manage.page").submit();
	});

    $(".student_manage_btn_export").click(function(){
        $("#student_manage_home").attr("action","${ctx}/admin/user/site/exportTrainees").submit();
    });

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
    $("#student_manage_home").attr("action","${ctx}/admin/user/site/student_manage.page").submit();
}
/* 编辑 */
function edit(id){
    $(".trainee_id").val(id);
    $("#student_manage_home").attr("action","${ctx}/admin/user/site/add_student_manage.page").submit();
}
/* 删除 */
function remove(id){
    $(".confirm_box").show();
    $(".bg").show();
    $(".confirm_header").text("您确认删除该学员吗？");

    $(".confirm_li.confirm").off('click').on("click",function(){
        $.ajax({
            type: "POST",
            url: "${ctx}/admin/user/site/deleteTrainee.json",
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
    $("#student_manage_home").attr("action","${ctx}/admin/user/site/student_manage.page").submit();
}
function ajaxImportExcel(e) {
    $.ajaxFileUpload({
        url: '${ctx}/admin/user/site/importTrainees.json', //服务器端请求地址
        secureuri: false, //是否需要安全协议，一般设置为false
        fileElementId: $(e).attr("id"), //文件上传域的ID
        dataType: 'json', //返回值类型 一般设置为json
        enctype: 'multipart/form-data',//注意一定要有该参数
        success: function (result, status)  //服务器成功响应处理函数
        {
            reminder_box(result.msg);
            if (result.status==1) {
                setTimeout(function(){
                    $("#student_manage_home").attr("action","${ctx}/admin/user/site/student_manage.page").submit();
                },1500);
            }
        },
        error: function (data, status, e)//服务器响应失败处理函数
        {
            reminder_box(e);
        }
    })
}
</script>
<form action="" method="post" id="student_manage_home">
	<input type="hidden" name="id" class="trainee_id">
	<input type="hidden" name="pageNum" class="pageNum">
	<input type="hidden" name="keyword" class="keyword" value="${keyword}">
	<input type="hidden" name="province" class="province" value="${province}">
</form>

<div class="back_right_box">
	<h1 class="student_manage_header">学员</h1>
	<div class="student_manage_btn_box">
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
         <!-- 新增搜索的功能 -->
         <img alt="" src="${ctx}/images/button_xueyuan_search.png" class="search_btn_img">
         <input type="text" class="search_btn" value="${keyword}" placeholder="请输入姓名或合格证编号搜索">
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
		<span class="student_manage_btn_export">批量导出</span>
		<div class="student_manage_btn_import_box">
			<span class="student_manage_btn_import">批量导入</span>
			<input type="file" id="excel_file" name="file" accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel"
				   onchange="ajaxImportExcel(this)">
		</div>
		<span class="student_manage_btn_register">学员登记</span>
	</div>
	<div class="student_manage_content_box">
		<ul class="student_manage_content_header_ul">
			<li class="student_manage_content_header_li">序号</li>
			<li class="student_manage_content_header_li">姓名</li>
			<li class="student_manage_content_header_li">性别</li>
			<li class="student_manage_content_header_li">省份</li>
			<li class="student_manage_content_header_li">详细地址</li>
			<li class="student_manage_content_header_li">签发时间</li>
			<li class="student_manage_content_header_li">合格证编号</li>
			<li class="student_manage_content_header_li">操作</li>
		</ul>
		<div class="student_manage_content_ul_box">
			<c:forEach items="${trainees}" var="trainee" varStatus="status">
				<ul class="student_manage_content_ul">
					<li class="student_manage_content_li">${status.index+1}</li>
					<li class="student_manage_content_li">${trainee.name}</li>
					<li class="student_manage_content_li">${trainee.gender}</li>
					<li class="student_manage_content_li">${trainee.province}</li>
					<li class="student_manage_content_li">${trainee.city}${trainee.address}</li>
					<li class="student_manage_content_li"><fmt:formatDate type="date" value="${trainee.issueDate}" /></li>
					<li class="student_manage_content_li">${trainee.certicateNo}</li>
					<li class="student_manage_content_li">
						<span class="student_manage_content_li_btn2" onclick="edit('${trainee.id}')">编辑</span>
						<span class="student_manage_content_li_btn3"onclick="remove('${trainee.id}')">删除</span>
					</li>
				</ul>
			</c:forEach>
		</div>
	</div>
</div>

