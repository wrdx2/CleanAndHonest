<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'head.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="./css/head_styles.css">
	<script type="text/javascript" src="./js/time.js"></script>
	<script type="text/javascript" src="./js/11.js"></script>
  </head>
  
  <body onload="startTime()">
    <div id="top">
    	<img src="./images/head/top1.jpg">
    	<div id="top_nt">
    		<div id="top_navi">| <a> 首页</a> | <a>廉政接待</a> | <a>网上办事</a> | <a href="./backer/login.jsp">系统维护</a> | </div>
    		<div id="top_time"></div>
    	</div>
    	<div id="top_bar">
    		<div id="top_bar1">
    			<marquee>
    			<strong>欢迎访问高校廉政建设网站！</strong>
            	</marquee>
            </div>
            <div id="top_bar2">
            	<span class="style11">|
            	<a href="javascript:void(0)" class=Bottom onClick="SetHome(this,'http://localhost:8080/Selects_bus/pages/index.jsp')">设为首页</a>|
            	<a href="javascript:void(0)" onClick="AddFavorite('高校廉政建设',location.href);">加入收藏</a>|
            	<a href="mailto:1102712970@qq.com" class=Bottom>联系站长</a>|
            	</span>
            </div>
    	</div>
    </div>
  </body>
</html>
