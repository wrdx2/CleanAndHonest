<%@ page language="java" import="java.util.*"
	import="com.cleanAndHonest.orm.User" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<title>高校廉政建设系统</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-image: url(../images/left.gif);
}
-->
</style>
<link href="../css/css.css" rel="stylesheet" type="text/css" />
</head>
<SCRIPT language=JavaScript>
	function tupian(idt) {
		var nametu = "xiaotu" + idt;
		var tp = document.getElementById(nametu);
		tp.src = "../images/ico05.gif";//图片ico04为白色的正方形

		for ( var i = 1; i < 30; i++) {

			var nametu2 = "xiaotu" + i;
			if (i != idt * 1) {
				var tp2 = document.getElementById('xiaotu' + i);
				if (tp2 != undefined) {
					tp2.src = "../images/ico06.gif";
				}//图片ico06为蓝色的正方形
			}
		}
	}

	function list(idstr) {
		var name1 = "subtree" + idstr;
		var name2 = "img" + idstr;
		var objectobj = document.all(name1);
		var imgobj = document.all(name2);

		//alert(imgobj);

		if (objectobj.style.display == "none") {
			for (i = 1; i < 10; i++) {
				var name3 = "img" + i;
				var name = "subtree" + i;
				var o = document.all(name);
				if (o != undefined) {
					o.style.display = "none";
					var image = document.all(name3);
					//alert(image);
					image.src = "../images/ico04.gif";
				}
			}
			objectobj.style.display = "";
			imgobj.src = "../images/ico03.gif";
		} else {
			objectobj.style.display = "none";
			imgobj.src = "../images/ico04.gif";
		}
	}
</SCRIPT>

<body>
	<table width="198" border="0" cellpadding="0" cellspacing="0"
		class="left-table01">
		<tr>
			<TD>
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td width="207" height="55" background="../images/nav01.gif">
							<table width="90%" border="0" align="center" cellpadding="0"
								cellspacing="0">
								<tr>
									<td width="25%" rowspan="2"><img src="../images/ico02.gif"
										width="35" height="35" />
									</td>
									<td width="75%" height="22" class="left-font01">
									<span class="left-font02">
									<%=((User) session.getAttribute("user")).getAuthority()%></span>
									您好，
									<span class="left-font02">
									<%=((User) session.getAttribute("user")).getUname()%></span>
									</td>
								</tr>
								<tr>
									<td height="22" class="left-font01">[&nbsp;
									<a href="../backer/login.jsp" target="_top" class="left-font01">退出</a>&nbsp;]</td>
								</tr>
							</table></td>
					</tr>
				</table>
				
				<!--  网上办事系统开始    -->
				<TABLE width="100%" border="0" cellpadding="0" cellspacing="0"
					class="left-table03">
					<tr>
						<td height="29">
							<table width="85%" border="0" align="center" cellpadding="0"
								cellspacing="0">
								<tr>
									<td width="8%"><img name="img8" id="img8"
										src="../images/ico04.gif" width="8" height="11" />
									</td>
									<td width="92%"><a href="javascript:" target="mainFrame"
										class="left-font03" onClick="list('8');">网上办事管理</a>
									</td>
								</tr>
							</table></td>
					</tr>
				</TABLE>
				<table id="subtree8" style="DISPLAY: none" width="80%" border="0"
					align="center" cellpadding="0" cellspacing="0" class="left-table02">
					<tr>
						<td width="9%" height="20"><img id="xiaotu20"
							src="../images/ico06.gif" width="8" height="12" />
						</td>
						<td width="91%"><a href="addrenwu.htm" target="mainFrame"
							class="left-font03" onClick="tupian('20');">审批事项管理</a>
						</td>
					</tr>
					<tr>
						<td width="9%" height="21"><img id="xiaotu21"
							src="../images/ico06.gif" width="8" height="12" />
						</td>
						<td width="91%"><a href="listrenwu.htm" target="mainFrame"
							class="left-font03" onClick="tupian('21');">我的审批事项管理</a>
						</td>
					</tr>
				</table>
				<!--  网上办事系统结束    -->
				
				<!--  文章管理系统开始    -->
				<TABLE width="100%" border="0" cellpadding="0" cellspacing="0"
					class="left-table03">
					<tr>
						<td height="29">
							<table width="85%" border="0" align="center" cellpadding="0"
								cellspacing="0">
								<tr>
									<td width="8%"><img name="img7" id="img7"
										src="../images/ico04.gif" width="8" height="11" />
									</td>
									<td width="92%"><a href="javascript:" target="mainFrame"
										class="left-font03" onClick="list('7');">文章管理</a>
									</td>
								</tr>
							</table></td>
					</tr>
				</TABLE>
				<table id="subtree7" style="DISPLAY: none" width="80%" border="0"
					align="center" cellpadding="0" cellspacing="0" class="left-table02">
					<tr>
						<td width="9%" height="20"><img id="xiaotu17"
							src="../images/ico06.gif" width="8" height="12" />
						</td>
						<td width="91%"><a href="sendxiaoxi.htm" target="mainFrame"
							class="left-font03" onClick="tupian('17');">栏目管理</a>
						</td>
					</tr>
					<tr>
						<td width="9%" height="20"><img id="xiaotu18"
							src="../images/ico06.gif" width="8" height="12" />
						</td>
						<td width="91%"><a href="listtakexiaoxi.htm"
							target="mainFrame" class="left-font03" onClick="tupian('18');">查看文章</a>
						</td>
					</tr>
					<tr>
						<td width="9%" height="20"><img id="xiaotu19"
							src="../images/ico06.gif" width="8" height="12" />
						</td>
						<td width="91%"><a href="listsendxiaoxi.htm"
							target="mainFrame" class="left-font03" onClick="tupian('19');">添加文章
						</a>
						</td>
					</tr>
					<tr>
						<td width="9%" height="20"><img id="xiaotu24"
							src="../images/ico06.gif" width="8" height="12" />
						</td>
						<td width="91%"><a href="listxiaoxi.htm" target="mainFrame"
							class="left-font03" onClick="tupian('24');">我的文章 </a>
						</td>
					</tr>
				</table>
				<!--  文章管理系统结束    -->


				<!-- 附加管理系统开始 -->
				<TABLE width="100%" border="0" cellpadding="0" cellspacing="0"
					class="left-table03">
					<tr>
						<td height="29">
							<table width="85%" border="0" align="center" cellpadding="0"
								cellspacing="0">
								<tr>
									<td width="8%"><img name="img1" id="img1"
										src="../images/ico04.gif" width="8" height="11" />
									</td>
									<td width="92%"><a href="javascript:" target="mainFrame"
										class="left-font03" onClick="list('1');">附加管理</a>
									</td>
								</tr>
							</table></td>
					</tr>
				</TABLE>
				<table id="subtree1" style="DISPLAY: none" width="80%" border="0"
					align="center" cellpadding="0" cellspacing="0" class="left-table02">
					<tr>
						<td width="9%" height="20"><img id="xiaotu1"
							src="../images/ico06.gif" width="8" height="12" />
						</td>
						<td width="91%"><a href="listxiangmuxinxi.htm"
							target="mainFrame" class="left-font03" onClick="tupian('1');">值班管理</a>
						</td>
					</tr>
					<tr>
						<td width="9%" height="20"><img id="xiaotu4"
							src="../images/ico06.gif" width="8" height="12" />
						</td>
						<td width="91%"><a href="listjihua.htm" target="mainFrame"
							class="left-font03" onClick="tupian('4');">文章审核|文章管理</a>
						</td>
					</tr>
					<tr>
						<td width="9%" height="20"><img id="xiaotu2"
							src="../images/ico06.gif" width="8" height="12" />
						</td>
						<td width="91%"><a href="listxuqiu.htm" target="mainFrame"
							class="left-font03" onClick="tupian('2');">专题管理|投票管理</a>
						</td>
					</tr>
					<tr>
						<td width="9%" height="20"><img id="xiaotu5"
							src="../images/ico06.gif" width="8" height="12" />
						</td>
						<td width="91%"><a href="listmokuai.htm" target="mainFrame"
							class="left-font03" onClick="tupian('5');">公告管理|链接提示</a>
						</td>
					</tr>
					<tr>
						<td width="9%" height="20"><img id="xiaotu3"
							src="../images/ico06.gif" width="8" height="12" />
						</td>
						<td width="91%"><a href="listgongneng.htm" target="mainFrame"
							class="left-font03" onClick="tupian('3');">广告管理</a>
						</td>
					</tr>
					<tr>
						<td width="9%" height="20"><img id="xiaotu6"
							src="../images/ico06.gif" width="8" height="12" />
						</td>
						<td width="91%"><a href="listshangchuan.htm"
							target="mainFrame" class="left-font03" onClick="tupian('6');">备份压缩</a>
						</td>
					</tr>
					<tr>
						<td width="9%" height="20"><img id="xiaotu7"
							src="../images/ico06.gif" width="8" height="12" />
						</td>
						<td width="91%"><a href="listchengbenxinxi.htm"
							target="mainFrame" class="left-font03" onClick="tupian('7');">信息探测</a>
						</td>
					</tr>
				</table>
				<!--  项目系统结束    -->
				
				<!--  部门信息开始    -->
				<table width="100%" border="0" cellpadding="0" cellspacing="0"
					class="left-table03">
					<tr>
						<td height="29"><table width="85%" border="0" align="center"
								cellpadding="0" cellspacing="0">
								<tr>
									<td width="8%" height="12"><img name="img2" id="img2"
										src="../images/ico04.gif" width="8" height="11" />
									</td>
									<td width="92%"><a href="javascript:" target="mainFrame"
										class="left-font03" onClick="list('2');">部门信息</a>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>

				<table id="subtree2" style="DISPLAY: none" width="80%" border="0"
					align="center" cellpadding="0" cellspacing="0" class="left-table02">

					<tr>
						<td width="9%" height="20"><img id="xiaotu7"
							src="../images/ico06.gif" width="8" height="12" />
						</td>
						<td width="91%"><a href="listkehuxinxi.html"
							target="mainFrame" class="left-font03" onClick="tupian('7');">部门管理</a>
						</td>
					</tr>
				</table>
				<!--  部门信息系统结束    -->
				
				<!--  管理人员系统开始    -->
				<table width="100%" border="0" cellpadding="0" cellspacing="0"
					class="left-table03">
					<tr>
						<td height="29"><table width="85%" border="0" align="center"
								cellpadding="0" cellspacing="0">
								<tr>
									<td width="8%" height="12"><img name="img3" id="img3"
										src="../images/ico04.gif" width="8" height="11" />
									</td>
									<td width="92%"><a href="javascript:" target="mainFrame"
										class="left-font03" onClick="list('3');">管理人员</a>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>

				<table id="subtree3" style="DISPLAY: none" width="80%" border="0"
					align="center" cellpadding="0" cellspacing="0" class="left-table02">
					<tr>
						<td width="9%" height="20"><img id="xiaotu8"
							src="../images/ico06.gif" width="8" height="12" />
						</td>
						<td width="91%"><a href="listyuangong.html"
							target="mainFrame" class="left-font03" onClick="tupian('8');">超管信息查看</a>
						</td>
					</tr>
					<tr>
						<td width="9%" height="20"><img id="xiaotu9"
							src="../images/ico06.gif" width="8" height="12" />
						</td>
						<td width="91%"><a href="listzhiwu.htm" target="mainFrame"
							class="left-font03" onClick="tupian('9');">超管管理</a>
						</td>
					</tr>
					<tr>
						<td width="9%" height="20"><img id="xiaotu10"
							src="../images/ico06.gif" width="8" height="12" />
						</td>
						<td width="91%"><a href="listMonthYuanGongGongZi.htm"
							target="mainFrame" class="left-font03" onClick="tupian('10');">添加超管</a>
						</td>
					</tr>
				</table>
				<!--  管理人员系统结束    -->
				
				<!--个人信息管理开始-->

				<TABLE width="100%" border="0" cellpadding="0" cellspacing="0"
					class="left-table03">
					<tr>
						<td height="29">
							<table width="85%" border="0" align="center" cellpadding="0"
								cellspacing="0">
								<tr>
									<td width="8%"><img name="img9" id="img9"
										src="../images/ico04.gif" width="8" height="11" />
									</td>
									<td width="92%"><a href="javascript:" target="mainFrame"
										class="left-font03" onClick="list('9');">个人管理</a>
									</td>
								</tr>
							</table></td>
					</tr>
				</TABLE>

				<table id="subtree9" style="DISPLAY: none" width="80%" border="0"
					align="center" cellpadding="0" cellspacing="0" class="left-table02">
					<tr>
						<td width="9%" height="22"><img id="xiaotu22"
							src="../images/ico06.gif" width="8" height="12" />
						</td>
						<td width="91%"><a href="listgerenxinxi.htm"
							target="mainFrame" class="left-font03" onClick="tupian('22');">个人信息查看</a>
						</td>
					</tr>
					<tr>
						<td width="9%" height="23"><img id="xiaotu23"
							src="../images/ico06.gif" width="8" height="12" />
						</td>
						<td width="91%"><a href="listgerenrenwu.htm"
							target="mainFrame" class="left-font03" onClick="tupian('23');">任务信息查看</a>
						</td>
					</tr>
				</table>
				<!--  个人信息结束    -->
				
				<!--  用户管理系统开始    -->
				<table width="100%" border="0" cellpadding="0" cellspacing="0"
					class="left-table03">
					<tr>
						<td height="29"><table width="85%" border="0" align="center"
								cellpadding="0" cellspacing="0">
								<tr>
									<td width="8%" height="12"><img name="img4" id="img4"
										src="../images/ico04.gif" width="8" height="11" />
									</td>
									<td width="92%"><a href="javascript:" target="mainFrame"
										class="left-font03" onClick="list('4');">用户管理</a>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>

				<table id="subtree4" style="DISPLAY: none" width="80%" border="0"
					align="center" cellpadding="0" cellspacing="0" class="left-table02">
					<tr>
						<td width="9%" height="20"><img id="xiaotu11"
							src="../images/ico06.gif" width="8" height="12" />
						</td>
						<td width="91%"><a href="listGongZiType.htm"
							target="mainFrame" class="left-font03" onClick="tupian('11');">用户信息</a>
						</td>
					</tr>
					<tr>
						<td width="9%" height="20"><img id="xiaotu12"
							src="../images/ico06.gif" width="8" height="12" />
						</td>
						<td width="91%"><a href="listMonthYuanGongGongZi.htm"
							target="mainFrame" class="left-font03" onClick="tupian('12');">添加用户</a>
						</td>
					</tr>
				</table>
				<!--  用户管理系统结束    -->
				
				<!-- 系统管理开始 -->
				<table width="100%" border="0" cellpadding="0" cellspacing="0"
					class="left-table03">
					<tr>
						<td height="29"><table width="85%" border="0" align="center"
								cellpadding="0" cellspacing="0">
								<tr>
									<td width="8%"><img name="img5" id="img5"
										src="../images/ico04.gif" width="8" height="11" />
									</td>
									<td width="92%"><a href="javascript:" target="mainFrame"
										class="left-font03" onClick="list('5');">系统管理</a>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>

				<table id="subtree5" style="DISPLAY: none" width="80%" border="0"
					align="center" cellpadding="0" cellspacing="0" class="left-table02">
					<tr>
						<td width="9%" height="20"><img id="xiaotu13"
							src="../images/ico06.gif" width="8" height="12" />
						</td>
						<td width="91%"><a href="register.html" target="mainFrame"
							class="left-font03" onClick="tupian('13');">网站信息</a>
						</td>
					</tr>
					<tr>
						<td height="20"><img id="xiaotu14" src="../images/ico06.gif"
							width="8" height="12" />
						</td>
						<td><a href="addquanxian.html" target="mainFrame"
							class="left-font03" onClick="tupian('14');">功能设置</a>
						</td>
					</tr>
				</table>
				<!-- 系统管理结束-->
				
				<!-- 系统帮助开始 -->
				<table width="100%" border="0" cellpadding="0" cellspacing="0"
					class="left-table03">
					<tr>
						<td height="29"><table width="85%" border="0" align="center"
								cellpadding="0" cellspacing="0">
								<tr>
									<td width="8%"><img name="img6" id="img6"
										src="../images/ico04.gif" width="8" height="11" />
									</td>
									<td width="92%"><a href="mode.html" target="mainFrame"
										class="left-font03" onClick="list('6');">系统帮助</a>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
				<table id="subtree6" style="DISPLAY: none" width="80%" border="0"
					align="center" cellpadding="0" cellspacing="0" class="left-table02">
					<tr>
						<td width="9%" height="20"><img id="xiaotu15"
							src="../images/ico06.gif" width="8" height="12" />
						</td>
						<td width="91%"><a href="mode.html" target="mainFrame"
							class="left-font03" onClick="tupian('15');">用户手册</a>
						</td>
					</tr>
					<tr>
						<td height="20"><img id="xiaotu16" src="../images/ico06.gif"
							width="8" height="12" />
						</td>
						<td><a href="mode.html" target="mainFrame"
							class="left-font03" onClick="tupian('16');">规章制度</a>
						</td>
					</tr>
				</table> 
				<!-- 系统帮助结束-->
			</TD>
		</tr>

	</table>
</body>
</html>
