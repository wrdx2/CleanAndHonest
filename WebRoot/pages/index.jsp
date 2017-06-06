<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>高校廉政建设</title>
<link href="${pageContext.request.contextPath}/css/home.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet">
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/pageDisp.js"></script>
<link rel="Shortcut Icon" href="WRZCNET.ico">
<!--IE地址栏前换成自己的图标-->
<link rel="Bookmark" href="WRZCNET.ico">
<!--可以在收藏夹中显示出你的图标-->
<script language="JavaScript">
function Helpor_net()
{
	return true;
}
window.onerror = Helpor_net;
</script>
<script type="text/JavaScript">
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
</script>
<script language="JavaScript">
if (self != top) top.location.href = window.location.href;
</script>

<script language="javascript">
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}
</script>
</head>

<body onload="init();" leftmargin="0" topmargin="0" marginwidth="0"
	marginheight="0">
	<!--内容部分开始-->
	<jsp:include page="head.jsp"></jsp:include>

	<script language="javascript">
//==========================
//        菜单开始
//==========================
//具有栏目隐藏与外部链接功能
mtDropDown.spacerGif = "images/Menu_x.gif"; 
mtDropDown.dingbatOn = "images/Menu_expand-1.gif"; 
mtDropDown.dingbatOff = "images/Menu_expand-0.gif"; 
mtDropDown.dingbatSize = 14; 
mtDropDown.menuPadding = 0; 
mtDropDown.itemPadding = 4; 
mtDropDown.shadowSize = 2; 
mtDropDown.shadowOffset = 3; 
mtDropDown.shadowColor = "#D2D1D1"; 
mtDropDown.shadowPng = "images/005.png"; 
mtDropDown.backgroundColor = "#EBEBEB"; 
mtDropDown.backgroundPng = "images/004.png"; 
mtDropDown.hideDelay = 100; 
mtDropDown.slideTime = 100; 

mtDropDown.reference = {topLeft:1,topRight:2,bottomLeft:3,bottomRight:4};
mtDropDown.direction = {down:1,right:2};
mtDropDown.registry = [];
mtDropDown._maxZ = 100;

mtDropDown.isSupported = function() {
if (typeof mtDropDown.isSupported.r == "boolean") 
return mtDropDown.isSupported.r;
var ua = navigator.userAgent.toLowerCase();
var an = navigator.appName;
var r = false;
if (ua.indexOf("gecko") > -1) r = true; 
else if (an == "Microsoft Internet Explorer") {
if (document.getElementById) r = true; 
}
mtDropDown.isSupported.r = r;
return r;
};

mtDropDown.initialize = function() {
for (var i = 0, menu = null; menu = this.registry[i]; i++) {
menu.initialize();
}
};

mtDropDown.renderAll = function() {
var aMenuHtml = [];
for (var i = 0, menu = null; menu = this.registry[i]; i++) {
aMenuHtml[i] = menu.toString();
}
document.write(aMenuHtml.join(""));
};

function mtDropDown(oActuator, iDirection, iLeft, iTop, iReferencePoint, parentMenuSet) {

this.addItem = addItem;
this.addMenu = addMenu;
this.toString = toString;
this.initialize = initialize;
this.isOpen = false;
this.show = show;
this.hide = hide;
this.items = [];

this.onactivate = new Function(); 
this.ondeactivate = new Function(); 
this.onmouseover = new Function(); 
this.onqueue = new Function(); 

this.index = mtDropDown.registry.length;
mtDropDown.registry[this.index] = this;
var id = "mtDropDown" + this.index;
var contentHeight = null;
var contentWidth = null;
var childMenuSet = null;
var animating = false;
var childMenus = [];
var slideAccel = -1;
var elmCache = null;
var ready = false;
var _this = this;
var a = null;
var pos = iDirection == mtDropDown.direction.down ? "top" : "left";
var dim = null;

function addItem(sText, sUrl) {
var item = new mtDropDownItem(sText, sUrl, this);
item._index = this.items.length;
this.items[item._index] = item;
}
function addMenu(oMenuItem) {
if (!oMenuItem.parentMenu == this) throw new Error("Cannot add a menu here");
if (childMenuSet == null) childMenuSet = new mtDropDownSet(mtDropDown.direction.right, -5, 2, mtDropDown.reference.topRight);
var m = childMenuSet.addMenu(oMenuItem);
childMenus[oMenuItem._index] = m;
m.onmouseover = child_mouseover;
m.ondeactivate = child_deactivate;
m.onqueue = child_queue;
return m;
}
function initialize() {
initCache();
initEvents();
initSize();
ready = true;
}
function show() {

if (ready) {
_this.isOpen = true;
animating = true;
setContainerPos();
elmCache["clip"].style.visibility = "visible";
elmCache["clip"].style.zIndex = mtDropDown._maxZ++;

slideStart();
_this.onactivate();
}
}
function hide() {
if (ready) {
_this.isOpen = false;
animating = true;
for (var i = 0, item = null; item = elmCache.item[i]; i++) 
dehighlight(item);
if (childMenuSet) childMenuSet.hide();
slideStart();
_this.ondeactivate();
}
}
function setContainerPos() {
var sub = oActuator.constructor == mtDropDownItem; 
var act = sub ? oActuator.parentMenu.elmCache["item"][oActuator._index] : oActuator; 
var el = act;
var x = 0;
var y = 0;
var minX = 0;
var maxX = (window.innerWidth ? window.innerWidth : document.body.clientWidth) - parseInt(elmCache["clip"].style.width);
var minY = 0;
var maxY = (window.innerHeight ? window.innerHeight : document.body.clientHeight) - parseInt(elmCache["clip"].style.height);

while (sub ? el.parentNode.className.indexOf("mtDropdownMenu") == -1 : el.offsetParent) {
x += el.offsetLeft;
y += el.offsetTop;
if (el.scrollLeft) x -= el.scrollLeft;
if (el.scrollTop) y -= el.scrollTop;
el = el.offsetParent;
}
if (oActuator.constructor == mtDropDownItem) {
x += parseInt(el.parentNode.style.left);
y += parseInt(el.parentNode.style.top);
}
switch (iReferencePoint) {
case mtDropDown.reference.topLeft:
break;
case mtDropDown.reference.topRight:
x += act.offsetWidth;
break;
case mtDropDown.reference.bottomLeft:
y += act.offsetHeight;
break;
case mtDropDown.reference.bottomRight:
x += act.offsetWidth;
y += act.offsetHeight;
break;
}
x += iLeft;
y += iTop;
x = Math.max(Math.min(x, maxX), minX);
y = Math.max(Math.min(y, maxY), minY);
elmCache["clip"].style.left = x + "px";
elmCache["clip"].style.top = y + "px";
}
function slideStart() {
var x0 = parseInt(elmCache["content"].style[pos]);
var x1 = _this.isOpen ? 0 : -dim;
if (a != null) a.stop();
a = new Accelimation(x0, x1, mtDropDown.slideTime, slideAccel);
a.onframe = slideFrame;
a.onend = slideEnd;
a.start();
}
function slideFrame(x) {
elmCache["content"].style[pos] = x + "px";
}
function slideEnd() {
if (!_this.isOpen) elmCache["clip"].style.visibility = "hidden";
animating = false;
}
function initSize() {

var ow = elmCache["items"].offsetWidth;
var oh = elmCache["items"].offsetHeight;
var ua = navigator.userAgent.toLowerCase();

elmCache["clip"].style.width = ow + mtDropDown.shadowSize + 2 + "px";
elmCache["clip"].style.height = oh + mtDropDown.shadowSize + 2 + "px";

elmCache["content"].style.width = ow + mtDropDown.shadowSize + "px";
elmCache["content"].style.height = oh + mtDropDown.shadowSize + "px";
contentHeight = oh + mtDropDown.shadowSize;
contentWidth = ow + mtDropDown.shadowSize;
dim = iDirection == mtDropDown.direction.down ? contentHeight : contentWidth;

elmCache["content"].style[pos] = -dim - mtDropDown.shadowSize + "px";
elmCache["clip"].style.visibility = "hidden";

if (ua.indexOf("mac") == -1 || ua.indexOf("gecko") > -1) {

elmCache["background"].style.width = ow + "px";
elmCache["background"].style.height = oh + "px";
elmCache["background"].style.backgroundColor = mtDropDown.backgroundColor;

elmCache["shadowRight"].style.left = ow + "px";
elmCache["shadowRight"].style.height = oh - (mtDropDown.shadowOffset - mtDropDown.shadowSize) + "px";
elmCache["shadowRight"].style.backgroundColor = mtDropDown.shadowColor;



elmCache["shadowBottom"].style.top = oh + "px";
elmCache["shadowBottom"].style.width = ow - mtDropDown.shadowOffset + "px";
elmCache["shadowBottom"].style.backgroundColor = mtDropDown.shadowColor;
}

else {

elmCache["background"].firstChild.src = mtDropDown.backgroundPng;
elmCache["background"].firstChild.width = ow;
elmCache["background"].firstChild.height = oh;

elmCache["shadowRight"].firstChild.src = mtDropDown.shadowPng;
elmCache["shadowRight"].style.left = ow + "px";
elmCache["shadowRight"].firstChild.width = mtDropDown.shadowSize;
elmCache["shadowRight"].firstChild.height = oh - (mtDropDown.shadowOffset - mtDropDown.shadowSize);



elmCache["shadowBottom"].firstChild.src = mtDropDown.shadowPng;
elmCache["shadowBottom"].style.top = oh + "px";
elmCache["shadowBottom"].firstChild.height = mtDropDown.shadowSize;
elmCache["shadowBottom"].firstChild.width = ow - mtDropDown.shadowOffset;
}
}
function initCache() {
var menu = document.getElementById(id);
var all = menu.all ? menu.all : menu.getElementsByTagName("*"); 
elmCache = {};
elmCache["clip"] = menu;
elmCache["item"] = [];
for (var i = 0, elm = null; elm = all[i]; i++) {
switch (elm.className) {
case "items":
case "content":
case "background":
case "shadowRight":
case "shadowBottom":
elmCache[elm.className] = elm;
break;
case "item":
elm._index = elmCache["item"].length;
elmCache["item"][elm._index] = elm;
break;
}
}

_this.elmCache = elmCache;
}
function initEvents() {

for (var i = 0, item = null; item = elmCache.item[i]; i++) {
item.onmouseover = item_mouseover;
item.onmouseout = item_mouseout;
item.onclick = item_click;
}

if (typeof oActuator.tagName != "undefined") {
oActuator.onmouseover = actuator_mouseover;
oActuator.onmouseout = actuator_mouseout;
}

elmCache["content"].onmouseover = content_mouseover;
elmCache["content"].onmouseout = content_mouseout;
}
function highlight(oRow) {
oRow.className = "item hover";
if (childMenus[oRow._index]) 
oRow.lastChild.firstChild.src = mtDropDown.dingbatOn;
}
function dehighlight(oRow) {
oRow.className = "item";
if (childMenus[oRow._index]) 
oRow.lastChild.firstChild.src = mtDropDown.dingbatOff;
}
function item_mouseover() {
if (!animating) {
highlight(this);
if (childMenus[this._index]) 
childMenuSet.showMenu(childMenus[this._index]);
else if (childMenuSet) childMenuSet.hide();
}
}
function item_mouseout() {
if (!animating) {
if (childMenus[this._index])
childMenuSet.hideMenu(childMenus[this._index]);
else 
dehighlight(this);
}
}
function item_click() {
if (!animating) {
if (_this.items[this._index].url) 
location.href = _this.items[this._index].url;
}
}
function actuator_mouseover() {
parentMenuSet.showMenu(_this);
}
function actuator_mouseout() {
parentMenuSet.hideMenu(_this);
}
function content_mouseover() {
if (!animating) {
parentMenuSet.showMenu(_this);
_this.onmouseover();
}
}
function content_mouseout() {
if (!animating) {
parentMenuSet.hideMenu(_this);
}
}
function child_mouseover() {
if (!animating) {
parentMenuSet.showMenu(_this);
}
}
function child_deactivate() {
for (var i = 0; i < childMenus.length; i++) {
if (childMenus[i] == this) {
dehighlight(elmCache["item"][i]);
break;
}
}
}
function child_queue() {
parentMenuSet.hideMenu(_this);
}
function toString() {
var aHtml = [];
var sClassName = "mtDropdownMenu" + (oActuator.constructor != mtDropDownItem ? " top" : "");
for (var i = 0, item = null; item = this.items[i]; i++) {
aHtml[i] = item.toString(childMenus[i]);
}
return '<div id="' + id + '" class="' + sClassName + '">' + 
'<div class="content"><table class="items" cellpadding="0" cellspacing="0" border="0">' + 
'<tr><td colspan="2"><img src="' + mtDropDown.spacerGif + '" width="1" height="' + mtDropDown.menuPadding + '"></td></tr>' + 
aHtml.join('') + 
'<tr><td colspan="2"><img src="' + mtDropDown.spacerGif + '" width="1" height="' + mtDropDown.menuPadding + '"></td></tr></table>' + 
'<div class="shadowBottom"><img src="' + mtDropDown.spacerGif + '" width="1" height="1"></div>' + 
'<div class="shadowRight"><img src="' + mtDropDown.spacerGif + '" width="1" height="1"></div>' + 
'<div class="background"><img src="' + mtDropDown.spacerGif + '" width="1" height="1"></div>' + 
'</div></div>';
}
}

mtDropDownSet.registry = [];
function mtDropDownSet(iDirection, iLeft, iTop, iReferencePoint) {

this.addMenu = addMenu;
this.showMenu = showMenu;
this.hideMenu = hideMenu;
this.hide = hide;

var menus = [];
var _this = this;
var current = null;
this.index = mtDropDownSet.registry.length;
mtDropDownSet.registry[this.index] = this;

function addMenu(oActuator) {
var m = new mtDropDown(oActuator, iDirection, iLeft, iTop, iReferencePoint, this);
menus[menus.length] = m;
return m;
}
function showMenu(oMenu) {
if (oMenu != current) {

if (current != null) hide(current); 

current = oMenu;

oMenu.show();
}
else {

cancelHide(oMenu);
}
}
function hideMenu(oMenu) {

if (current == oMenu && oMenu.isOpen) {

if (!oMenu.hideTimer) scheduleHide(oMenu);
}
}
function scheduleHide(oMenu) {

oMenu.onqueue();
oMenu.hideTimer = window.setTimeout("mtDropDownSet.registry[" + _this.index + "].hide(mtDropDown.registry[" + oMenu.index + "])", mtDropDown.hideDelay);
}
function cancelHide(oMenu) {

if (oMenu.hideTimer) {
window.clearTimeout(oMenu.hideTimer);
oMenu.hideTimer = null;
}
}
function hide(oMenu) { 
if (!oMenu && current) oMenu = current;
if (oMenu && current == oMenu && oMenu.isOpen) {

cancelHide(oMenu);
current = null;
oMenu.hideTimer = null;
oMenu.hide();
}
}
}

function mtDropDownItem(sText, sUrl, oParent) {
this.toString = toString;
this.text = sText;
this.url = sUrl;
this.parentMenu = oParent;
function toString(bDingbat) {
var sDingbat = bDingbat ? mtDropDown.dingbatOff : mtDropDown.spacerGif;
var iEdgePadding = mtDropDown.itemPadding + mtDropDown.menuPadding;
var sPaddingLeft = "padding:" + mtDropDown.itemPadding + "px; padding-left:" + iEdgePadding + "px;";
var sPaddingRight = "padding:" + mtDropDown.itemPadding + "px; padding-right:" + iEdgePadding + "px;";
return '<tr class="item"><td nowrap style="' + sPaddingLeft + '">' + 
sText + '</td><td width="14" style="' + sPaddingRight + '">' + 
'<img src="' + sDingbat + '" width="14" height="14"></td></tr>';
}
}

function Accelimation(from, to, time, zip) {
if (typeof zip == "undefined") zip = 0;
if (typeof unit == "undefined") unit = "px";
this.x0 = from;
this.x1 = to;
this.dt = time;
this.zip = -zip;
this.unit = unit;
this.timer = null;
this.onend = new Function();
this.onframe = new Function();
}

Accelimation.prototype.start = function() {
this.t0 = new Date().getTime();
this.t1 = this.t0 + this.dt;
var dx = this.x1 - this.x0;
this.c1 = this.x0 + ((1 + this.zip) * dx / 3);
this.c2 = this.x0 + ((2 + this.zip) * dx / 3);
Accelimation._add(this);
};

Accelimation.prototype.stop = function() {
Accelimation._remove(this);
};

Accelimation.prototype._paint = function(time) {
if (time < this.t1) {
var elapsed = time - this.t0;
this.onframe(Accelimation._getBezier(elapsed/this.dt,this.x0,this.x1,this.c1,this.c2));
}
else this._end();
};

Accelimation.prototype._end = function() {
Accelimation._remove(this);
this.onframe(this.x1);
this.onend();
};

Accelimation._add = function(o) {
var index = this.instances.length;
this.instances[index] = o;

if (this.instances.length == 1) {
this.timerID = window.setInterval("Accelimation._paintAll()", this.targetRes);
}
};

Accelimation._remove = function(o) {
for (var i = 0; i < this.instances.length; i++) {
if (o == this.instances[i]) {
this.instances = this.instances.slice(0,i).concat( this.instances.slice(i+1) );
break;
}
}

if (this.instances.length == 0) {
window.clearInterval(this.timerID);
this.timerID = null;
}
};

Accelimation._paintAll = function() {
var now = new Date().getTime();
for (var i = 0; i < this.instances.length; i++) {
this.instances[i]._paint(now);
}
};

Accelimation._B1 = function(t) { return t*t*t; };
Accelimation._B2 = function(t) { return 3*t*t*(1-t); };
Accelimation._B3 = function(t) { return 3*t*(1-t)*(1-t); };
Accelimation._B4 = function(t) { return (1-t)*(1-t)*(1-t); };

Accelimation._getBezier = function(percent,startPos,endPos,control1,control2) {
return endPos * this._B1(percent) + control2 * this._B2(percent) + control1 * this._B3(percent) + startPos * this._B4(percent);
};

Accelimation.instances = [];
Accelimation.targetRes = 10;
Accelimation.timerID = null;

</script>

	<script language="javascript">

		function init() {
			if (mtDropDown.isSupported()) {
				mtDropDown.initialize();
			}
		}

		// this is a crappy example preloader. Use whichever one you want.
		function loadImage(sFilename) {
			var img = new Image();
			img.src ="images/" + sFilename;
			return img;
		}
</script>


	<div class="global_nav" align="center">
		<ul>
			<li><a
				href="${pageContext.request.contextPath}/article/selLmArArticleAction?type=1&cont=廉政动态"
				id="menu1" title="廉政动态">廉政动态</a>
			</li>
			<li><a
				href="${pageContext.request.contextPath}/article/selLmArArticleAction?type=1&cont=政务公开"
				id="menu2" title="政务公开">政务公开</a>
			</li>
			<li><a
				href="${pageContext.request.contextPath}/article/selLmArArticleAction?type=1&cont=基层廉政"
				id="menu3" title="基层廉政">基层廉政</a>
			</li>
			<li><a
				href="${pageContext.request.contextPath}/article/selLmArArticleAction?type=1&cont=信访举报"
				id="menu5" title="信访举报">信访举报</a>
			</li>
			<li><a
				href="${pageContext.request.contextPath}/article/selLmArArticleAction?type=1&cont=廉政教育"
				id="menu6" title="廉政教育">廉政教育</a>
			</li>
			<li><a
				href="${pageContext.request.contextPath}/article/selLmArArticleAction?type=1&cont=效能建设"
				id="menu7" title="效能建设">效能建设</a>
			</li>
			<li><a
				href="${pageContext.request.contextPath}/article/selLmArArticleAction?type=1&cont=部门职能"
				id="menu10" title="部门职能">部门职能</a>
			</li>
			<li><a
				href="${pageContext.request.contextPath}/article/selLmArArticleAction?type=1&cont=政风行风"
				id="menu11" title="政风行风">政风行风</a>
			</li>
			<li><a
				href="${pageContext.request.contextPath}/article/selLmArArticleAction?type=1&cont=廉洁自律"
				id="menu12" title="廉洁自律">廉洁自律</a>
			</li>
			<li><a
				href="${pageContext.request.contextPath}/article/selLmArArticleAction?type=1&cont=执法监察"
				id="menu13" title="执法监察">执法监察</a>
			</li>
		</ul>
		<script language="javascript">
if (mtDropDown.isSupported()) {
	var ms = new mtDropDownSet(mtDropDown.direction.down, 0, 0, mtDropDown.reference.bottomLeft);

	var menu1 = ms.addMenu(document.getElementById('menu1'));
	menu1.addItem('- 廉政信息','${pageContext.request.contextPath}/article/selLmArArticleAction?type=2&cont=廉政信息'); 
	menu1.addItem('- 文件精神','${pageContext.request.contextPath}/article/selLmArArticleAction?type=2&cont=文化精神'); 
	menu1.addItem('- 政策法规','${pageContext.request.contextPath}/article/selLmArArticleAction?type=2&cont=政策法规'); 
	menu1.addItem('- 重要讲话','${pageContext.request.contextPath}/article/selLmArArticleAction?type=2&cont=重要讲话'); 

	var subMenu0 = menu1.addMenu(menu1.items[0]);
	subMenu0.addItem('- 人物简介','${pageContext.request.contextPath}/article/selLmArArticleAction?type=3&cont=人物简介');

	var menu2 = ms.addMenu(document.getElementById('menu2'));
	menu2.addItem('- 工作决策','${pageContext.request.contextPath}/article/selLmArArticleAction?type=2&cont=工作决策');
	menu2.addItem('- 干部任免','${pageContext.request.contextPath}/article/selLmArArticleAction?type=2&cont=干部任免');
	menu2.addItem('- 事项研究','${pageContext.request.contextPath}/article/selLmArArticleAction?type=2&cont=事项研究');

	var menu3 = ms.addMenu(document.getElementById('menu3'));
	menu3.addItem('- 廉政信息','${pageContext.request.contextPath}/article/selLmArArticleAction?type=2&cont=廉政信息');
	menu3.addItem('- 文件精神','${pageContext.request.contextPath}/article/selLmArArticleAction?type=2&cont=文件精神');
	menu3.addItem('- 政策法规','${pageContext.request.contextPath}/article/selLmArArticleAction?type=2&cont=政策法规');

	var menu7 = ms.addMenu(document.getElementById('menu7'));
	menu7.addItem('- 干部作风','${pageContext.request.contextPath}/article/selLmArArticleAction?type=2&cont=干部作风'); 
	menu7.addItem('- 效能投诉','${pageContext.request.contextPath}/article/selLmArArticleAction?type=2&cont=效能投诉'); 
	menu7.addItem('- 制度建设','${pageContext.request.contextPath}/article/selLmArArticleAction?type=2&cont=制度建设'); 

	var menu10 = ms.addMenu(document.getElementById('menu10'));
	menu10.addItem('- 队伍建设','${pageContext.request.contextPath}/article/selLmArArticleAction?type=2&cont=队伍建设'); 
	menu10.addItem('- 机构设置','${pageContext.request.contextPath}/article/selLmArArticleAction?type=2&cont=机构设置'); 
	menu10.addItem('- 领导分工','${pageContext.request.contextPath}/article/selLmArArticleAction?type=2&cont=领导分工'); 

	var menu11 = ms.addMenu(document.getElementById('menu11'));
	menu11.addItem('- 纠风工作','${pageContext.request.contextPath}/article/selLmArArticleAction?type=2&cont=纠风工作'); 
	menu11.addItem('- 监督检查','${pageContext.request.contextPath}/article/selLmArArticleAction?type=2&cont=监督检查'); 
	menu11.addItem('- 源头治理','${pageContext.request.contextPath}/article/selLmArArticleAction?type=2&cont=源头治理');

	var menu12 = ms.addMenu(document.getElementById('menu12'));
	menu12.addItem('- 廉政制度','${pageContext.request.contextPath}/article/selLmArArticleAction?type=2&cont=廉政制度'); 

	mtDropDown.renderAll();
	}
	//==========================
	//        菜单结束
	//==========================
</script>
		<div id="mtDropDown0" class="mtDropdownMenu top"
			style="width: 96px; height: 110px; visibility: hidden; left: 4px; top: 287px; z-index: 121;">
			<div class="content" style="width: 94px; height: 108px; top: -108px;">
				<table class="items" cellpadding="0" cellspacing="0" border="0">
					<tbody>
						<tr>
							<td colspan="2"><img src="images/Menu_x.gif" width="1"
								height="0">
							</td>
						</tr>
						<tr class="item">
							<td style="padding:4px; padding-left:4px;">- 廉政信息</td>
							<td width="14" style="padding:4px; padding-right:4px;"><img
								src="images/Menu_expand-0.gif" width="14" height="14">
							</td>
						</tr>
						<tr class="item">
							<td style="padding:4px; padding-left:4px;">- 文件精神</td>
							<td width="14" style="padding:4px; padding-right:4px;"><img
								src="images/Menu_x.gif" width="14" height="14">
							</td>
						</tr>
						<tr class="item">
							<td style="padding:4px; padding-left:4px;">- 政策法规</td>
							<td width="14" style="padding:4px; padding-right:4px;"><img
								src="images/Menu_x.gif" width="14" height="14">
							</td>
						</tr>
						<tr class="item">
							<td style="padding:4px; padding-left:4px;">- 重要讲话</td>
							<td width="14" style="padding:4px; padding-right:4px;"><img
								src="images/Menu_x.gif" width="14" height="14">
							</td>
						</tr>
						<tr>
							<td colspan="2"><img src="images/Menu_x.gif" width="1"
								height="0">
							</td>
						</tr>
					</tbody>
				</table>
				<div class="shadowBottom"
					style="top: 106px; width: 89px; background-color: rgb(210, 209, 209);">
					<img src="images/Menu_x.gif" width="1" height="1">
				</div>
				<div class="shadowRight"
					style="left: 92px; height: 105px; background-color: rgb(210, 209, 209);">
					<img src="images/Menu_x.gif" width="1" height="1">
				</div>
				<div class="background"
					style="width: 92px; height: 106px; background-color: rgb(235, 235, 235);">
					<img src="images/Menu_x.gif" width="1" height="1">
				</div>
			</div>
		</div>
		<div id="mtDropDown1" class="mtDropdownMenu"
			style="width: 96px; height: 32px; visibility: hidden; left: 90px; top: 294px; z-index: 125;">
			<div class="content" style="width: 94px; height: 30px; left: -94px;">
				<table class="items" cellpadding="0" cellspacing="0" border="0">
					<tbody>
						<tr>
							<td colspan="2"><img src="images/Menu_x.gif" width="1"
								height="0">
							</td>
						</tr>
						<tr class="item">
							<td style="padding:4px; padding-left:4px;">- 人物简介</td>
							<td width="14" style="padding:4px; padding-right:4px;"><img
								src="images/Menu_x.gif" width="14" height="14">
							</td>
						</tr>
						<tr>
							<td colspan="2"><img src="images/Menu_x.gif" width="1"
								height="0">
							</td>
						</tr>
					</tbody>
				</table>
				<div class="shadowBottom"
					style="top: 28px; width: 89px; background-color: rgb(210, 209, 209);">
					<img src="images/Menu_x.gif" width="1" height="1">
				</div>
				<div class="shadowRight"
					style="left: 92px; height: 27px; background-color: rgb(210, 209, 209);">
					<img src="images/Menu_x.gif" width="1" height="1">
				</div>
				<div class="background"
					style="width: 92px; height: 28px; background-color: rgb(235, 235, 235);">
					<img src="images/Menu_x.gif" width="1" height="1">
				</div>
			</div>
		</div>
		<div id="mtDropDown2" class="mtDropdownMenu top"
			style="width: 96px; height: 84px; visibility: hidden; left: 80px; top: 287px; z-index: 126;">
			<div class="content" style="width: 94px; height: 82px; top: -82px;">
				<table class="items" cellpadding="0" cellspacing="0" border="0">
					<tbody>
						<tr>
							<td colspan="2"><img src="images/Menu_x.gif" width="1"
								height="0">
							</td>
						</tr>
						<tr class="item">
							<td style="padding:4px; padding-left:4px;">- 工作决策</td>
							<td width="14" style="padding:4px; padding-right:4px;"><img
								src="images/Menu_x.gif" width="14" height="14">
							</td>
						</tr>
						<tr class="item">
							<td style="padding:4px; padding-left:4px;">- 干部任免</td>
							<td width="14" style="padding:4px; padding-right:4px;"><img
								src="images/Menu_x.gif" width="14" height="14">
							</td>
						</tr>
						<tr class="item">
							<td style="padding:4px; padding-left:4px;">- 事项研究</td>
							<td width="14" style="padding:4px; padding-right:4px;"><img
								src="images/Menu_x.gif" width="14" height="14">
							</td>
						</tr>
						<tr>
							<td colspan="2"><img src="images/Menu_x.gif" width="1"
								height="0">
							</td>
						</tr>
					</tbody>
				</table>
				<div class="shadowBottom"
					style="top: 80px; width: 89px; background-color: rgb(210, 209, 209);">
					<img src="images/Menu_x.gif" width="1" height="1">
				</div>
				<div class="shadowRight"
					style="left: 92px; height: 79px; background-color: rgb(210, 209, 209);">
					<img src="images/Menu_x.gif" width="1" height="1">
				</div>
				<div class="background"
					style="width: 92px; height: 80px; background-color: rgb(235, 235, 235);">
					<img src="images/Menu_x.gif" width="1" height="1">
				</div>
			</div>
		</div>
		<div id="mtDropDown3" class="mtDropdownMenu top"
			style="width: 96px; height: 84px; visibility: hidden; left: 156px; top: 287px; z-index: 127;">
			<div class="content" style="width: 94px; height: 82px; top: -82px;">
				<table class="items" cellpadding="0" cellspacing="0" border="0">
					<tbody>
						<tr>
							<td colspan="2"><img src="images/Menu_x.gif" width="1"
								height="0">
							</td>
						</tr>
						<tr class="item">
							<td style="padding:4px; padding-left:4px;">- 廉政信息</td>
							<td width="14" style="padding:4px; padding-right:4px;"><img
								src="images/Menu_x.gif" width="14" height="14">
							</td>
						</tr>
						<tr class="item">
							<td style="padding:4px; padding-left:4px;">- 文件精神</td>
							<td width="14" style="padding:4px; padding-right:4px;"><img
								src="images/Menu_x.gif" width="14" height="14">
							</td>
						</tr>
						<tr class="item">
							<td style="padding:4px; padding-left:4px;">- 政策法规</td>
							<td width="14" style="padding:4px; padding-right:4px;"><img
								src="images/Menu_x.gif" width="14" height="14">
							</td>
						</tr>
						<tr>
							<td colspan="2"><img src="images/Menu_x.gif" width="1"
								height="0">
							</td>
						</tr>
					</tbody>
				</table>
				<div class="shadowBottom"
					style="top: 80px; width: 89px; background-color: rgb(210, 209, 209);">
					<img src="images/Menu_x.gif" width="1" height="1">
				</div>
				<div class="shadowRight"
					style="left: 92px; height: 79px; background-color: rgb(210, 209, 209);">
					<img src="images/Menu_x.gif" width="1" height="1">
				</div>
				<div class="background"
					style="width: 92px; height: 80px; background-color: rgb(235, 235, 235);">
					<img src="images/Menu_x.gif" width="1" height="1">
				</div>
			</div>
		</div>
		<div id="mtDropDown4" class="mtDropdownMenu top"
			style="width: 96px; height: 84px; visibility: hidden; left: 232px; top: 287px; z-index: 128;">
			<div class="content" style="width: 94px; height: 82px; top: -82px;">
				<table class="items" cellpadding="0" cellspacing="0" border="0">
					<tbody>
						<tr>
							<td colspan="2"><img src="images/Menu_x.gif" width="1"
								height="0">
							</td>
						</tr>
						<tr class="item">
							<td style="padding:4px; padding-left:4px;">- 理论征文</td>
							<td width="14" style="padding:4px; padding-right:4px;"><img
								src="images/Menu_x.gif" width="14" height="14">
							</td>
						</tr>
						<tr class="item">
							<td style="padding:4px; padding-left:4px;">- 演讲比赛</td>
							<td width="14" style="padding:4px; padding-right:4px;"><img
								src="images/Menu_x.gif" width="14" height="14">
							</td>
						</tr>
						<tr class="item">
							<td style="padding:4px; padding-left:4px;">- 知识竞答</td>
							<td width="14" style="padding:4px; padding-right:4px;"><img
								src="images/Menu_x.gif" width="14" height="14">
							</td>
						</tr>
						<tr>
							<td colspan="2"><img src="images/Menu_x.gif" width="1"
								height="0">
							</td>
						</tr>
					</tbody>
				</table>
				<div class="shadowBottom"
					style="top: 80px; width: 89px; background-color: rgb(210, 209, 209);">
					<img src="images/Menu_x.gif" width="1" height="1">
				</div>
				<div class="shadowRight"
					style="left: 92px; height: 79px; background-color: rgb(210, 209, 209);">
					<img src="images/Menu_x.gif" width="1" height="1">
				</div>
				<div class="background"
					style="width: 92px; height: 80px; background-color: rgb(235, 235, 235);">
					<img src="images/Menu_x.gif" width="1" height="1">
				</div>
			</div>
		</div>
		<div id="mtDropDown5" class="mtDropdownMenu top"
			style="width: 96px; height: 110px; visibility: hidden; left: 460px; top: 287px; z-index: 129;">
			<div class="content" style="width: 94px; height: 108px; top: -108px;">
				<table class="items" cellpadding="0" cellspacing="0" border="0">
					<tbody>
						<tr>
							<td colspan="2"><img src="images/Menu_x.gif" width="1"
								height="0">
							</td>
						</tr>
						<tr class="item">
							<td style="padding:4px; padding-left:4px;">- 便民服务</td>
							<td width="14" style="padding:4px; padding-right:4px;"><img
								src="images/Menu_x.gif" width="14" height="14">
							</td>
						</tr>
						<tr class="item">
							<td style="padding:4px; padding-left:4px;">- 干部作风</td>
							<td width="14" style="padding:4px; padding-right:4px;"><img
								src="images/Menu_x.gif" width="14" height="14">
							</td>
						</tr>
						<tr class="item">
							<td style="padding:4px; padding-left:4px;">- 效能投诉</td>
							<td width="14" style="padding:4px; padding-right:4px;"><img
								src="images/Menu_x.gif" width="14" height="14">
							</td>
						</tr>
						<tr class="item">
							<td style="padding:4px; padding-left:4px;">- 制度建设</td>
							<td width="14" style="padding:4px; padding-right:4px;"><img
								src="images/Menu_x.gif" width="14" height="14">
							</td>
						</tr>
						<tr>
							<td colspan="2"><img src="images/Menu_x.gif" width="1"
								height="0">
							</td>
						</tr>
					</tbody>
				</table>
				<div class="shadowBottom"
					style="top: 106px; width: 89px; background-color: rgb(210, 209, 209);">
					<img src="images/Menu_x.gif" width="1" height="1">
				</div>
				<div class="shadowRight"
					style="left: 92px; height: 105px; background-color: rgb(210, 209, 209);">
					<img src="images/Menu_x.gif" width="1" height="1">
				</div>
				<div class="background"
					style="width: 92px; height: 106px; background-color: rgb(235, 235, 235);">
					<img src="images/Menu_x.gif" width="1" height="1">
				</div>
			</div>
		</div>
		<div id="mtDropDown6" class="mtDropdownMenu top"
			style="width: 96px; height: 58px; visibility: hidden; left: 536px; top: 287px; z-index: 130;">
			<div class="content" style="width: 94px; height: 56px; top: -56px;">
				<table class="items" cellpadding="0" cellspacing="0" border="0">
					<tbody>
						<tr>
							<td colspan="2"><img src="images/Menu_x.gif" width="1"
								height="0">
							</td>
						</tr>
						<tr class="item">
							<td style="padding:4px; padding-left:4px;">- 廉政漫画</td>
							<td width="14" style="padding:4px; padding-right:4px;"><img
								src="images/Menu_x.gif" width="14" height="14">
							</td>
						</tr>
						<tr class="item">
							<td style="padding:4px; padding-left:4px;">- 广告展播</td>
							<td width="14" style="padding:4px; padding-right:4px;"><img
								src="images/Menu_x.gif" width="14" height="14">
							</td>
						</tr>
						<tr>
							<td colspan="2"><img src="images/Menu_x.gif" width="1"
								height="0">
							</td>
						</tr>
					</tbody>
				</table>
				<div class="shadowBottom"
					style="top: 54px; width: 89px; background-color: rgb(210, 209, 209);">
					<img src="images/Menu_x.gif" width="1" height="1">
				</div>
				<div class="shadowRight"
					style="left: 92px; height: 53px; background-color: rgb(210, 209, 209);">
					<img src="images/Menu_x.gif" width="1" height="1">
				</div>
				<div class="background"
					style="width: 92px; height: 54px; background-color: rgb(235, 235, 235);">
					<img src="images/Menu_x.gif" width="1" height="1">
				</div>
			</div>
		</div>
		<div id="mtDropDown7" class="mtDropdownMenu top"
			style="width: 96px; height: 84px; visibility: hidden; left: 612px; top: 287px; z-index: 131;">
			<div class="content" style="width: 94px; height: 82px; top: -82px;">
				<table class="items" cellpadding="0" cellspacing="0" border="0">
					<tbody>
						<tr>
							<td colspan="2"><img src="images/Menu_x.gif" width="1"
								height="0">
							</td>
						</tr>
						<tr class="item">
							<td style="padding:4px; padding-left:4px;">- 六进活动</td>
							<td width="14" style="padding:4px; padding-right:4px;"><img
								src="images/Menu_x.gif" width="14" height="14">
							</td>
						</tr>
						<tr class="item">
							<td style="padding:4px; padding-left:4px;">- 书画墨香</td>
							<td width="14" style="padding:4px; padding-right:4px;"><img
								src="images/Menu_x.gif" width="14" height="14">
							</td>
						</tr>
						<tr class="item">
							<td style="padding:4px; padding-left:4px;">- 检察文苑</td>
							<td width="14" style="padding:4px; padding-right:4px;"><img
								src="images/Menu_x.gif" width="14" height="14">
							</td>
						</tr>
						<tr>
							<td colspan="2"><img src="images/Menu_x.gif" width="1"
								height="0">
							</td>
						</tr>
					</tbody>
				</table>
				<div class="shadowBottom"
					style="top: 80px; width: 89px; background-color: rgb(210, 209, 209);">
					<img src="images/Menu_x.gif" width="1" height="1">
				</div>
				<div class="shadowRight"
					style="left: 92px; height: 79px; background-color: rgb(210, 209, 209);">
					<img src="images/Menu_x.gif" width="1" height="1">
				</div>
				<div class="background"
					style="width: 92px; height: 80px; background-color: rgb(235, 235, 235);">
					<img src="images/Menu_x.gif" width="1" height="1">
				</div>
			</div>
		</div>
		<div id="mtDropDown8" class="mtDropdownMenu top"
			style="width: 96px; height: 84px; visibility: hidden; left: 688px; top: 287px; z-index: 132;">
			<div class="content" style="width: 94px; height: 82px; top: -82px;">
				<table class="items" cellpadding="0" cellspacing="0" border="0">
					<tbody>
						<tr>
							<td colspan="2"><img src="images/Menu_x.gif" width="1"
								height="0">
							</td>
						</tr>
						<tr class="item">
							<td style="padding:4px; padding-left:4px;">- 队伍建设</td>
							<td width="14" style="padding:4px; padding-right:4px;"><img
								src="images/Menu_x.gif" width="14" height="14">
							</td>
						</tr>
						<tr class="item">
							<td style="padding:4px; padding-left:4px;">- 机构设置</td>
							<td width="14" style="padding:4px; padding-right:4px;"><img
								src="images/Menu_x.gif" width="14" height="14">
							</td>
						</tr>
						<tr class="item">
							<td style="padding:4px; padding-left:4px;">- 领导分工</td>
							<td width="14" style="padding:4px; padding-right:4px;"><img
								src="images/Menu_x.gif" width="14" height="14">
							</td>
						</tr>
						<tr>
							<td colspan="2"><img src="images/Menu_x.gif" width="1"
								height="0">
							</td>
						</tr>
					</tbody>
				</table>
				<div class="shadowBottom"
					style="top: 80px; width: 89px; background-color: rgb(210, 209, 209);">
					<img src="images/Menu_x.gif" width="1" height="1">
				</div>
				<div class="shadowRight"
					style="left: 92px; height: 79px; background-color: rgb(210, 209, 209);">
					<img src="images/Menu_x.gif" width="1" height="1">
				</div>
				<div class="background"
					style="width: 92px; height: 80px; background-color: rgb(235, 235, 235);">
					<img src="images/Menu_x.gif" width="1" height="1">
				</div>
			</div>
		</div>
		<div id="mtDropDown9" class="mtDropdownMenu top"
			style="width: 96px; height: 84px; visibility: hidden; left: 712px; top: 287px; z-index: 133;">
			<div class="content" style="width: 94px; height: 82px; top: -82px;">
				<table class="items" cellpadding="0" cellspacing="0" border="0">
					<tbody>
						<tr>
							<td colspan="2"><img src="images/Menu_x.gif" width="1"
								height="0">
							</td>
						</tr>
						<tr class="item">
							<td style="padding:4px; padding-left:4px;">- 纠风工作</td>
							<td width="14" style="padding:4px; padding-right:4px;"><img
								src="images/Menu_expand-0.gif" width="14" height="14">
							</td>
						</tr>
						<tr class="item">
							<td style="padding:4px; padding-left:4px;">- 监督检查</td>
							<td width="14" style="padding:4px; padding-right:4px;"><img
								src="images/Menu_x.gif" width="14" height="14">
							</td>
						</tr>
						<tr class="item">
							<td style="padding:4px; padding-left:4px;">- 源头治理</td>
							<td width="14" style="padding:4px; padding-right:4px;"><img
								src="images/Menu_x.gif" width="14" height="14">
							</td>
						</tr>
						<tr>
							<td colspan="2"><img src="images/Menu_x.gif" width="1"
								height="0">
							</td>
						</tr>
					</tbody>
				</table>
				<div class="shadowBottom"
					style="top: 80px; width: 89px; background-color: rgb(210, 209, 209);">
					<img src="images/Menu_x.gif" width="1" height="1">
				</div>
				<div class="shadowRight"
					style="left: 92px; height: 79px; background-color: rgb(210, 209, 209);">
					<img src="images/Menu_x.gif" width="1" height="1">
				</div>
				<div class="background"
					style="width: 92px; height: 80px; background-color: rgb(235, 235, 235);">
					<img src="images/Menu_x.gif" width="1" height="1">
				</div>
			</div>
		</div>

		<div id="mtDropDown11" class="mtDropdownMenu top"
			style="width: 96px; height: 32px; visibility: hidden;">
			<div class="content" style="width: 94px; height: 30px; top: -32px;">
				<table class="items" cellpadding="0" cellspacing="0" border="0">
					<tbody>
						<tr>
							<td colspan="2"><img src="images/Menu_x.gif" width="1"
								height="0">
							</td>
						</tr>
						<tr class="item">
							<td style="padding:4px; padding-left:4px;">- 廉政制度</td>
							<td width="14" style="padding:4px; padding-right:4px;"><img
								src="images/Menu_x.gif" width="14" height="14">
							</td>
						</tr>
						<tr>
							<td colspan="2"><img src="images/Menu_x.gif" width="1"
								height="0">
							</td>
						</tr>
					</tbody>
				</table>
				<div class="shadowBottom"
					style="top: 28px; width: 89px; background-color: rgb(210, 209, 209);">
					<img src="images/Menu_x.gif" width="1" height="1">
				</div>
				<div class="shadowRight"
					style="left: 92px; height: 27px; background-color: rgb(210, 209, 209);">
					<img src="images/Menu_x.gif" width="1" height="1">
				</div>
				<div class="background"
					style="width: 92px; height: 28px; background-color: rgb(235, 235, 235);">
					<img src="images/Menu_x.gif" width="1" height="1">
				</div>
			</div>
		</div>

	</div>
	<!--左边部分开始-->
	<div id="CLeft">
		<!--导读开始-->
		<div id="daodu">
		</div>
		<div class="sitesearch">
			<form method="post" name="myform1" action="searchArticleAction"
				target="newwindow">
				<div class="s_cnt">
					站内搜索 ： <select name="action"
						style="width:130px;height:18px;border:1px solid #e4e4e4"
						align="absmiddle">
						<option value="">- 全 部 内 容 -</option>
						<option value="title">- 按 标 题 -</option>
						<option value="content">- 按 内 容 -</option>
						<option value="editor">- 按 作 者 -</option>
						<option value="about">- 按 关 键 字 -</option>
					</select> <input type="text" name="keyword"
						style="width:380px;height:18px;line-height:18px;border:1px solid #e4e4e4"
						value="请输入查询关键字" onfocus="if (value =='请输入查询关键字'){value ='';}"
						onblur="if (value ==''){value='请输入查询关键字';}" maxlength="50"
						align="absmiddle"> <input name="Submit" type="image"
						src="images/search_an.gif" width="44" height="20" border="0"
						align="absmiddle">
				</div>

			</form>
		</div>

		<!--文章列表开始-->

		<!-- <div class="art float_left">
			<h2>
				<span class="more">
				<a href="">
				<img src="image/more.gif" alt="更多" width="39" height="9" border="0">
				</a> </span>
				<a href="">政务公开</a>
			</h2>
			<!-- <div class="lanmu_pic">
				<a class="class" target="_blank" href="" title="网站建设中">
				<img src="uploadfile/jpg/2010-6/201061991413493.jpg" width="112"
					border="1" style="border-color:#ffffff" height="88">
				</a>
			</div> >>>

			<ul class="list">
				<li><span>11.19</span>· <a href="" title="网站建设中"
					target="_blank"> <font color=""> 网站建设中 </font> </a> <font
					class="pic_word">[图]</font> 标题后评论提示
				</li>
			</ul>
		</div>

		<div class="art art_right float_right">
			<h2>
				<span class="more"> <a href=""> <img src="image/more.gif"
						alt="更多 " width="39" height="9" border="0"> </a> </span><a href="">基层廉政</a>
			</h2>

			<ul class="list">

				<li><span>11.9</span>· <a href="" title="网站建设中" target="_blank">
						<font color="">网站建设中</font> </a> 标题后评论提示</li>

			</ul>
		</div>-->

		<div class="clear_float"></div>

		<!--互动专区开始-->
		<div class="hudong">
			<h2>
				<span class="more">
				<a href="" target="_blank">
				<img src="image/more.gif" alt="更多" width="39" height="9" border="0">
				</a> 
				</span>
				<a href="" target="_blank">廉政接待</a>
			</h2>
			<div class="vote float_left">
				<div class="vote_tit">廉政调查</div>

				<div class="vote_list"><!-- 
					<form action="" method="post" name="research" target="newwindow"
						id="research"> -->
						<table width="184" border="0" align="center" cellpadding="0"
							cellspacing="0">
							<tbody>
								<tr>
									<td height="25" colspan="2" align="center" valign="middle"
										class="black_title">小型民意调查</td>
								</tr>
								<tr>
									<td id="pageVoteName" height="25" colspan="2" align="center" valign="middle" class="black_title">
									
									</td>
								</tr>

								<tr id="pageVoteNode">
									<td id="pageVote" colspan="2" align="left">
									<!-- <input style=" border:0 " checked="checked" 
										name="Options" type="CheckBox" value="1">
										1.。。。<br> 
									<input style=" border:0 " name="Options"
										type="CheckBox" value="2">
										2.。。。<br> -->
										</td>
								</tr>
								<tr>
									<td height="48" colspan="2" align="center">
									<input style="width:50px;height:18px;border:1px solid #bbb;background:#fff;color:#333;text-align:center;line-height:16px;"
										type="button" onclick="voteSubmit()" 
										value="提 交">
									<input onclick="voteLook()" type="button" value="查 看" 
										style="width:50px;height:18px;border:1px solid #bbb;background:#fff;color:#333;text-align:center;line-height:16px;">
									</td>
								</tr>
							</tbody>
						</table>
					<!-- </form> -->

				</div>
				<div class="vote_bottom"></div>
			</div>
<script type="text/javascript">
function Show_SubLmy(id_num,num){
	//舌签功能
	for(var i=0;i<=9;i++){
		
		if(GetObj("S_MenuMy_"+id_num+i)){
			GetObj("S_MenuMy_"+id_num+i).className='';
			
		}
		if(GetObj("S_ContMy_"+id_num+i)){
			GetObj("S_ContMy_"+id_num+i).style.display='none';
		}
		
	}
	if(GetObj("S_MenuMy_"+id_num+num)){
		GetObj("S_MenuMy_"+id_num+num).className='selectd';
		
	}
	if(GetObj("S_ContMy_"+id_num+num)){
		GetObj("S_ContMy_"+id_num+num).style.display='block';
		
	}
	
}
function GetObj(objName){
	
	if(document.getElementById){
		
		return eval('document.getElementById("'+objName+'")');		
		
	}else {
		
		return eval('document.all.'+objName);		
		
	}
	
}
</script>
			<div class="hd slide_bg float_right">
				<ul class="T_Menu_style">
					<li class="selectd" id="S_MenuMy_11" onclick="openurl('')"
						onmouseover="Show_SubLmy(1,1); return false">网上受理</li>
					<li id="S_MenuMy_12" onclick="openurl('')"
						onmouseover="Show_SubLmy(1,2); return false">廉政咨询</li>
					<li id="S_MenuMy_13" onclick="openurl('')"
						onmouseover="Show_SubLmy(1,3); return false">建议献策</li>
					<li id="S_MenuMy_14" onclick="openurl('')"
						onmouseover="Show_SubLmy(1,4); return false">公众留言</li>
				</ul>
			<div id="S_ContMy_11">
<script language="javascript">
function myform_onsubmit() {
	var i, n;
	if (document.myform.receptnum.value=="")
		{
		  alert("对不起，请输入受理编号！");
		  document.myform.receptnum.focus();
		  return false;
		 }
	else if (document.myform.g_password.value=="")
		{
		  alert("对不起，请输入查询密码！");
		  document.myform.g_password.focus();
		  return false;
		 }
}
</script>
					<form action="" method="post" name="myform" target="_blank"
						id="myform" onsubmit="return myform_onsubmit()" class="myform">
						受理编号：<input name="receptnum" type="text" id="receptnum"
							style="width:80px;height:16px;border:1px solid #9FAABF">
						查询密码：<input name="g_password" type="password" id="g_password"
							style="width:80px;height:16px;border:1px solid #9FAABF">
						<input name="Submit" type="image"
							style="Cursor: hand;width:44; height:20"
							src="image/an_search.gif" align="absmiddle"> <br>
					</form>
					<table width="100%" align="center" cellpadding="0" cellspacing="0"
						border="1" bordercolor="#BBBBBB">
						<tbody>
							<tr align="center" class="blue_tit">
								<td width="12%" height="23" bgcolor="#FFFFFF">状态</td>
								<td width="17%" bgcolor="#FFFFFF">交办</td>
								<td width="51%" bgcolor="#FFFFFF">审批事项</td>
								<td width="20%" bgcolor="#FFFFFF">提交</td>
							</tr>

							<tr class="normal_tr" onmouseover="this.className='Hover_tr'"
								onmouseout="this.className='normal_tr'">
								<td height="23" align="center">已审</td>
								<td height="23" align="center">信访局</td>
								<td align="left">·<a class="list" href="" target="_blank">举报建设中..</a>
								</td>
								<td align="center">2016-11-13</td>
							</tr>

						</tbody>
					</table>
				</div>

				<div id="S_ContMy_12" style="DISPLAY: none">
					<table width="98%" align="center" cellpadding="0" cellspacing="0"
						border="1" bordercolor="#BBBBBB">
						<tbody>
							<tr align="center" class="blue_tit">
								<td width="16%" height="24" bgcolor="#FFFFFF">状态</td>
								<td width="58%" bgcolor="#FFFFFF">信访举报标题</td>
								<td width="26%" bgcolor="#FFFFFF">日 &nbsp;期</td>
							</tr>

							<tr class="normal_tr" onmouseover="this.className='Hover_tr'"
								onmouseout="this.className='normal_tr'">
								<td height="22" align="center">已办结</td>
								<td align="left">·<a class="list" href="" target="_black">举报模块建设中..</a>
								</td>
								<td align="center">2016-11-14</td>
							</tr>

						</tbody>
					</table>
				</div>

				<div id="S_ContMy_13" style="DISPLAY: none">
					<table width="98%" align="center" cellpadding="0" cellspacing="0"
						border="1" bordercolor="#BBBBBB">
						<tbody>
							<tr align="center" class="blue_tit">
								<td width="16%" height="24" bgcolor="#FFFFFF">状态</td>
								<td width="58%" bgcolor="#FFFFFF">发言标题</td>
								<td width="26%" bgcolor="#FFFFFF">发言日期</td>
							</tr>

							<tr class="normal_tr" onmouseover="this.className='Hover_tr'"
								onmouseout="this.className='normal_tr'">
								<td height="22" align="center">已处理</td>
								<td align="left">·<a class="list" href="" target="_blank">模块建设中</a>
								</td>
								<td align="center">2016-11-16</td>
							</tr>

							<tr class="normal_tr" onmouseover="this.className='Hover_tr'"
								onmouseout="this.className='normal_tr'">
								<td height="22" align="center">已处理</td>
								<td align="left">·<a class="list" href="" target="_blank">建设中</a>
								</td>
								<td align="center">2016-11-16</td>
							</tr>

						</tbody>
					</table>
				</div>

				<div id="S_ContMy_14" style="DISPLAY: none">

					<div>
						<ul class="list">

							<li>·评论&nbsp;<a href="" title="模块建设中" target="_blank">模块建设中</a>
							</li>
							<li>·留言&nbsp;<a href="" title="模块建设中" target="_blank">模块建设中</a>
							</li>

						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- 清除全部样式（主要复位浮动） -->
		<div class="clear_float"></div>
		<!--单位部门开始-->
		<div class="hudong">
			<h2>
				<span class="more"><a href="" target="_blank"><img
						src="image/more.gif" alt="更多" width="28" height="9" border="0">
				</a> </span><a href="" target="_blank">下属单位部门</a>
			</h2>
			<div class="bm slide_bg">
				<ul class="T_Menu_style">
					<li class="selectd" id="S_MenuMy_21" onclick="openurl('')"
						onmouseover="Show_SubLmy(2,1); return false">政府部门</li>
					<li id="S_MenuMy_22" onclick="openurl('')"
						onmouseover="Show_SubLmy(2,2); return false" class="">乡镇机构</li>
					<li id="S_MenuMy_23" onclick="openurl('')"
						onmouseover="Show_SubLmy(2,3); return false" class="">其他单位</li>
				</ul>

				<div id="S_ContMy_21" style="display: block;">
					<table width="98%" border="0" cellspacing="2" cellpadding="0">

						<tbody>
							<tr>

								<td height="19">·<a href="" class="list" target="_blank">管理部</a>
								</td>

								<td height="19">·<a href="" class="list" target="_blank">策划部</a>
								</td>

								<td height="19">·<a href="" class="list" target="_blank">财务部</a>
								</td>

								<td height="19">·<a href="" class="list" target="_blank">客户部</a>
								</td>

								<td height="19">·<a href="" class="list" target="_blank">发改委</a>
								</td>

								<td height="19">·<a href="" class="list" target="_blank">建管局</a>
								</td>

							</tr>

							<tr>
								<td height="19">·<a href="" class="list" target="_blank">民政局</a>
								</td>

								<td height="19">·<a href="" class="list" target="_blank">商务局</a>
								</td>

								<td height="19">·<a href="" class="list" target="_blank">国税局</a>
								</td>

								<td height="19">·<a href="" class="list" target="_blank">建设局</a>
								</td>

								<td height="19">·<a href="" class="list" target="_blank">科技局</a>
								</td>

							</tr>
						</tbody>
					</table>
				</div>

				<div id="S_ContMy_22" style="display: none;">
					<table width="98%" border="0" align="center" cellpadding="0"
						cellspacing="2">

						<tbody>
							<tr>
								<td height="21">·<a href="" target="_blank">办公室</a></td>

							</tr>
						</tbody>
					</table>
				</div>

				<div id="S_ContMy_23" style="display: none;">
					<table width="98%" border="0" align="center" cellpadding="0"
						cellspacing="2">
						<tbody>
							<tr>
								<td height="21">· <a href="" target="_blank">纪检委</a>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>

	</div>
	<!--左边部分结束-->
	<!--右边部分开始-->
	<div id="CRight">
		<div class="Rcnt1">
			<div class="zt">
				
				<div class="zt_bottom"></div>
			</div>
			<div class="hotnews lianmu_bg">
				<h3>今日值班</h3>


				<table width="100%" height="103" border="1" bordercolor="#BBBBBB"
					cellpadding="0" cellspacing="0">
					<tbody>
						<tr>
							<td height="30" colspan="2" align="center">今天是：2016年11月8日&nbsp;&nbsp;星期二</td>
						</tr>
						<tr>
							<td width="30%" height="35" align="center" bgcolor="#EFFAFE">值班人员</td>
							<td width="70%" align="center"><a href="WrzcNet_Duty.asp"
								target="_blank">王荣道</a>
							</td>
						</tr>
						<tr>
							<td width="30%" height="36" align="center" bgcolor="#EFFAFE">值班电话</td>
							<td width="70%" align="center"><a href="WrzcNet_Duty.asp"
								target="_blank">15732115734</a>
							</td>
						</tr>
					</tbody>
				</table>

			</div>

			<div class="stat lianmu_bg">
				<h3>网上举报中心</h3>
				<div class="visit float_left">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tbody>
							<tr>
								<td height="65"><a href="" target="_blank"><img
										src="image/12380.gif" alt="我要举报" border="0"> </a>
								</td>
							</tr>
							<tr>
								<td height="65"><a href="" target="_blank"><img
										src="image/12380range.png" alt="受理范围" border="0"> </a>
								</td>
							</tr>
							<tr>
								<td height="65"><a href="" target="_blank"><img
										src="image/12380in.png" alt="举报须知" border="0"> </a>
								</td>
							</tr>
							<tr>
								<td height="65"><a href="" target="_blank"><img
										src="image/12380dep.png" alt="受理单位" border="0"> </a>
								</td>
							</tr>
							<tr>
								<td height="65"><a href="" target="_blank"><img
										src="image/12380aq.png" alt="举报问答" border="0"> </a>
								</td>
							</tr>
							<tr>
								<td height="65"><a href="" target="_blank"><img
										src="image/12380bulide.png" alt="制度建设" border="0"> </a>
								</td>
							</tr>
						</tbody>
					</table>

				</div>
				<div class="bs_bottom"></div>
			</div>
			<div class="clear_float"></div>
			<div class="hotnews lianmu_bg">
				<h3>热门信息排名</h3>
				<div>
					<ul class="list">

						<li>·<a href="" title="网站建设中" target="_blank"> <font
								color=""> 网站建设中。。。 </font> </a>
						</li>
					</ul>
				</div>
				<div class="bs_bottom"></div>
			</div>
			<div class="stat lianmu_bg">
				<h3>发稿排行</h3>
				<div class="bm_article">
					<table width="100%" height="59" border="0" cellpadding="0"
						cellspacing="1" bgcolor="#eeeeee">
						<tbody>
							<tr>
								<td width="57%" height="22" align="left"><b>单位部门</b>
								</td>
								<td width="43%" align="right"><b>稿件总计</b>
								</td>
							</tr>
							<tr>
								<td width="57%" height="20" align="left">政府部门-管理部</td>
								<td width="43%" height="20" align="right">0</td>
							</tr>
							<tr>
								<td width="57%" height="20" align="left">政府部门-策划部</td>
								<td width="43%" height="20" align="right">0</td>
							</tr>

							<tr>
								<td colspan="2" align="right"><a class="class"
									href="WrzcNet_Alldep.asp">更多</a>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="clear_float"></div>
				<div class="bs_bottom"></div>

				<div class="stat lianmu_bg">
					<h3>数据统计</h3>

					<div class="visit">
						<ul>
							<li>今日文章：<font color="red">[0]</font>
							</li>
							<li>文章总数：<font color="red">[0]</font>
							</li>
							<li>昨日访问：<font color="red">[0]</font>
							</li>
							<li>今日访问：<font color="red">[0]</font>
							</li>
							<li>上月访问：<font color="red">[0]</font>
							</li>
							<li>本月访问：<font color="red">[0]</font>
							</li>
							<li>访问总数：<font color="red">[0]</font>
							</li>
							<li>当前在线：<font color="red">[0]</font>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--右边部分结束-->
	<!--内容部分结束-->
</body>
</html>
