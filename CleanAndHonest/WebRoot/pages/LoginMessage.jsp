<%@ page language="java" import="java.util.*,java.text.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <base href="<%=basePath%>" />
    <title>登录失败</title> 
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="keywords" content="公交,查询系统，王荣道" />
	<meta name="description" content="公交出行  方便快捷" />	
	<meta name="author" content="王荣道" />
	<meta name="copyright" content="信1305_20132997_王荣道" />
	<!-- 
	<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" /> 
	<link rel="stylesheet" type="text/css" href="css/common.css" /> -->
	<script type="javaScript" src="./js/11.js"></script>
	<style type="text/css">
	#errorContent{width:520px;height:70px;padding:30px 100px 50px 100px;margin:70px auto;text-align:left;border:1px solid #EEEEEE;background:url(images/login/icon_warning.gif) no-repeat scroll 30px 32px #FFFFFF;}
	</style>
  </head>
  
  <body onload="countdown();startTime()">
  <div id="main">
  <jsp:include page="head.jsp" />
  	<div id="errorContent">
  		<p style="color:#E46A01; font-weight:bold; font-size:14px;">对不起，您的账号或密码错误</p>
  		<p>系统将在<span id="timeCount">5</span>秒钟之后自动跳转到默认页面</p>
	 </div>
  <jsp:include page="foot.html" />
  </div>
  </body>
</html>