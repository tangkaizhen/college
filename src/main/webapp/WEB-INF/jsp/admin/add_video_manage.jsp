<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
<script type="text/javascript" src="${ctx}/js/ckeditor/ckeditor.js"></script>

<script type="text/javascript" src="${ctx}/js/ajaxfileupload.js"></script> 

<style>
.back_right_box{
    background: #fafafa;
        font-size: 16px;
}
.video_mange_header{
    width: 100%;
    border-bottom: 1px solid #ccc;
    font-size: 20px;
    padding: 6px 0 6px 23px;
    background: #fff;
}
.video_mange_btn_box{
    font-size: 16px;
    margin-left: 1%;
    margin: 12px 1%;
}
.video_mange_btn_back{
	display: inline-block;
    cursor: pointer;
}
.video_mange_btn_back_img{
    width: 15px;
    margin-right: 7px;
}
.video_mange_btn_back_txt{

}
.add_video_mange_content{
	background: #fff;
    width: 98%;
    margin-left: 1%;
    font-size: 20px;
    padding-bottom: 35px;
}
.add_video_mange_header_box{
    width: 60%;
    margin-left: 20%;
    padding-top: 60px;
}
.add_video_mange_header_name{
    display: inline-block;
    width: 10%;
    text-align: right;
}
.add_video_mange_header_name_value{
	float: right;
    width: 86%;
    border: 1px solid #ccc;
    font-size: 16px;
    height: 30px;
    border-radius: 4px;
    padding-left: 14px;
    cursor: pointer;
}
.add_video_mange_type_box{
    width: 60%;
    margin-left: 20%;
    padding-top: 29px;
    cursor: pointer;
}
.add_video_mange_type_name{
    display: inline-block;
    width: 10%;
    text-align: right;
    margin-right: 3%;
}
.add_video_mange_type_select{
	background: url(${ctx}/images/triangle.png) no-repeat 93% center; 
	    display: inline-block;
    position: relative;
    width: 19%;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 16px;
    height: 28px;
}
.add_video_mange_type_select_name{
	display: inline-block;
    width: 100%;
    padding-left: 10%;
    margin-top: 3px;
}
.add_video_mange_type_select_ul{
    position: absolute;
    width: 100%;
    text-align: center;
    border: 1px solid #ccc;
    top: 27px;
    background: #fff;
    z-index: 10;
    display: none;
}
.add_video_mange_type_select_li{
    border-bottom: 1px solid #ccc;
    height: 29px;
    line-height: 29px;
}
.add_video_mange_type_author{
    float: right;
    margin-right: 3%;
}
.add_video_mange_type_author_value{
    float: right;
    background: #ddd;
    border: 1px solid #ccc;
    width: 21%;
    text-align: center;
    font-size: 16px;
    padding: 3px 0;
}
.add_video_mange_cover_box{
    width: 60%;
    margin-left: 20%;
    padding-top: 29px;
}
.add_video_mange_cover_name{
    display: inline-block;
    width: 10%;
    text-align: right;
    margin-right: 3%;
    position: relative;
    top: -44px;
}
.add_pic{
    margin-bottom: -49px;
    cursor: pointer;
    width: 100px;
    height: 100px;
    position: absolute;
    left: 0;
    top: 0;
}
.add_video_mange_article_box{
    width: 60%;
    margin-left: 20%;
    padding-top: 40px;
}
.add_video_mange_article_name{
    display: inline-block;
    width: 10%;
    text-align: right;
    margin-right: 4%;
    float: left;
}
.add_video_mange_article_content{
    display: inline-block;
    width: 86%;
}
.add_video_mange_article_edite{
    width: 100%;
    height: 350px;
    margin-bottom: 22px;
     opacity:0;
    filter:alpha(opacity=0);
}
.add_video_mange_save{
    background: #139FD2;
    color: #fff;
    border: none;
    font-size: 16px;
    padding: 4px 10px;
    border-radius: 4px;
    cursor: pointer;
    margin-top: 52px;
}
.video_url{
    width: 86%;
    border: 1px solid #ccc;
    font-size: 16px;
    height: 30px;
    border-radius: 4px;
    padding-left: 14px;
    cursor: pointer;
    display: block;
    margin-bottom: 47px;
}
.img_cover_box{
	display: inline-block;
    width: 100px;
    height: 100px;
    position: relative;
}
#cover_img{
    height: 100%;
    width: 100%;
    z-index: 3;
    position: absolute;
    left: 0;
    opacity: 0;
    filter:alpha(opacity=0);
}

/* 新增视频内容 */
.add_video_content_box{
    display: inline-block;
    position: relative;
    width: 16%;
    text-align: center;
    font-size: 13px;
    border: 1px solid #ccc;
    height: 25px;
    font-weight: bold;
    line-height: 25px;
    border-radius: 7px;
    color: #000;
    margin-top: 3px;
    cursor: pointer;
}
.add_video_content_header{
    position: absolute;
    left: 0;
    top: 0;
    width: 100%;
}
#video_content{
    width: 100%;
    position: absolute;
    left: 0;
    right: 0;
    height: 100%;
    opacity: 0;
    filter:alpha(opacity=0);
}
.add_video_txt{
    font-size: 12px;
    color: #ccc;
    margin-left: 7px;
    position: relative;
    top: -7px;
}
.video_name{
    height: 20px;
    font-size: 15px;
    margin-top: 11px;
}
</style>
<form action="${ctx}/admin/knowledge/video_manage.page" id="video_mange_home">
	<input type="hidden" value="${video.id}" class="video_id">
	<input type="hidden" value="${video.videoUrl}" class="video_url">
</form>
<div class="back_right_box">
	<h1 class="video_mange_header">视频管理</h1>
	<div class="video_mange_btn_box">
		<div class="video_mange_btn_back"><img alt="" src="${ctx}/images/icon_back.png" class="video_mange_btn_back_img">
		<span class="video_mange_btn_back_txt">返回></span></div>
		<c:choose>
			<c:when test="${empty video.id}">
				<span>添加视频</span>
			</c:when>
			<c:otherwise>
				<span>编辑视频</span>
			</c:otherwise>
		</c:choose>
	</div>
	
	<div class="add_video_mange_content">
		<div class="add_video_mange_header_box">
			<span class="add_video_mange_header_name">视频名称</span>
			<input type="text" maxlength="20" class="add_video_mange_header_name_value" value="${video.name}" placeholder="请输入视频的名称">
		</div>
		<div class="add_video_mange_type_box">
			<span class="add_video_mange_type_name">视频类型</span>
			<div class="add_video_mange_type_select">
				<c:choose>
					<c:when test="${empty video}">
						<span class="add_video_mange_type_select_name">请选择视频类型</span>
					</c:when>
					<c:otherwise>
						<span class="add_video_mange_type_select_name" id="${video.uavTypeId}">${video.uavType}</span>
					</c:otherwise>
				</c:choose>
				<ul class="add_video_mange_type_select_ul">
					<c:forEach items="${uavTypes}" var="uavType">
						<li class="add_video_mange_type_select_li" onclick="add_video_mange_type_select_li(this,'${uavType.id}')">${uavType.name}</li>
					</c:forEach>	
				</ul>
			</div>
			
			<!-- 下面这个自动带入的 -->
			<span class="add_video_mange_type_author_value">超级管理员</span>
			<span class="add_video_mange_type_author">发布者</span>
		</div>

		<div class="add_video_mange_cover_box">
			<span class="add_video_mange_cover_name">视频封面</span>
			
			<div class="img_cover_box">
				<c:choose>
					<c:when test="${empty video.image}">
						<img alt="" src="${ctx}/images/add_pic.png" onclick="pull_out_crop(9,5,$('#img_cover_img'),$('#data_cover_img'))" class="add_pic" id="img_cover_img">
					</c:when>
					<c:otherwise>
						<img alt="" src="${ctx}/${video.image}" class="add_pic" id="img_cover_img">
					</c:otherwise>
				</c:choose>
				<!-- <input type="file" id="cover_img" name="file" accept="image/*" onchange="ajaxFileUpload(this,2,$('#img_cover_img'),$('#data_cover_img'))"> -->
			</div>
			<!-- 这是编辑时候需要出现替换按钮 -->
			<c:if test="${not empty video.image}">
				<span class="img_cover_change" onclick="pull_out_crop(9,5,$('#img_cover_img'),$('#data_cover_img'))">替换图片</span>
			</c:if>
			
			<input type="hidden" id="data_cover_img" value="${video.image}">
		</div>
		
		<div class="add_video_mange_article_box">
			<span class="add_video_mange_article_name">视频内容</span>
			<div class="add_video_mange_article_content">
			
				<div class="add_video_content_box">
					<h1 class="add_video_content_header">上传视频+</h1>
					<input type="file" onchange="changeName(this,event)" id="video_content" name="video_file" accept="video/*">
					
					<input type="hidden" class="video_size">
				</div>
				<span class="add_video_txt">视频大小不能超过250M，支持的视频格式有：MP4,3gp,WebM,Ogg</span>
				<p class="video_name">${video.videoUrl}</p>
			</div>
		</div>
		
		<div class="add_video_mange_article_box">
			<span class="add_video_mange_article_name">视频简介</span>
			<div class="add_video_mange_article_content">
				<div class="add_video_mange_article_edite">
					<c:choose>
						<c:when test="${empty video.introduction}">
							<textarea id="TextArea1" class="ckeditor"></textarea>
						</c:when>
						<c:otherwise>
							<textarea id="TextArea1" class="ckeditor">${video.introduction}</textarea>
						</c:otherwise>
					</c:choose>
					
				</div>
				<input type="button" class="add_video_mange_save" value="提交保存">
			</div>
		</div>
		
		
	</div>
</div>

<script type="text/javascript">
var maxlength =30000;
$(function(){
	var _editor=CKEDITOR.replace('TextArea1');
	
	$(".add_video_mange_article_edite").css("opacity",1);
	_editor.on('key',function(event){
	     var oldhtml = _editor.document.getBody().getHtml();
	     var description = oldhtml.replace(/<.*?>/ig,"");
	     var etop = $("#cke_1_top");
	     var _slen = maxlength-description.length;
	     
	     var canwrite = $("<label id='canwrite'>还可以输入200字</label>");
	     
	     if(etop.find("#canwrite").length<1){
	         canwrite.css({border:'1px #f1f1f1 solid','line-height':'28px',color:'#999'});
	         etop.prepend(canwrite);
	     }
	     
	     var _label = etop.find("#canwrite");
	     
	     if(description.length>maxlength){
	         //alert("最多可以输入"+maxlength+"个文字，您已达到最大字数限制");
	         
	         _editor.setData(oldhtml);
	         _label.html("还可以输入0字");
	         
	     }else{
	    	 
	         _label.html("还可以输入"+_slen+"字");
	     }
	 });
	/* $(".back_nav_li").eq(0).find(".back_article_header").addClass("index");
	$(".back_nav_li").eq(0).find(".back_article_ul").show();
	$(".back_nav_li").eq(0).find(".back_article_li").eq(1).addClass("index"); */
	
	$(".add_video_mange_type_select_name").click(function(){
		$(".add_video_mange_type_select_ul").toggle();
	});
	
	$(".video_mange_btn_back").click(function(){
		$("#video_mange_home").attr("action","${ctx}/admin/knowledge/video_manage.page").submit();
	});
	
	$(".add_video_mange_save").click(function(){
		var value=$.trim($(".add_video_mange_header_name_value").val());
		if(value==""){
			reminder_box("请输入视频的名称");
			return;
		}
		if(value.length<2){
			reminder_box("视频的题目至少大于两个字符");
			return;
		}
		
		value=$.trim($(".add_video_mange_type_select_name").text());
		if(value=="请选择视频类型"){
			reminder_box("请选择视频类型");
			return;
		}
		if($("#data_cover_img").val()==""){
			reminder_box("请选择视频的封面");
			return;
		}
        var fileId = "video_content";
        
        var dom = document.getElementById(fileId);
        if (dom.files[0]) {
            var fileSize =  dom.files[0].size;
            var video_m=fileSize/1024;
            video_m=video_m/1024;
            if(video_m>250){
                reminder_box("上传视频大小最大为250M");
                return;
            }
		} else {
			if('${video.videoUrl}') {
			} else {
				reminder_box("请选择上传视频");
				return;
			}
            
            
		}

        var video_desc=$.trim(getContent()); 
		if(video_desc==""){
			reminder_box("请输入视频的简介");
			return;
		}
		
		// 视频类别
		var categoryId =$(".add_video_mange_type_select_name").attr("id");
		var data;
		
		if($.trim($(".video_id").val())==""){
			
			data = {
					uavTypeId: categoryId,
		            name: $(".add_video_mange_header_name_value").val(),
		            image: $("#data_cover_img").val(),
		            introduction:getContent()
				}
		}else{
			data = {
					id:$.trim($(".video_id").val()),
					uavTypeId: categoryId,
		            name: $(".add_video_mange_header_name_value").val(),
		            videoUrl:$.trim($(".video_url").val()),
		            image: $("#data_cover_img").val(),
		            introduction:getContent()
				}
		}

		console.log(data);
        $.ajaxFileUpload({
            url: '${ctx}/admin/knowledge/saveVideo.json', //服务器端请求地址
			type:'',
            data: data,
            secureuri: false, //是否需要安全协议，一般设置为false
            fileElementId: 'video_content', //文件上传域的ID
            dataType: 'json', //返回值类型 一般设置为json
            enctype: 'multipart/form-data',//注意一定要有该参数
            success: function (result, status)  //服务器成功响应处理函数
            {
                if($.trim($(".video_id").val())==""){
                    reminder_box("保存成功！");
                }else{
                    reminder_box("编辑成功！");
                }

                setTimeout(function(){
                    location.href="${ctx}/admin/knowledge/video_manage.page";
                },1500);
            },
            error: function (data, status, e)//服务器响应失败处理函数
            {
                reminder_box(e);
            }
        })
	});
})
function add_video_mange_type_select_li(e,id){
	var video_mange_type_value=$.trim($(e).text());
	$(".add_video_mange_type_select_name").text(video_mange_type_value).attr("id",id);
	$(".add_video_mange_type_select_ul").toggle();
}
function changeName(e,event){
	var fileId = "video_content";
	var dom = document.getElementById(fileId);  
	var fileSize =  dom.files[0].size;
	var video_m=fileSize/1024;
	video_m=video_m/1024;
	if(video_m>250){
		dom.value='';
		reminder_box("上传视频大小最大为250M");
		return;
	}
	$(".video_name").html(event.currentTarget.files[0].name);
}
</script>

<%@ include file="img_crop.jsp"%>