<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 裁切图片css -->
<link rel="stylesheet" href="${ctx}/css/cropper.min.css">
<link rel="stylesheet" href="${ctx}/css/ImgCropping.css">
<style>
.reminder_box{
	z-index:100000000000
}
</style>

<!--图片裁剪框 start-->
<div style="display: none" class="tailoring-container">
    <div class="black-cloth" onClick="closeTailor(this)"></div>
    <div class="tailoring-content">
            <div class="tailoring-content-one">
                <label title="上传图片" for="chooseImg" class="l-btn choose-btn">
                    <input type="file" accept="image/jpg,image/jpeg,image/png" name="file" id="chooseImg" class="hidden" onChange="selectImg(this)">
                    选择图片
                </label>
                <div class="close-tailoring"  onclick="closeTailor(this)">×</div>
            </div>
            <div class="tailoring-content-two">
                <div class="tailoring-box-parcel">
                    <img id="tailoringImg">
                </div>
                <div class="preview-box-parcel">
                    <p>图片预览：</p>
                    <div class="square previewImg"></div>
                    <!--<div class="circular previewImg"></div>-->
                </div>
            </div>
            <div class="tailoring-content-three">
                <button class="l-btn cropper-reset-btn">复位</button>
                <button class="l-btn cropper-rotate-btn">旋转</button>
                <button class="l-btn cropper-scaleX-btn">换向</button>
                <button class="l-btn sureCut" id="sureCut">确定</button>
            </div>
        </div>
</div>

<!-- 裁切图片js -->
<script type="text/javascript" src="${ctx}/js/cropper.min.js"></script>
<script type="text/javascript">

    //弹出框水平垂直居中
    (window.onresize = function () {
        var win_height = $(window).height();
        var win_width = $(window).width();
        if (win_width <= 768){
            $(".tailoring-content").css({
                "top": (win_height - $(".tailoring-content").outerHeight())/2,
                "left": 0
            });
        }else{
            $(".tailoring-content").css({
                "top": (win_height - $(".tailoring-content").outerHeight())/2,
                "left": (win_width - $(".tailoring-content").outerWidth())/2
            });
        }
    })();
function pull_out_crop(num1,num2,show_input,hidden_input){
	$("#sureCut").off("click");
	/* 对裁切工具初始化 */
	aspectRatio(num1,num2);
	
	$('#tailoringImg').cropper('setAspectRatio',num1/num2);
	
	$(".tailoring-container").toggle();
	
	//裁剪后的处理
    $("#sureCut").on("click",function () {
        if ($("#tailoringImg").attr("src") == null ){
            return false;
        }else{
        	
            var cas = $('#tailoringImg').cropper('getCroppedCanvas');//获取被裁剪后的canvas
            var base64url = cas.toDataURL('image/jpeg'); //转换为base64地址形式
            
            /* 加个控制图片大小的方法，如果超过2m。就不让输入 */
            var tag="base64,";
			var baseStr=base64url.substring(base64url.indexOf(tag)+tag.length);
			var eqTagIndex=baseStr.indexOf("=");
			baseStr=eqTagIndex!=-1?baseStr.substring(0,eqTagIndex):baseStr;
			var strLen=baseStr.length;
			
			var fileSize=(strLen-(strLen/8)*2)/1024/1024;
			if(fileSize>=2){
				/* 提示文件太大 */
				reminder_box("图片不能超过2M");
				return;
			}else{
	            hidden_input.val(base64url);//显示为图片的形式
	            show_input.prop("src",base64url);//显示为图片的形式
	            
			}
			
        }
      //关闭裁剪框
        closeTailor();
    });
}    

function aspectRatio(num1,num2){
	//cropper图片裁剪
    $('#tailoringImg').cropper({
    	aspectRatio: num1/num2,//默认比例
        preview: '.previewImg',//预览视图
        guides: false,  //裁剪框的虚线(九宫格)
        autoCropArea: 0.5,  //0-1之间的数值，定义自动剪裁区域的大小，默认0.8
        movable: false, //是否允许移动图片
        dragCrop: true,  //是否允许移除当前的剪裁框，并通过拖动来新建一个剪裁框区域
        movable: true,  //是否允许移动剪裁框
        resizable: true,  //是否允许改变裁剪框的大小
        zoomable: false,  //是否允许缩放图片大小
        mouseWheelZoom: false,  //是否允许通过鼠标滚轮来缩放图片
        touchDragZoom: true,  //是否允许通过触摸移动来缩放图片
        rotatable: true,  //是否允许旋转图片
        crop: function(e) {
            // 输出结果数据裁剪图像。
        }
    });
}

    //图像上传
    function selectImg(file) {
        if (!file.files || !file.files[0]){
            return;
        }
        
        var reader = new FileReader();
        reader.onload = function (evt) {
            var replaceSrc = evt.target.result;
            //更换cropper的图片
            $('#tailoringImg').cropper('replace', replaceSrc,false);//默认false，适应高度，不失真
        }
        reader.readAsDataURL(file.files[0]);
    }
    
    
    //旋转
    $(".cropper-rotate-btn").on("click",function () {
        $('#tailoringImg').cropper("rotate", 45);
    });
    //复位
    $(".cropper-reset-btn").on("click",function () {
        $('#tailoringImg').cropper("reset");
    });
    //转向
    var flagX = true;
    $(".cropper-scaleX-btn").on("click",function () {
        if(flagX){
            $('#tailoringImg').cropper("scaleX", -1);
            flagX = false;
        }else{
            $('#tailoringImg').cropper("scaleX", 1);
            flagX = true;
        }
        flagX != flagX;
    });

    //关闭裁剪框
    function closeTailor() {
        $(".tailoring-container").toggle();
    }
</script>
