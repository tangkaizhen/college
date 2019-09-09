<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<style>
<!--

-->

/* 底部导航条样式 */
.bottom_navigation_ul{
    position: fixed;
    bottom: 0;
    width: 100%;
    border-top: .1rem solid #ccc;
    background:#fff;
    z-index: 4;
    left:0
}
.bottom_navigation_li{
    width: 25%;
    float: left;
    height: 9rem;
    text-align: center;
    padding-top: 5.3rem;
    font-size: 2.5rem;
}
.bottom_navigation_li:nth-child(1){
	background:url(${ctx}/images/icon_home.png) no-repeat center 20%;
	background-size: 4rem;
}

.bottom_navigation_li:nth-child(4){
	background:url(${ctx}/images/icon_my.png) no-repeat center 20%;
	background-size: 4rem;
}
.bottom_navigation_li:nth-child(3){
	background:url(${ctx}/images/icon_expert.png) no-repeat center 20%;
	background-size: 4rem;
}
.bottom_navigation_li:nth-child(3).index{
	background:url(${ctx}/images/icon_expert_r.png) no-repeat center 20%;
	background-size: 4rem;
	color: #148cd7;
}
.bottom_navigation_li:nth-child(2){
	background:url(${ctx}/images/icon_encyclopedia.png) no-repeat center 20%;
	background-size: 4rem;
}

.bottom_navigation_li:nth-child(1).index{
	background:url(${ctx}/images/icon_home_r.png) no-repeat center 20%;
	color: #148cd7;
	background-size: 4rem;
}
.bottom_navigation_li:nth-child(4).index{
	background:url(${ctx}/images/icon_my_r.png) no-repeat center 20%;
	color: #148cd7;
	background-size: 4rem;
}
.bottom_navigation_li:nth-child(2).index{
	background:url(${ctx}/images/icon_encyclopedia_r.png) no-repeat center 20%;
	color: #148cd7;
	background-size: 4rem;
}
</style>

	
<ul class="bottom_navigation_ul">
	<li class="bottom_navigation_li">
		首页
	</li>
	<li class="bottom_navigation_li">
		干货
	</li>
	<li class="bottom_navigation_li">
		大咖
	</li>
	<li class="bottom_navigation_li">
		我的
	</li>
</ul>
<script type="text/javascript">
var ifVisitor=false;
$(function(){
	var arr_cookie=document.cookie.split("; ");
    if(arr_cookie.length>=1){
	    /* 循环遍历数组，找出index_cookie */
	    for(var i=0;i<arr_cookie.length;i++){
	    	
	    	var arr_cookie_name=arr_cookie[i].split("=")[0];
	    	if(arr_cookie_name=="visitor_cookie"){
	    		/* 表示这是首页存放的的visitor_cookie */    		
	    		ifVisitor=true;
	    	}
	    }                                     
    }


    $(".bottom_navigation_li").click(function () {
    	
        $(this).addClass("index").siblings().removeClass("index");
        var value = $.trim($(this).text());
        
        if (value == "首页") {
            location.href = '${ctx}/wechat/home';
        } else if (value == "干货") {
        	if(isVisitor()){
        		return;
        	}
            location.href = '${ctx}/wechat/wikis';
        } else if (value == "大咖") {
        	if(isVisitor()){
        		return;
        	}
            location.href = '${ctx}/wechat/families';
        } else if (value == "我的") {
        	if(isVisitor()){
        		return;
        	}
            location.href = '${ctx}/wechat/mine';
        }
    });
	
})
</script>