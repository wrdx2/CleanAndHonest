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
<title>文章详细信息</title>
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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/flexpaper/js/flexpaper.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/flexpaper/js/flexpaper_handlers.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/flexpaper/js/flexpaper_handlers_debug.js"></script>
<script src="${pageContext.request.contextPath}/js/layer/layer.min.js"></script>
<link href="../css/css.css" rel="stylesheet" type="text/css" />
<link href="../css/style.css" rel="stylesheet" type="text/css" />
<script type="text/JavaScript">
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
	function sub(){
		var text = window.frames["text"].document.getElementById("textarea").value;
		document.getElementById("text").value = text;
		if(text != ""){
			document.forms[0].submit();
		}
	}
	
	function find(x,y){
		return document.getElementById("con"+x+y).style;
	}
	
	function xianshi(){
		console.log($("#aname").val());
		console.log($("#cont_att").val());
		if($("#aname").val().trim() != $("#uName").val().trim()){
			console.log($("#aname").val().trim() + "不等于" + $("#uName").val().trim());
			find(1,4).display = 'none';
		}
	}
	
	function edit(){
		window.location.href="editArticleAction?ano=" + $("#ano").val();
	}
	
</SCRIPT>
</head>

<body onload="xianshi()">

<input type="hidden" id="aname" name="aname" value="<s:property value='ar.aname'/>" />
<input type="hidden" id="ano" name="ano" value="<s:property value='ar.ano'/>" />
<input type="hidden" id="uName" name="uName" value="${sessionScope.uName}" />
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
											<tr>
												<td height="20" colspan="9" align="center"
													bgcolor="#EEEEEE" class="tablestyle_title">
													文章信息
												</td>
											</tr>
											<tr>
												<td width="15%" height="20" align="right" 
												bgcolor="#FFFFFF">
													文章标题:
												</td>
												<td width="85%" align="left" bgcolor="#FFFFFF">
													<s:property value="ar.atitle"/>
												</td>
											</tr>
											<tr>
												<td height="20" align="right" bgcolor="#FFFFFF">
													文章发表人:
												</td>
												<td bgcolor="#FFFFFF">
													<s:property value="ar.aname"/>
												</td>
											</tr>
											<tr>
												<td height="20" align="right" bgcolor="#FFFFFF">
													文章编号:
												</td>
												<td bgcolor="#FFFFFF">
													<s:property value="ar.ano"/>
												</td>
											</tr>
											<tr id="con11" style="display:">
												<td align="right" bgcolor="#FFFFFF">发表时间:</td>
												<td bgcolor="#FFFFFF">
													<s:property value="ar.atime"/>
												</td>
											</tr>
											<tr>
												<td height="20" align="right" bgcolor="#FFFFFF">
													文章链接地址:
												</td>
												<td bgcolor="#FFFFFF">
													<a href="<s:property value="ar.aaddress"/>">
													<s:property value="ar.aaddress"/>
													</a>
													
												</td>
											</tr>
											<tr>
												<td height="20" align="right" bgcolor="#FFFFFF">
													文章所在栏目:
												</td>
												<td bgcolor="#FFFFFF">
													<s:property value="ar.atype"/>
												</td>
											</tr>
											<tr>
												<td align="right" bgcolor="#FFFFFF">文章附件:</td>
												<td bgcolor="#FFFFFF">
													<s:if test="ar.aattach != ''">
													<s:property value="ar.aattach"/>&nbsp;
													<a id="view" onclick="viewName('${ar.aattach}');">预览
													</a>&nbsp;
													<a id="downloadFile" onclick="downloadFile('${ar.aattach}');">下载
													</a>
													</s:if>
												</td>
											</tr>
											<tr>
												<td align="right" bgcolor="#FFFFFF" height="80">
													文章内容:
												</td>
												<td id="content" bgcolor="#FFFFFF">
													<s:property value="ar.acontent" escape="false"/>
												</td>
											</tr>
											
											<TR id="con13" style="display:">
												<TD colspan="2" align="center" height="40px">
													<input id="con14" type="button" value="修改" style="display:"
													class="button" onclick="edit();"/>
													<input type="button" name="reset" value="返回"
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
</body>
</html>
