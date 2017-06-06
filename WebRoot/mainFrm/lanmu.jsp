<%@ page language="java" import="java.util.*" import="com.cleanAndHonest.orm.Lanmu" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>栏目管理</title>
<style type="text/css">
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
</style>

<link href="../css/css.css" rel="stylesheet" type="text/css" />
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/jquery.cookie.js"></script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/page.js"></script>
<script src="${pageContext.request.contextPath}/js/layer/layer.min.js"></script>
<script src="${pageContext.request.contextPath}/js/lanmu.js"></script>
<link href="../css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	pageSize2(8);
	function selectAll() {
		var obj = $("input:checkbox");
		for ( var i = 0; i < obj.length; i++) {
			if (obj[i].name == "delid") {
				obj[i].checked = true;
			}
		}
	}

	function unselectAll() {
		var obj = $("input:checkbox");
		for ( var i = 0; i < obj.length; i++) {
			if (obj[i].name == "delid") {
				if (obj[i].checked == true)
					obj[i].checked = false;
				else
					obj[i].checked = true;
			}
		}
	}
</script>
</head>


<body>
	<!-- <form name="fom" id="fom" method="post" action=""></form> -->
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td>
				
				<table id="subtree1" style="DISPLAY: ;" width="100%"
						border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td>
								<table width="95%" border="0" align="center"
									cellpadding="0" cellspacing="0">
									<tr>
										<td height="20">
											<span class="newfont07">选择：
												<a href="#" class="right-font08" onclick="selectAll();">全选</a> -
												<a href="#" class="right-font08" onclick="unselectAll();">反选</a>
											</span>
											<input name="Submit" type="button" class="right-button08" onclick="deleteLmAll();" value="删除所选栏目" /> 
											<input name="Submit2" type="button" class="right-button08" onclick="addlmContent();" value="添加" />
										</td>
									</tr>
									<tr>
										<td height="40" class="font42">
											<table id="show_table" width="100%" border="0" cellpadding="4"
												cellspacing="1" bgcolor="#464646" class="newfont03">
												<!-- <tr class="CTitle">
													<td height="22" colspan="7" align="center"
														style="font-size:16px">审批事项详细列表</td>
												</tr> -->
												<tr id="show_table_one" bgcolor="#EEEEEE">
													<td width="4%" align="center" height="30">选择</td>
													<td width="10%">栏目类型</td>
													<td width="10%">总栏名称</td>
													<td width="10%">大类名称</td>
													<td width="10%">小类名称</td>
													<td width="10%">审核状态</td>
													<td width="10%">显示状态</td>
													<td width="10%">操作</td>
												</tr>
												
												<s:iterator value="lanmu">
												<tr id="show_table tr" bgcolor="#FFFFFF">
													<td height="20">
													<input type="checkbox" name="delid" value=<s:property value="lno" /> />
													</td>
												     <td>
												     	<s:if test='ltype2 == null'>总栏
												     	 </s:if>
												     	 <s:elseif test='ltype3 == null'>大类
												     	 </s:elseif>
												     	 <s:else>小类
												     	 </s:else>
												     
												     </td>
												     <td><s:property value="ltype"/></td>
												     <td><s:property value="ltype2"/></td>
												     <td><s:property value="ltype3"/></td>
												     <td><s:if test='lstate == 0'>未审核
												     	 <td></td>
												     	 </s:if>
												     	 <s:elseif test='lstate == 1 '>已审核
												     	 <td>未显示</td>
												     	 </s:elseif>
												     	 <s:elseif test="lstate == 2">已审核
												     	 <td>已显示</td>
												     	 </s:elseif>
												     </td>
												     <td>
												     	<a onclick="renameLm('${lno}','${ltype}','${ltype2}','${ltype3}','${lstate}');" href="javascript:;">修改</a>
													</td>
												</tr>
												</s:iterator>
											</table>
										</td>
									</tr>
								</table>
								<form id="addLmForm">
								</form>
								<table width="95%" border="0" align="center" cellpadding="0"
									cellspacing="0">
									<tr>
										<td height="6"><img src="../images/spacer.gif" width="1"
											height="1" />
										</td>
									</tr>
									<tr>
										<td height="33">
											<table width="100%" border="0"
												align="center" cellpadding="0" cellspacing="0"
												class="right-font08">
												<tr>
													<td width="50%">第 
														<span id="cpage" class="right-text09">1</span> 页 | 共
														<span id="page" class="right-text09">1</span> 页
													</td>
													<td width="49%" align="right">[
														<a id="firstpage" href="#" class="right-font08">首页</a>|
														<a id="lastpage" href="#" class="right-font08">上一页</a>|
														<a id="nextpage" href="#" class="right-font08">下一页</a>|
														<a id="endpage" href="#" class="right-font08">末页</a>] 转至：
													</td>
													<td width="1%">
														<table width="20" border="0"
															cellspacing="0" cellpadding="0">
															<tr>
																<td width="1%">
																	<input id="curPage" name="textfield3" type="text"
																	class="right-textfield03" size="1" />
																</td>
																<td width="87%">
																	<input id="npage" name="Submit23222"
																	type="button" class="right-button06" />
																</td>
															</tr>
														</table>
													</td>
													<!-- <td width="1%"> 指定每页显示行数
														<table width="20" border="0"
															cellspacing="0" cellpadding="0">
															<tr>
																<td width="1%">
																	<input id="pageSize" name="textfield3" type="text"
																	class="right-textfield03" size="1" />
																</td>
																<td width="87%">
																	<input id="npage" name="Submit23222"
																	type="button" class="right-button06" onclick="pageSize2()" />
																</td>
															</tr>
														</table>
													</td> -->
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	<div>
	</div>
</body>
</html>
