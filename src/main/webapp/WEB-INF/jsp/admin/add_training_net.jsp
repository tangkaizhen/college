<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
<script type="text/javascript" src="${ctx}/js/jquery.md5.js"></script>
<script src="${ctx}/js/LAreaData1.js" type="text/javascript"></script>
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
    font-size: 16px;
    margin-left: 1%;
    margin: 12px 1%;
}
.training_net_btn_back{
	display: inline-block;
    cursor: pointer;
}
.training_net_btn_back_img{
    width: 15px;
    margin-right: 7px;
}
.training_net_btn_back_txt{

}
.add_training_net_content{
	background: #fff;
    width: 98%;
    margin-left: 1%;
    font-size: 20px;
    padding: 35px 3%;
}

.training_net_pro_type_box{
    border: 1px solid #ccc;
    height: 29px;
    width: 145px;
    margin-right: 24px;
    text-align: center;
    border-radius: 4px;
    position: relative;
        cursor: pointer;
    background: url(${ctx}/images/triangle.png) no-repeat 97% center;    
    display:inline-block;
    font-size:16px
}
.training_net_pro_type_value{
    display: inline-block;
    margin-top: 3px;
    width: 100%;
    text-align: left;
    padding-left: 8%;
}
.training_net_pro_type_ul{
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
.training_net_pro_type_li{
    border-bottom: 1px solid #ccc;
    line-height: 30px;
}
.training_net_city_type_box{
    border: 1px solid #ccc;
    height: 29px;
    width: 145px;
    margin-right: 24px;
    text-align: center;
    border-radius: 4px;
    position: relative;
        cursor: pointer;
    background: url(${ctx}/images/triangle.png) no-repeat 97% center;    
    display:inline-block;
    font-size:16px
}
.training_net_city_type_value{
    display: inline-block;
    margin-top: 3px;
    width: 100%;
    text-align: left;
    padding-left: 8%;
}
.training_net_city_type_ul{
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
.training_net_city_type_box{
font-size: 16px;

}
.training_net_position_details{
    margin-right:27px;
        float: right;
}
.training_net_position_details_value{
    width: 32%;
    border: 1px solid #ccc;
    font-size: 16px;
    height: 30px;
    border-radius: 4px;
    padding-left: 14px;
    cursor: pointer;
    float: right;
    margin-right: 7.2%;
}
.training_net_city_type_li{
    border-bottom: 1px solid #ccc;
    line-height: 30px;
}
.training_net_manage_save{
    background: #139FD2;
    color: #fff;
    border: none;
    font-size: 16px;
        padding: 8px 22px;
    border-radius: 4px;
    cursor: pointer;
    margin-left: 48%;
}
.training_net_name_box{
margin-bottom: 20px;
}
.training_net_name{
display: inline-block;
    width: 12%;
    text-align: right;
    margin-right: 12px;
    float: left;
}
.training_net_name_value{
    width: 38%;
    border: 1px solid #ccc;
    font-size: 16px;
    height: 30px;
    border-radius: 4px;
    padding-left: 14px;
    cursor: pointer;
    float: left;
}
.training_net_type{
    width: 8%;
    text-align: right;
    float: left;
}
.training_net_type_ul{
    display: inline-block;
    overflow: hidden;
    position: relative;
    width: 38%;
}
.training_net_type_li{
    float: left;
    margin-left: 22px;
    margin-bottom: 6px;
    font-size: 18px;
}
.training_net_checkbox{
width: 20px;
    height: 20px;
    cursor: pointer;
    float: left;
    margin-top: 4px;
    margin-right: 5px;
}
.training_net_type_txt{

}
.training_net_account_box{
    margin-bottom: 20px;
}
.training_net_account_value{
    width: 38%;
    border: 1px solid #ccc;
    font-size: 16px;
    height: 30px;
    border-radius: 4px;
    padding-left: 14px;
    cursor: pointer;
}
.training_net_pass{
margin: 0 12px 0 36px;
}
.training_net_pass_value{
    width: 19%;
    border: 1px solid #ccc;
    font-size: 16px;
    height: 30px;
    border-radius: 4px;
    padding-left: 14px;
    cursor: pointer;
}
.training_net_class_box{
    margin-bottom: 20px;
}
.training_net_class_value{
    width: 38%;
    border: 1px solid #ccc;
    font-size: 16px;
    height: 30px;
    border-radius: 4px;
    padding-left: 14px;
    cursor: pointer;
}
.training_net_class_date{
    margin: 0 20px 0 37px;
}
.training_net_class_date_start{
    border: 1px solid #ccc;
    font-size: 16px;
    height: 30px;
    border-radius: 4px;
    padding-left: 14px;
    cursor: pointer;
    margin-right: 13px;
}
.training_net_class_date_end{
    border: 1px solid #ccc;
    font-size: 16px;
    height: 30px;
    border-radius: 4px;
    padding-left: 14px;
    cursor: pointer;
    margin-left: 13px;
}
.training_net_money_box{
    margin-bottom: 20px;
}
.training_net_money_value{
	width: 38%;
    border: 1px solid #ccc;
    font-size: 16px;
    height: 90px;
    border-radius: 4px;
    padding-left: 14px;
    cursor: pointer;
    resize:none
}
.training_net_position_box{
    margin-bottom: 20px;
}
.training_net_contact_box{
    margin-bottom: 20px;
}
.training_net_contact_value{
    width: 38%;
    border: 1px solid #ccc;
    font-size: 16px;
    height: 30px;
    border-radius: 4px;
    padding-left: 14px;
    cursor: pointer;
}
.training_net_tel{
    margin: 0 20px 0 37px;
}
.training_net_tel_value{
    width: 29%;
    border: 1px solid #ccc;
    font-size: 16px;
    height: 30px;
    border-radius: 4px;
    padding-left: 14px;
    cursor: pointer;
}
.training_net_explain_box{
    margin-bottom: 20px;
}
.training_net_explain_value{
    width: 38%;
    border: 1px solid #ccc;
    font-size: 16px;
    height: 80px;
    border-radius: 4px;
    padding-left: 14px;
    cursor: pointer;
    resize:none
}
.training_net_advantage_box{
margin-bottom: 20px;
}
.training_net_advantage_value{
    width: 38%;
    border: 1px solid #ccc;
    font-size: 16px;
    height: 80px;
    border-radius: 4px;
    padding-left: 14px;
    cursor: pointer;
    resize:none
}
.training_net_contact_li{
	margin-bottom: 17px;
}
</style>
<script type="text/javascript">
$(function(){
	/* $(".back_nav_li").eq(3).find(".back_article_header").addClass("index");
	$(".back_nav_li").eq(3).find(".back_article_ul").show();
	$(".back_nav_li").eq(3).find(".back_article_li").eq(1).addClass("index"); */
	
	if($.trim($(".train_net_type").val())!=''){
		var type=$.trim($(".train_net_type").val()).split(",");
		
		for(var i=0;i<type.length;i++){
			$(".training_net_type_txt").each(function(){
				if($.trim($(this).text())==type[i]){
					$(this).siblings().prop({checked:true});
				}
			});
		}
	}
	
	if($.trim($(".train_net_start").val())){
		
		var data_arr=$.trim($(".train_net_start").val()).split("-");
		console.log(data_arr);
		if(data_arr[1]*1<10){
			data_arr[1]="0"+data_arr[1];
		}
		if(data_arr[2]*1<10){
			data_arr[2]="0"+data_arr[2];
		}
		
		var new_date=data_arr[0]+"-"+data_arr[1]+"-"+data_arr[2]
		$(".training_net_class_date_start").val(new_date);
	}
	
	if($.trim($(".train_net_end").val())){
		
		var data_arr=$.trim($(".train_net_end").val()).split("-");
		console.log(data_arr);
		if(data_arr[1]*1<10){
			data_arr[1]="0"+data_arr[1];
		}
		if(data_arr[2]*1<10){
			data_arr[2]="0"+data_arr[2];
		}
		
		var new_date=data_arr[0]+"-"+data_arr[1]+"-"+data_arr[2]
		$(".training_net_class_date_end").val(new_date);
	}
	
	if("按市区筛选"!=$.trim($(".training_net_city_type_value").text())){
		/* 价值市 */
		var city_html='';
		city_html+='<li class="training_net_pro_type_li" onclick="training_net_pro_type_li(this)">全部</li>';
		for(var i=0;i<LAreaData.length;i++){
			if(LAreaData[i].name==$.trim($(".training_net_pro_type_value").text())){
				for(var j=0;j<LAreaData[i].child.length;j++){
					city_html+='<li class="training_net_city_type_li" onclick="training_net_city_type_li(this)">'+LAreaData[i].child[j].name+'</li>';
				}
			}
	    }
		$(".training_net_city_type_ul").html(city_html);	
	}
	
	$(".add_training_net_type_select_name").click(function(){ 
		$(".add_training_net_type_select_ul").toggle();
	});
	
	$(".training_net_btn_back").click(function(){
		$("#training_net_home").attr("action","${ctx}/admin/training/training_net.page").submit();
	});
	
	$(".training_net_pro_type_value").click(function(){
		$(".training_net_city_type_value").text("按市区筛选");
		$(".training_net_pro_type_ul").toggle();
	});
	$(".training_net_city_type_value").click(function(){
		if($.trim($(".training_net_pro_type_value").text())=="按省份筛选"){
			reminder_box("请先选择省");
			return;
		}
		$(".training_net_city_type_ul").toggle();
	});
	
	/* 加载省份 */
	/* 加载各省份 */
	
	var province_html='';
	province_html+='<li class="training_net_pro_type_li" onclick="training_net_pro_type_li(this)">全部</li>';
	for(var i=0;i<LAreaData.length;i++){
		province_html+='<li class="training_net_pro_type_li" onclick="training_net_pro_type_li(this)">'+LAreaData[i].name+'</li>';
    }
	$(".training_net_pro_type_ul").html(province_html);
	
	
	
	$(".training_net_manage_save").click(function(){
		
		var value=$.trim($(".training_net_name_value").val());
		if(value==""){
			reminder_box("请输入培训点名称");
			return;
		}
		if(value.length<2||value.length>100){
			reminder_box("培训点名称长度需要在2-100个字符以内");
			return;
		}
		
		var ifallselect=false;
		var training_type='';
		var training_type_id='';
		$(".training_net_checkbox").each(function(){
			if($(this).is(':checked')){
				training_type+=$.trim($(this).siblings().text())+',';
				training_type_id+=$.trim($(this).siblings().attr("id"))+',';
				ifallselect=true;
			}
		});
		
		if(!ifallselect){
			reminder_box("请选择培训类型");
			return;
		}
		
		training_type=training_type.substring(0,training_type.length-1);
		training_type_id=training_type_id.substring(0,training_type_id.length-1);
		
		if("${trainingSite}"==""){
			value=$.trim($(".training_net_account_value").val());
			if(value==""){
				reminder_box("请输入网点管理员账号");
				return;
			}
			if(value.length<2||value.length>32){
				reminder_box("网点管理员账号长度需要在2-32个字符以内");
				return;
			}
			value=$.trim($(".training_net_pass_value").val());
			if(value==""){
				reminder_box("请输入网点管理员密码");
				return;
			}
			if(value.length<6||value.length>32){
				reminder_box("网点管理员密码长度需要在6-32个字符以内");
				return;
			}
		}else{
			
		}
		
		value=$.trim($(".training_net_class_value").val());
		if(value==""){
			reminder_box("请输入开班名称");
			return;
		}
		if(value.length<2||value.length>100){
			reminder_box("开班名称长度需要在2-100个字符以内");
			return;
		}
		value=$.trim($(".training_net_class_date_start").val());
		if(value==""){
			reminder_box("请选择开班时间");
			return;
		}
		
		value=$.trim($(".training_net_class_date_end").val());
		if(value==""){
			reminder_box("请选择开班时间");
			return;
		}
		if(1*$.trim($(".training_net_class_date_start").val()).split("-").join("")>1*$.trim($(".training_net_class_date_end").val()).split("-").join("")){
			reminder_box("开班时间开始时间大于开班结束时间");
			return;
		}
		value=$.trim($(".training_net_money_value").val());
		if(value==""){
			reminder_box("请输入费用说明");
			return;
		}
		if(value.length<2||value.length>5000){
			reminder_box("费用说明长度需要在2-5000个字符以内");
			return;
		}
		
		value=$.trim($(".training_net_pro_type_value").text());
		if(value=="按省份筛选"){
			reminder_box("请选择网点的省份");
			return;
		}
		value=$.trim($(".training_net_city_type_value").text());
		if(value=="按市区筛选"){
			reminder_box("请选择网点的市区");
			return;
		}
		value=$.trim($(".training_net_position_details_value").val());
		if(value==""){
			reminder_box("请输入网点的详细地址");
			return;
		}
		if(value.length<2||value.length>100){
			reminder_box("详细地址长度需要在2-100个字符以内");
			return;
		}
		
		/* 注意此时联系人是有三行 */
		
		/* 查看第一行联系人 */
		/* value=$.trim($(".training_net_contact_value").eq(0).val());
		if(value==""){
			reminder_box("请输入第一行联系人");
			return;
		}
		
		if(value.length<2||value.length>10){
			reminder_box("第一行联系人长度需要在2-10个字符以内");
			return;
		}
		
		value=$.trim($(".training_net_tel_value").eq(0).val());
		if(value==""){
			reminder_box("请输入第一行联系方式");
			return;
		}
		if(value.length<2||value.length>20){
			reminder_box("第一行联系方式长度需要在2-20个字符以内");
			return;
		} */
		
		/* 查看第二行联系人 */
		/* 只要有一个空格填了，必须填满 */
		/* if($.trim($(".training_net_contact_value").eq(1).val())!=''||$.trim($(".training_net_tel_value").eq(1).val())!=''){
			
			value=$.trim($(".training_net_contact_value").eq(1).val());
			if(value==""){
				reminder_box("请输入第二行联系人");
				return;
			}
			
			if(value.length<2||value.length>10){
				reminder_box("第二行联系人长度需要在2-10个字符以内");
				return;
			}
			
			value=$.trim($(".training_net_tel_value").eq(1).val());
			if(value==""){
				reminder_box("请输入第二行联系方式");
				return;
			}
			if(value.length<2||value.length>20){
				reminder_box("第二行联系方式长度需要在2-20个字符以内");
				return;
			}
		} */
		/* 查看第三行联系人 */
		/* 只要有一个空格填了，必须填满 */
		/* if($.trim($(".training_net_contact_value").eq(2).val())!=''||$.trim($(".training_net_tel_value").eq(2).val())!=''){
			
			value=$.trim($(".training_net_contact_value").eq(2).val());
			if(value==""){
				reminder_box("请输入第三行联系人");
				return;
			}
			
			if(value.length<2||value.length>10){
				reminder_box("第三行联系人长度需要在2-10个字符以内");
				return;
			}
			
			value=$.trim($(".training_net_tel_value").eq(2).val());
			if(value==""){
				reminder_box("请输入第三行联系方式");
				return;
			}
			if(value.length<2||value.length>20){
				reminder_box("第三行联系方式长度需要在2-20个字符以内");
				return;
			}
		} */
		
		value=$.trim($(".training_net_explain_value").val());
		if(value==""){
			reminder_box("请输入培训说明");
			return;
		}
		if(value.length<2||value.length>5000){
			reminder_box("培训说明长度需要在2-5000个字符以内");
			return;
		}
		value=$.trim($(".training_net_advantage_value").val());
		if(value==""){
			reminder_box("请输入优势说明");
			return;
		}
		if(value.length<2||value.length>5000){
			reminder_box("优势说明长度需要在2-5000个字符以内");
			return;
		}
		
		var data;
		if($.trim($(".train_net_id").val())==""){
			data = {
					name:$.trim($(".training_net_name_value").val()),
					trainingType:training_type,
					adminAccount:$.trim($(".training_net_account_value").val()),
					adminPassword:$.md5($.trim($(".training_net_pass_value").val())),
					className:$.trim($(".training_net_class_value").val()),
					trainingStartDate:$.trim($(".training_net_class_date_start").val()),
					feeDescription:$.trim($(".training_net_money_value").val()),
					province:$.trim($(".training_net_pro_type_value").text()),
					city:$.trim($(".training_net_city_type_value").text()),
					address:$.trim($(".training_net_position_details_value").val()),
					contactName1:$.trim($(".training_net_contact_value").eq(0).val()),
					contactPhone1:$.trim($(".training_net_tel_value").eq(0).val()),
					contactName2:$.trim($(".training_net_contact_value").eq(1).val()),
					contactPhone2:$.trim($(".training_net_tel_value").eq(1).val()),
					contactName3:$.trim($(".training_net_contact_value").eq(2).val()),
					contactPhone3:$.trim($(".training_net_tel_value").eq(2).val()),
					trainingDescription:$.trim($(".training_net_explain_value").val()),
					advantage:$.trim($(".training_net_advantage_value").val()),
					trainingTypeIds:training_type_id,
					trainingEndDate:$.trim($(".training_net_class_date_end").val())
				}
		}else{
			data = {
					id:$.trim($(".train_net_id").val()),
					name:$.trim($(".training_net_name_value").val()),
					trainingType:training_type,
					className:$.trim($(".training_net_class_value").val()),
					trainingStartDate:$.trim($(".training_net_class_date_start").val()),
					trainingEndDate:$.trim($(".training_net_class_date_end").val()),
					feeDescription:$.trim($(".training_net_money_value").val()),
					province:$.trim($(".training_net_pro_type_value").text()),
					city:$.trim($(".training_net_city_type_value").text()),
					address:$.trim($(".training_net_position_details_value").val()),
					contactName1:$.trim($(".training_net_contact_value").eq(0).val()),
					contactPhone1:$.trim($(".training_net_tel_value").eq(0).val()),
					contactName2:$.trim($(".training_net_contact_value").eq(1).val()),
					contactPhone2:$.trim($(".training_net_tel_value").eq(1).val()),
					contactName3:$.trim($(".training_net_contact_value").eq(2).val()),
					contactPhone3:$.trim($(".training_net_tel_value").eq(2).val()),
					trainingDescription:$.trim($(".training_net_explain_value").val()),
					advantage:$.trim($(".training_net_advantage_value").val()),
					trainingTypeIds:training_type_id
				}
		}
		$.ajax({
            type: "POST",
            url: "${ctx}/admin/training/saveTrainingSite.json",
            dataType: "json",
            data: data,
            success: function(msg) {
                if(msg.status==1){
                	if($.trim($(".train_net_id").val())==""){
                		reminder_box("保存成功！");
                	}else{
                		reminder_box("编辑成功！");
                	}
                	setTimeout(function(){
                		location.href="${ctx}/admin/training/training_net.page";
                	},1500);
                }else{
                	console.log(msg.msg);
                		reminder_box(msg.msg);
                }
            }
		});		
	});
})
function add_training_net_type_select_li(e){
	var training_net_type_value=$.trim($(e).text());
	$(".add_training_net_type_select_name").text(training_net_type_value);
	$(".add_training_net_type_select_ul").toggle();
}

function training_net_pro_type_li(e){
	var value=$.trim($(e).text());
	$(".training_net_pro_type_value").text(value);
	$(".training_net_pro_type_ul").toggle();
	
	/* 价值市 */
	var city_html='';
	city_html+='<li class="training_net_pro_type_li" onclick="training_net_pro_type_li(this)">全部</li>';
	for(var i=0;i<LAreaData.length;i++){
		if(LAreaData[i].name==value){
			for(var j=0;j<LAreaData[i].child.length;j++){
				city_html+='<li class="training_net_city_type_li" onclick="training_net_city_type_li(this)">'+LAreaData[i].child[j].name+'</li>';
			}
		}
    }
	$(".training_net_city_type_ul").html(city_html);
}
function training_net_city_type_li(e){
	var value=$.trim($(e).text());
	$(".training_net_city_type_value").text(value);
	$(".training_net_city_type_ul").toggle();
}
</script>
<form action="" method="post" id="training_net_home">
	<input type="hidden" value="${trainingSite.id}" class="train_net_id">
	<input type="hidden" value="${trainingSite.trainingType}" class="train_net_type">
	<input type="hidden" value="<fmt:formatDate type='date' value='${trainingSite.trainingStartDate}' />" class="train_net_start">
	<input type="hidden" value="<fmt:formatDate type='date' value='${trainingSite.trainingEndDate}' />" class="train_net_end">
</form>
<div class="back_right_box">
	<h1 class="training_net_header">培训网点</h1>
	<div class="training_net_btn_box">
		<div class="training_net_btn_back"><img alt="" src="${ctx}/images/icon_back.png" class="training_net_btn_back_img"><span class="training_net_btn_back_txt">返回></span></div>
		<c:choose>
			<c:when test="${empty trainingSite}">
				<span>添加培训网点</span>
			</c:when>
			<c:otherwise>
				<span>编辑培训网点</span>
			</c:otherwise>
		</c:choose>
	</div>

	<div class="add_training_net_content">
		<div class="training_net_name_box">
			<span class="training_net_name">培训点名称</span>
			<input class="training_net_name_value" maxlength="40" value="${trainingSite.name}" placeholder="请输入培训点名称">
			
			<span class="training_net_type">培训类型</span>
			<ul class="training_net_type_ul">
				<c:forEach items="${trainingTypes}" var="trainingType">
					<li class="training_net_type_li">
						<input type="checkbox" class="training_net_checkbox">
					
						<span class="training_net_type_txt" id="${trainingType.id}">${trainingType.name}</span>
					</li>
				</c:forEach>	
			</ul>
		</div>
		<c:choose>
			<c:when test="${empty trainingSite}">
				<div class="training_net_account_box">
					<span class="training_net_name">网点管理员账号</span>
					<input class="training_net_account_value" value="${trainingSite.adminAccount}" placeholder="请输入网点管理员账号">
					<span class="training_net_pass">网点管理员密码</span>
					<input class="training_net_pass_value" type="number" value="" placeholder="请输入网点管理员密码(仅限数字)">
				</div>
			</c:when>
			<c:otherwise>
				<div class="training_net_account_box">
					<span class="training_net_name">网点管理员账号</span>
					<input class="training_net_account_value" style="background:#ccc" value="${trainingSite.adminAccount}" readonly placeholder="请输入网点管理员账号">
				</div>
			</c:otherwise>
		</c:choose>
		<div class="training_net_class_box">
			<span class="training_net_name">开班名称</span>
			<input type="text" class="training_net_class_value" maxlength="20" value="${trainingSite.className}" placeholder="请输入开班名称">
			
			<span class="training_net_class_date">开班时间</span>
			<input type="date" value="<fmt:formatDate type='date' value='${trainingSite.trainingStartDate}' />" class="training_net_class_date_start">到
			<input type="date" class="training_net_class_date_end">
		</div>
		<div class="training_net_money_box">
			<span class="training_net_name">费用说明</span>
			<textarea rows="" cols="" class="training_net_money_value" maxlength="1000" placeholder="请输入费用说明">${trainingSite.feeDescription}</textarea>
		</div>
		
		<div class="training_net_position_box">
			<span class="training_net_name">省</span>
			<div class="training_net_pro_type_box">
				<c:choose>
					<c:when test="${empty trainingSite.province}">
						<span class="training_net_pro_type_value">按省份筛选</span>
					</c:when>
					<c:otherwise>
						<span class="training_net_pro_type_value">${trainingSite.province}</span>
					</c:otherwise>
				</c:choose>
				<ul class="training_net_pro_type_ul">
				</ul>
			</div>
				
			<span class="training_net_city">市</span>
			<div class="training_net_city_type_box">
				<c:choose>
					<c:when test="${empty trainingSite.city}">
						<span class="training_net_city_type_value">按市区筛选</span>
					</c:when>
					<c:otherwise>
						<span class="training_net_city_type_value">${trainingSite.city}</span>
					</c:otherwise>
				</c:choose>
				<ul class="training_net_city_type_ul">
				</ul>
			</div>
			<input type="text" class="training_net_position_details_value" value='${trainingSite.address}' placeholder="请输入详细地址">
			<span class="training_net_position_details">详细地址</span>
		</div>
		
	
		<ul class="training_net_contact_box">
			<li class="training_net_contact_li">
				<span class="training_net_name">联系人</span>
				<input type="text"  value='${trainingSite.contactName1}' class="training_net_contact_value" placeholder="请输入联系人">
				<span class="training_net_tel">联系方式</span>
				<input type="number" value='${trainingSite.contactPhone1}' class="training_net_tel_value" placeholder="请输入联系方式">
			</li>
			<li class="training_net_contact_li">
				<span class="training_net_name">联系人</span>
				<input type="text"  value='${trainingSite.contactName2}' class="training_net_contact_value" placeholder="请输入联系人">
				<span class="training_net_tel">联系方式</span>
				<input type="number" value='${trainingSite.contactPhone2}' class="training_net_tel_value" placeholder="请输入联系方式">
			</li>
			<li class="training_net_contact_li">
				<span class="training_net_name">联系人</span>
				<input type="text"  value='${trainingSite.contactName3}' class="training_net_contact_value" placeholder="请输入联系人">
				<span class="training_net_tel">联系方式</span>
				<input type="number" value='${trainingSite.contactPhone3}' class="training_net_tel_value" placeholder="请输入联系方式">
			</li>
		</ul>
		<div class="training_net_explain_box">
			<span class="training_net_name">培训说明</span>
			<textarea rows="" cols="" class="training_net_explain_value" maxlength="5000" placeholder="请输入培训说明">${trainingSite.trainingDescription}</textarea>
		</div>
		<div class="training_net_advantage_box">
			<span class="training_net_name">优势说明</span>
			<textarea rows="" cols="" class="training_net_advantage_value" maxlength="25000" placeholder="请输入优势说明">${trainingSite.advantage}</textarea>
		</div>
		
		<input type="button" class="training_net_manage_save" value="提交保存">
	</div>	
</div>

