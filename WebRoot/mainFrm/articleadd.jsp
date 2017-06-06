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
<title>添加文章</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}

.tabfont01 {
	font-family: "宋体";
	font-size: 9px;
	color: #555555;
	text-decoration: none;
	text-align: center;
}

.font051 {
	font-family: "宋体";
	font-size: 12px;
	color: #333333;
	text-decoration: none;
	line-height: 20px;
}

.font201 {
	font-family: "宋体";
	font-size: 12px;
	color: #FF0000;
	text-decoration: none;
}

.button {
	font-family: "宋体";
	font-size: 14px;
	height: 37px;
}

html {
	overflow-x: auto;
	overflow-y: auto;
	border: 0;
}
-->
</style>
<script type="text/javaScript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/flexpaper/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ajaxfileupload.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/addFileUpload.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/flexpaper/js/flexpaper.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/flexpaper/js/flexpaper_handlers.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/flexpaper/js/flexpaper_handlers_debug.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/layer/layer.min.js"></script>
<link href="../css/css.css" rel="stylesheet" type="text/css" />
<link href="../css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
function sub() {
	var text = window.frames["text"].document.getElementById("textarea").value;
	document.getElementById("text").value = text;
	var flag = true;
	$("input").each(
			function() {
				if ($(this).attr("name") == "title" || $(this).attr("name") == "text") {
					if ($(this).val() == "") {
						flag = false;
					}
				}
			});
	if (flag) {
		var f = ajaxUpload();
		if(f){
			var names = [];
		   $(":file").each(function(){
			   if($(this).val() != "" && $(this).attr("id").length <= 6){
				   names.push($(this).prop("files")[0].name);
				}
		   });
		   $("#files").val(names);
		   document.forms[0].submit();
		}
	} else {
		alert("请填写完整信息！");
	}
}
</script>

</head>

<body onload="loadSelect();">

<input type="hidden" id="stat" value="<s:property value='stat'/>" />
<form name="fom" id="fom" method="post" action="${pageContext.request.contextPath}/article/addArticleAction">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="30">
				<table width="100%" border="0" cellspacing="0"
					cellpadding="0">
					<tr>
						<td height="62" background="../images/nav04.gif">
							<table width="98%" border="0" align="center" cellpadding="0"
								cellspacing="0">
								<tr>
									<td width="679" align="left">
										<a href="#" onclick="sousuo()"></a>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>
				<table id="subtree1" style="DISPLAY: " width="100%"
					border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td>
							<table width="95%" border="0" align="center"
								cellpadding="0" cellspacing="0">
								<tr>
									<td height="40" class="font42">
										<table width="100%" border="0" cellpadding="4" 
											cellspacing="1" bgcolor="#464646" class="newfont03">
											<tr height="40">
												<td height="20" colspan="9" align="center"
													bgcolor="#EEEEEE" class="tablestyle_title">
													添加文章信息
												</td>
											</tr>
											<tr height="40">
												<td width="15%" height="20" align="right" 
												bgcolor="#FFFFFF">
													文章标题:
												</td>
												<td width="85%" align="left" bgcolor="#FFFFFF">
													<input name="title" />
												</td>
											</tr>
											<tr>
												<td height="20" align="right" bgcolor="#FFFFFF">
													文章链接地址:
												</td>
												<td bgcolor="#FFFFFF">
													<input name="address" /><label style="color:red; ">若文章是外部引用，请填写文章链接</label>
												</td>
											</tr>
											<tr>
												<td height="20" align="right" bgcolor="#FFFFFF">
													文章所在栏目:
												</td>
												<td id="lanmu_type" bgcolor="#FFFFFF"> 
													<select id="type" name="type"></select>
												</td>
											</tr>
											<tr>
												<td align="right" bgcolor="#FFFFFF">文章附件:</td>
												<td id="fileTd" bgcolor="#FFFFFF">
													<input style="display:none " id="files" name="fileNames">
													<input type="button" onclick="addFile();" value="添加附件">
												</td>
											</tr>
											<tr>
												<td align="right" bgcolor="#FFFFFF" height="80">
													文章内容:
												</td>
												<td bgcolor="#FFFFFF" height="400px">
												<iframe name="text" src="${pageContext.request.contextPath}/backer/textarea.jsp" 
												height="100%" width="98%" frameborder="0" 
												scrolling="no" >
												</iframe>
												<input id="text" name="text" type="hidden"/>
												</td>
											</tr>
											
											<TR>
												<TD colspan="2" align="center" height="40px">
													<input type="button" value="添加" class="button" 
													onclick="sub();"/>
													<input type="button" name="reset" value="取消" 
													class="button" onclick="window.history.go(-1);"/>
													
												</TD>
											</TR>
										</table>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
				<table width="95%" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr>
						<td height="6">
							<img src="../images/spacer.gif" width="1" height="1" />
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</form>
</body>
</html>
