/**
 * @license Copyright (c) 2003-2018, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */
CKEDITOR.editorConfig = function( config ) {
	$(".cke_button_icon.cke_button__image_icon").click(function(){
		alert(1);
	});
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	config.language = 'zh-cn';
	config.toolbarCanCollapse = false;
	// 取消 “拖拽以改变尺寸”功能
	config.resize_enabled = false;
	
	config.startupMode ='wysiwyg';
	// 编辑器的z-index值
    config.baseFloatZIndex = 10000;
    //当从word里复制文字进来时，是否进行文字的格式化去除 plugins/pastefromword/plugin.js
    
    //默认为忽略格式
    /*config.pasteFromWordIgnoreFontFace = false; 
    config.pasteFromWordRemoveFontStyles = false;
    config.pasteFromWordRemoveStyles = false;*/
    CKEDITOR.config.pasteFilter=null; //粘贴过滤器设置为null 即可 
    
    // 设置快捷键
    // 用于实现Ctrl + V进行粘贴
    // 无此配置，无法进行快捷键粘贴
    /*config.keystrokes = [
     [CKEDITOR.CTRL + 86, 'paste']
    ];*/
     
    // 设置快捷键，可能与浏览器冲突plugins/keystrokes/plugin.js
    // 用于实现Ctrl + V进行粘贴
  //设置快捷键 可能与浏览器快捷键冲突 plugins/keystrokes/plugin.js.
    //config.blockedKeystrokes = [
    //CKEDITOR.CTRL + 66 /*B*/,
    //CKEDITOR.CTRL + 73 /*I*/,
    //CKEDITOR.CTRL + 85 /*U*/,
    //]
    config.tabSpaces = 3;
    // 图片上传相关
    config.filebrowserImageUploadUrl = ctx + '/upload/uploadCKImg'; // 图片上传路径
    config.image_previewText = ' '; // 图片信息面板预览区内容的文字内容，默认显示CKEditor自带的内容
    config.removeDialogTabs = 'image:advanced;image:Link,image:Upload,image:info'; // 移除图片上传页面的'高级','链接'页签
    //文本对齐方式
    //config.extraPlugins = "justify,showblocks";
  //添加中文字体
    //config.font_names=" 宋体/宋体;黑体/黑体;楷体/楷体 常规;";
    config.font_names='宋体;新宋体;仿宋;楷体;黑体;微软雅黑';
	config.toolbarGroups = [
	                		{ name: 'document', groups: [ 'mode', 'document', 'doctools' ] },
	                		{ name: 'clipboard', groups: [ 'clipboard', 'undo' ] },
	                		{ name: 'editing', groups: [ 'find', 'selection', 'spellchecker', 'editing' ] },
	                		{ name: 'forms', groups: [ 'forms' ] },
	                		{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
	                		{ name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi', 'paragraph' ] },
	                		{ name: 'links', groups: [ 'links' ] },
	                		{ name: 'insert', groups: [ 'insert' ] },
	                		{ name: 'styles', groups: [ 'styles' ] },
	                		{ name: 'colors', groups: [ 'colors' ] },
	                		{ name: 'tools', groups: [ 'tools' ] },
	                		{ name: 'others', groups: [ 'others' ] },
	                		{ name: 'about', groups: [ 'about' ] }
	                	];
	 if($('.study_instruction_header').text().trim()=="学习指引"||$('.expert_manage_header').text().trim()=="专家管理"||$('.video_mange_header').text().trim()=="视频管理"){
		 config.removeButtons = 'Font,Smiley,HorizontalRule,JustifyBlock,Indent,Outdent,BulletedList,Styles,Form,Radio,TextField,Checkbox,Textarea,Select,Button,ImageButton,HiddenField,Paste,Copy,PasteText,PasteFromWord,Flash,Print,Save,Templates,Preview,Find,SelectAll,Language,Scayt,Blockquote,CreateDiv,Anchor,Unlink,Link,Table,PageBreak,Iframe,About,Maximize,ShowBlocks,Image';
	 }else{
		 config.removeButtons = 'Font,Smiley,HorizontalRule,JustifyBlock,Indent,Outdent,BulletedList,Styles,Form,Radio,TextField,Checkbox,Textarea,Select,Button,ImageButton,HiddenField,Paste,Copy,PasteText,PasteFromWord,Flash,Print,Save,Templates,Preview,Find,SelectAll,Language,Scayt,Blockquote,CreateDiv,Anchor,Unlink,Link,Table,PageBreak,Iframe,About,Maximize,ShowBlocks';
	 }
	                
	                
};
/*CKEDITOR.stylesSet.add( 'default', [
	{ name : '图片左对齐', element : 'img', attributes:{'align' : 'left' } }, 
])*/