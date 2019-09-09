//看看浏览器是不是IE9以下，如果是IE9以上强制升级
if(navigator.appName == "Microsoft Internet Explorer"&&parseInt(navigator.appVersion.split(";")[1].replace(/[ ]/g, "").replace("MSIE",""))<9){
  var r=confirm("您的浏览器版本过低，请下载IE9及以上版本")
        if (r==true){
          //跳转到升级浏览器界面
        	location.href="https://support.microsoft.com/zh-cn/help/17621/internet-explorer-downloads";
          }
        else
          {
        	window.close();
          }
}
$(function(){
	
	
}) 
/*点击页码改变其颜色*/
$(".page_box li").click(function(){
	$(this).addClass("index").siblings().removeClass("index");
});

function reminder_box(txt){
	$(".reminder_box").text(txt);
	$(".reminder_box").fadeIn();
	setTimeout(function(){
		$(".reminder_box").fadeOut();
	},1000); 
}	

/* 判断是否有小数 */
function isDot(num) {
    var result = (num.toString()).indexOf(".");
    if(result != -1) {
    	return true;
    } else {
    	return false;
    	
    }
}

//JavaScript Document
var phoneWidth =  parseInt(window.screen.width);
var phoneScale = phoneWidth/640;
var ua = navigator.userAgent;
if (/Android (\d+\.\d+)/.test(ua)){
     var version = parseFloat(RegExp.$1);
     if(version>2.3){
    	 
         document.write('<meta name="viewport" content="width=640, minimum-scale = '+phoneScale+', maximum-scale = '+phoneScale+', target-densitydpi=device-dpi">');
         
     }else{
         document.write('<meta name="viewport" content="width=640, target-densitydpi=device-dpi">');
     }
}else{
     document.write('<meta name="viewport" content="width=640, user-scalable=no, target-densitydpi=device-dpi">');
}
 
 //获取 CKEditor 中的内容
 function getContent() {
     return content = CKEDITOR.instances.TextArea1.getData();
 }
 
 function setContent(value) {
	 return content = CKEDITOR.instances.TextArea1.setData(value);
 }