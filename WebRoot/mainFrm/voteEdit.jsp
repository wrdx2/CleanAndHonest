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
<title>编辑调查</title>
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
<link href="${pageContext.request.contextPath}/css/css.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
function sub() {
	var flag = true;
	var node = [];
	$(".vnode").each(function(){
		if(this.value != ""){
			node.push(this.value);
		}else{
			flag = false;
		}
	});
	$("#vnodes").val(node.join(","));
	if($("#shenhe").val() == 0){
		$("#vstate").val(0);
	}else if($("#shenhe").val() == 1){
		if($("#voteDisplay").val() == 1){
			$("#vstate").val(1);
		}else{
			$("#vstate").val(2);
		};
	}
	if(flag){
		document.forms[0].submit();
	}else{
		alert("请输入调查选项值");
	};
}

function stateSelChange(){
	console.log("选择值："+$("#shenhe").val());
	if(($("#shenhe").val()) == 0){
		$("#voteDisplay").val(1);
		$("#voteDisplay").attr('disabled',"disabled");
	}else{
		$("#voteDisplay").removeAttr("disabled");
	}
}
function load(){
	var state = $("#vstate").val();
	console.log("状态值："+$("#vstate").val());
	
	if(state == 0){
		$("#shenhe").val(0);
		//$("#shenhe").find("option[text='未审核']").attr("selected",true);
		$("#voteDisplay").val(1);
		$("#voteDisplay").attr('disabled',"disabled");
	}else if(state == 1){
		$("#shenhe").val(1);
		$("#voteDisplay").val(1);
		//$("#shenhe").find("option[text='已审核']").attr("selected",true);
		//$("#voteDisplay").find("option[text='未发起']").attr("selected",true);
	}else if(state == 2){
		$("#shenhe").val(1);
		$("#voteDisplay").val(2);
		//$("#shenhe")[1].selected=true;
		//$("#voteDisplay")[1].selected=true;
	};
}
</script>

</head>

<body onload="load();">

<form name="fom" id="fom" method="post" action="${pageContext.request.contextPath}/vote/subEditVoteAction">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		
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
													修改民意调查信息
												</td>
											</tr>
											<tr height="40">
												<td width="15%" height="20" align="right" 
												bgcolor="#FFFFFF">
													调查名称:
												</td>
												<td width="85%" align="left" bgcolor="#FFFFFF">
													<s:property value="list[0].vname"/>
													<input type="hidden" name="vname" value="${list.get(0).vname}"/>
													<input type="hidden" id="vnodes" name="vnodes" value=""/>
												</td>
											</tr>
											<s:iterator value="list">
											<tr>
												
												<td height="20" align="right" bgcolor="#FFFFFF">
													调查选项:
												</td>
												<td bgcolor="#FFFFFF">
													<input class="vnode" name="vnode" value="${vnode}" />
												</td>
											</tr>
											</s:iterator>
											
											<tr>
												<td height="20" align="right" bgcolor="#FFFFFF">
													审核:
												</td>
												<td bgcolor="#FFFFFF">
												<input type="hidden" id="vstate" name="vstate" value=<s:property value="list[0].vstate"/>>
												<select id='shenhe' name='shenhe' onchange='stateSelChange()'>
													<option value='0' >未审核</option>
													<option value='1' >已审核</option>
												</select>
												<select id='voteDisplay' name='voteDisplay'>
													<option value='1' >不发起</option>
													<option value='2' >发起</option>
												</select>
												</td>
											</tr>
											
											<TR>
												<TD colspan="2" align="center" height="40px">
													<input type="button" value="修改" class="button" 
													onclick="sub();"/>
													<input type="button" name="reset" value="取消" 
													class="button" onclick="window.history.go(-1)"/>
													
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
							<img src="${pageContext.request.contextPath}/images/spacer.gif" width="1" height="1" />
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</form>
</body>
</html>
