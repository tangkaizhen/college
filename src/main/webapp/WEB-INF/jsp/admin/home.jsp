<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
<style>
.back_right_box{
    background: #fafafa;
        font-size: 16px;
}
.baike_header{
    width: 100%;
    border-bottom: 1px solid #ccc;
    font-size: 20px;
    padding: 6px 0 6px 23px;
    background: #fff;
}
.baike_btn_box{
	width: 100%;
    height: 63px; 
}
.baike_btn_next{
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
.baike_btn_fore{
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
.baike_btn_type_box{
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
.baike_btn_type_value{
    display: inline-block;
    margin-top: 3px;
    width: 100%;
    text-align: left;
    padding-left: 8%;
}

.baike_btn_type_ul{
    position: absolute;
    width: 100%;
    border: 1px solid #ccc;
    top: 27px;
    background: #fff;
    z-index: 3;
    display: none;
}
.baike_btn_type_li{
    border-bottom: 1px solid #ccc;
    line-height: 30px;
}
.baike_btn_add{
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
.baike_content_box{
    width: 98%;
    background: #fff;
    margin-left: 1%;
    border: 1px solid #ccc;
    border-radius: 4px;
}
.baike_content_box{

}
.baike_content_header_ul{
    overflow: hidden;
    font-size: 16px;
    font-weight: bold;
    border-bottom: 1px solid #ccc;
}
.baike_content_header_li{
	float: left;
    text-align: center;
    border-right: 1px solid;
    height: 50px;
    line-height: 50px;
}
.baike_content_header_li:first-child{
    width: 7%;
}
.baike_content_header_li:first-child+li{
    width: 25%;
}
.baike_content_header_li:first-child+li+li{
    width: 18%;
}
.baike_content_header_li:first-child+li+li+li{
    width: 13%;
}
.baike_content_header_li:first-child+li+li+li+li{
    width: 16%;
}
.baike_content_header_li:first-child+li+li+li+li+li{
    width: 21%;
    border-right:none
}
.baike_content_ul_box{

}
.baike_content_ul{
	height: 70px;
    font-size: 16px;
    border-bottom: 1px solid #ccc;
}
.baike_content_li{
	float: left;
    text-align: center;
    border-right: 1px solid;
    height: 70px;
    padding-top: 20px;
    white-space: nowrap;
    text-overflow: ellipsis;
}
.baike_content_li:first-child{
	width: 7%;
}
.baike_content_li:first-child+li{
	width: 25%;
    white-space: normal;
    text-align: left;
    padding-left: 9px;
    padding-top: 17px;
}
.baike_content_li:first-child+li .baike_content_li_title{
	text-overflow: ellipsis;
    overflow-x: hidden;
    text-align: left;
    padding-left: 3%;
    cursor:pointer
}
.baike_content_li:first-child+li .baike_content_li_title.index{
	white-space: normal;
	background: #fff;
    border-bottom: 1px solid #000;
    z-index: 3;
    position: relative;
    padding-bottom: 5px;
}
.baike_content_li:first-child+li+li{
width: 18%;
}
.baike_content_li:first-child+li+li+li{
width: 13%;
}
.baike_content_li:first-child+li+li+li+li{
width: 16%;
}
.baike_content_li:first-child+li+li+li+li+li{
width: 21%;
border-right:none;
    font-size: 13px;
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
.baike_content_li_btn2{
    background: #139FD2;
    color: #fff;
    padding: 3px 8px;
    border-radius: 2px;
    margin: 0 12px;
    cursor:pointer
}
.baike_content_li_btn3{
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
.page_box_ul{
	    float: right;
    font-size: 16px;
    margin-top: 23px;
    margin-right: 22px;	
}
.prePage {
    padding-right: 8px;
}
.page_box_li{
    float: left;
    position: relative;
    font-size: 12px;
    border: 1px solid #ccc;
    text-align: center;
    width: 27px;
    border-radius: 4px;
    margin-right: 10px;
    cursor: pointer;
    height: 20px;
}
.nextPage {
    padding-left: 8px;
}
.nextPage{

}
.page_index{
    width: 56px;
    margin: 0 5px;
    height: 22px;
    position: relative;
    cursor: pointer;
    padding-left: 4px;
    font-size: 12px;
    border-radius: 3px;
    border: 1px solid #ccc;
}
.page_confirm{
    border: 1px solid #ccc;
    padding: 1px 5px;
    border-radius: 4px;
}
.page_btn_box{
    border: none;
    width: auto;
}
.page_box_li.index{
    color: #FF9C30;
    border: none;
}
</style>
<script type="text/javascript">


$(function(){
	
	$(".baike_btn_type_value").click(function(){
		$(".baike_btn_type_ul").toggle();
	});
	
	$(".baike_btn_add").click(function(){
		$("#baike_home").attr("action","${ctx}/admin/knowledge/add_baike.page").submit();
	});
	
	$(".confirm_box_close,.confirm_li.cancel").click(function(){
		$(".confirm_box").hide();
		$(".bg").hide();
	});
	
	var pageMaxIndex=12
	$(".page_confirm").click(function(){
		if($.trim($(".page_index").val())==''||1*$.trim($(".page_index").val())<0||1*$.trim($(".page_index").val())>pageMaxIndex){
			/* 闪一下，变红 */
			$(".page_index").css("borderColor","#ff0000")
			setTimeout(function(){
				$(".page_index").css("borderColor","#ccc")
			},50);
			$(".page_index").val("");
			return;	
		}
		
		/* 加入方法 */
		alert("加入方法");
	});
	
	/*点击页码改变其颜色*/
    $(".page_box li").click(function(){
        $(this).addClass("index").siblings().removeClass("index");
    });
})
function baike_btn_type_li(e,id){
	var baike_type_value=$.trim($(e).text());
	$(".baike_btn_type_value").text(baike_type_value);
	$(".baike_btn_type_ul").toggle();
	$(".articleCategory_id").val(id);
	$("#baike_home").attr("action","${ctx}/admin/knowledge/baike.page").submit();
}

/* 编辑方法 */
function baike_content_li_btn2(id){
	$(".article_id").val(id);
	$("#baike_home").submit();
}
function pageQuery(num){
	$(".pageNum").val(num);
	$("#baike_home").attr("action","${ctx}/admin/knowledge/baike.page").submit();
}
/* 删除方法 */
function baike_content_li_btn3(id){
	$(".confirm_box").show();
	$(".bg").show();
	$(".confirm_header").text("您确认删除该干货吗？");
	
	$(".confirm_li.confirm").on("click",function(){
		$.ajax({
			   type: "POST",
			   url: "${ctx}/admin/knowledge/deleteWiki.json",
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
function top_box(e,index,id){
	/* 
	index==0表示还没有置顶
	index==-1表示置顶2
	index==-2表示还没有置顶1
	*/
	$(e).parents(".top_box").find(".top_ul").toggle();
	
	$(e).parents(".top_box").find(".top_li").on("click",function(){
		$(e).parents(".top_box").find(".top_ul").hide();
		
		var value=$.trim($(this).text());
		var seq=0;
		
		if(index==0){
			/* 这时候表示没有置顶 */
			if(value=="置顶1"){
				/* 首先看看有没有置顶1的 */
				seq=-2;
			}else if(value=="置顶2"){
				seq=-1;
				
			}else if(value=="取消置顶"){
				return;
			}
			
		}else if(index==-1){
			/* 这时候表示置顶2 */
			if(value=="置顶1"){
				seq=-2;
			}else if(value=="置顶2"){
				return;
				
			}else if(value=="取消置顶"){
				
				seq=0;
			}
			
		}else if(index==-2){
			/* 这时候表示置顶1 */
			if(value=="置顶1"){
				return;
			}else if(value=="置顶2"){
				seq=-1;
			}else if(value=="取消置顶"){
				seq=0;
			}
		}
		
		
		$.ajax({
			   type: "POST",
			   url: "${ctx}/admin/knowledge/stick.json",
			   dataType: "json",
			   data: {id:id,seq:seq},
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
</script>
<form action="${ctx}/admin/knowledge/add_baike.page" id="baike_home">
	<input type="hidden" name="id" class="article_id">
	<input type="hidden" name="pageNum" class="pageNum">
	<input type="hidden" value="${articleCategoryId}" name="articleCategoryId" class="articleCategory_id">
</form>

<div class="back_right_box">
	<h1 class="baike_header">汉和干货</h1>
	<div class="baike_btn_box">
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
                
		<div class="baike_btn_type_box">
			<c:choose>
				<c:when test="${empty articleCategoryId}">
					<span class="baike_btn_type_value">按类型选择</span>
				</c:when>
				<c:otherwise>
					<c:forEach items="${articleCategories}" var="articleCategory">
						<c:if test="${articleCategory.id==articleCategoryId}">
							<span class="baike_btn_type_value">${articleCategory.name}</span>
						</c:if>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			
			<ul class="baike_btn_type_ul">
					<li class="baike_btn_type_li" onclick="baike_btn_type_li(this)">全部</li>
				<c:forEach items="${articleCategories}" var="articleCategory">
					<li class="baike_btn_type_li" onclick="baike_btn_type_li(this,'${articleCategory.id}')">${articleCategory.name}</li>
				</c:forEach>	
			</ul>
		</div>
		<span class="baike_btn_add">添加干货</span>
	</div>

	<div class="baike_content_box">
		<ul class="baike_content_header_ul">
			<li class="baike_content_header_li">序号</li>
			<li class="baike_content_header_li">题目</li>
			<li class="baike_content_header_li">知识类型</li>
			<li class="baike_content_header_li">作者</li> 
			<li class="baike_content_header_li">最近更新</li>
			<li class="baike_content_header_li">操作</li>
		</ul>
		<div class="baike_content_ul_box">
			<c:forEach items="${articles}" var="article" varStatus="status">
				<ul class="baike_content_ul">
					<li class="baike_content_li">${status.index+1}</li>
					<li class="baike_content_li">${article.title}</li>
					<li class="baike_content_li">${article.articleCategory}</li>
					<li class="baike_content_li">${article.author}</li>
					<li class="baike_content_li"><fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${article.operateTime}" /></li>
					<li class="baike_content_li">
								<!-- 这时候没有置顶 -->
								<div class="top_box">
								<c:choose>
									<c:when test="${article.seq==0}">
										<span class="baike_content_li_btn1 index" onclick="top_box(this,0,'${article.id}')">置顶</span>
									</c:when>	
									<c:when test="${article.seq==-1}">
										<span class="baike_content_li_btn1"  onclick="top_box(this,-1,'${article.id}')">置顶2</span>
									</c:when>	
									<c:when test="${article.seq==-2}">
										<span class="baike_content_li_btn1" onclick="top_box(this,-2,'${article.id}')">置顶1</span>
									</c:when>	
									<c:otherwise>
										<span class="baike_content_li_btn1 index">置顶</span>
									</c:otherwise>
								</c:choose>		
									<ul class="top_ul" style="display:none">
										<li class="top_li">置顶1</li>
										<li class="top_li">置顶2</li>
										<li class="top_li">取消置顶</li>
									</ul>
								</div>
						<span class="baike_content_li_btn2" onclick="baike_content_li_btn2('${article.id}')">编辑</span>
						<span class="baike_content_li_btn3" onclick="baike_content_li_btn3('${article.id}')">删除</span>
					</li>
				</ul>
			</c:forEach>
		</div>
	</div>
</div>

