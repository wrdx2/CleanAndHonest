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
<title>查看投票</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link href="${pageContext.request.contextPath}/css/home.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/news.css" rel="stylesheet">
</head>

<body>
	<div id="vote">
		<div class="vote_titbg"></div>
		<div class="vote_cnt">


			<fieldset style="width:99%">
				<legend>${list[0].vname}</legend>
				<table width="100%" height="87" border="0" align="center"
					cellpadding="0" cellspacing="0">
					<tbody>
						<tr valign="middle">
							<td width="49%" height="27">序号</td>
							<td width="41%">百比分</td>
							<td align="center">人数</td>
						</tr>
						
						<s:set name="hit" value="0"></s:set>
						<s:iterator value="list">
							<s:set name="hit" value="#hit + vhits"></s:set>
						</s:iterator>
						
						<s:property value="#hit"/>
						
						<s:iterator value="list">
						<tr valign="middle">
							<td height="29">
							 ${vnode}
							</td>
							<td>
							<s:set name="len" value="(vhits*100/#hit)"></s:set>
							<img src="${pageContext.request.contextPath}/images/RSCount.gif" width="<s:property value='#len*2'/>" height="8">
								<s:property value="len"/>%</td>
							<td width="10%" align="center">${vhits}人次</td>
						</tr>
						</s:iterator>
						<!-- 
						<tr valign="middle">
							<td height="29"><input style="border: 0" name="Options"
								type="CheckBox" disabled=""> 2.色彩比较合理。</td>
							<td><img src="images/RSCount.gif" width="37" height="8">
								18.947%</td>
							<td width="10%" align="center">18人</td>

						</tr>
						<tr valign="middle">
							<td height="29"><input style="border: 0" name="Options"
								type="CheckBox" disabled=""> 3.框架比较清晰明确。</td>
							<td><img src="images/RSCount.gif" width="40" height="8">
								20%</td>
							<td width="10%" align="center">19人</td>

						</tr>
						<tr valign="middle">
							<td height="29"><input style="border: 0" name="Options"
								type="CheckBox" disabled=""> 4.内容丰富。</td>
							<td><img src="images/RSCount.gif" width="37" height="8">
								18.947%</td>
							<td width="10%" align="center">18人</td>

						</tr>
						<tr valign="middle">
							<td height="29"><input style="border: 0" name="Options"
								type="CheckBox" disabled=""> 5.功能强大，使用方便。</td>
							<td><img src="images/RSCount.gif" width="37" height="8">
								18.947%</td>
							<td width="10%" align="center">18人</td>

						</tr> -->
						<tr>
							<td height="31" colspan="3">共有【<s:property value="#hit"/>】人参加投票<br>
							</td>
						</tr>
					</tbody>
				</table>
			</fieldset>

		</div>
		<a href="javascript:window.close();window.history.go(-1);">
		<img src="${pageContext.request.contextPath}/images/an_close.gif" width="86" height="25" border="0">
		</a>
	</div>
</body>
</html>
