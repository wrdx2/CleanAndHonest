<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>${ar.atitle}</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<link href="${pageContext.request.contextPath}/css/home.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/news.css" rel="stylesheet">
<script type="text/javaScript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/flexpaper/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/flexpaper/js/flexpaper.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/flexpaper/js/flexpaper_handlers.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/flexpaper/js/flexpaper_handlers_debug.js"></script>
<script src="${pageContext.request.contextPath}/js/layer/layer.min.js"></script>
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
	<jsp:include page="head.jsp"></jsp:include>
	<div id="Cnt_center">
		<!--左边部分开始-->
		<div class="cnt_left float_left">
			<!--位置导航部分开始-->
			<div class="position">
				<img src="images/lm_dot.gif" width="11" height="11">&nbsp;&nbsp;您的位置&nbsp;&nbsp;
				<a href="${pageContext.request.contextPath}">首页</a> &gt;&gt;
				
				<a href="${pageContext.request.contextPath}/article/selLmArArticleAction?type=1&cont=<s:property value='lm.ltype'/>">
					<s:property value='lm.ltype'/>
				</a> &gt;&gt; 
				<s:if test="lm.ltype2!=null&&lm.ltype2!=''">
					<a href="${pageContext.request.contextPath}/article/selLmArArticleAction?type=2&cont=<s:property value='lm.ltype2'/>">
						<s:property value='lm.ltype2'/>
					</a>&gt;&gt; 
				</s:if>
				<s:if test="lm.ltype3!=null&&lm.ltype3!=''">
					<a href="${pageContext.request.contextPath}/article/selLmArArticleAction?type=3&cont=<s:property value='lm.ltype2'/>">
						<s:property value='lm.ltype3'/>
					</a>&gt;&gt; 
				</s:if> 正文
			</div>
			<!--位置导航部分结束-->
			<!--正文部分开始-->
			<div class="content_left">
				<div class="news_title">
					<font color="">${ar.atitle}</font>
				</div>
				<div class="title_line"></div>
				<div class="art_info">
					[作者：${ar.aname} | 日期：${ar.atime} | 浏览<font color="red">${ar.ahits}</font>
					次] 字体:[<a href="javascript:doZoom(16)">大</a> 
					<a href="javascript:doZoom(14)">中</a> 
					<a href="javascript:doZoom(12)">小</a>]
				</div>
<script type="text/javascript">
function viewName(file){
	var arr = file.split('/');
	
	var filename = arr[arr.length-1];
	var dir = "";
	for(var i = 0;i <= arr.length - 2;i++){
		dir += arr[i] + '/';
	}
	var fileDir = "";
	for(var i = 5 ; i <= arr.length-1 ; i++){
		if(i<=arr.length-2){
			fileDir += arr[i] + '/' ;
		}else{
			fileDir += arr[i];
		}
	}
	
	$.layer({
	    type: 2,
	    border: [0],
	    title: false,
	    closeBtn: [0, true],
	    iframe: {src : '../article/viewArticleAction?dir=' + dir + '&name='+filename},
	    area: ['950px', '500px']
	});
};

function downloadFile(file){
	var arr = file.split('/');
	var filename = arr[arr.length-1];
	var fileDir = "";
	for(var i = 5 ; i <= arr.length-1 ; i++){
		if(i<=arr.length-2){
			fileDir += arr[i] + '/' ;
		}else{
			fileDir += arr[i];
		}
	}
	
	window.location.href="../DownLoadAction?fileName=" + fileDir + "&name=" + filename;
	
}
</script>
<SCRIPT language=JavaScript>

//========================= 设置字体大中小 start =============
	function doZoom(size){
		var zw_content = document.getElementById('zw_content');
		if(!zw_content){
			return;
		}
		var zw_contentChild = zw_content.childNodes;
		zw_content.style.fontSize = size + 'px';
		//再对ArticleCnt div内的直接html节点设置fontSize属性
		for(var i = 0; i < zw_contentChild.length; i++){
			if(zw_contentChild[i].nodeType == 1){
				zw_contentChild[i].style.fontSize = size + 'px';
			}
		}		
	}
//========================= 设置字体大中小 end =============
</SCRIPT>
				<div id="zw_content">
					<s:property value='ar.acontent'/>
					
					<s:if test="ar.aattach!=null&&ar.aattach!=''">
						<s:property value="ar.aattach" escapeHtml="false" />&nbsp;
						<a id="view" onclick="viewName('${ar.aattach}');">预览
						</a>&nbsp;
						<a id="downloadFile" onclick="downloadFile('${ar.aattach}');">下载
						</a>
					</s:if>
					<div class="editor">责任编辑：admin</div>
				</div>
				<div class="pages">
					上一篇：<a href="WrzcNet_ReadNews.asp?NewsID=1029">监察局网站模板看廉政纪委门户网站建站系统下载</a>
					<br> 下一篇：<a href="WrzcNet_ReadNews.asp?NewsID=1053">监察局网站模板廉政与法制纪委门户网站建站系统下载</a>

				</div>
				<div class="title_line"></div>
				<div class="about_news">

					<div class="float_left about_art">
						<h3>相关文章</h3>
						<div>
							<ul class="list">
								<li><span class="float_right">[2]</span>·<a target="_blank"
									href="WrzcNet_ReadNews.asp?NewsID=1073">网软纪委门户网站建站系统正式版监察局廉政网站模板下载</a>
								</li>
							</ul>
						</div>
					</div>

					<div class="float_right about_spec">
						<h3>相关专题</h3>
						<div>
							<ul class="list">
								<li><a href="Special_News.asp?SpecialID=8">·网软志成政府网站管理系统</a>
								</li>
							</ul>
						</div>
					</div>
					<div class="clear_float"></div>
				</div>
			</div>
			<!--正文部分结束-->

		</div>
		<!--左边部分结束-->

		<!--右边部分开始-->
		<div class="Cnt_Right float_right">
			<div class="n_right lianmu_bg">
				<h3>热门文章</h3>
				<div>
					<ul class="list">

					<s:iterator value="arList">
					<li>
						<span class="float_right">[<s:property value='ahits'/>]</span>·
						<a href="${pageContext.request.contextPath}/article/selArArticleAction?arId=<s:property value='ano'/>"
							title="<s:property value='atitle'/>" target="_blank"> <font
								color=""><s:property value='atitle'/></font> </a>
					</li>
					</s:iterator>

					</ul>
				</div>
			</div>

			<div class="npic_right lianmu_bg">
				<h3>最新文章</h3>
				<ul class="list">
					<s:iterator value="arList2">
					<li>
						<span class="float_right">[<s:property value='ahits'/>]</span>·
						<a href="${pageContext.request.contextPath}/article/selArArticleAction?arId=<s:property value='ano'/>"
							title="<s:property value='atitle'/>" target="_blank"> <font
								color=""><s:property value='atitle'/></font> </a>
					</li>
					</s:iterator>

				</ul>
			</div>


		</div>
		<!--右边部分结束-->
		<div class="clear_float"></div>
	</div>
	<jsp:include page="/pages/foot.html"></jsp:include>
</body>
</html>
