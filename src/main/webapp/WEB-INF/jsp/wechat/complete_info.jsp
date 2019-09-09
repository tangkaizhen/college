<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="common.jsp"%>
<script type="text/javascript" src="${ctx}/js/jquery.md5.js"></script>
<title>汉和学院</title>
<style type="text/css">
.complete_header{
    font-size: 4.8rem;
    text-align: center;
    margin: 6rem 0 2rem;
}
.complete_ul{
    padding: 0 3rem;
}
.complete_li{
	border-bottom: .1rem solid #eee;
    height: 10rem;
}
.complete_li_name{
    border: none;
    font-size: 3rem;
    padding-left: 1rem;
    margin-top: 1.5rem;
    padding: 1.5rem;
    width: 100%;
}
.complete_li_tel{
    border: none;
    font-size: 3rem;
    padding-left: 1rem;
    margin-top: 1.5rem;
    padding: 1.5rem;
    width: 100%;
}
.complete_li_verification{
    border: none;
    font-size: 3rem;
    padding-left: 1rem;
    margin-top: 1.5rem;
    width: 61%;
    padding: 1.5rem;
}
.complete_li_verification_btn{
    float: right;
    font-size: 2.4rem;
    color: #fff;
    width: 14.8rem;
    height: 5.6rem;
    background:#148cd7;
    text-align: center;
    line-height: 5.6rem;
    margin-top: 2rem;
}
.complete_li_img_verification_value{
        border: none;
    font-size: 3rem;
    padding-left: 1rem;
    margin-top: 1.5rem;
    width: 61%;
    padding: 1.5rem;
}
.complete_li_verification_img{
    float: right;
    width: 14.8rem;
    height: 6rem;
    margin-top: 1rem;
}
.user_protocol{
    text-align: right;
    color:#148cd7;
    font-size: 2.4rem;
    margin-top: 2rem;
    padding-right: 2rem;
}
.complete_confirm_btn{
    background:#148cd7;
    border: none;
    color: #fff;
    font-size: 3rem;
    height: 8.8rem;
    line-height: 8.8rem;
    width: 90%;
    margin-left: 5%;
    margin-top: 3rem;
    text-align: center;
}
.complete_scan{
    font-size: 2.8rem;
    color: #148cd7;
    border: .1rem solid #148cd7;
    width: 54%;
    text-align: center;
    height: 7rem;
    line-height: 7rem;
    margin-left: 23%;
    margin-top: 4rem;
}
.user_protocol_box{
    position: fixed;
    z-index: 3;
    background: #fff;
    border-radius: 1rem 1rem 0 0;
    bottom: 0;
    height: 90%;
    overflow-y: auto;
    width: 100%;
}
.user_protocol_header{
    text-align: center;
    font-size: 3.6rem;
    border-bottom: .1rem solid #ccc;
    padding: 2rem 0;
    width: 100%;
    background: #fff;
    position: fixed;
    top: 10%;
    left: 0;
}
.user_protocol_close{
    position: absolute;
    right: 2rem;
    top: 1rem;
    font-size: 3rem;
}
.user_protocol_content{
	
	text-indent: 2em;
    padding: 2.4rem;
    font-size: 2.4rem;
    line-height: 4rem;
    padding-top: 10rem;
    
}
</style>
<script type="text/javascript">
$(function(){
	$(".user_protocol").click(function(){
		$(".bg").show();
		$(".user_protocol_box").show();
	});
	$(".bg").click(function(){
		$(".bg").hide();
		$(".user_protocol_box").hide();
	});
	
	$(".complete_confirm_btn").click(function(){
		var value=$.trim($(".complete_li_name").val());
		if(value==""){
			reminder_box("请输入真实姓名");
			return;
		}
		value=$.trim($(".complete_li_tel").val());
		if(value==""){
			reminder_box("请输入手机号码");
			return;
		}
		
		if(!reg_phone.test(value)){
			reminder_box("请输入正确的手机号。");
			return;
		}
		
		value=$.trim($(".complete_li_verification").val());
		if(value==""){
			reminder_box("请输入手机验证码");
			return;
		}
		value=$.trim($(".complete_li_img_verification_value").val());
		if(value==""){
			reminder_box("请输入图形验证码");
			return;
		}
		
		if(value.length!=4){
			reminder_box("输入的图形验证码格式错误");
			return;
		}
		
		$.ajax({
			   type: "POST",
			   url: "${ctx}/wechat/api/register.json",
			   dataType: "json",
			   data: {name:$.trim($(".complete_li_name").val()),openid:'${openid}',phone:$.trim($(".complete_li_tel").val()),checkCode:$.trim($(".complete_li_verification").val())},
			   success: function(msg){
				   if(msg.status==1){
					   reminder_box("注册成功");
					   setTimeout(function(){
						   location.href="${ctx}/wechat/home";
					   },1000);
				   }else{
					   reminder_box(msg.msg);
				   }
			   }
		})
	});
	
	
	$(".complete_scan").click(function(){
		location.href="${ctx}/wechat/home";
	});
})
/* 点击获取验证码 */
var reg_phone=/^1[2,3,4,5,6,7,8]\d{9}$/;
var timer=null;
var count_down=29;
/* 这主要是防止用户重复点击 */
var click_num=0;
function get_verification(){
	/* 首先判断手机号是否为空，以及各式是否正确 */
	var value=$.trim($(".complete_li_tel").val());
	if(value==""){
		reminder_box("请输入手机号码");
		return;
	}
	if(!reg_phone.test(value)){
		reminder_box("请输入正确的手机号。");
		return;
	}
	
	/* 开始验证图形验证码是否为空和是不是4位 */
	var figure_code_value=$.trim($(".complete_li_img_verification_value").val());	
	if(figure_code_value==""){
		reminder_box("请输入图形验证码");
		return;
	}
	if(figure_code_value.length!=4){
		reminder_box("输入的图形验证码格式错误");
		return;
	}
	
	/* 下面就是和后台交互 */
	//点击获取验证码按钮
	click_num++;		

	if(click_num==1){
		$.post("${ctx}/wechat/api/sendSMS.json",{phone:value,type:1,openid:"${openid}",vCode:figure_code_value},function(result){
			console.log(result);
			if(result.status==1){
				reminder_box("验证码已发送");
				/* 下面是获取验证码的特效 */
				$(".complete_li_verification_btn").css({"background":"#ccc"}).text("验证码发送中").removeAttr("onclick");
				
				timer=setInterval(function(){
					if(count_down<=0){
						click_num=0;
						count_down=29;
						clearInterval(timer);
						$(".complete_li_verification_btn").css({"background":"rgb(43,162,69)"}).attr("onclick","get_verification()");
					}
					count_down--;
					},1000);
				
			}else{
				/* 这时候表示验证码发送异常 */
				click_num=0;
				reminder_box(result.msg);
			};
		},"json");
	}
		
}
function refresh() {
    $(".complete_li_verification_img").attr("src", "${ctx}/wechat/validateImg?"+Math.random());
    $(".complete_li_img_verification_value").val("");
}

</script>
</head>
<body>
<h1 class="complete_header">请完善信息</h1>
<ul class="complete_ul">
	<li class="complete_li">
		<input type="text" maxlength="20" class="complete_li_name" placeholder="请输入真实姓名">
	</li>
	<li class="complete_li">
		<input type="number" class="complete_li_tel" oninput="if(value.length>11)value=value.slice(0,11)" placeholder="请输入手机号码">
	</li>
	<li class="complete_li">
		<input type="text" class="complete_li_img_verification_value" placeholder="请输入图形验证码">
		<img alt="" src="${ctx}/wechat/validateImg" onclick="javascript:refresh();" class="complete_li_verification_img">
	</li>
	<li class="complete_li">
		<input type="text" class="complete_li_verification" placeholder="请输入手机验证码">
		<span class="complete_li_verification_btn" onclick="get_verification()">获取验证码</span>
	</li>
</ul>
<div class="complete_confirm_btn">确定</div>
<p class="user_protocol">《用户服务协议》</p>
<div class="complete_scan">不注册，继续浏览</div>
<div class="bg" style="display:none"></div>
<div class="user_protocol_box" style="display:none">
	<h1 class="user_protocol_header">用户服务协议</h1>
	<!-- <span class="user_protocol_close">X</span> -->
	<div class="user_protocol_content">
	
	<p style=";text-align:justify;text-justify:inter-ideograph">
    <strong><span style="font-family: 宋体"><span style="font-family:宋体">汉和学院</span></span></strong><strong><span style="font-family: &#39;Times New Roman&#39;"><span style="font-family:宋体">与用户共同确认：</span></span></strong><span style=";font-family:Calibri;font-size:16px"><br/></span><strong><span style="font-family: &#39;Times New Roman&#39;">1. <span style="font-family:宋体">用户点击汉和学院注册页面的同意注册按钮并完成注册程序、获得汉和学院账号和密码时，视为用户与汉和学院已达成《汉和学院用户协议》，就用户进入汉和学院</span></span></strong><strong><span style="font-family: 宋体"><span style="font-family:宋体">学习和消费</span></span></strong><strong><span style="font-family: &#39;Times New Roman&#39;"><span style="font-family:宋体">达成本协议的全部约定。</span></span></strong><span style=";font-family:Calibri;font-size:16px"><br/></span><strong><span style="font-family: &#39;Times New Roman&#39;">2. <span style="font-family:宋体">汉和学院及用户均已认真阅读本《汉和学院用户协议》</span><span style="font-family:Times New Roman">(</span><span style="font-family:宋体">下称</span><span style="font-family:Times New Roman">“</span><span style="font-family:宋体">本协议</span><span style="font-family:Times New Roman">”)</span><span style="font-family:宋体">中全部条款（特别是关于汉和学院及用户重大权益的条款）及汉和学院发布的其他全部服务条款和操作规则的内容，对本协议及前述服务条款和规则均以知晓、理解并接受，同意将其作为确定双方权利义务的依据。汉和学院《法律声明》为本协议的必要组成部分，用户接受本协议的同时即视为接受汉和学院《法律声明》的全部内容。</span></span></strong>
</p>
<h4>
    <strong><span style="font-family: 宋体;font-size: 16px"><span style="font-family:宋体">一、定义条款</span> </span></strong>
</h4>
<p style="margin-top:auto;margin-bottom:auto">
    <span style="font-family:Wingdings;font-size:13px">&nbsp;</span><span style=";font-family:Calibri;font-size:14px">1.1.“<span style="font-family:宋体">服务</span><span style="font-family:Calibri">”</span><span style="font-family:宋体">：通过互联网渠道，消费者以合理的价格购买一种商品</span><span style="font-family:Calibri">/</span><span style="font-family:宋体">服务的商业活动。</span></span>
</p>
<p style="margin-top:auto;margin-bottom:auto">
    <span style="font-family:Wingdings;font-size:13px">&nbsp;</span><span style=";font-family:Calibri;font-size:14px">1.2.“<span style="font-family:宋体">汉和学院</span><span style="font-family:Calibri">”</span><span style="font-family:宋体">：无锡</span></span><span style=";font-family:宋体;font-size:14px"><span style="font-family:宋体">汉和航空技术有限</span></span><span style=";font-family:Calibri;font-size:14px"><span style="font-family:宋体">公司运营和管理的网络</span></span><span style=";font-family:宋体;font-size:14px"><span style="font-family:宋体">服务</span></span><span style=";font-family:Calibri;font-size:14px"><span style="font-family:宋体">平台，无锡</span></span><span style=";font-family:宋体;font-size:14px"><span style="font-family:宋体">汉和航空技术有限</span></span><span style=";font-family:Calibri;font-size:14px"><span style="font-family:宋体">公司通过该网络</span></span><span style=";font-family:宋体;font-size:14px"><span style="font-family:宋体">服务</span></span><span style=";font-family:Calibri;font-size:14px"><span style="font-family:宋体">平台为用户和商家提供进网络</span></span><span style=";font-family:宋体;font-size:14px"><span style="font-family:宋体">学习和考核的服务</span></span><span style=";font-family:Calibri;font-size:14px"><span style="font-family:宋体">平台。本协议下文中，</span>“<span style="font-family:宋体">汉和学院</span><span style="font-family:Calibri">”</span><span style="font-family:宋体">指网络</span></span><span style=";font-family:宋体;font-size:14px"><span style="font-family:宋体">服务</span></span><span style=";font-family:Calibri;font-size:14px"><span style="font-family:宋体">平台（</span></span><span style=";font-family:宋体;font-size:14px"><span style="font-family:宋体">公众号</span></span><span style=";font-family:Calibri;font-size:14px"><span style="font-family:宋体">）。</span></span>
</p>
<p style="margin-top:auto;margin-bottom:auto">
    <span style="font-family:Wingdings;font-size:13px">&nbsp;</span><span style=";font-family:Calibri;font-size:14px">1.3.“<span style="font-family:宋体">用户</span><span style="font-family:Calibri">”</span><span style="font-family:宋体">：接受并同意本协议全部条款及汉和学院发布的其他全部服务条款和操作规则、通过汉和学院进行</span></span><span style=";font-family:宋体;font-size:14px"><span style="font-family:宋体">学习和考核</span></span><span style=";font-family:Calibri;font-size:14px"><span style="font-family:宋体">的汉和学院注册会员。</span></span>
</p>
<p style="margin-top:auto;margin-bottom:auto">
    <span style="font-family:Wingdings;font-size:13px">&nbsp;</span><span style=";font-family:Calibri;font-size:14px">1.4.“<span style="font-family:宋体">商家服务者</span><span style="font-family:Calibri">”</span><span style="font-family:宋体">：通过汉和学院发布服务商品</span><span style="font-family:Calibri">/</span><span style="font-family:宋体">服务信息、向用户提供商品</span><span style="font-family:Calibri">/</span><span style="font-family:宋体">服务的自然人、法人和其他组织。</span></span>
</p>
<p style="margin-top:auto;margin-bottom:auto">
    <span style="font-family:Wingdings;font-size:13px">&nbsp;</span><span style=";font-family:Calibri;font-size:14px">1.5.“<span style="font-family:宋体">服务交易</span><span style="font-family:Calibri">”</span><span style="font-family:宋体">：用户与商家通过汉和学院进行的交易商品</span><span style="font-family:Calibri">/</span><span style="font-family:宋体">服务的活动。</span></span>
</p>
<p style="margin-top:auto;margin-bottom:auto">
    <span style="font-family:Wingdings;font-size:13px">&nbsp;</span><span style=";font-family:Calibri;font-size:14px">1.6.“<span style="font-family:宋体">交易信息</span><span style="font-family:Calibri">”</span><span style="font-family:宋体">：商家通过汉和学院发布的，在汉和学院页面上展示的商品</span><span style="font-family:Calibri">/</span><span style="font-family:宋体">服务信息，包括但不限于商品</span><span style="font-family:Calibri">/</span><span style="font-family:宋体">服务的名称、种类、数量、质量、价格、有效期、预约时间、商家地址、服务方式、退换方式、退款条件、售后服务等内容。服务信息在法律上构成商家就商品</span><span style="font-family:Calibri">/</span><span style="font-family:宋体">服务向用户发出的要约。</span></span>
</p>
<p style="margin-top:auto;margin-bottom:auto">
    <span style="font-family:Wingdings;font-size:13px">&nbsp;</span><span style=";font-family:Calibri;font-size:14px">1.7.“<span style="font-family:宋体">服务价款</span><span style="font-family:Calibri">”</span><span style="font-family:宋体">：用户为购买商品</span><span style="font-family:Calibri">/</span><span style="font-family:宋体">服务而应向商家支付的商品</span><span style="font-family:Calibri">/</span><span style="font-family:宋体">服务的对价，服务价款的数额以用户与商家达成的订单中约定的价格及数量为确定依据。</span></span>
</p>
<p style="margin-top:auto;margin-bottom:auto">
    <span style="font-family:Wingdings;font-size:13px">&nbsp;</span><span style=";font-family:Calibri;font-size:14px">1.8.“<span style="font-family:宋体">电子消费凭证</span><span style="font-family:Calibri">”</span><span style="font-family:宋体">：由汉和学院以页面、短信、电子邮件或其他方式向用户发送的电子形式的购货凭证或服务单据，内容为消费订单状态信息，用于证明用户已支付商品</span><span style="font-family:Calibri">/</span><span style="font-family:宋体">服务价款、有权获得所购买的商品</span><span style="font-family:Calibri">/</span><span style="font-family:宋体">服务。</span></span>
</p>
<h4>
    <strong><span style="font-family: 宋体;font-size: 16px"><span style="font-family:宋体">二、用户注册</span></span></strong>
</h4>
<p style="margin-top:auto;margin-bottom:auto">
    <span style="font-family:Wingdings;font-size:13px">&nbsp;</span><span style=";font-family:Calibri;font-size:14px">2.1.<span style="font-family:宋体">注册资格</span></span>
</p>
<p>
    <span style=";font-family:Calibri;font-size:16px"><span style="font-family:宋体">用户承诺：用户具有完全民事权利能力和行为能力或虽不具有完全民事权利能力和行为能力但经其法定代理人同意并由其法定代理人代理注册及应用汉和学院服务。</span></span>
</p>
<p style="margin-top:auto;margin-bottom:auto">
    <span style="font-family:Wingdings;font-size:13px">&nbsp;</span><span style=";font-family:Calibri;font-size:14px">2.2.<span style="font-family:宋体">注册目的</span></span>
</p>
<p>
    <span style=";font-family:Calibri;font-size:16px"><span style="font-family:宋体">用户承诺：用户进行用户注册并非出于违反法律法规或破坏汉和学院网络秩序的目的。</span></span>
</p>
<p style="margin-top:auto;margin-bottom:auto">
    <span style="font-family:Wingdings;font-size:13px">&nbsp;</span><span style=";font-family:Calibri;font-size:14px">2.3.<span style="font-family:宋体">注册流程</span></span>
</p>
<p>
    <span style=";font-family:Calibri;font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.3.1.<span style="font-family:宋体">用户同意根据汉和学院用户注册页面的要求提供有效移动电话号码、邮箱、所在城市等信息，设置汉和学院账号及密码，用户应确保所提供全部信息的真实性、完整性和准确性。</span></span><span style=";font-family:Calibri;font-size:16px"><br/></span><span style=";font-family:Calibri;font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.3.2.<span style="font-family:宋体">用户在注册时有权选择是否订阅汉和学院发送的关于服务信息的电子邮件和</span><span style="font-family:Calibri">/</span><span style="font-family:宋体">或短信息。</span></span><span style=";font-family:Calibri;font-size:16px"><br/></span><span style=";font-family:Calibri;font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.3.3.<span style="font-family:宋体">用户合法、完整并有效提供注册所需信息的，有权获得汉和学院账号和密码，汉和学院账号和密码用于用户在汉和学院进行会员登录。</span></span><span style=";font-family:Calibri;font-size:16px"><br/></span><span style=";font-family:Calibri;font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.3.4.<span style="font-family:宋体">用户获得汉和学院账号及密码时视为用户注册成功，用户同意接收汉和学院发送的与汉和学院网站管理、运营相关的电子邮件和</span><span style="font-family:Calibri">/</span><span style="font-family:宋体">或短消息。</span></span>
</p>
<h4>
    <strong><span style="font-family: 宋体;font-size: 16px"><span style="font-family:宋体">三、用户服务</span></span></strong>
</h4>
<p>
    <span style=";font-family:Calibri;font-size:16px"><span style="font-family:宋体">汉和学院为用户通过汉和学院进行网络交易活动提供网络交易平台服务，目前汉和学院对用户提供的汉和学院网络交易平台服务为免费服务，但汉和学院保留未来对汉和学院网络交易平台服务收取服务费用的权利。</span></span>
</p>
<p style="margin-top:auto;margin-bottom:auto">
    <span style="font-family:Wingdings;font-size:13px">&nbsp;</span><span style=";font-family:Calibri;font-size:14px">3.1.<span style="font-family:宋体">服务内容</span></span>
</p>
<p>
    <span style=";font-family:Calibri;font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.1.1.<span style="font-family:宋体">用户有权在汉和学院浏览商品</span><span style="font-family:Calibri">/</span><span style="font-family:宋体">服务的信息、有权通过汉和学院与商家达成订单、支付价款、获得电子消费凭证等。</span></span><span style=";font-family:Calibri;font-size:16px"><br/></span><span style=";font-family:Calibri;font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.1.2.<span style="font-family:宋体">用户有权在汉和学院查看其汉和学院会员账号下的信息，有权应用汉和学院提供的功能进行操作。</span></span><span style=";font-family:Calibri;font-size:16px"><br/></span><span style=";font-family:Calibri;font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.1.3.<span style="font-family:宋体">用户有权按照汉和学院发布的活动规则参与汉和学院组织的网站活动。</span></span><span style=";font-family:Calibri;font-size:16px"><br/></span><span style=";font-family:Calibri;font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.1.4.<span style="font-family:宋体">汉和学院承诺为用户提供的其他服务。</span></span>
</p>
<p style="margin-top:auto;margin-bottom:auto">
    <span style="font-family:Wingdings;font-size:13px">&nbsp;</span><span style=";font-family:Calibri;font-size:14px">3.2.<span style="font-family:宋体">服务规则</span></span>
</p>
<p>
    <span style=";font-family:Calibri;font-size:16px"><span style="font-family:宋体">用户承诺遵守下列汉和学院服务规则：</span></span><span style=";font-family:Calibri;font-size:16px"><br/></span><span style=";font-family:Calibri;font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.2.1.<span style="font-family:宋体">用户应当遵守法律法规、规章、规范性文件及政策要求的规定，不得在汉和学院或利用汉和学院服务从事非法或其他损害汉和学院或第三方权益的活动，如发送或接收任何违法、违规、违反公序良俗、侵犯他人权益的信息，发送或接收传销材料或存在其他危害的信息或言论，未经汉和学院授权使用或伪造汉和学院电子邮件题头信息等。</span></span><span style=";font-family:Calibri;font-size:16px"><br/></span><span style=";font-family:Calibri;font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.2.2.<span style="font-family:宋体">用户应当遵守法律法规应当谨慎合理使用和妥善保管汉和学院账号及密码，对其汉和学院账号和密码下进行的行为和发生的事件负责。当用户发现汉和学院账号被未经其授权的第三方使用或存在其他账号安全问题时应立即有效通知汉和学院，要求汉和学院暂停该汉和学院账号的服务，并向公安机关报案。汉和学院有权在合理时间内对用户的该等请求采取行动，但对采取行动前用户已经遭受的损失不承担任何责任。用户在未经汉和学院同意的情况下不得将汉和学院账号以赠与、借用、租用、转让或其他方式处分给他人。</span></span><span style=";font-family:Calibri;font-size:16px"><br/></span><span style=";font-family:Calibri;font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.2.3.<span style="font-family:宋体">用户通过汉和学院与商家进行交易时，应当遵守本协议</span><span style="font-family:Calibri">“</span><span style="font-family:宋体">交易规则</span><span style="font-family:Calibri">”</span><span style="font-family:宋体">的全部约定及汉和学院发布的其他关于交易的服务条款和操作规则的全部规定。</span></span><span style=";font-family:Calibri;font-size:16px"><br/></span><span style=";font-family:Calibri;font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.2.4.<span style="font-family:宋体">用户在汉和学院对商品</span><span style="font-family:Calibri">/</span><span style="font-family:宋体">服务进行评价时应当根据实际情况如实进行评价。</span></span><span style=";font-family:Calibri;font-size:16px"><br/></span><span style=";font-family:Calibri;font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.2.5.<span style="font-family:宋体">用户应当按照汉和学院发布的规则参加汉和学院抽奖等活动，遵守活动秩序。</span></span><span style=";font-family:Calibri;font-size:16px"><br/></span><span style=";font-family:Calibri;font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.2.6.<span style="font-family:宋体">汉和学院发布的其他服务条款和操作规则。</span></span>
</p>
<h4>
    <strong><span style="font-family: 宋体;font-size: 16px"><span style="font-family:宋体">四、交易规则</span></span></strong>
</h4>
<p>
    <span style=";font-family:Calibri;font-size:16px"><span style="font-family:宋体">用户承诺在其进入汉和学院消费，通过汉和学院与商家进行交易的过程中良好遵守如下汉和学院交易规则。</span></span>
</p>
<p style="margin-top:auto;margin-bottom:auto">
    <span style="font-family:Wingdings;font-size:13px">&nbsp;</span><span style=";font-family:Calibri;font-size:14px">4.1.<span style="font-family:宋体">浏览交易信息</span></span>
</p>
<p>
    <span style=";font-family:Calibri;font-size:16px"><span style="font-family:宋体">用户在汉和学院浏览商品</span>/<span style="font-family:宋体">服务的信息时，应当仔细阅读商品</span><span style="font-family:Calibri">/</span><span style="font-family:宋体">服务信息中包含的全部内容，包括但不限于商品</span><span style="font-family:Calibri">/</span><span style="font-family:宋体">服务的名称、种类、数量、质量、价格、有效期、预约时间、商家地址、营业时间、服务方式、退换方式、退款条件、售后服务等内容，其中用户应特别注意商品</span><span style="font-family:Calibri">/</span><span style="font-family:宋体">服务的有效期、预约时间及退款条件等内容，用户完全接受信息中包含的全部内容后方可点击购买。</span></span>
</p>
<p style="margin-top:auto;margin-bottom:auto">
    <span style="font-family:Wingdings;font-size:13px">&nbsp;</span><span style=";font-family:Calibri;font-size:14px">4.2.<span style="font-family:宋体">提交及确认订单</span></span>
</p>
<p>
    <span style=";font-family:Calibri;font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.2.1.<span style="font-family:宋体">用户应当仔细阅读订单页面中所包含的全部内容，包括但不限于服务信息中的全部内容、为再次提示用户注意而标明的本单商品</span><span style="font-family:Calibri">/</span><span style="font-family:宋体">服务的有效期、退款条件等内容（如有），选择及确认购买数量、价格、应付总额、用户接收电子消费凭证的联系方式或接收服务的服务地址和服务时间等内容。</span></span><span style=";font-family:Calibri;font-size:16px"><br/></span><span style=";font-family:Calibri;font-size:16px"><span style="font-family:宋体">前述订单页面中所包含的全部内容，构成了用户与商家之间达成的合同的合同内容，用户完全同意订单的全部内容后方可提交订单。</span></span><span style=";font-family:Calibri;font-size:16px"><br/></span><span style=";font-family:Calibri;font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.2.2.<span style="font-family:宋体">用户再次阅读并确认订单的全部内容后方可点击确认订单并付款，用户确认订单即视为用户已知晓、同意并接受订单中的全部内容，与商家成立了合同。订单中所包含的全部内容即为合同的内容，具体包括但不限于商品</span><span style="font-family:Calibri">/</span><span style="font-family:宋体">服务的名称、种类、数量、质量、价格、有效期、预约时间、商家地址、营业时间、服务方式、退换方式、退款条件、售后服务等，用户与商家均应当按照前述服务合同的约定履行各自的权利义务。</span></span>
</p>
<p style="margin-top:auto;margin-bottom:auto">
    <span style="font-family:Wingdings;font-size:13px">&nbsp;</span><span style=";font-family:Calibri;font-size:14px">4.3.<span style="font-family:宋体">支付价款</span></span>
</p>
<p>
    <span style=";font-family:Calibri;font-size:16px"><span style="font-family:宋体">在服务合同成立之后用户应根据付款页面的提示通过网上支付平台完成服务价款的全额或定金支付（选择线下支付的用户除外，在与商家达成协议合同后可进行线下现金支付）。因汉和学院接受商家委托代商家向用户收取服务价款，故用户将服务价款支付给汉和学院且支付成功即视为用户已向商家履行了服务合同项下的服务价款支付义务。选择线上付款用户在支付服务价款之前不得要求商家向用户提供商品</span>/<span style="font-family:宋体">服务。</span></span>
</p>
<p style="margin-top:auto;margin-bottom:auto">
    <span style="font-family:Wingdings;font-size:13px">&nbsp;</span><span style=";font-family:Calibri;font-size:14px">4.4.<span style="font-family:宋体">服务电子消费凭证</span></span>
</p>
<p>
    <span style=";font-family:Calibri;font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.4.1.<span style="font-family:宋体">用户支付服务价款成功后，汉和学院向用户展示消费凭证，用户可按照服务合同的约定凭电子消费凭证向商家主张获得商品</span><span style="font-family:Calibri">/</span><span style="font-family:宋体">服务。</span></span><span style=";font-family:Calibri;font-size:16px"><br/></span><span style=";font-family:Calibri;font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.4.2.<span style="font-family:宋体">用户应当妥善保管服务电子消费凭证，因用户保管不善导致电子消费凭证被他人盗用的，用户要求汉和学院或商家重新认证或提供服务的</span><span style="font-family:Calibri">, </span><span style="font-family:宋体">汉和学院与该商家有权拒绝提供。</span></span><span style=";font-family:Calibri;font-size:16px"><br/></span><span style=";font-family:Calibri;font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.4.3.<span style="font-family:宋体">服务电子消费凭证于发生以下情形之一时即失效：</span></span><span style=";font-family:Calibri;font-size:16px"><br/></span><span style=";font-family:Calibri;font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.4.3.1.<span style="font-family:宋体">确认完成电子消费</span><span style="font-family:Calibri">/</span><span style="font-family:宋体">服务凭证已获得商品</span><span style="font-family:Calibri">/</span><span style="font-family:宋体">服务；</span></span><span style=";font-family:Calibri;font-size:16px"><br/></span><span style=";font-family:Calibri;font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.4.3.2.<span style="font-family:宋体">服务合同内容中约定的有效期届满。</span></span>
</p>
<p>
    <span style=";font-family:Calibri;font-size:16px">4.5.<span style="font-family:宋体">服务争议解决规则</span></span>
</p>
<p>
    <span style=";font-family:Calibri;font-size:16px"><span style="font-family:宋体">如用户与商家因服务合同的履行发生任何争议，包括但不限于对商品</span>/<span style="font-family:宋体">服务的数量、质量、价格、有效期、预约时间、商家地址、服务方式、退换方式、退款条件、售后服务等问题发生争议的，用户应与商家根据服务合同内容的约定确定用户与商家各自的权利义务，承担各自的责任，解决争议。汉和学院可协助用户与商家之间争议的协商调解。</span></span><span style=";font-family:Calibri;font-size:16px"><br/></span><span style=";font-family:Calibri;font-size:16px"><span style="font-family:宋体">用户的权利和义务</span></span>
</p>
<p style="margin-top:auto;margin-bottom:auto">
    <span style="font-family:Wingdings;font-size:13px">&nbsp;</span><span style=";font-family:Calibri;font-size:14px">5.1.<span style="font-family:宋体">用户有权按照本协议约定接受汉和学院提供的汉和学院网络交易平台服务。</span></span>
</p>
<p style="margin-top:auto;margin-bottom:auto">
    <span style="font-family:Wingdings;font-size:13px">&nbsp;</span><span style=";font-family:Calibri;font-size:14px">5.2.<span style="font-family:宋体">用户有权在注册时选择是否订阅汉和学院发送的关于服务信息的电子邮件或短消息，并在注册成功后有权随时订阅或退订汉和学院该等信息。</span></span>
</p>
<p style="margin-top:auto;margin-bottom:auto">
    <span style="font-family:Wingdings;font-size:13px">&nbsp;</span><span style=";font-family:Calibri;font-size:14px">5.3.<span style="font-family:宋体">如用户要求获得商品</span><span style="font-family:Calibri">/</span><span style="font-family:宋体">服务的发票、其他付款凭证、购货凭证或服务单据，有权且应当在对商品</span><span style="font-family:Calibri">/</span><span style="font-family:宋体">服务进行消费时向商家提出，发票金额以实际支付的价款为准。</span></span>
</p>
<p style="margin-top:auto;margin-bottom:auto">
    <span style="font-family:Wingdings;font-size:13px">&nbsp;</span><span style=";font-family:Calibri;font-size:14px">5.4.<span style="font-family:宋体">用户在消费商品</span><span style="font-family:Calibri">/</span><span style="font-family:宋体">服务的过程中，如发现商品</span><span style="font-family:Calibri">/</span><span style="font-family:宋体">服务与订单内容不符或存在质量、服务态度等其他问题的，应与商家采取协商或其他方式予以解决，汉和学院可向用户提供商家的真实网站登记信息并积极协助用户与商家解决争议。</span></span>
</p>
<p style="margin-top:auto;margin-bottom:auto">
    <span style="font-family:Wingdings;font-size:13px">&nbsp;</span><span style=";font-family:Calibri;font-size:14px">5.5.<span style="font-family:宋体">用户有权随时终止使用汉和学院服务。</span></span>
</p>
<p style="margin-top:auto;margin-bottom:auto">
    <span style="font-family:Wingdings;font-size:13px">&nbsp;</span><span style=";font-family:Calibri;font-size:14px">5.6.<span style="font-family:宋体">用户应保证其在注册时和提交订单时所提供的姓名、联系方式、联系地址等全部信息真实、完整、准确，并当上述信息发生变更时及时进行更新提供给汉和学院的信息。</span></span>
</p>
<p style="margin-top:auto;margin-bottom:auto">
    <span style="font-family:Wingdings;font-size:13px">&nbsp;</span><span style=";font-family:Calibri;font-size:14px">5.7.<span style="font-family:宋体">用户在汉和学院进行交易时不得恶意干扰服务的正常进行、破坏汉和学院服务秩序。</span></span>
</p>
<p style="margin-top:auto;margin-bottom:auto">
    <span style="font-family:Wingdings;font-size:13px">&nbsp;</span><span style=";font-family:Calibri;font-size:14px">5.8.<span style="font-family:宋体">用户不得以任何技术手段或其他方式干扰汉和学院的正常运行或干扰其他用户对汉和学院服务的使用。</span></span>
</p>
<p style="margin-top:auto;margin-bottom:auto">
    <span style="font-family:Wingdings;font-size:13px">&nbsp;</span><span style=";font-family:Calibri;font-size:14px">5.9.<span style="font-family:宋体">用户不得以虚构事实等方式恶意诋毁汉和学院或商家的商誉。</span></span>
</p>
<p style="margin-top:auto;margin-bottom:auto">
    <span style="font-family:Wingdings;font-size:13px">&nbsp;</span><span style=";font-family:Calibri;font-size:14px">5.10.<span style="font-family:宋体">用户通过汉和学院进行交易应出于真实消费目的，不得以转售等商业目的进行交易。</span></span>
</p>
<p style="margin-top:auto;margin-bottom:auto">
    <span style="font-family:Wingdings;font-size:13px">&nbsp;</span><span style=";font-family:Calibri;font-size:14px">5.11.<span style="font-family:宋体">用户在付款成功后应配合接收服务或电子消费凭证。</span></span>
</p>
<p style="margin-top:auto;margin-bottom:auto">
    <span style="font-family:Wingdings;font-size:13px">&nbsp;</span><span style=";font-family:Calibri;font-size:14px">5.12.<span style="font-family:宋体">用户不得对商品</span><span style="font-family:Calibri">/</span><span style="font-family:宋体">服务进行虚假评价或虚假投诉。</span></span>
</p>
<p>
    <span style=";font-family:Calibri;font-size:16px"><span style="font-family:宋体">六、汉和学院的权利和义务</span></span>
</p>
<p style="margin-top:auto;margin-bottom:auto">
    <span style="font-family:Wingdings;font-size:13px">&nbsp;</span><span style=";font-family:Calibri;font-size:14px">6.1.<span style="font-family:宋体">如用户不具备本协议约定的注册资格，则汉和学院有权拒绝用户进行注册，对已注册的用户有权注销其汉和学院会员账号，汉和学院因此而遭受损失的有权向前述用户或其法定代理人主张赔偿。同时，汉和学院保留其他任何情况下决定是否接受用户注册的权利。</span></span>
</p>
<p style="margin-top:auto;margin-bottom:auto">
    <span style="font-family:Wingdings;font-size:13px">&nbsp;</span><span style=";font-family:Calibri;font-size:14px">6.2.<span style="font-family:宋体">汉和学院发现账户使用者并非账户初始注册人时，有权中止该账户的使用。</span></span>
</p>
<p style="margin-top:auto;margin-bottom:auto">
    <span style="font-family:Wingdings;font-size:13px">&nbsp;</span><span style=";font-family:Calibri;font-size:14px">6.3.<span style="font-family:宋体">汉和学院通过技术检测、人工抽检等检测方式合理怀疑用户提供的信息错误、不实、失效或不完整时，有权通知用户更正、更新信息或中止、终止为其提供汉和学院服务。</span></span>
</p>
<p style="margin-top:auto;margin-bottom:auto">
    <span style="font-family:Wingdings;font-size:13px">&nbsp;</span><span style=";font-family:Calibri;font-size:14px">6.4.<span style="font-family:宋体">汉和学院有权在发现汉和学院上显示的任何信息存在明显错误时，对信息予以更正。</span></span>
</p>
<p style="margin-top:auto;margin-bottom:auto">
    <span style="font-family:Wingdings;font-size:13px">&nbsp;</span><span style=";font-family:Calibri;font-size:14px">6.5.<span style="font-family:宋体">用户付款成功前，汉和学院有权接受商家委托对订单内容作出变更，如用户接受变更后的内容则用户可确认订单及付款，如用户不接受变更后内容则有权取消订单。用户付款成功后，如确因情况变化导致商家需对订单内容作出变更的，汉和学院有权接受商家委托单方对订单内容作出变更，如用户接受变更则按变更后的订单内容进行消费，如用户不接受变更则用户有权取消订单并要求汉和学院代商家全额退款。</span></span>
</p>
<p style="margin-top:auto;margin-bottom:auto">
    <span style="font-family:Wingdings;font-size:13px">&nbsp;</span><span style=";font-family:Calibri;font-size:14px">6.6.<span style="font-family:宋体">汉和学院保留修改、中止或终止汉和学院服务的权利，汉和学院行使前述权利将按照法律规定的程序及方式告知用户。</span></span>
</p>
<p style="margin-top:auto;margin-bottom:auto">
    <span style="font-family:Wingdings;font-size:13px">&nbsp;</span><span style=";font-family:Calibri;font-size:14px">6.7.<span style="font-family:宋体">汉和学院应当采取必要的技术手段和管理措施保障汉和学院的正常运行，并提供必要、可靠的交易环境和交易服务，维护交易秩序。</span></span>
</p>
<p style="margin-top:auto;margin-bottom:auto">
    <span style="font-family:Wingdings;font-size:13px">&nbsp;</span><span style=";font-family:Calibri;font-size:14px">6.8.<span style="font-family:宋体">如用户连续一年未使用汉和学院会员账号和密码登录美团网，则美团网有权注销用户的汉和学院账号。账号注销后，汉和学院有权将相应的会员名开放给其他用户注册使用。</span></span>
</p>
<p style="margin-top:auto;margin-bottom:auto">
    <span style="font-family:Wingdings;font-size:13px">&nbsp;</span><span style=";font-family:Calibri;font-size:14px">6.9.<span style="font-family:宋体">汉和学院有权在本协议履行期间及本协议终止后保留用户的注册信息及用户应用汉和学院服务期间的全部交易信息，但不得非法使用该等信息。</span></span>
</p>
<p style="margin-top:auto;margin-bottom:auto">
    <span style="font-family:Wingdings;font-size:13px">&nbsp;</span><span style=";font-family:Calibri;font-size:14px">6.10.<span style="font-family:宋体">汉和学院有权随时删除汉和学院网站内各类不符合国家法律法规、规范性文件或汉和学院网站规定的用户评价等内容信息，汉和学院行使该等权利不需提前通知用户。</span></span>
</p>
<h4>
    <strong><span style="font-family: 宋体;font-size: 16px"><span style="font-family:宋体">七、用户信息</span></span></strong>
</h4>
<p style="margin-top:auto;margin-bottom:auto">
    <span style="font-family:Wingdings;font-size:13px">&nbsp;</span><span style=";font-family:Calibri;font-size:14px">7.1.<span style="font-family:宋体">在遵守法律的前提下，为向用户提供优质、便捷的服务，当用户注册汉和学院账户时，或访问汉和学院网站及其相关网站、汉和学院移动设备客户端时，或使用汉和学院提供的服务时，汉和学院可能会记录用户操作的相关信息或采集用户的以下信息：</span></span>
</p>
<p>
    <span style=";font-family:Calibri;font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;7.1.1.<span style="font-family:宋体">在用注册汉和学院账户及使用汉和学院提供的各项服务时，为识别用户的身份，可能要向汉和学院提供一些个人信息（包括但不限于姓名、身份证明、地址、电话号码、电子邮件地址等信息及相关附加信息（如您所在的省份和城市、邮政编码等））。</span></span><span style=";font-family:Calibri;font-size:16px"><br/></span><span style=";font-family:Calibri;font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;7.1.2.<span style="font-family:宋体">如用户使用的汉和学院服务需与用户的银行账户或其他支付工具的账户关联方能实现时，用户需要向汉和学院提供用户的银行账户信息或其他支付工具的账户信息。</span></span><span style=";font-family:Calibri;font-size:16px"><br/></span><span style=";font-family:Calibri;font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;7.1.3.<span style="font-family:宋体">为便于用户查询自己的交易状态或历史记录，汉和学院会保存用户使用汉和学院服务产生的交易信息。</span></span><span style=";font-family:Calibri;font-size:16px"><br/></span><span style=";font-family:Calibri;font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;7.1.4.<span style="font-family:宋体">为更好地识别用户的身份以充分保护用户的账户安全，当用户访问汉和学院网站及其相关网站、汉和学院移动设备客户端时，或使用汉和学院提供的服务时，汉和学院可能会记录用户操作的相关信息，包括但不限于用户的计算机</span><span style="font-family:Calibri">IP</span><span style="font-family:宋体">地址、设备标识符、硬件型号、操作系统版本、用户的位置以及与汉和学院服务相关的日志信息。</span></span><span style=";font-family:Calibri;font-size:16px"><br/></span><span style=";font-family:Calibri;font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;7.1.5.<span style="font-family:宋体">除上述信息外，汉和学院还可能为了提供服务及改进服务质量的合理需要而收集用户的其他信息，包括用户与汉和学院的客户服务团队联系时用户提供的相关信息，用户参与问卷调查时向汉和学院发送的问卷答复信息，以及用户与汉和学院及汉和学院关联公司互动时汉和学院收集的相关信息。与此同时，为提高用户使用汉和学院提供的服务的安全性，更准确地预防钓鱼网站欺诈和木马病毒，汉和学院可能会通过了解一些用户的网络使用习惯、用户常用的软件信息等手段来判断用户账户的风险，并可能会记录一些汉和学院认为有风险的</span><span style="font-family:Calibri">URL</span><span style="font-family:宋体">。</span></span><span style=";font-family:Calibri;font-size:16px"><br/></span><span style=";font-family:Calibri;font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;7.2.<span style="font-family:宋体">为保障用户的信息安全，汉和学院一直并将继续努力采取各种合理的物理、电子和管理方面的安全措施来保护用户信息，使用户的信息不会被泄漏、毁损或者丢失，包括但不限于信息加密存储、数据中心的访问控制。汉和学院对可能接触到用户的信息的员工或外包人员也采取了严格管理，包括但不限于根据岗位的不同设置不同的权限，与员工签署保密协议等措施。</span></span><span style=";font-family:Calibri;font-size:16px"><br/></span><span style=";font-family:Calibri;font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;7.3.<span style="font-family:宋体">在遵守法律的前提下，为向用户提供服务及提升服务质量，汉和学院会把用户的信息用于下列用途：</span></span><span style=";font-family:Calibri;font-size:16px"><br/></span><span style=";font-family:Calibri;font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;7.3.1.<span style="font-family:宋体">向用户提供汉和学院的各项服务及客户服务，并维护、改进这些服务。</span></span><span style=";font-family:Calibri;font-size:16px"><br/></span><span style=";font-family:Calibri;font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;7.3.2.<span style="font-family:宋体">比较信息的准确性，并与第三方进行验证。例如，将用户向汉和学院提交的身份信息与身份验证的服务机构进行验证。</span></span><span style=";font-family:Calibri;font-size:16px"><br/></span><span style=";font-family:Calibri;font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;7.3.3.<span style="font-family:宋体">为使用户知晓自己使用汉和学院服务的情况或了解汉和学院的服务，向用户发送服务状态的通知、营销活动及其他商业性电子信息。</span></span><span style=";font-family:Calibri;font-size:16px"><br/></span><span style=";font-family:Calibri;font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;7.3.4.<span style="font-family:宋体">对汉和学院用户的身份数据、交易信息等进行综合统计、分析或加工，并出于服务、奖励或为了让用户拥有更广泛的社交圈的需要而使用、共享或披露；例如汉和学院可能会统计某个时间段注册汉和学院账户的新用户，对这些新用户提供专享的优惠活动。</span></span><span style=";font-family:Calibri;font-size:16px"><br/></span><span style=";font-family:Calibri;font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;7.3.5.<span style="font-family:宋体">预防或禁止非法的活动。</span></span><span style=";font-family:Calibri;font-size:16px"><br/></span><span style=";font-family:Calibri;font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;7.3.6.<span style="font-family:宋体">经用户许可的其他用途。</span></span>
</p>
<p style="margin-top:auto;margin-bottom:auto">
    <span style="font-family:Wingdings;font-size:13px">&nbsp;</span><span style=";font-family:Calibri;font-size:14px">7.4.Cookie<span style="font-family:宋体">（储存在用户本地终端上的数据）的使用</span></span>
</p>
<p>
    <span style=";font-family:Calibri;font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;7.4.1.<span style="font-family:宋体">为使用户获得更轻松的访问体验，用户访问汉和学院网站或使用汉和学院提供的服务时，汉和学院可能会通过小型数据文件识别用户的身份，帮用户省去重复输入注册信息的步骤，或者帮助判断用户的账户安全。这些数据文件可能是</span><span style="font-family:Calibri">Cookie</span><span style="font-family:宋体">，</span><span style="font-family:Calibri">Flash Cookie</span><span style="font-family:宋体">，或用户的浏览器或关联应用程序提供的其他本地存储（统称</span><span style="font-family:Calibri">“Cookie”</span><span style="font-family:宋体">）。</span></span><span style=";font-family:Calibri;font-size:16px"><br/></span><span style=";font-family:Calibri;font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;7.4.2.<span style="font-family:宋体">请用户理解，汉和学院的某些服务只能通过使用</span><span style="font-family:Calibri">“Cookie”</span><span style="font-family:宋体">才可得到实现。如果用户的浏览器或浏览器附加服务允许，用户可以修改对</span><span style="font-family:Calibri">Cookie</span><span style="font-family:宋体">的接受程度或者拒绝汉和学院的</span><span style="font-family:Calibri">Cookie</span><span style="font-family:宋体">，但这一举动在某些情况下可能会影响用户安全访问汉和学院网站和使用汉和学院提供的服务。</span></span>
</p>
<h4>
    <strong><span style="font-family: 宋体;font-size: 16px"><span style="font-family:宋体">八、特别声明</span></span></strong>
</h4>
<p>
    <span style=";font-family:Calibri;font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;8.1.<span style="font-family:宋体">用户未通过汉和学院与商家之间进行的交易不属于汉和学院交易，汉和学院对不属于汉和学院交易的交易事项不承担任何责任，用户不得因其与商家之间因此类交易发生的任何争议投诉汉和学院或要求汉和学院承担任何责任。不属于汉和学院交易的情况具体包括：用户未在汉和学院与商家成立订单；用户虽在汉和学院与商家成立订单，但未通过汉和学院而直接向商家支付价款。</span></span><span style=";font-family:Calibri;font-size:16px"><br/></span><span style=";font-family:Calibri;font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;8.2.<span style="font-family:宋体">不论在何种情况下，汉和学院对由于信息网络设备维护、信息网络连接故障、电脑、通讯或其他系统的故障、电力故障、罢工、劳动争议、暴乱、起义、骚乱、生产力或生产资料不足、火灾、洪水、风暴、爆炸、战争、政府行为、司法行政机关的命令、其他不可抗力或第三方的不作为而造成的不能服务或延迟服务不承担责任。</span></span>
</p>
<p style="margin-top:auto;margin-bottom:auto">
    <span style="font-family:Wingdings;font-size:13px">&nbsp;</span><span style=";font-family:Calibri;font-size:14px">8.3.<span style="font-family:宋体">作弊、扰乱交易秩序的情况</span></span>
</p>
<p>
    <span style=";font-family:Calibri;font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;8.3.1.<span style="font-family:宋体">除活动规则另有规定外，每次活动中，每个用户只限参加一次活动（活动包括并不限于促销优惠、秒杀、抽奖等等），每个用户只能中奖一次。同一手机、同一联系方式、同一</span><span style="font-family:Calibri">IP</span><span style="font-family:宋体">地址、同一汉和学院账户、同一身份证件、同一银行卡号、同一收货地址、同一终端设备号或其他可以合理显示为同一用户的情形，均视为同一用户。</span></span><span style=";font-family:Calibri;font-size:16px"><br/></span><span style=";font-family:Calibri;font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;8.3.2.<span style="font-family:宋体">活动期间，如发现有用户通过不正当手段（包括但不限于侵犯第三人合法权益、作弊、扰乱系统、实施网络攻击、恶意套现、刷信誉、批量注册、用机器注册汉和学院账户、用机器模拟客户端）参加活动而有碍其他用户公平参加本次活动或有违反活动目的之行为，活动举办方有权取消其获奖资格或其因参加活动所获赠品或权益。如该作弊行为给活动举办方造成损失的，活动举办方保留追究赔偿的权利。</span></span><span style=";font-family:Calibri;font-size:16px"><br/></span><span style=";font-family:Calibri;font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;8.3.3.<span style="font-family:宋体">对于恶意进行注册，反复交易退款，侵害汉和学院实际经营交易的情况，汉和学院会停止服务、封停账号并追究责任。</span></span>
</p>
<h4>
    <strong><span style="font-family: 宋体;font-size: 16px"><span style="font-family:宋体">九、知识产权</span></span></strong>
</h4>
<p>
    <span style=";font-family:Calibri;font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;9.1.<span style="font-family:宋体">汉和学院所包含的全部智力成果包括但不限于数据库、网站设计、文字和图表、软件、照片、录像、音乐、声音及其前述组合，软件编译、相关源代码和软件 </span><span style="font-family:Calibri">(</span><span style="font-family:宋体">包括小应用程序和脚本</span><span style="font-family:Calibri">) </span><span style="font-family:宋体">的知识产权权利均归汉和学院所有。用户不得为商业目的复制、更改、拷贝、发送或使用前述任何材料或内容。</span></span>
</p>
<p style="margin-top:auto;margin-bottom:auto">
    <span style="font-family:Wingdings;font-size:13px">&nbsp;</span><span style=";font-family:Calibri;font-size:14px">9.2.<span style="font-family:宋体">汉和学院名称中包含的所有权利 </span><span style="font-family:Calibri">(</span><span style="font-family:宋体">包括商誉和商标</span><span style="font-family:Calibri">) </span><span style="font-family:宋体">均归汉和学院所有。</span></span>
</p>
<p>
    <span style=";font-family:Calibri;font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;9.3.<span style="font-family:宋体">用户接受本协议即视为用户主动将其在汉和学院发表的任何形式的信息的著作权，包括但不限于：复制权、发行权、出租权、展览权、表演权、放映权、广播权、信息网络传播权、摄制权、改编权、翻译权、汇编权以及应当由著作权人享有的其他可转让权利无偿独家转让给汉和学院所有，汉和学院有权利就任何主体侵权单独提起诉讼并获得全部赔偿。本协议属于《中华人民共和国著作权法》第二十五条规定的书面协议，其效力及于用户在汉和学院发布的任何受著作权法保护的作品内容，无论该内容形成于本协议签订前还是本协议签订后。</span></span><span style=";font-family:Calibri;font-size:16px"><br/></span><span style=";font-family:Calibri;font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;9.4.<span style="font-family:宋体">用户在使用汉和学院服务过程中不得非法使用或处分汉和学院或他人的知识产权权利。用户不得将已发表于汉和学院的信息以任何形式发布或授权其它网站（及媒体）使用。</span></span>
</p>
<h4>
    <strong><span style="font-family: 宋体;font-size: 16px"><span style="font-family:宋体">十、客户服务</span></span></strong>
</h4>
<p>
    <span style=";font-family:Calibri;font-size:16px"><span style="font-family:宋体">汉和学院建立专业的客服团队，并建立完善的客户服务制度，从技术、人员和制度上保障用户提问及投诉渠道的畅通，为用户提供及时的疑难解答与投诉反馈。</span></span>
</p>
<h4>
    <strong><span style="font-family: 宋体;font-size: 16px"><span style="font-family:宋体">十一、协议的变更和终止</span></span></strong>
</h4>
<p style="margin-top:auto;margin-bottom:auto">
    <span style="font-family:Wingdings;font-size:13px">&nbsp;</span><span style=";font-family:Calibri;font-size:14px">11.1.<span style="font-family:宋体">协议的变更</span></span>
</p>
<p>
    <span style=";font-family:Calibri;font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-family:宋体">汉和学院有权对本协议内容或汉和学院发布的其他服务条款及操作规则的内容进行变更，汉和学院将按照法律规定的程序及方式发布公告。如用户继续使用汉和学院提供的服务即视为用户同意该等内容变更，如用户不同意变更后的内容则用户有权注销汉和学院账户、停止使用汉和学院服务。</span></span>
</p>
<p style="margin-top:auto;margin-bottom:auto">
    <span style="font-family:Wingdings;font-size:13px">&nbsp;</span><span style=";font-family:Calibri;font-size:14px">11.2.<span style="font-family:宋体">协议的终止</span></span>
</p>
<p>
    <span style=";font-family:Calibri;font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;11.2.1.<span style="font-family:宋体">汉和学院有权依据本协议约定注销用户的汉和学院账号，本协议于账号注销之日终止。</span></span><span style=";font-family:Calibri;font-size:16px"><br/></span><span style=";font-family:Calibri;font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;11.2.2.<span style="font-family:宋体">汉和学院有权终止全部汉和学院服务，本协议于汉和学院全部服务依法定程序及方式终止之日终止。</span></span><span style=";font-family:Calibri;font-size:16px"><br/></span><span style=";font-family:Calibri;font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;11.2.3.<span style="font-family:宋体">本协议终止后，用户不得要求汉和学院继续向其提供任何服务或履行任何其他义务，包括但不限于要求汉和学院为用户保留或向用户披露其原汉和学院账号中的任何信息，向用户或第三方转发任何其未曾阅读或发送过的信息等。</span></span><span style=";font-family:Calibri;font-size:16px"><br/></span><span style=";font-family:Calibri;font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;11.2.4.<span style="font-family:宋体">本协议的终止不影响守约方向违约方追究违约责任。</span></span>
</p>
<h4>
    <strong><span style="font-family: 宋体;font-size: 16px"><span style="font-family:宋体">十二、违约责任</span></span></strong>
</h4>
<p>
    <span style=";font-family:Calibri;font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;12.1.<span style="font-family:宋体">汉和学院或用户违反本协议的约定即构成违约，违约方应当向守约方承担违约责任。</span></span><span style=";font-family:Calibri;font-size:16px"><br/></span><span style=";font-family:Calibri;font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;12.2.<span style="font-family:宋体">如用户违反本协议约定，以转售等商业目的进行交易，则汉和学院有权代商家取消相关交易，并有权注销其汉和学院账号，终止为其提供汉和学院服务，如汉和学院因此而遭受损失的，有权要求用户赔偿损失。</span></span><span style=";font-family:Calibri;font-size:16px"><br/></span><span style=";font-family:Calibri;font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;12.3.<span style="font-family:宋体">如因用户提供的信息不真实、不完整或不准确给汉和学院或商家造成损失的，汉和学院有权要求用户对汉和学院或对商家进行损失的赔偿。</span></span><span style=";font-family:Calibri;font-size:16px"><br/></span><span style=";font-family:Calibri;font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;12.4.<span style="font-family:宋体">如因用户违反法律法规规定或本协议约定，在汉和学院或利用汉和学院服务从事非法活动的，汉和学院有权立即终止继续对其提供汉和学院服务，注销其账号，并要求其赔偿由此给汉和学院造成的损失。</span></span><span style=";font-family:Calibri;font-size:16px"><br/></span><span style=";font-family:Calibri;font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;12.5.<span style="font-family:宋体">如用户以技术手段干扰汉和学院的运行或干扰其他用户对汉和学院使用的，汉和学院有权立即注销其汉和学院账号，并有权要求其赔偿由此给汉和学院造成的损失。</span></span><span style=";font-family:Calibri;font-size:16px"><br/></span><span style=";font-family:Calibri;font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;12.6.<span style="font-family:宋体">如用户以虚构事实等方式恶意诋毁汉和学院或商家的商誉，汉和学院有权要求用户向汉和学院或商家公开道歉，赔偿其给汉和学院或商家造成的损失，并有权终止对其提供汉和学院服务。</span></span>
</p>
<h4>
    <strong><span style="font-family: 宋体;font-size: 16px"><span style="font-family:宋体">十三、争议解决</span></span></strong>
</h4>
<p>
    <span style=";font-family:Calibri;font-size:16px"><span style="font-family:宋体">用户与汉和学院因本协议的履行发生争议的应通过友好协商解决，协商解决不成的，任一方有权将争议提交无锡仲裁委员会依据该会仲裁规则进行仲裁。</span></span>
</p>
<h4>
    <strong><span style="font-family: 宋体;font-size: 16px"><span style="font-family:宋体">十四、协议生效</span></span></strong>
</h4>
<p style=";text-align:justify;text-justify:inter-ideograph">
    <span style=";font-family:Calibri;font-size:16px"><span style="font-family:宋体">本协议于用户点击汉和学院注册页面的同意注册并完成注册程序、获得汉和学院账号和密码时生效，对汉和学院和用户均具有约束力。</span></span><span style=";font-family:Calibri;font-size:16px"><br/></span><span style=";font-family:Calibri;font-size:16px"><span style="font-family:宋体">本协议于</span>2018<span style="font-family:宋体">年</span><span style="font-family:Calibri">12</span><span style="font-family:宋体">月</span><span style="font-family:Calibri">1</span><span style="font-family:宋体">日发布。</span></span>
</p>
<p>
    <span style=";font-family:Calibri;font-size:14px">&nbsp;</span>
</p>
<p>
    <br/>
</p></div>
</div>
</body>
</html>