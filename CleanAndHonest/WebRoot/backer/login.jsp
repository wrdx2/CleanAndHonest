<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户登录</title>
<style type="text/css">
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
</style>
<link href="${pageContext.request.contextPath}/css/css.css" rel="stylesheet" type="text/css" />
<script type="text/javaScript" src="${pageContext.request.contextPath}/js/jquery.js">
</script>
<script type="text/javascript" >
function checfm(){
	var name=document.forms[0].loginName.value.length;
	var pass=document.forms[0].loginPassword.value.length;
	var code=document.forms[0].chcode.value;
	var chcode=document.getElementById("checkCode").title;
	if(code!= chcode){
		alert("验证码输入错误");
		change();
		return false;
	}else if(name<0||pass<0){
		alert("请输入用户名、密码！");
		return false;
	}else{
		document.forms[0].submit();
		return true;
	}
}
</script>
<!-- <script type="text/javaScript" src="../js/checkCode.js">
</script> -->
<script type="text/javascript">
	function change(){
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/changeCheckCode",
			data : $("#checkCode"),
			dataType : "json",
			success : function(json) {
				if (json.success) {
					//$("#checkCode").attr("src","../images/pic05.gif?" + Math.random());
					$("#checkCode").attr("src","data:image/gif;base64," + json.obj);
					$("#checkCode").attr("title",json.msg);
				}else{
					alert(json.msg);
				}
			}
		});
	}
</script>

</head>

<body id="first" onload="change();">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="147" background="${pageContext.request.contextPath}/images/top02.gif"><img
				src="${pageContext.request.contextPath}/images/top03.gif" width="776" height="147" />
			</td>
		</tr>
	</table>
	<table width="562" border="0" align="center" cellpadding="0"
		cellspacing="0" class="right-table03">
		<tr>
			<td width="221"><table width="95%" border="0" cellpadding="0"
					cellspacing="0" class="login-text01">
					<tr>
						<td><table width="100%" border="0" cellpadding="0"
								cellspacing="0" class="login-text01">
								<tr>
									<td align="center"><img src="${pageContext.request.contextPath}/images/ico13.gif"
										width="107" height="97" />
									</td>
								</tr>
								<tr>
									<td height="40" align="center">&nbsp;</td>
								</tr>
							</table>
						</td>
						<td><img src="${pageContext.request.contextPath}/images/line01.gif" width="5" height="292" />
						</td>
					</tr>
				</table>
			</td>
			<td>
				<form name="login" action="loginUserAction" method="post">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="31%" height="35" class="login-text02">用户名称：<br />
							</td>
							<td width="69%"><input name="loginName" type="text"
								size="30" />
							</td>
						</tr>
						<tr>
							<td height="35" class="login-text02">密 码：<br />
							</td>
							<td><input name="loginPassword" type="password" size="30" />
							</td>
						</tr>
						<tr>
							<td height="35" class="login-text02">验证图片：<br />
							</td>
							<td><img id="checkCode" onclick="change();"
								src="" width="109" height="30" title='' /> 
								<!-- <a href="./../changeCheckCode" class="login-text03">
								看不清楚，换张图片</a> -->
								
							</td>
						</tr>
						<tr>
							<td height="35" class="login-text02">请输入验证码：</td>
							<td><input name="chcode" type="text" size="30" />
							</td>
						</tr>
						<tr>
							<td height="35">&nbsp;</td>
							<td>
								<input name="Submit2" type="button" onclick="checfm()" 
								class="right-button01" value="登陆" />
								<input name="Submit232" type="reset" class="right-button02" value="重 置"/>
							</td>
						</tr>
					</table>
				</form>
			</td>
		</tr>
	</table>
</body>
</html>