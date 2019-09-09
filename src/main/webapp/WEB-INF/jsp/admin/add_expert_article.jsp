<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
<script type="text/javascript" src="${ctx}/js/ckeditor/ckeditor.js"></script>
<%-- <script type="text/javascript" src="${ctx}/js/ajaxfileupload.js"></script> --%>
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
    font-size: 16px;
    margin-left: 1%;
    margin: 12px 1%;
}
.expert_article_btn_back{
	display: inline-block;
    cursor: pointer;
}
.expert_article_btn_back_img{
    width: 15px;
    margin-right: 7px;
}
.expert_article_btn_back_txt{

}
.add_expert_article_content{
	background: #fff;
    width: 98%;
    margin-left: 1%;
    font-size: 20px;
    padding-bottom: 35px;
}
.add_expert_article_header_box{
    width: 60%;
    margin-left: 20%;
    padding-top: 60px;
}
.add_expert_article_header_name{
    display: inline-block;
    width: 10%;
    text-align: right;
}
.add_expert_article_header_name_value{
	float: right;
    width: 86%;
    border: 1px solid #ccc;
    font-size: 16px;
    height: 30px;
    border-radius: 4px;
    padding-left: 14px;
    cursor: pointer;
}
.add_expert_article_type_box{
    width: 60%;
    margin-left: 20%;
    padding-top: 29px;
    cursor: pointer;
}
.add_expert_article_type_name{
    display: inline-block;
    width: 10%;
    text-align: right;
    margin-right: 3%;
}
.add_expert_article_type_select{
	background: url(${ctx}/images/triangle.png) no-repeat 93% center; 
	    display: inline-block;
    position: relative;
    width: 14%;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 16px;
    height: 28px;
}
.add_expert_article_type_select_name{
	display: inline-block;
    width: 100%;
    padding-left: 10%;
    margin-top: 3px;
}
.add_expert_article_type_select_ul{
    position: absolute;
    width: 100%;
    text-align: center;
    border: 1px solid #ccc;
    top: 27px;
    background: #fff;
    z-index: 10;
    display: none;
}
.add_expert_article_type_select_li{
    border-bottom: 1px solid #ccc;
    height: 29px;
    line-height: 29px;
}
.add_expert_article_type_author{
    float: right;
    margin-right: 3%;
}
.add_expert_article_type_author_value{
    background: #ddd;
    border: 1px solid #ccc;
    width: 21%;
    text-align: center;
    font-size: 16px;
    padding: 3px 0;
    display: inline-block;
}
.add_expert_article_cover_box{
    width: 60%;
    margin-left: 20%;
    padding-top: 29px;
}
.add_expert_article_cover_name{
    display: inline-block;
    width: 10%;
    text-align: right;
    margin-right: 3%;
}
.add_pic{
    margin-bottom: -49px;
    cursor: pointer;
}
.add_expert_article_article_box{
    width: 60%;
    margin-left: 20%;
    padding-top: 40px;
}
.add_expert_article_article_name{
    display: inline-block;
    width: 10%;
    text-align: right;
    margin-right: 4%;
    float: left;
}
.add_expert_article_article_content{
    display: inline-block;
    width: 86%;
}
.add_expert_article_article_edite{
    width: 100%;
    height: 350px;
    margin-bottom: 22px;
    opacity:0;
    filter:alpha(opacity=0);
}
.add_expert_article_save{
    background: #139FD2;
    color: #fff;
    border: none;
    font-size: 16px;
    padding: 4px 10px;
    border-radius: 4px;
    cursor: pointer;
}
.add_expert_manage_cover_box{
    width: 60%;
    margin-left: 20%;
    padding-top: 29px;
}
.add_expert_manage_cover_name{
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
}

.ckeditor{
	width: 100%;
	height:100%
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
.add_pic{
    margin-bottom: -49px;
    cursor: pointer;
    width: 100px;
    height: 100px;
    position: absolute;
    left: 0;
    top: 0;
}
.expert_select{
    font-size: 16px;
}
</style>
<script type="text/javascript">
$(function(){
	/* $(".back_nav_li").eq(0).find(".back_article_header").addClass("index");
	$(".back_nav_li").eq(0).find(".back_article_ul").show();
	$(".back_nav_li").eq(0).find(".back_article_li").eq(2).addClass("index"); */
	
	
	$(".add_expert_article_type_select_name").click(function(){
		$(".add_expert_article_type_select_ul").toggle();
	});
	
	$(".expert_article_btn_back").click(function(){
		$("#expert_article_home").attr("action","${ctx}/admin/knowledge/expert/expert_article.page").submit();
	});
})
function add_expert_article_type_select_li(e){
	var expert_article_type_value=$.trim($(e).text());
	$(".add_expert_article_type_select_name").text(expert_article_type_value);
	$(".add_expert_article_type_select_ul").toggle();
}

</script>
<form action="" method="post" id="expert_article_home">
	<input type="hidden" value="${article.id}" name="id" class="article_id">
</form>
<div class="back_right_box">
	<h1 class="expert_article_header">专家文章</h1>
	<div class="expert_article_btn_box">
		<div class="expert_article_btn_back"><img alt="" src="${ctx}/images/icon_back.png" class="expert_article_btn_back_img"><span class="expert_article_btn_back_txt">返回></span></div><span>专家文章</span>
	</div>
	
	<div class="add_expert_article_content">
		<div class="add_expert_article_header_box">
			<span class="add_expert_article_header_name">文章标题</span>
			<input type="text" class="add_expert_article_header_name_value" maxlength="40" placeholder="请输入文章的标题" value="${article.title}">
		</div>
		<div class="add_expert_article_type_box">
			<span class="add_expert_article_type_name">作者</span>
			<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_KNOWLEDGE')">
				<select class="expert_select">
					<c:forEach items="${experts}" var="expert">
						<c:choose>
							<c:when test="${expert.id == article.expertId}">
								<option value="${expert.id}" selected>${expert.nickname}</option>
							</c:when>
							<c:otherwise>
								<option value="${expert.id}">${expert.nickname}</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_EXPERT')">
				<span class="add_expert_article_type_author_value" id="${user.id}">${user.name}</span>
			</sec:authorize>
			
		</div>
		<div class="add_expert_manage_cover_box">
			<span class="add_expert_manage_cover_name">封面</span>
			<div class="img_cover_box">
				<c:choose>
					<c:when test="${empty article.coverImg}">
						<img alt="" src="${ctx}/images/add_pic.png" class="add_pic" onclick="pull_out_crop(5,3,$('#img_cover_img'),$('#data_cover_img'))" id="img_cover_img">
					</c:when>
					<c:otherwise>
						<img alt="" src="${ctx}/${article.coverImg}" class="add_pic" id="img_cover_img">
					</c:otherwise>
				</c:choose>
				
<!-- 				<input type="file" id="cover_img" name="file" accept="image/*" onchange="ajaxFileUpload(this,1,$('#img_cover_img'),$('#data_cover_img'))"> -->
			</div>
			<!-- 这是编辑时候需要出现替换按钮 -->
			<c:if test="${not empty article.coverImg}">
				<span class="img_cover_change" onclick="pull_out_crop(5,3,$('#img_cover_img'),$('#data_cover_img'))">替换图片</span>
			</c:if>
			
			<input type="hidden" id="data_cover_img" value="${article.coverImg}">
			
		</div>
		
		<div class="add_expert_article_article_box">
			<span class="add_expert_article_article_name">内容</span>
			<div class="add_expert_article_article_content">
				<div class="add_expert_article_article_edite">
					<textarea id="TextArea1" class="ckeditor">${article.content}</textarea>
				</div>
				<input type="button" class="add_expert_article_save" value="提交保存">
			</div>
		</div>
</div>
<script type="text/javascript">

var maxlength =25000;

$(function(){
	
	var _editor=CKEDITOR.replace('TextArea1');
	$(".add_expert_article_article_edite").css("opacity",1);
	
	/* if($.trim($(".article_id").val())!=''){
		setContent(''+$(".article_content").val());
    }  */
	
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
	
	$(".add_expert_article_save").click(function(){
		/* 检查数据有效性 */
		var value=$.trim($(".add_expert_article_header_name_value").val());
		if(value==""){
			reminder_box("请输入文章的标题");
			return;
		}
		
		if(value.length<2){
			reminder_box("文章的标题至少大于两个字符");
			return;
		}
		
		if($("#data_cover_img").val()==""){
			reminder_box("请选择专家文章的封面");
			return;
		}
		
		value=$.trim(getContent()); 
		if(value==""){
			reminder_box("请输入专家文章的内容");
			return;
		}
		var author='';
		var expertId=0;
		if($(".add_expert_article_type_author_value").text()){
			expertId=$(".add_expert_article_type_author_value").attr("id");
			author=$.trim($(".add_expert_article_type_author_value").text());
		}else{
			expertId=$(".expert_select").val();
			author=$(".expert_select").find("option:selected").text();
		}
		// 文章类别
		var data;
		if($.trim($(".article_id").val())==""){
			data = {
					expertId:expertId,
		            author:author,
		            title: $(".add_expert_article_header_name_value").val(),
		            content: getContent(),
		            coverImg: $("#data_cover_img").val()
				}
		}else{
			data = {
					id:$.trim($(".article_id").val()),
					expertId:expertId,
		            author:author,
		            title: $(".add_expert_article_header_name_value").val(),
		            content: getContent(),
		            coverImg: $("#data_cover_img").val()
				}
		}
		$.ajax({
            type: "POST",
            url: "${ctx}/admin/knowledge/expert/saveExpertArticle.json",
            dataType: "json",
            data: data,
            success: function(msg) {
                if(msg.status==1){
                	if($.trim($(".article_id").val())==""){
                		reminder_box("保存成功！");
                	}else{
                		reminder_box("编辑成功！");
                	}
                	setTimeout(function(){
                		location.href="${ctx}/admin/knowledge/expert/expert_article.page";
                	},1500);
                }else{
                	reminder_box(msg.msg);
                }
            }
		});
		
		
	});
})
</script>

<%@ include file="img_crop.jsp"%>