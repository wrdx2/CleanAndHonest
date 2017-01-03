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
<title>审批详细信息</title>
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

<link href="../css/css.css" rel="stylesheet" type="text/css" />
<script type="text/JavaScript">
	
</script>
<link href="../css/style.css" rel="stylesheet" type="text/css" />
</head>
<SCRIPT language=JavaScript>
	/* function sousuo() {
		window.open("gaojisousuo.htm","",
		"depended=0,alwaysRaised=1,width=800,height=510,location=0,menubar=0,resizable=0,
		scrollbars=0,status=0,toolbar=0");
	} */
	function selectAll() {
		var obj = document.fom.elements;
		for ( var i = 0; i < obj.length; i++) {
			if (obj[i].name == "delid") {
				obj[i].checked = true;
			}
		}
	}

	function unselectAll() {
		var obj = document.fom.elements;
		for ( var i = 0; i < obj.length; i++) {
			if (obj[i].name == "delid") {
				if (obj[i].checked == true)
					obj[i].checked = false;
				else
					obj[i].checked = true;
			}
		}
	}
	
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
		if((document.getElementById("content").innerHTML).trim() != ""){
			find(1,1).display ='';
			find(1,2).display ='';
			find(1,3).display ='';
			find(2,1).display ='none';
			find(2,2).display ='none';
		}else{
			find(1,1).display ='none';
			find(1,2).display ='none';
			find(1,3).display ='none';
			find(2,1).display ='';
			find(2,2).display ='';
		}
	}
	
	function bianji(){
		find(1,1).display ='none';
		find(1,2).display ='none';
		find(1,3).display ='none';
		find(2,1).display ='';
		find(2,2).display ='';
	}
	
	/* function link() {
		document.getElementById("fom").action = "";
		document.getElementById("fom").submit();
	} */
</SCRIPT>

<body onload="xianshi()">
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
													审批信息
												</td>
											</tr>
											<tr>
												<td width="15%" height="20" align="right" 
												bgcolor="#FFFFFF">
													审批事项标题:
												</td>
												<td width="85%" align="left" bgcolor="#FFFFFF">
													<s:property value="sr.stitle"/>
												</td>
											</tr>
											<tr>
												<td height="20" align="right" bgcolor="#FFFFFF">
													受理编号:
												</td>
												<td bgcolor="#FFFFFF">
													<s:property value="sr.sno"/>
												</td>
											</tr>
											<tr>
												<td height="20" align="right" bgcolor="#FFFFFF">
													受理单位:
												</td>
												<td bgcolor="#FFFFFF">
													<s:property value="sr.sdep"/>
												</td>
											</tr>
											<tr>
												<td height="20" align="right" bgcolor="#FFFFFF">
													申报人:
												</td>
												<td bgcolor="#FFFFFF">
													<s:property value="sr.sname"/>
												</td>
											</tr>
											<tr>
												<td align="right" bgcolor="#FFFFFF">联系邮箱:</td>
												<td bgcolor="#FFFFFF">
													<s:property value="sr.semail"/>
												</td>
											</tr>
											<tr>
												<td align="right" bgcolor="#FFFFFF">联系电话:</td>
												<td bgcolor="#FFFFFF">
													<s:property value="sr.stel"/>
												</td>
											</tr>
											<tr>
												<td align="right" bgcolor="#FFFFFF">联系地址:</td>
												<td bgcolor="#FFFFFF">
													<s:property value="sr.saddress"/>
												</td>
											</tr>
											<tr>
												<td align="right" bgcolor="#FFFFFF" height="80">
													事项内容:
												</td>
												<td bgcolor="#FFFFFF">
													<s:property value="sr.scontent"/>
												</td>
											</tr>
											<tr>
												<td align="right" bgcolor="#FFFFFF">事项附件:</td>
												<td bgcolor="#FFFFFF">
													<s:a><s:property value="sr.sattach"/></s:a>
												</td>
											</tr>
											
											<tr id="con11" style="display:">
												<td align="right" bgcolor="#FFFFFF">回复时间:</td>
												<td bgcolor="#FFFFFF">
													<s:property value="sr.rtime"/>
												</td>
											</tr>
											<tr id="con12" style="display:">
												<td align="right" bgcolor="#FFFFFF" height="80">
													回复内容:
												</td>
												<td id="content" bgcolor="#FFFFFF" >
													<s:property value='sr.rcontent' escape="false"/>
												</td>
											</tr>
											<TR id="con13" style="display:">
												<TD colspan="2" align="center" height="40px">
													<input type="button" value="编辑" class="button" 
													onclick="bianji()"/>
													<input type="button" name="reset" value="返回"
													class="button" onclick="window.history.go(-1);"/>
												</TD>
											</TR>
											
											<tr id="con21" style="display:">
												<td align="right" bgcolor="#FFFFFF" height="200px">
													回复:
												</td>
												<td bgcolor="#FFFFFF" height="200px">
												<iframe name="text" src=".././backer/textarea.jsp" 
												height="100%" width="98%" frameborder="0" 
												scrolling="no" >
												</iframe>
												<!-- <textarea style="height:100%;width:100%;">
												</textarea> -->
												</td>
											</tr>
											<TR id="con22" style="display:">
												<TD colspan="2" align="center" height="40px">
												<form name="fom" id="fom" method="post" action="doShenpi">
													<input type="button" value="回复" class="button" 
													onclick="sub()"/>
													<input type="button" name="reset" value="返回" 
													class="button" onclick="window.history.go(-1);"/>
													<div style="hight:0px;">
													<input id="text" name="text" type="text"
													style="display:none;"/>
													<s:textfield name="rno" 
													value="%{sr.sno}"
													cssStyle="display:none;" />
													</div>
												</form>
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
