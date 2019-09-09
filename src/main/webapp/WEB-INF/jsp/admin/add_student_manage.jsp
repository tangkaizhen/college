<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
<script src="${ctx}/js/LAreaData1.js" type="text/javascript"></script>
<%-- <script type="text/javascript" src="${ctx}/js/ajaxfileupload.js"></script> --%>
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
    font-size: 16px;
    margin-left: 1%;
    margin: 12px 1%;
}
.student_manage_btn_back{
	display: inline-block;
    cursor: pointer;
}
.student_manage_btn_back_img{
    width: 15px;
    margin-right: 7px;
}
.student_manage_btn_back_txt{

}
.add_student_manage_content{
	    background: #fff;
    width: 98%;
    margin-left: 1%;
    font-size: 20px;
    padding:10px 8%;
}
.add_student_manage_save{
    background: #139FD2;
    color: #fff;
    border: none;
    font-size: 16px;
    padding: 4px 10px;
    border-radius: 4px;
    cursor: pointer;
    margin-left: 48%;
}
.student_account_pass{
    margin-bottom: 30px;
}
.student_account_name{
    display: inline-block;
    width: 8%;
    text-align: right;
    margin-right: 12px;
}
.student_account_value{
    width: 35%;
    border: 1px solid #ccc;
    font-size: 16px;
    height: 30px;
    border-radius: 4px;
    padding-left: 14px;
    cursor: pointer;
    
}
.student_pass_value{
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
.student_pass_name{
    float: right;
    margin-right: 12px;
}
.student_name_tag{
    margin-bottom: 30px;
}
.student_name,.student_name_pin{
    display: inline-block;
    width: 8%;
    text-align: right;
    margin-right: 12px;
}
.student_name_pin_value,.student_name_value{
    width: 16%;
    border: 1px solid #ccc;
    font-size: 16px;
    height: 30px;
    border-radius: 4px;
    padding-left: 14px;
    cursor: pointer;
    margin-right: 7px;
}
.student_tag_value{
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
.student_tag_name{
    float: right;
    margin-right: 12px;
}
.student_introduction_box{
    margin-bottom: 30px;
}
.student_introduction{
    display: inline-block;
    width: 8%;
    text-align: right;
    margin-right: 12px;
}
.student_introduction_value{
	width: 84%;
    border: 1px solid #ccc;
    font-size: 16px;
    height: 30px;
    border-radius: 4px;
    padding-left: 14px;
    cursor: pointer;
}
.student_details_box{
    margin-bottom: 30px;
}
.student_details{
    display: inline-block;
    width: 8%;
    text-align: right;
    margin-right: 17px;
    float: left;
}
.student_details_value{
    width: 84%;
    border: 1px solid #ccc;
    font-size: 16px;
    height: 81px;
    border-radius: 4px;
    padding-left: 14px;
    cursor: pointer;
}
.student_photo_box{
    margin-bottom: 30px;
}
.student_photo{
    display: inline-block;
    width: 8%;
    text-align: right;
    margin-right: 18px;
    float: left;
}
.student_photo_innerbox{
    display: inline-block;
}
.student_img_box1{
    display: inline-block;
    cursor: pointer;
    margin-right: 167px;
}
.student_img_box2{
    display: inline-block;
    cursor: pointer;
}
.student_manage_btn_back_img1{

}
.student_manage_btn_back_img2{

}
.student_pro_type_box,.addressee_pro_type_box{
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
.student_pro_type_value,.addressee_pro_type_value{
    display: inline-block;
    margin-top: 3px;
    width: 100%;
    text-align: left;
    padding-left: 8%;
}
.student_pro_type_ul,.addressee_pro_type_ul{
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
.student_pro_type_li,.addressee_pro_type_li{
    border-bottom: 1px solid #ccc;
    line-height: 30px;
}
.student_city_type_box,.addressee_city_type_box,addressee_district_type_box{
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
.student_city_type_value,.addressee_city_type_value,.addressee_district_type_value{
    display: inline-block;
    margin-top: 3px;
    width: 100%;
    text-align: left;
    padding-left: 8%;
}
.student_city_type_ul,.addressee_city_type_ul{
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

.student_phone_box{
    margin-bottom: 30px;
}
.student_phone_name{
    display: inline-block;
    width: 12%;
    text-align: right;
    margin-right: 12px;
        float: left;
}
.add_pic{
    width: 110px;
    height: 110px;
}
.student_name_box{
    margin-bottom: 30px;
}
.student_name{
    display: inline-block;
    width: 12%;
    text-align: right;
    margin-right: 12px;
}
/* .student_name_value{
    width: 29%;
    border: 1px solid #ccc;
    font-size: 16px;
    height: 30px;
    border-radius: 4px;
    padding-left: 14px;
    cursor: pointer;
    margin-right: 35px;
} */
.student_gender_name{
    margin-right: 12px;
}
.student_gender_value{
    border: 1px solid #ccc;
    font-size: 16px;
    height: 30px;
    border-radius: 4px;
    padding: 0 10px;
    cursor: pointer;
}
.student_birth_value{
    border: 1px solid #ccc;
    font-size: 16px;
    height: 30px;
    border-radius: 4px;
    padding-left: 14px;
    cursor: pointer;
    float: right;
}
.student_birth{
    margin-right: 12px;
    float: right;
}
.student_position_box{
    margin-bottom: 30px;
}
.student_pro,.addressee_pro{
    display: inline-block;
    width: 12%;
    text-align: right;
    margin-right: 12px;
}
.student_position_details_value,.addressee_position_details_value{
    border: 1px solid #ccc;
    font-size: 16px;
    height: 30px;
    border-radius: 4px;
    padding-left: 14px;
    cursor: pointer;
}
.student_pro_type_value{

}
.student_pro_type_ul{

}
.student_city{

}
.student_city_type_box{
font-size: 16px;

}
.student_city_type_value{

}
.student_city_type_ul{

}
.student_city_type_li{

}
.student_pro_type_li{

}
.student_position_details,.addressee_position_details{
    margin-right: 12px;
}
.student_position_details{

}
.training_net_position_details_value{

}
.student_city_type_li{
    border-bottom: 1px solid #ccc;
    line-height: 30px;
}
.student_iden_box{
    margin-bottom: 30px;
}
.student_iden{
    display: inline-block;
    width: 12%;
    text-align: right;
    margin-right: 12px;
}
.student_iden_value{
	width: 29%;
    border: 1px solid #ccc;
    font-size: 16px;
    height: 30px;
    border-radius: 4px;
    padding-left: 14px;
    cursor: pointer;
    margin-right: 35px;
}
.student_id_box{
    margin-bottom: 30px;
}
.student_id{
    display: inline-block;
    width: 12%;
    text-align: right;
    margin-right: 12px;
}
.student_id_value{
    width: 29%;
    border: 1px solid #ccc;
    font-size: 16px;
    height: 30px;
    border-radius: 4px;
    padding-left: 14px;
    cursor: pointer;
    margin-right: 35px;
}
.student_sign_box{
    margin-bottom: 30px;
}
.student_sign{
    display: inline-block;
    width: 12%;
    text-align: right;
    margin-right: 12px;
}
.student_sign_value{
    width: 29%;
    border: 1px solid #ccc;
    font-size: 16px;
    height: 30px;
    border-radius: 4px;
    padding-left: 14px;
    margin-right: 35px;
}
.student_sign_date{
    float: right;
    margin-right: 12px;
}
.student_sign_date_value{
    border: 1px solid #ccc;
    font-size: 16px;
    height: 30px;
    border-radius: 4px;
    padding-left: 14px;
    cursor: pointer;
    float: right;
}
.student_useful_box{
    margin-bottom: 30px;
}
.student_useful{
display: inline-block;
    width: 12%;
    text-align: right;
    margin-right: 12px;
}
.student_useful_start{
    border: 1px solid #ccc;
    font-size: 16px;
    height: 30px;
    border-radius: 4px;
    padding-left: 14px;
    cursor: pointer;
    margin-right: 10px;
}
.student_useful_end{
    border: 1px solid #ccc;
    font-size: 16px;
    height: 30px;
    border-radius: 4px;
    padding-left: 14px;
    cursor: pointer;
    margin-left: 10px;
}
.student_condition_box{
    margin-bottom: 30px;
}
.student_condition{
    display: inline-block;
    width: 12%;
    text-align: right;
    margin-right: 12px;
}
.student_condition_value{
    width: 86%;
    border: 1px solid #ccc;
    font-size: 16px;
    height: 30px;
    border-radius: 4px;
    padding-left: 14px;
    cursor: pointer;
}
.student_grade_box{
    margin-bottom: 30px;
}
.student_grade{
    display: inline-block;
    width: 12%;
    text-align: right;
    margin-right: 12px;
}

.student_remarks_value{
    width: 29%;
    border: 1px solid #ccc;
    font-size: 16px;
    height: 30px;
    border-radius: 4px;
    padding-left: 14px;
    cursor: pointer;
    float: right;
}
.student_remarks{
    float: right;
    margin-right: 12px;
}
.student_phone_inner_box{
    width: 110px;
    height: 110px;
    display: inline-block;
    position: relative;
}
#head_img{
	height: 100%;
    width: 100%;
    z-index: 3;
    position: absolute;
    left: 0;
    opacity: 0;
    filter: alpha(opacity=0);
        top: 0;
}
.student_addressee_box{

}
.addressee_name{
    display: inline-block;
    width: 12%;
    text-align: right;
    margin-right: 12px;
}
.addressee_name_value{
    width: 16%;
    border: 1px solid #ccc;
    font-size: 16px;
    height: 30px;
    border-radius: 4px;
    padding-left: 14px;
    cursor: pointer;
    margin-right: 7px;
}
.addressee_addresseePhone{
	display: inline-block;
    text-align: right;
    margin-right: 12px;
}
.addressee_addresseePhone_value{
	width: 16%;
    border: 1px solid #ccc;
    font-size: 16px;
    height: 30px;
    border-radius: 4px;
    padding-left: 14px;
    cursor: pointer;
    margin-right: 7px;
}
.addressee_position_box{
    margin: 21px 0;
}
.student_grade_innerbox{
    display: inline-block;
    position: relative;
    width: 30%;
    text-align: center;
    border: 1px solid #ccc;
    height:32px;
    border-radius: 5px;
}
.student_grade_value{
	font-size: 16px;
    cursor: pointer;
    display: inline-block;
    width: 100%;
    margin-top:5px;
}
.student_grade_ul{
    position: absolute;
    width: 100%;
    font-size: 18px;
    border: 1px solid #ccc;
    top:30px;
}
.student_grade_li{
    border-bottom: 1px solid #eee;
    padding: 3px 0;
    cursor: pointer;
}
.addressee_city_type_li{
	border-bottom: 1px solid #eee;
    padding: 3px 0;
}

.student_tel{
    float: right;
    margin-right: 12px;
}
.student_tel_value{
    width: 16%;
    border: 1px solid #ccc;
    font-size: 16px;
    height: 30px;
    border-radius: 4px;
    padding-left: 14px;
    cursor: pointer;
    margin-right: 7px;
    float: right;
}
</style>
<script type="text/javascript">
$(function(){
	/* $(".back_nav_li").eq(5).find(".back_article_header").addClass("index");
	$(".back_nav_li").eq(5).find(".back_article_ul").show();
	$(".back_nav_li").eq(5).find(".back_article_li").eq(4).addClass("index"); */
	
	$(".student_manage_btn_back").click(function(){
		$("#student_manage_home").attr("action","${ctx}/admin/user/site/student_manage.page").submit();
	});
	
	$(".add_student_manage_save").click(function(){
		var src=$(".add_pic").attr("src");
		if(src.indexOf("add_pic")>-1){
			reminder_box("请选择学生的头像");
			return;
		}
		
		var value=$.trim($(".student_name_value").val());
		if(value==""){
			reminder_box("请输入学员的姓名");
			return;
		}
		var value=$.trim($(".student_name_pin_value").val());
		if(value==""){
			reminder_box("请输入学员的姓名拼音");
			return;
		}
		
		value=$.trim($(".student_birth_value").val());
		if(value==""){
			reminder_box("请输入学员的出生年月");
			return;
		}
		
		value=$.trim($(".student_pro_type_value").text());
		if(value=="按省份筛选"){
			reminder_box("请选择学员的省份");
			return;
		}
		value=$.trim($(".student_city_type_value").text());
		if(value=="按市区筛选"){
			reminder_box("请选择学员的市区");
			return;
		}
		
		
		value=$.trim($(".student_position_details_value").val());
		if(value==""){
			reminder_box("请输入学员的详细地址");
			return;
		}
		value=$.trim($(".student_tel_value").val());
		if(value==""){
			reminder_box("请输入学员的手机号");
			return;
		} 
		
		value=$.trim($(".addressee_name_value").val());
		if(value==""){
			reminder_box("请输入收件人的姓名");
			return;
		}
		value=$.trim($(".addressee_addresseePhone_value").val());
		if(value==""){
			reminder_box("请输入收件人的联系方式");
			return;
		}
		
		value=$.trim($(".addressee_pro_type_value").text());
		if(value=="按省份筛选"){
			reminder_box("请选择收件人的省份");
			return;
		}
		value=$.trim($(".addressee_city_type_value").text());
		if(value=="按市区筛选"){
			reminder_box("请选择收件人的市区");
			return;
		}
		
		
		value=$.trim($(".addressee_position_details_value").val());
		if(value==""){
			reminder_box("请输入收件人的详细地址");
			return;
		}
		
		
		value=$.trim($(".student_id_value").val());
		if(value==""){
			reminder_box("请输入学员的合格证编号");
			return;
		}
        var isIDCard1=/^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$|^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X|x)$/;
        if(!isIDCard1.test(value)){
            reminder_box("资格证号格式错误");
            return;
        }
		value=$.trim($(".student_sign_date_value").val());
		if(value==""){
			reminder_box("请输入学员的签发日期");
			return;
		}
		value=$.trim($(".student_useful_start").val());
		if(value==""){
			reminder_box("请选择有效期");
			return;
		}
		value=$.trim($(".student_useful_end").val());
		if(value==""){
			reminder_box("请选择有效期");
			return;
		}
		/* value=$.trim($(".student_condition_value").val());
		if(value==""){
			reminder_box("请输入学员的签发条件");
			return;
		} */
		/* value=$.trim($(".student_grade_value").val());
		if(value==""){
			reminder_box("请输入学员的等级");
			return;
		}  */
		
		value=$.trim($(".student_remarks_value").val());
		if(value==""){
			reminder_box("请输入学员的备注");
			return;
		}
        var data;
		if ('${trainee.id}' == '') {
		    data = {
		        name:$.trim($(".student_name_value").val()),
		        namePy:$.trim($(".student_name_pin_value").val()),
                gender:$(".student_gender_value").val(),
                birthDate:$.trim($(".student_birth_value").val()),
                pic:$("#data_pic").val(),
                phone:$.trim($(".student_tel_value").val()),
                province:$.trim($(".student_pro_type_value").text()),
                city:$.trim($(".student_city_type_value").text()),
                address:$.trim($(".student_position_details_value").val()),
                addresseeName:$.trim($(".addressee_name_value").val()),
                addresseePhone:$.trim($(".addressee_addresseePhone_value").val()),
                addresseeProvince:$.trim($(".addressee_pro_type_value").text()),
                addresseeCity:$.trim($(".addressee_city_type_value").text()),
                addresseeAddress:$.trim($(".addressee_position_details_value").val()),
                certicateNo:$.trim($(".student_id_value").val()),
                issueUnit:$.trim($(".student_sign_value").val()),
                issueDate:$.trim($(".student_sign_date_value").val()),
                validityStartDate:$.trim($(".student_useful_start").val()),
                validityEndDate:$.trim($(".student_useful_end").val()),
                rating:$.trim($(".student_grade_value").text()),
                remarks:$.trim($(".student_remarks_value").val())
			}
		} else {
            data = {
                id:'${trainee.id}',
                name:$.trim($(".student_name_value").val()),
		        namePy:$.trim($(".student_name_pin_value").val()),
                gender:$(".student_gender_value").val(),
                birthDate:$.trim($(".student_birth_value").val()),
                pic:$("#data_pic").val(),
                phone:$.trim($(".student_tel_value").val()),
                province:$.trim($(".student_pro_type_value").text()),
                city:$.trim($(".student_city_type_value").text()),
                address:$.trim($(".student_position_details_value").val()),
                addresseeName:$.trim($(".addressee_name_value").val()),
                addresseePhone:$.trim($(".addressee_addresseePhone_value").val()),
                addresseeProvince:$.trim($(".addressee_pro_type_value").text()),
                addresseeCity:$.trim($(".addressee_city_type_value").text()),
                addresseeAddress:$.trim($(".addressee_position_details_value").val()),
                certicateNo:$.trim($(".student_id_value").val()),
                issueUnit:$.trim($(".student_sign_value").val()),
                issueDate:$.trim($(".student_sign_date_value").val()),
                validityStartDate:$.trim($(".student_useful_start").val()),
                validityEndDate:$.trim($(".student_useful_end").val()),
                rating:$.trim($(".student_grade_value").text()),
                remarks:$.trim($(".student_remarks_value").val())
            }
		}
        $.ajax({
            type: "POST",
            url: "${ctx}/admin/user/site/saveTrainee.json",
            dataType: "json",
            data: data,
            success: function(msg) {
                if(msg.status==1){
                    reminder_box("保存成功");
                    setTimeout(function(){
                        location.href="${ctx}/admin/user/site/student_manage.page";
                    },1500);
                }else{
                    reminder_box(msg.msg);
                }
            }
        });
	});
	
	$(".student_pro_type_value").click(function(){
        $(".student_city_type_value").text("按市区筛选");
		$(".student_pro_type_ul").toggle();
	});
	$(".addressee_pro_type_value").click(function(){
        $(".addressee_city_type_value").text("按市区筛选");
		$(".addressee_pro_type_ul").toggle();
	});
	
	$(".student_city_type_value").click(function(){
		if($.trim($(".student_pro_type_value").text())=="按省份筛选"){
			reminder_box("请先选择省");
			return;
		}
		$(".student_city_type_ul").toggle();
	});
	
	$(".student_grade_value").click(function(){
		$(".student_grade_ul").toggle();
	});
	
	$(".addressee_city_type_value").click(function(){
		if($.trim($(".addressee_pro_type_value").text())=="按省份筛选"){
			reminder_box("请先选择省");
			return;
		}
		$(".addressee_city_type_ul").toggle();
	});
	
	/* 加载省份 */
	/* 加载各省份 */
	
	var province_html='';
	var province_html2='';
	for(var i=0;i<LAreaData.length;i++){
		province_html+='<li class="student_pro_type_li" onclick="student_pro_type_li(this)">'+LAreaData[i].name+'</li>';
		province_html2+='<li class="addressee_pro_type_li" onclick="addressee_pro_type_li(this)">'+LAreaData[i].name+'</li>';
    }
	$(".student_pro_type_ul").html(province_html);
	$(".addressee_pro_type_ul").html(province_html2);

	if ('${trainee.gender}'!='') {
        $(".student_gender_value").val('${trainee.gender}');
	}
})
function student_pro_type_li(e){
	var value=$.trim($(e).text());
	$(".student_pro_type_value").text(value);
	$(".student_pro_type_ul").toggle();
	
	/* 加载市 */
	var city_html='';
	for(var i=0;i<LAreaData.length;i++){
		if(LAreaData[i].name==value){
			for(var j=0;j<LAreaData[i].child.length;j++){
				city_html+='<li class="student_city_type_li" onclick="student_city_type_li(this)">'+LAreaData[i].child[j].name+'</li>';
			}
		}
    }
	$(".student_city_type_ul").html(city_html);
}
function addressee_pro_type_li(e){
	var value=$.trim($(e).text());
	$(".addressee_pro_type_value").text(value);
	$(".addressee_pro_type_ul").toggle();
	
	/* 加载市 */
	var city_html='';
	for(var i=0;i<LAreaData.length;i++){
		if(LAreaData[i].name==value){
			for(var j=0;j<LAreaData[i].child.length;j++){
				city_html+='<li class="addressee_city_type_li" onclick="addressee_city_type_li(this)">'+LAreaData[i].child[j].name+'</li>';
			}
		}
    }
	$(".addressee_city_type_ul").html(city_html);
}
function student_city_type_li(e){
	var value=$.trim($(e).text());
	$(".student_city_type_value").text(value);
	$(".student_city_type_ul").toggle();
}
function addressee_city_type_li(e){
	var value=$.trim($(e).text());
	$(".addressee_city_type_value").text(value);
	$(".addressee_city_type_ul").toggle();
	
}

function student_grade_li(e){
	$(".student_grade_value").text($(e).text().trim());
	$(".student_grade_ul").toggle();
}
</script>
<form action="" method="post" id="student_manage_home">
	
</form>
<div class="back_right_box">
	<h1 class="student_manage_header">学员</h1>
	<div class="student_manage_btn_box">
		<div class="student_manage_btn_back"><img alt="" src="${ctx}/images/icon_back.png" class="student_manage_btn_back_img"><span class="student_manage_btn_back_txt">返回></span></div><span>添加学员</span>
	</div>

	<div class="add_student_manage_content">
		<div class="student_phone_box">
			<span class="student_phone_name">照片</span>
			<div class="student_phone_inner_box">
				<c:choose>
					<c:when test="${empty trainee.pic}">
						<img alt="" src="${ctx}/images/add_pic.png" onclick="pull_out_crop(1,1,$('#img_pic'),$('#data_pic'))" class="add_pic" id="img_pic">
					</c:when>
					<c:otherwise>
						<img alt="" src="${ctx}/${trainee.pic}" class="add_pic" id="img_pic">
					</c:otherwise>
				</c:choose>
				<!-- <input type="file" id="head_img" name="file" accept="image/*" onchange="ajaxFileUpload(this,4,$('#img_pic'),$('#data_pic'))"> -->
			</div>
			
			<!-- 这是编辑时候需要出现替换按钮 -->
			<c:if test="${not empty trainee.pic}">
				<span class="img_cover_change" onclick="pull_out_crop(1,1,$('#img_pic'),$('#data_pic'))">替换图片</span>
			</c:if>
			<input type="hidden" id="data_pic" value="${trainee.pic}">
		</div>
		<div class="student_name_box">
			<span class="student_name">姓名</span><input type="text" class="student_name_value" placeholder="请输入学员的姓名" value="${trainee.name}">
			<span class="student_name_pin">姓名拼音</span><input type="text" class="student_name_pin_value" placeholder="请输入姓名拼音" value="${trainee.namePy}">
			<span class="student_gender_name">性别</span>
			<select class="student_gender_value">
				<option value="男 Male" selected>男/Male</option>
				<option value="女 Female">女/Female</option>
			</select>
			<input type="date" class="student_birth_value"  value="<fmt:formatDate pattern="yyyy-MM-dd" value='${trainee.birthDate}'/>">
			<span class="student_birth">出生年月</span>
		</div>
		<div class="student_position_box">
			<span class="student_pro">户籍地址</span>
			<div class="student_pro_type_box">
				<span class="student_pro_type_value">
					<c:choose>
						<c:when test="${empty trainee.province}">
							按省份筛选
						</c:when>
						<c:otherwise>
							${trainee.province}
						</c:otherwise>
					</c:choose>
				</span>
				<ul class="student_pro_type_ul">
				</ul>
			</div>
			
			<!-- <span class="student_city">市</span> -->
			<div class="student_city_type_box">
				<span class="student_city_type_value">
					<c:choose>
						<c:when test="${empty trainee.city}">
							按市区筛选
						</c:when>
						<c:otherwise>
							${trainee.city}
						</c:otherwise>
					</c:choose>
				</span>
				<ul class="student_city_type_ul">
				</ul>
			</div>
			<span class="student_position_details">详细地址</span>
			<input type="text" class="student_position_details_value" placeholder="请输入学员的详细地址" value="${trainee.address}">

			<input type="number" class="student_tel_value" placeholder="请输入学员的手机号" value="${trainee.phone}">
			<span class="student_tel">手机号</span>
		</div>

		<!-- <div class="student_iden_box">
			<span class="student_iden">身份属性</span><input type="text" class="student_iden_value" placeholder="请输入学员的身份属性" value="">
		</div> -->
		
		<div class="student_addressee_box">
			<span class="addressee_name">收件人姓名</span><input type="text" class="addressee_name_value" placeholder="请输入收件人的姓名" value="${trainee.addresseeName}">
			<span class="addressee_addresseePhone">收件人联系方式</span><input type="number" class="addressee_addresseePhone_value" placeholder="请输入收件人的联系方式" value="${trainee.addresseePhone}">
		</div>
		
		<div class="addressee_position_box">
			<span class="addressee_pro">收件地址</span>
			<div class="addressee_pro_type_box">
				<span class="addressee_pro_type_value">
					<c:choose>
						<c:when test="${empty trainee.addresseeProvince}">
							按省份筛选
						</c:when>
						<c:otherwise>
							${trainee.addresseeProvince}
						</c:otherwise>
					</c:choose>
				</span>
				<ul class="addressee_pro_type_ul">
				</ul>
			</div>
			
			<!-- <span class="addressee_city">市</span> -->
			<div class="addressee_city_type_box">
				<span class="addressee_city_type_value">
					<c:choose>
						<c:when test="${empty trainee.addresseeCity}">
							按市区筛选
						</c:when>
						<c:otherwise>
							${trainee.addresseeCity}
						</c:otherwise>
					</c:choose>
				</span>
				<ul class="addressee_city_type_ul">
				</ul>
			</div>
			<%-- <div class="addressee_district_type_box">
				<span class="addressee_district_type_value">
					<c:choose>
						<c:when test="${empty trainee.addresseeDistrict}">
							按区筛选
						</c:when>
						<c:otherwise>
							${trainee.addresseeDistrict}
						</c:otherwise>
					</c:choose>
				</span>
				<ul class="addressee_district_type_ul">
				</ul>
			</div> --%>
			<span class="addressee_position_details">详细地址</span>
			<input type="text" class="addressee_position_details_value" placeholder="请输入学员的详细地址" value="${trainee.addresseeAddress}">
		</div>
		
		<div class="student_id_box">
			<span class="student_id">合格证编号</span><input type="text" class="student_id_value" placeholder="请输入学员的合格证编号" value="${trainee.certicateNo}">
		</div>
		<div class="student_sign_box">
			<span class="student_sign">签发单位</span><input type="text" class="student_sign_value" value="无锡汉和学院" readonly>
			<input type="date" class="student_sign_date_value" value="<fmt:formatDate pattern="yyyy-MM-dd" value='${trainee.issueDate}'/>">
			<span class="student_sign_date">签发日期</span>
		</div>
		<div class="student_useful_box">
			<span class="student_useful">有效期</span>
			<input type="date" class="student_useful_start" value="<fmt:formatDate pattern="yyyy-MM-dd" value='${trainee.validityStartDate}'/>">
			至<input type="date" class="student_useful_end" value="<fmt:formatDate pattern="yyyy-MM-dd" value='${trainee.validityEndDate}'/>">
		</div>
		<!-- <div class="student_condition_box">
			<span class="student_condition">签发条件</span><input type="text" placeholder="请输入学员的签发条件" class="student_condition_value" value="">
		</div> -->
		
		<div class="student_grade_box">
			<span class="student_grade">合格证等级</span>
			<div class="student_grade_innerbox">
				<span class="student_grade_value">电动单旋翼机长</span>
				<ul class="student_grade_ul" style="display:none">
					<li class="student_grade_li" onclick="student_grade_li(this)">电动单旋翼机长</li>
					<li class="student_grade_li" onclick="student_grade_li(this)">电动单旋翼教员</li>
					<li class="student_grade_li" onclick="student_grade_li(this)">电动多旋翼机长</li>
					<li class="student_grade_li" onclick="student_grade_li(this)">电动多旋翼教员</li>
					<li class="student_grade_li" onclick="student_grade_li(this)">教员（电动单旋翼/电动多旋翼）</li>
					<li class="student_grade_li" onclick="student_grade_li(this)">机长（电动单旋翼/电动多旋翼）</li>
				</ul>
			</div>
			
			<input type="text" class="student_remarks_value" placeholder="请输入学员的备注"  value="${trainee.remarks}"><span class="student_remarks">备注</span>
		</div>
		
		<input type="button" class="add_student_manage_save" value="提交保存">
	</div>	
</div>

<%@ include file="img_crop.jsp"%>