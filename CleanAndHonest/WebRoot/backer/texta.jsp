<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> -->
<title>Editor</title>
<style type="text/css" > </style>
<link href=".././css/texta.css"  rel="stylesheet" type="text/css"/>
<script type="text/javaScript" src=".././js/textarea.js"></script>
</head>
<body>
<div id='ss'></div>
<div id='sss'></div>

<input id='get' value="get" type="button"  />
<input id='set' value="set'hello,world'" type="button"  />
</body>
</html>

