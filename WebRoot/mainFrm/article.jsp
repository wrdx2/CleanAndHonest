<%@ page language="java" import="java.util.*" import="com.cleanAndHonest.orm.Lanmu" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>查看文章</title>
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
	/* function sousuo() {
		window.open("gaojisousuo.htm","","depended=0,alwaysRaised=1,width=800,height=510,location=0,menubar=0,resizable=0,scrollbars=0,status=0,toolbar=0");
	} */
	//pageSize2(8);
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
	
	function deleteArAll(){
	var ids = [];
	$("#show_table input[type=checkbox]").each(function(){
	if(this.checked == true && this.name == 'delid'){
		ids.push(this.value);
	}
	});
	console.log(ids);
	if(ids.length>0){
		layer.confirm('删除提醒',function(index){
			$.post('${pageContext.request.contextPath}/article/deleteArArticleAction', {ids:ids.join(',')}, function(j) {
			if (j.success) {
				location.reload();
			}else{
				alert(json.msg);
			}
		}, 'json');
	});
	}else{
		layer.msg('你没有选择', 2, -1);
	}
}
	
	function xianshi(){
		console.log($("#isEdit").val());
		if($("#isEdit").val() != "T"){
			$("a").each(function(i){
				if($(this).attr("id") == "but_edit"){
					$(this).hide();
				}
			});
			$("#ar_Select").hide();
		}
	}
</script>
</head>


<body onload="xianshi()">
	<!-- <form name="fom" id="fom" method="post" action=""></form> -->
	<input type="hidden" id="isEdit" value="<s:property value='%{#session.isEdit}'/>" />
		<table width="100%" border="0" cellspacing="0" cellpadding="0">

			<tr>
				<td height="30">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="62" background="../images/nav04.gif">

								<table width="98%" border="0" align="center" cellpadding="0"
									cellspacing="0">
									<tr>
										<td width="21">
											<img src="../images/ico07.gif" width="20"
											height="18" />
										</td>
										<td width="538">查看内容：按时间： 
											<input name="textfield" type="text" size="12" 
												readonly="readonly" />
											<span class="newfont06">至</span>
											<input name="textfield" type="text" size="12" 
												readonly="readonly" />
											<input name="Submit4" type="button" class="right-button02" 
												value="查 询" />
										</td>
										<td width="144" align="left">
											<a href="#" onclick="sousuo()">
											<input name="Submit3" type="button"
												class="right-button07" value="高级搜索" /> </a>
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
				
				<table id="subtree1" style="DISPLAY: ;" width="100%"
						border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td>
								<table width="95%" border="0" align="center"
									cellpadding="0" cellspacing="0">
									<tr id="ar_Select">
										<td height="20">
											<span class="newfont07">选择：
												<a href="#" class="right-font08" onclick="selectAll();">全选</a> -
												<a href="#" class="right-font08" onclick="unselectAll();">反选</a>
											</span>
											<input name="Submit" type="button" class="right-button08" onclick="deleteArAll();" value="删除所选文章" /> 
											<!-- <input name="Submit2" type="button" class="right-button08" onclick="addlmContent();" value="添加" /> -->
										</td>
									</tr>
									<tr>
										<td height="40" class="font42">
											<table id="show_table" width="100%" border="0" cellpadding="4"
												cellspacing="1" bgcolor="#464646" class="newfont03">
												<tr id="show_table_one" bgcolor="#EEEEEE">
													<td width="4%" align="center" height="30">选择</td>
													<td width="10%">文章发表人</td>
													<td width="10%">文章标题</td>
													<td width="10%">栏目类别</td>
													<td width="10%">发表时间</td>
													<td width="10%">操作</td>
												</tr>
												
												<s:iterator value="arList">
												<tr id="show_table tr" bgcolor="#FFFFFF">
													<td height="20">
													<input type="checkbox" name="delid" value=<s:property value="ano" /> />
													</td>
												     <td><s:property value="aname"/></td>
												     <td>
												     	 <s:property value="atitle"/>
												     </td>
												     <td>
												     	<s:property value="atype"/>
												     </td>
												     <td>
												     	<s:property value="atime"/>
												     </td>
												   
												     <td>
												     	<s:a href='lookArticleAction?ano=%{ano}'>查看</s:a>&nbsp;
												     	<s:a id="but_edit" href='editArticleAction?ano=%{ano}'>编辑</s:a>
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
