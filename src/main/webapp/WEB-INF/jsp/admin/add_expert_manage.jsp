<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
<script type="text/javascript" src="${ctx}/js/jquery.md5.js"></script>
<script type="text/javascript" src="${ctx}/js/ckeditor/ckeditor.js"></script> 
<%-- <script type="text/javascript" src="${ctx}/js/ajaxfileupload.js"></script> --%>
<style>
.ckeditor{
	width: 100%;
	height:100%
}
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
    font-size: 16px;
    margin-left: 1%;
    margin: 12px 1%;
}
.expert_manage_btn_back{
	display: inline-block;
    cursor: pointer;
}
.expert_manage_btn_back_img{
    width: 15px;
    margin-right: 7px;
}
.expert_manage_btn_back_txt{

}
.add_expert_manage_content{
	    background: #fff;
    width: 98%;
    margin-left: 1%;
    font-size: 20px;
    padding: 100px 10%;
}
.add_expert_manage_save{
    background: #139FD2;
    color: #fff;
    border: none;
    font-size: 16px;
    padding: 4px 10px;
    border-radius: 4px;
    cursor: pointer;
    margin-left: 48%;
}
.expert_account_pass{
    margin-bottom: 30px;
}
.expert_account_name{
    display: inline-block;
    width: 8%;
    text-align: right;
    margin-right: 12px;
}
.expert_account_value{
    width: 35%;
    border: 1px solid #ccc;
    font-size: 16px;
    height: 30px;
    border-radius: 4px;
    padding-left: 14px;
    cursor: pointer;
    
}
.expert_pass_value{
    float: right;
    width: 35%;
    border: 1px solid #ccc;
    font-size: 16px;
    height: 30px;
    border-radius: 4px;
    padding-left: 14px;
    cursor: pointer;
    margin-right: 6.5%;
}
.expert_pass_name{
    float: right;
    margin-right: 12px;
}
.expert_name_tag{
    margin-bottom: 30px;
}
.expert_name{
    display: inline-block;
    width: 8%;
    text-align: right;
    margin-right: 12px;
}
.expert_name_value{
    width: 35%;
    border: 1px solid #ccc;
    font-size: 16px;
    height: 30px;
    border-radius: 4px;
    padding-left: 14px;
    cursor: pointer;
}
.expert_tag_value{
    float: right;
    width: 35%;
    border: 1px solid #ccc;
    font-size: 16px;
    height: 30px;
    border-radius: 4px;
    padding-left: 14px;
    cursor: pointer;
    margin-right: 6.5%;
}
.expert_tag_name{
    float: right;
    margin-right: 12px;
}
.expert_introduction_box{
    margin-bottom: 30px;
}
.expert_introduction{
    display: inline-block;
    width: 8%;
    text-align: right;
    margin-right: 12px;
}
.expert_introduction_value{
	width: 84%;
    border: 1px solid #ccc;
    font-size: 16px;
    height: 30px;
    border-radius: 4px;
    padding-left: 14px;
    cursor: pointer;
}
.expert_details_box{
    margin-bottom: 30px;
    overflow: hidden;
}
.expert_details{
    display: inline-block;
    width: 8%;
    text-align: right;
    margin-right: 17px;
    float: left;
}
.expert_details_value{
    height: 81px;
}
.expert_photo_box{
    margin-bottom: 30px;
}
.expert_photo{
    display: inline-block;
    width: 8%;
    text-align: right;
    margin-right: 18px;
    float: left;
}
.expert_photo_innerbox{
    display: inline-block;
}
.expert_img_box1{
    display: inline-block;
    cursor: pointer;
    margin-right: 167px;
        width: 120px;
    height: 120px;
        position: relative;
}
.expert_img_box2{
    display: inline-block;
    cursor: pointer;
        width: 120px;
    height: 120px;
        position: relative;
}
.expert_manage_btn_back_img1{
    width: 120px;
    height: 120px;
}
.expert_manage_btn_back_img2{
    width: 120px;
    height: 120px;
}
#head_img,#banner_img{
    height: 100%;
    width: 100%;
    z-index: 3;
    position: absolute;
    left: 0;
    opacity: 0;
    filter: alpha(opacity=0);
    top: 0;
}
.add_course_manage_article_edite{
	float:left;
	width: 84%;
	opacity:0;
    filter:alpha(opacity=0);
    height: 315px;
}
</style>
<script type="text/javascript">
var maxlength =5000;
$(function(){
	var _editor=CKEDITOR.replace('TextArea1');
	$(".add_course_manage_article_edite").css("opacity",1);
	/* if($.trim($(".article_id").val())!=''){
		setContent('${article.content}');
	} */
	
	_editor.on('key',function(event){
	     var oldhtml = _editor.document.getBody().getHtml();
	     var description = oldhtml.replace(/<.*?>/ig,"");
	     var etop = $("#cke_1_top");
	     var _slen = maxlength-description.length;
	     var canwrite = $("<label id='canwrite'>还可以输入200字</label>");
	     if(etop.find("#canwrite").length<1){
	         canwrite.css({border:'1px #f1f1f1 solid','line-height':'28px',color:'#999'});
	         /* etop.prepend(canwrite); */
	     }
	     var _label = etop.find("#canwrite");
	     
	     /* if(description.length>maxlength){
	         alert("最多可以输入"+maxlength+"个文字，您已达到最大字数限制");
	         _editor.setData(oldhtml);
	         _label.html("还可以输入0字");
	     }else{
	         _label.html("还可以输入"+_slen+"字");
	     } */
	 });
	
	/* $(".back_nav_li").eq(5).find(".back_article_header").addClass("index");
	$(".back_nav_li").eq(5).find(".back_article_ul").show();
	$(".back_nav_li").eq(5).find(".back_article_li").eq(1).addClass("index"); */
	
	$(".expert_manage_btn_back").click(function(){
		$("#expert_manage_home").attr("action","${ctx}/admin/user/expert_manage.page").submit();
	});
	
	$(".add_expert_manage_save").click(function(){
		var value=$.trim($(".expert_account_value").val());
		if(value==""){
			reminder_box("请输入专家的账号");
			return;
		}
		if ('${expert.id}' == '') {
            value=$.trim($(".expert_pass_value").val());
            if(value==""){
                reminder_box("请输入专家的密码");
                return;
            }
            if(value.length>12){
                reminder_box("专家的密码不能大于12位");
                return;
            }
            if(value.length<6){
                reminder_box("专家的密码不能小于6位");
                return;
            }
		}
		value=$.trim($(".expert_name_value").val());
		if(value==""){
			reminder_box("请输入专家的姓名");
			return;
		}
		value=$.trim($(".expert_tag_value").val());
		if(value==""){
			reminder_box("请输入专家的姓名标签");
			return;
		}
		value=$.trim($(".expert_introduction_value").val());
		if(value==""){
			reminder_box("请输入专家的一句话简介");
			return;
		}
		value=$.trim(getContent());
		if(value==""){
			reminder_box("请输入专家的详细介绍");
			return;
		}
        var data;
        if ('${expert.id}' == '') {
            data = {
                name: $.trim($(".expert_account_value").val()),
                nickname: $.trim($(".expert_name_value").val()),
                password: $.md5($.trim($(".expert_pass_value").val())),
                headImg:$("#data_head_img").val(),
                bannerImg:$("#data_banner_img").val(),
				label:$.trim($(".expert_tag_value").val()),
                resume:$.trim($(".expert_introduction_value").val()),
                details:$.trim(getContent())
			};
		} else {
            data = {
                id:'${expert.id}',
                name: $.trim($(".expert_account_value").val()),
                nickname: $.trim($(".expert_name_value").val()),
                headImg:$("#data_head_img").val(),
                bannerImg:$("#data_banner_img").val(),
                label:$.trim($(".expert_tag_value").val()),
                resume:$.trim($(".expert_introduction_value").val()),
                details:$.trim(getContent())
            };
        }
        $.ajax({
            type: "POST",
            url: "${ctx}/admin/user/saveExpert.json",
            dataType: "json",
            data: data,
            success: function(msg) {
                if(msg.status==1){
                    reminder_box("保存成功");
                    setTimeout(function(){
                        location.href="${ctx}/admin/user/expert_manage.page";
                    },1500);
                }else{
                    reminder_box(msg.msg);
                }
            }
        });
	});
})


</script>
<form action="" method="post" id="expert_manage_home">
	
</form>
<div class="back_right_box">
	<h1 class="expert_manage_header">专家管理</h1>
	<div class="expert_manage_btn_box">
		<div class="expert_manage_btn_back"><img alt="" src="${ctx}/images/icon_back.png" class="expert_manage_btn_back_img"><span class="expert_manage_btn_back_txt">返回></span></div><span>添加专家</span>
	</div>
	<div class="add_expert_manage_content">
		<div class="expert_account_pass">
			<span class="expert_account_name">账号</span>
			<c:choose>
				<c:when test="${empty expert}">
					<input type="text" class="expert_account_value" maxlength="25" placeholder="请输入专家的账号">
				</c:when>
				<c:otherwise>
					<input type="text" class="expert_account_value" readonly value="${expert.name}" placeholder="请输入专家的账号">
				</c:otherwise>
			</c:choose>


			<c:choose>
				<c:when test="${empty expert}">
					<input type="number" class="expert_pass_value" maxlength="6" placeholder="请输入专家的密码(仅限数字)">
					<span class="expert_pass_name">密码</span>
				</c:when>
				<c:otherwise>
					<input type="hidden" class="expert_pass_value" value="${expert.password}">
				</c:otherwise>
			</c:choose>

		</div>
		<div class="expert_name_tag">
			<span class="expert_name">专家姓名</span>
			<c:choose>
				<c:when test="${empty expert}">
					<input type="text" maxlength="4" class="expert_name_value" placeholder="请输入专家的姓名">
				</c:when>
				<c:otherwise>
					<input type="text" class="expert_name_value" readonly value="${expert.nickname}" placeholder="请输入专家的姓名">
				</c:otherwise>
			</c:choose>

			<input type="text" class="expert_tag_value" maxlength="10" value="${expert.label}" placeholder="请输入专家的姓名标签">
			<span class="expert_tag_name">姓名标签</span>
		</div>
		<div class="expert_introduction_box">
			<span class="expert_introduction">一句话简介</span>
			<input type="text" maxlength="20" class="expert_introduction_value" value="${expert.resume}" placeholder="请输入专家的一句话简介">
		</div>
		<div class="expert_details_box">
			<span class="expert_details">详细介绍</span>
			<div class="add_course_manage_article_edite">
				<c:choose>
					<c:when test="${empty expert.details}">
						<textarea maxlength="10000" id="TextArea1" class="ckeditor expert_details_value"></textarea>
					</c:when>
					<c:otherwise>
						<textarea maxlength="10000" id="TextArea1" class="ckeditor expert_details_value">${expert.details}</textarea>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="expert_photo_box">
			<span class="expert_photo">专家照片</span>
			
			<div class="expert_photo_innerbox">
				<div class="expert_img_box1">
					<c:choose>
						<c:when test="${empty expert.headImg}">
							<img alt="" src="${ctx}/images/add_pic.png" onclick="pull_out_crop(10,13,$('#img_head_img'),$('#data_head_img'))" class="expert_manage_btn_back_img1" id="img_head_img">
						</c:when>
						<c:otherwise>
							<img alt="" src="${ctx}/${expert.headImg}" class="expert_manage_btn_back_img1" id="img_head_img">
						</c:otherwise>
					</c:choose>
					<!-- <input type="file" id="head_img" name="file" accept="image/*" onchange="ajaxFileUpload(this,3,$('#img_head_img'),$('#data_head_img'))"> -->
				</div>
				<!-- 这是编辑时候需要出现替换按钮 -->
				<c:if test="${not empty expert.headImg}">
					<span class="img_cover_change" onclick="pull_out_crop(10,13,$('#img_head_img'),$('#data_head_img'))">替换头像</span>
				</c:if>
				
				<div class="expert_img_box2">
					<c:choose>
						<c:when test="${empty expert.bannerImg}">
							<img alt="" src="${ctx}/images/add_pic.png" onclick="pull_out_crop(2,1,$('#img_banner_img'),$('#data_banner_img'))" class="expert_manage_btn_back_img2" id="img_banner_img">
						</c:when>
						<c:otherwise>
							<img alt="" src="${ctx}/${expert.bannerImg}" class="expert_manage_btn_back_img2" id="img_banner_img">
						</c:otherwise>
					</c:choose>
				<!-- <input type="file" id="banner_img" name="file" accept="image/*" onchange="ajaxFileUpload(this,3,$('#img_banner_img'),$('#data_banner_img'))"> -->
				</div>
				
				<!-- 这是编辑时候需要出现替换按钮 -->
				<c:if test="${not empty expert.bannerImg}">
					<span class="img_cover_change" onclick="pull_out_crop(2,1,$('#img_banner_img'),$('#data_banner_img'))">替换专家横幅</span>
				</c:if>
				
			</div>
			<input type="hidden" id="data_head_img" value="${expert.headImg}">
			<input type="hidden" id="data_banner_img" value="${expert.bannerImg}">
		</div>
		
		<input type="button" class="add_expert_manage_save" value="提交保存">
	</div>	
</div>

<%@ include file="img_crop.jsp"%>