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

<title>${param.cont}</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="${pageContext.request.contextPath}/css/home.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/news.css" rel="stylesheet">
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/jquery.js"></script>

</head>

<body>
	<jsp:include page="head.jsp"></jsp:include>
	<input type="hidden" id="type" value="${param.type}" />
	<input type="hidden" id="cont" value="${param.cont}" />
	<div id="big_center" style="width: 100%">
		<!--左边部分开始-->
		<div class="big_left float_left">
			<div class="dl_dh lianmu_bg">
				<h3>${param.cont}</h3>
				<div class="dl_name">
					<ul>
						<s:if test="lmList.size() > 0">
							<s:iterator value="lmList">
								<s:if test="ltype3!=null">
									<li>
										<a href='${pageContext.request.contextPath}/article/selLmArArticleAction?type=3&cont=${ltype3}'>
										 ${ltype3}
										</a>
									</li>
								</s:if>
								<s:else>
									<li>
										<a href='${pageContext.request.contextPath}/article/selLmArArticleAction?type=2&cont=${ltype2}'>
										${ltype2}
										</a>
									</li>
								</s:else>
							</s:iterator>
							</s:if>
						<s:else>
								<li>本栏没有子栏目</li>
						</s:else>
					</ul>
				</div>
			</div>
			<div class="new_art lianmu_bg">
				<h3>最新更新</h3>
				<div class="new_art_list">
					<ul class="list">
						<!-- <li>·本栏目暂无更新</li> -->
						<s:if test="arList.size() > 0">
							<s:iterator value="arList2" end="9">
									<li>·
										<a>${atitle}</a>[${atime}]
									</li>
							</s:iterator>
						</s:if>
						<s:else>
							<li>·本栏目暂无更新</li>
						</s:else>
					</ul>
				</div>
				<!-- <script type="text/javascript">
					var data = "";
					var hstr = "";
					function getBeforeDate(n){
					    var n = n;
					    var d = new Date();
					    var year = d.getFullYear();
					    var mon=d.getMonth()+1;
					    var day=d.getDate();
					    if(day <= n){
					            if(mon>1) {
					               mon=mon-1;
					            }
					           else {
					             year = year-1;
					             mon = 12;
					             }
					           }
					          d.setDate(d.getDate()-n);
					          year = d.getFullYear();
					          mon=d.getMonth()+1;
					          day=d.getDate();
					     s = year+(mon<10?('0'+mon):mon)+(day<10?('0'+day):day);
					     return s;
					}
					var time = getBeforeDate(7);
					
				</script> -->
			</div>


		</div>
		<!--左边部分结束-->

		<!--右边部分开始-->
		<div class="big_right float_right">

			<!--位置导航部分开始-->
			<div class="position">
				<img src="${pageContext.request.contextPath}/images/lm_dot.gif"
					width="11" height="11">&nbsp;&nbsp;您的位置&nbsp;&nbsp;
					<a href="${pageContext.request.contextPath}">首页</a> &gt;&gt;
					<s:if test="#parameters.type[0]==1">
						${param.cont}
					</s:if>
					<s:elseif test="#parameters.type[0]==2">
						<a href="${pageContext.request.contextPath}/article/selLmArArticleAction?type=1&cont=<s:property value='lmList2[0].ltype'/>"><s:property value='lmList2[0].ltype'/></a>
						&gt;&gt;${param.cont}
					</s:elseif>
					<s:else>
						<a href="${pageContext.request.contextPath}/article/selLmArArticleAction?type=1&cont=<s:property value='lmList2[0].ltype'/>"><s:property value='lmList2[0].ltype'/></a>
						&gt;&gt;
						<a href="${pageContext.request.contextPath}/article/selLmArArticleAction?type=2&cont=<s:property value='lmList2[0].ltype2'/>"><s:property value='lmList2[0].ltype2'/></a>
						&gt;&gt;${param.cont}
					</s:else>	&gt;&gt;列表
			</div>
			<!--位置导航部分结束-->

			<!--列表部分开始-->
			<div class="class_listcnt">

				<div class="class_list1 lm_class_bg">
					<h4>
						<span class="more">
						<a href="${pageContext.request.contextPath}/article/moreLmArArticleAction?type=${param.type}&cont=${param.cont}">
							<img src="${pageContext.request.contextPath}/images/more.gif"
								alt="更多信息" border="0"> </a> </span>${param.cont}·[本栏]
								
					</h4>
					<!--无大类文章区开始-->

					<ul class="list">
						<s:if test="arList!=null && arList.size()>0">
							<%-- <br/>
							<s:iterator value="arList">
							<li>·
							文章标题${atitle}</li>
							</s:iterator>
							<br/> --%>
							<s:if test="#parameters.type[0]==1">
								<s:iterator value="lmList2">
									<s:if test="ltype2==null">
										<s:iterator value="arList" end="10">
											<s:if test="atype==lno">
												<li>·
												<a href="${pageContext.request.contextPath}/article/selArArticleAction?arId=<s:property value='ano'/>">
												${atitle}&nbsp;[${atime}]
												</a>
												</li>
											</s:if>
											<%-- <s:else>
												2atype!=lno
											</s:else> --%>
										</s:iterator>
									</s:if>
									<%-- <s:else>
										2!=null
									</s:else> --%>
								</s:iterator>
							</s:if>
							<s:elseif test="#parameters.type[0]==2">
								<s:iterator value="lmList2">
									<s:if test="ltype3==null">
										<s:iterator value="arList" end="10">
											<s:if test="atype==lno">
												<li>·
												<a href="${pageContext.request.contextPath}/article/selArArticleAction?arId=<s:property value='ano'/>">
												${atitle}</a>[${atime}]
												</li>
											</s:if>
											<%-- <s:else>
												3atype!=lno
											</s:else> --%>
										</s:iterator>
									</s:if>
									<%-- <s:else>
										3!=null
									</s:else> --%>
								</s:iterator>
							</s:elseif>
							<s:else>
								<s:iterator value="lmList2">
									<s:if test="ltype3!=null">
										<s:iterator value="arList" end="10"> 
											<s:if test="atype==lno">
												<li>·
												<a href="${pageContext.request.contextPath}/article/selArArticleAction?arId=<s:property value='ano'/>">
												${atitle}</a>[${atime}]
												</li>
											</s:if>
											<%-- <s:else>
												3!atype=lno
											</s:else> --%>
										</s:iterator>
									</s:if>
									<%-- <s:else>
										3=null
									</s:else> --%>
								</s:iterator>
							</s:else>
						</s:if>
						<s:else>
							<li>·暂无本栏信息</li>
						</s:else>
					</ul>

					<!--无大类文章区结束-->

				</div>

				<!--大类文章区开始-->
				<s:iterator value="lmList">
					<div class="class=list1 lm_class_bg">
						<h4>
							<s:elseif test="ltype3==null">
								<span class="more">
								<a href="${pageContext.request.contextPath}/article/moreLmArArticleAction?type=2&cont=${ltype2}">
								
								<img src="${pageContext.request.contextPath}/images/more.gif"
										alt="更多信息" border="0"> 
								</a></span>${ltype2}
							</s:elseif>
							<s:else>
								<span class="more">
								<a href="${pageContext.request.contextPath}/article/moreLmArArticleAction?type=3&cont=${ltype3}">
								
								<img src="${pageContext.request.contextPath}/images/more.gif"
										alt="更多信息" border="0"> 
								</a></span>${ltype3}
							</s:else>
							
						</h4>
						<ul class="list">
							<s:set var="ztarlm" value="0"></s:set>
							<s:iterator value="arList">
								<s:if test="atype==lno">
									<li>·
										<a href="${pageContext.request.contextPath}/article/selArArticleAction?arId=<s:property value='ano'/>">
										${atitle}</a>[${atime}]
									</li>
									<s:set var="ztarlm" value="1"> </s:set>
								</s:if>
							</s:iterator>
							<s:if test="#ztarlm==0">
								<li>·暂无信息</li>
							</s:if>
							
						</ul>
					</div>
				</s:iterator>
				<!--大类文章区结束-->
			</div>
			<!--列表部分结束-->
		</div>
		<!--右边部分结束-->
		<div class="clear_float"></div>
		<!-- 清除浮动属性 -->
	</div>
	<jsp:include page="/pages/foot.html"></jsp:include>
</body>
</html>
