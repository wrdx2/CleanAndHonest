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
<link href="../css/home.css" rel="stylesheet">
<link href="../css/index.css" rel="stylesheet">
<link rel="Shortcut Icon" href="WRZCNET.ico">
<!--IE地址栏前换成自己的图标-->
<link rel="Bookmark" href="WRZCNET.ico">
<!--可以在收藏夹中显示出你的图标-->
<script language="JavaScript">  function Helpor_net()
 {
    return true;
 }
 window.onerror = Helpor_net;
 -->
</script>
<script src="inc/slide.js" type="text/javascript"></script>

<script type="text/JavaScript">function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
</script>
<script language="JavaScript">
if (self != top) top.location.href = window.location.href;
</script>
<script language="JavaScript">//
var version = "other";
browserName = navigator.appName;   
browserVer = parseInt(navigator.appVersion);
if (browserName == "Netscape" && browserVer >= 3) version = "n3";
else if (browserName == "Netscape" && browserVer < 3) version = "n2";
else if (browserName == "Microsoft Internet Explorer" && browserVer >= 4) version = "e4";
else if (browserName == "Microsoft Internet Explorer" && browserVer < 4) version = "e3";
function marquee1()
{
	if (version == "e4" | version == "n3")
	{
		document.write("<marquee style='BOTTOM: 0px; FONT-WEIGHT: 100px; HEIGHT:120px;  TEXT-ALIGN: left; TOP: 0px' id='news' scrollamount='1' scrolldelay='10' behavior='loop' direction='up' border='0' onmouseover='this.stop()' onmouseout='this.start()'>");
	}
}

function marquee2()
{
	if (version == "e4" | version == "n3")
	{
		document.write("</marquee>");
	}
}

function marquee_logo_news()
{
	if (version == "e4")
	{
		document.write("<marquee style='BOTTOM: 0px; FONT-WEIGHT: 1200px; HEIGHT:31px;  TEXT-ALIGN: left; TOP: 0px' id='link_map' scrollamount='2' scrolldelay='10' behavior='alternate' direction='right' border='0' onmouseover='this.stop()' onmouseout='this.start()'>");
	}
}

function marquee3()
{
	if (version == "e4" | version == "n3")
	{
		document.write("<marquee direction='left' border='0' onmouseover='this.stop()' onmouseout='this.start()'>");
	}
}

function marquee4()
{
	if (version == "e4" | version == "n3")
	{
		document.write("</marquee>");
	}
}

function marquee5()
{
	if (version == "e4" | version == "n3")
	{
		document.write("<marquee style='BOTTOM: 0px; FONT-WEIGHT: 100px; HEIGHT:100px;  TEXT-ALIGN: left; TOP: 0px' id='news' scrollamount='1' scrolldelay='10' behavior='loop' direction='up' border='0' onmouseover='this.stop()' onmouseout='this.start()'>");
	}
}

function marquee6()
{
	if (version == "e4" | version == "n3")
	{
		document.write("</marquee>");
	}
}

</script>
<script language="JavaScript1.2">
function makevisible(cur,which){
if (which==0)
cur.filters.alpha.opacity=100
else
cur.filters.alpha.opacity=20
}
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
//原 mt_dropdown_initialize.js
		var preloaded = [];

		// here is a lame preloading script i am putting in just for demonstration
		for (var i = 1; i <= 8; i++) {
			preloaded[i] = [loadImage(i + "-0.gif"), loadImage(i + "-1.gif")];
		}

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


	<div class="global_nav" algin="center">
		<ul>
			<li><a href="" id="menu1"
				title="廉政动态">廉政动态</a>
			</li>
			<li><a href="" id="menu2"
				title="政务公开">政务公开</a>
			</li>
			<li><a href="" id="menu3"
				title="基层廉政">基层廉政</a>
			</li>
			<!-- <li><a href="" id="menu4"
				title="大漠清风">大漠清风</a>
			</li> -->
			<li><a href="" id="menu5" title="信访举报">信访举报</a>
			</li>
			<li><a href="" id="menu6"
				title="廉政教育">廉政教育</a>
			</li>
			<li><a href="" id="menu7"
				title="效能建设">效能建设</a>
			</li>
			<!-- <li><a href="" id="menu8"
				title="廉政视频">廉政视频</a>
			</li> -->
			<!-- <li><a href="" id="menu9"
				title="廉政文化">廉政文化</a>
			</li> -->
			<li><a href="" id="menu10"
				title="部门职能">部门职能</a>
			</li>
			<li><a href="" id="menu11"
				title="政风行风">政风行风</a>
			</li>
			<li><a href="" id="menu12"
				title="廉洁自律">廉洁自律</a>
			</li>
			<li><a href="" id="menu13"
				title="执法监察">执法监察</a>
			</li>
		</ul>
		<script language="javascript">
if (mtDropDown.isSupported()) {
	var ms = new mtDropDownSet(mtDropDown.direction.down, 0, 0, mtDropDown.reference.bottomLeft);

	var menu1 = ms.addMenu(document.getElementById('menu1'));
	menu1.addItem('- 廉政信息',''); 
	menu1.addItem('- 文件精神',''); 
	menu1.addItem('- 政策法规',''); 
	menu1.addItem('- 重要讲话',''); 

	var subMenu0 = menu1.addMenu(menu1.items[0]);
	subMenu0.addItem('- 人物简介','');

	var menu2 = ms.addMenu(document.getElementById('menu2'));
	menu2.addItem('- 工作决策','');
	menu2.addItem('- 干部任免','');
	menu2.addItem('- 事项研究','');

	var menu3 = ms.addMenu(document.getElementById('menu3'));
	menu3.addItem('- 廉政信息','');
	menu3.addItem('- 文件精神','');
	menu3.addItem('- 政策法规','');

	/* var menu4 = ms.addMenu(document.getElementById('menu4'));
	menu4.addItem('- 理论征文','');
	menu4.addItem('- 演讲比赛','');
	menu4.addItem('- 知识竞答','');  */

	var menu7 = ms.addMenu(document.getElementById('menu7'));
	//menu7.addItem('- 便民服务',''); 
	menu7.addItem('- 干部作风',''); 
	menu7.addItem('- 效能投诉',''); 
	menu7.addItem('- 制度建设',''); 

	/* var menu8 = ms.addMenu(document.getElementById('menu8'));
	menu8.addItem('- 廉政漫画',''); 
	menu8.addItem('- 广告展播','');  */

	/* var menu9 = ms.addMenu(document.getElementById('menu9'));
	menu9.addItem('- 六进活动',''); 
	menu9.addItem('- 书画墨香',''); 
	menu9.addItem('- 检察文苑','');  */

	var menu10 = ms.addMenu(document.getElementById('menu10'));
	menu10.addItem('- 队伍建设',''); 
	menu10.addItem('- 机构设置',''); 
	menu10.addItem('- 领导分工',''); 

	var menu11 = ms.addMenu(document.getElementById('menu11'));
	menu11.addItem('- 纠风工作',''); 
	menu11.addItem('- 监督检查',''); 
	menu11.addItem('- 源头治理',''); 

	/* var subMenu0 = menu11.addMenu(menu11.items[0]);
	subMenu0.addItem('- [旅游景区]','');
	subMenu0.addItem('- [旅游导览]','');
	subMenu0.addItem('- [特色餐饮]','');
	subMenu0.addItem('- [宾馆酒店]','');
	subMenu0.addItem('- [旅 行 社]','');
	subMenu0.addItem('- [旅游黄页]','');
	subMenu0.addItem('- [摄影天地]',''); */

	var menu12 = ms.addMenu(document.getElementById('menu12'));
	menu12.addItem('- 廉政制度',''); 

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
		<div id="mtDropDown10" class="mtDropdownMenu"
			style="width: 108px; height: 188px; visibility: hidden; left: 700px; top: 294px; z-index: 134;">
			<div class="content"
				style="width: 106px; height: 186px; left: -106px;">
				<table class="items" cellpadding="0" cellspacing="0" border="0">
					<tbody>
						<tr>
							<td colspan="2"><img src="images/Menu_x.gif" width="1"
								height="0">
							</td>
						</tr>
						<tr class="item">
							<td style="padding:4px; padding-left:4px;">- [旅游景区]</td>
							<td width="14" style="padding:4px; padding-right:4px;"><img
								src="images/Menu_x.gif" width="14" height="14">
							</td>
						</tr>
						<tr class="item">
							<td style="padding:4px; padding-left:4px;">- [旅游导览]</td>
							<td width="14" style="padding:4px; padding-right:4px;"><img
								src="images/Menu_x.gif" width="14" height="14">
							</td>
						</tr>
						<tr class="item">
							<td style="padding:4px; padding-left:4px;">- [特色餐饮]</td>
							<td width="14" style="padding:4px; padding-right:4px;"><img
								src="images/Menu_x.gif" width="14" height="14">
							</td>
						</tr>
						<tr class="item">
							<td style="padding:4px; padding-left:4px;">- [宾馆酒店]</td>
							<td width="14" style="padding:4px; padding-right:4px;"><img
								src="images/Menu_x.gif" width="14" height="14">
							</td>
						</tr>
						<tr class="item">
							<td style="padding:4px; padding-left:4px;">- [旅 行 社]</td>
							<td width="14" style="padding:4px; padding-right:4px;"><img
								src="images/Menu_x.gif" width="14" height="14">
							</td>
						</tr>
						<tr class="item">
							<td style="padding:4px; padding-left:4px;">- [旅游黄页]</td>
							<td width="14" style="padding:4px; padding-right:4px;"><img
								src="images/Menu_x.gif" width="14" height="14">
							</td>
						</tr>
						<tr class="item">
							<td style="padding:4px; padding-left:4px;">- [摄影天地]</td>
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
					style="top: 184px; width: 101px; background-color: rgb(210, 209, 209);">
					<img src="images/Menu_x.gif" width="1" height="1">
				</div>
				<div class="shadowRight"
					style="left: 104px; height: 183px; background-color: rgb(210, 209, 209);">
					<img src="images/Menu_x.gif" width="1" height="1">
				</div>
				<div class="background"
					style="width: 104px; height: 184px; background-color: rgb(235, 235, 235);">
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
			<div id="picture">
				<table width="280" border="0" cellpadding="0" cellspacing="0"
					id="Layer7" style="display: none;">
					<tbody>
						<tr>
							<td height="17" style="CURSOR: hand;">
							<img src="image/pic1.gif" width="287" height="30" border="0"
								usemap="#Map7">
							</td>
						</tr>
						<tr>
							<td height="200" align="center"><script
									type="text/javascript">
imgUrl1="uploadfile/jpg/2010-6/201061993511731.jpg";
imgtext1="网站建设中";
imgLink1=escape("");

 var focus_width=285;
 var focus_height=180;
 var text_height=20;
 var swf_height = focus_height+text_height;
 
 var pics=imgUrl1+"|"+imgUrl2+"|"+imgUrl3+"|"+imgUrl4+"|"+imgUrl5;
 var links=imgLink1+"|"+imgLink2+"|"+imgLink3+"|"+imgLink4+"|"+imgLink5;
 var texts=imgtext1+"|"+imgtext2+"|"+imgtext3+"|"+imgtext4+"|"+imgtext5;
 
 document.write('<object type="application/x-shockwave-flash" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="'+ focus_width +'" height="'+ swf_height +'">');
 document.write('<param name="allowScriptAccess" value="sameDomain"><param name="movie" value="images/focus.swf"><param name="quality" value="high"><param name="bgcolor" value="#F8DDAA">');
 document.write('<param name="menu" value="false"><param name=wmode value="opaque">');
 document.write('<param name="FlashVars" value="pics='+pics+'&links='+links+'&texts='+texts+'&borderwidth='+focus_width+'&borderheight='+focus_height+'&textheight='+text_height+'">');
 document.write('<embed src="images/focus.swf" wmode="opaque" FlashVars="pics='+pics+'&links='+links+'&texts='+texts+'&borderwidth='+focus_width+'&borderheight='+focus_height+'&textheight='+text_height+'" menu="false" bgcolor=""#bbbbbb" quality="high" width="'+ focus_width +'" height="'+ focus_height +'" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />'); 
 document.write('</object>');
  </script>
							</td>
						</tr>
					</tbody>
				</table>

				<table width="280" height="220" border="0" cellpadding="0"
					cellspacing="0" id="Layer8" style="visibility: visible;">
					<tbody>
						<tr>
							<td height="17" style="CURSOR: hand;"><img
								src="image/pic2.gif" width="287" height="30" border="0"
								usemap="#Map8">
							</td>
						</tr>
						<tr>
							<td height="200" align="center">
								<table width="285" border="0" align="center" cellpadding="0"
									cellspacing="0">
									<tbody>
										<tr>
											<td rowspan="8" bgcolor="#FFFFFF" align="center">
											<object
													classid="CLSID:22d6f312-b0f6-11d0-94ab-0080c74c7e95"
													codebase="http://activex.microsoft.com/activex/controls/mplayer/en/nsmp2inf.cab#Version=6,4,5,715"
													type="application/x-oleobject" width="285" height="200"
													hspace="0" vspace="0" align="middle" style="FILTER: Gray()"
													standby="Loading Microsoft Windows Media Player components..."
													id="NSPlay">
													<!-- ASX File Name -->
													<param name="AutoRewind" value="1">
													<param name="FileName"
														value="uploadfile/wmv/2010-6-25/2010625174446811.wmv">
													<!-- Display Controls -->
													<param name="ShowControls" value="1">
													<!-- Display Position Controls -->
													<param name="ShowPositionControls" value="0">
													<!-- Display Audio Controls -->
													<param name="ShowAudioControls" value="1">
													<!-- Display Tracker Controls -->
													<param name="ShowTracker" value="0">
													<!-- Show Display -->
													<param name="ShowDisplay" value="0">
													<!-- Display Status Bar -->
													<param name="ShowStatusBar" value="0">
													<!-- Diplay Go To Bar -->
													<param name="ShowGotoBar" value="0">
													<!-- Display Controls -->
													<param name="ShowCaptioning" value="0">
													<!-- Player Autostart -->
													<param name="AutoStart" value="0">
													<!-- Animation at Start -->
													<param name="Volume" value="-100">
													<param name="AnimationAtStart" value="0">
													<!-- Transparent at Start -->
													<param name="TransparentAtStart" value="0">
													<!-- Do not allow a change in display size -->
													<param name="AllowChangeDisplaySize" value="0">
													<!-- Do not allow scanning -->
													<param name="AllowScan" value="0">
													<!-- Do not show contect menu on right mouse click -->
													<param name="EnableContextMenu" value="0">
													<!-- Do not allow playback toggling on mouse click -->
													<param name="ClickToPlay" value="1">
													<!-- 是否循环播放 -->
													<param name="PlayCount" value="0">
												</object>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
					</tbody>
				</table>

			</div>
			<div class="tt_tj">
				<div class="tiaotiao">
					<a target="_blank" href="" title="通知公告">通知公告</a>
				</div>
				<div class="tj">
					<ul class="list">
						<li>
						<span>11/9</span>·
						<a target="_blank" href="" title="网站建设中">网站建设中</a>
						</li>

						<li><span>11/9</span>·
						<a target="_blank" href="" title="网站建设中"> 网站建设中</a>
						</li>

					</ul>
				</div>
			</div>
			<div class="clear_float"></div>
			<map name="Map7" id="Map7">
				<area onmouseover="javascript:ShowPic(Layer7);" shape="rect"
					coords="14,1,115,30">
				<area onmouseover="javascript:ShowPic(Layer8);" shape="rect"
					coords="134,5,204,28">
			</map>
			<map name="Map8" id="Map8">
				<area onmouseover="javascript:ShowPic(Layer7);shape=quot;rect&quot;"
					coords="28,7,96,28">
				<area onmouseover="javascript:ShowPic(Layer8);shape=quot;rect&quot;"
					coords="117,2,218,30" shape="rect">
			</map>


			<script>
       document.all.Layer8.style.display="none";
       document.all.Layer8.style.visibility="hidden";

function ShowPic(taobj) {
       document.all.Layer7.style.display="none";
       document.all.Layer8.style.display="none";

	taobj.style.display="";
	taobj.style.visibility="visible";

}
</script>
		</div>
		<div class="sitesearch">
			<form method="post" name="myform1" action="Result.asp"
				target="newwindow">
				<div class="s_cnt">
					站内搜索 ： 
					<select name="action"
						style="width:130px;height:18px;border:1px solid #e4e4e4"
						align="absmiddle">
						<option value="">- 全 部 内 容 -</option>
						<option value="title">- 按 标 题 -</option>
						<option value="content">- 按 内 容 -</option>
						<option value="editor">- 按 作 者 -</option>
						<option value="about">- 按 关 键 字 -</option>
					</select> 
					<input type="text" name="keyword"
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

		<div class="art float_left">
			<h2>
				<span class="more">
				<a href="">
				<img src="image/more.gif" alt="更多" width="39" height="9" border="0">
				</a> </span><a href="">政务公开</a>
			</h2>

			<div class="lanmu_pic">
				<a class="class" target="_blank" href="" title="网站建设中">
				<img src="uploadfile/jpg/2010-6/201061991413493.jpg" width="112"
					border="1" style="border-color:#ffffff" height="88"> </a>

			</div>

			<ul class="list">
				<li><span>11.19</span>·
				<a href="" title="网站建设中" target="_blank">
					<font color=""> 网站建设中 </font> </a>
					<font class="pic_word">[图]</font> <!--标题后评论提示-->

				</li>

				<li><span>11.9</span>·
				<a href="" title="网站建设中" target="_blank">
				<font color="">网站建设中</font> </a> <!--标题后评论提示--></li>

			</ul>
		</div>

		<div class="art art_right float_right">
			<h2>
				<span class="more">
				<a href="">
				<img src="image/more.gif" alt="更多 " width="39" height="9" border="0">
				</a> </span><a href="">基层廉政</a>
			</h2>

			<div class="lanmu_pic">
				<a class="class" target="_blank" href="" title="网站建设中">
				<img src="uploadfile/jpg/2010-6/201061992410422.jpg" width="112"
					border="1" style="border-color:#ffffff" height="88"> </a>


			</div>

			<ul class="list">

				<li><span>11.9</span>·
				<a href="" title="网站建设中" target="_blank">
				<font color="">网站建设中</font> </a> <!--标题后评论提示--></li>

			</ul>
		</div>

		<div class="art float_left">

			<h2>
				<span class="more">
				<a href="">
				<img src="image/more.gif" alt="更多" width="39" height="9" border="0">
				</a> </span><a href="">廉政文化</a>
			</h2>

			<div class="lanmu_pic">
				<a class="class" target="_blank" href="" title="网站建设中"> 
				<img src="uploadfile/jpg/2010-6/201061992940481.jpg" width="112"
					border="1" style="border-color:#ffffff" height="88"> </a>
			</div>

			<ul class="list">

				<li><span>11.9</span>·
				<a href="" title="网站建设中" target="_blank">
				<font color=""> 网站建设中</font> </a> <!--标题后评论提示--></li>
			</ul>
		</div>

		<div class="art art_right float_right">
			<h2>
				<span class="more">
				<a href="">
				<img src="image/more.gif" alt="更多 " width="39" height="9" border="0">
				</a> </span><a href="">廉政教育</a>
			</h2>

			<div class="lanmu_pic">
				<a class="class" target="_blank" href="" title="网站建设中">
				<img src="uploadfile/jpg/2010-6/201061993511731.jpg" width="112"
					border="1" style="border-color:#ffffff" height="88"> </a>
			</div>

			<ul class="list">

				<li><span>11.9</span>·
				<a href="" title="网站建设中" target="_blank">
					<font color=""> 网站建设中</font> </a> <!--标题后评论提示--></li>
			</ul>
		</div>

		<div class="clear_float"></div>
		<div class="newpic">
			<div class="pic_t">

				<div class="scrollpic" id="demo">
					<!--滚动区的高度和宽度-->
					<table align="center" cellpadding="0" cellspace="0" border="0">
						<tbody>
							<tr>
								<td id="demo1" valign="top">
									<table width="100%" cellpadding="0" cellspacing="0" border="0"
										align="center">
										<tbody>
											<tr valign="top">

												<td align="center">
													<div class="pic_cont"
														onmouseover="this.className='pic_cont pic_cont_Hover'"
														onmouseout="this.className='pic_cont'">

														<a href="" target="_blank" title="">
														<img src="uploadfile/jpg/2010-6/201061992410422.jpg"
															width="120" height="90" border="0">
														</a>
													</div>
												</td>

												<td align="center">
													<div class="pic_cont"
														onmouseover="this.className='pic_cont pic_cont_Hover'"
														onmouseout="this.className='pic_cont'">

														<a href="" target="_blank" title="">
														<img src="uploadfile/jpg/2010-6/201061991413493.jpg"
															width="120" height="90" border="0"> </a>
													</div>
												</td>
											</tr>
										</tbody>
									</table></td>
								<td id="demo2" valign="top">
									<table width="100%" cellpadding="0" cellspacing="0" border="0"
										align="center">
										<tbody>
											<tr valign="top">
												<td align="center">
													<div class="pic_cont"
														onmouseover="this.className='pic_cont pic_cont_Hover'"
														onmouseout="this.className='pic_cont'">

														<a href="" target="_blank"
															title=""><img
															src="uploadfile/jpg/2010-6/201061993511731.jpg"
															width="120" height="90" border="0"> </a>
													</div>
												</td>

												<td align="center">
													<div class="pic_cont"
														onmouseover="this.className='pic_cont pic_cont_Hover'"
														onmouseout="this.className='pic_cont'">

														<a href="" target="_blank" title="">
														<img src="uploadfile/jpg/2010-6/201061991413493.jpg"
															width="120" height="90" border="0"> </a>
													</div>
												</td>
											</tr>
										</tbody>
									</table></td>
							</tr>
						</tbody>
					</table>
				</div>

<script>
var speed=30;
demo2.innerHTML=demo1.innerHTML;
function Marquee1(){
if(demo2.offsetWidth-demo.scrollLeft<=0)
demo.scrollLeft-=demo1.offsetWidth;
else{
demo.scrollLeft++;
}
}
var MyMar1=setInterval(Marquee1,speed);
demo.onmouseover=function() {clearInterval(MyMar1);};
demo.onmouseout=function() {MyMar1=setInterval(Marquee1,speed);};

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


			</div>
		</div>

		<!--互动专区开始-->
		<div class="hudong">
			<h2>
				<span class="more"><a href=""
					target="_blank"><img src="image/more.gif" alt="更多" width="39"
						height="9" border="0"> </a> </span><a href=""
					target="_blank">廉政接待</a>
			</h2>
			<div class="vote float_left">
				<div class="vote_tit">廉政调查</div>
				<div class="vote_list">
					<form action="" method="post" name="research"
						target="newwindow" id="research">
						<table width="184" border="0" align="center" cellpadding="0"
							cellspacing="0">

							<tbody>
								<tr>
									<td height="25" colspan="2" align="center" valign="middle"
										class="black_title">小型民意调查</td>
								</tr>

								<tr>
									<td colspan="2" align="left"><input style=" border:0 "
										checked=true name="Options" type="CheckBox" value="1">
										1.。。。<br> <input style=" border:0 " name="Options"
										type="CheckBox" value="2"> 2.。。。<br> <input
										style=" border:0 " name="Options" type="CheckBox" value="3">
										3.。。。<br> <input style=" border:0 " name="Options"
										type="CheckBox" value="4"> 4.。。。<br> <input
										style=" border:0 " name="Options" type="CheckBox" value="5">
										5.。。。<br></td>
								</tr>
								<tr>
									<td height="48" colspan="2" align="center"><input
										style="cursor:hand;width:50px;height:18px;border:1px solid #bbb;background:#fff;color:#333;text-align:center;line-height:16px;"
										type="submit" value="提 交" id="submit1" name="submit1">
										<input onclick="javascript:vote()" type="button" value="查 看"
										id="button1" name="button1"
										style="cursor:hand;width:50px;height:18px;border:1px solid #bbb;background:#fff;color:#333;text-align:center;line-height:16px;">
									</td>
								</tr>
							</tbody>
						</table>
					</form>

				</div>
				<div class="vote_bottom"></div>
			</div>
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
	if (document. myform.receptnum.value=="")
		{
		  alert("对不起，请输入受理编号！");
		  document. myform.receptnum.focus();
		  return false;
		 }
	else if (document. myform.g_password.value=="")
		{
		  alert("对不起，请输入查询密码！");
		  document. myform.g_password.focus();
		  return false;
		 }
}
</script>
					<form action="" method="post"
						name="myform" target="_blank" id="myform"
						onsubmit="return myform_onsubmit()" class="myform">
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
								<td align="left">·<a class="list"
									href="" target="_black">举报模块建设中..</a>
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
								<td align="left">·<a class="list"
									href="" target="_blank">模块建设中</a>
								</td>
								<td align="center">2016-11-16</td>
							</tr>

							<tr class="normal_tr" onmouseover="this.className='Hover_tr'"
								onmouseout="this.className='normal_tr'">
								<td height="22" align="center">已处理</td>
								<td align="left">·<a class="list"
									href="" target="_blank">建设中</a>
								</td>
								<td align="center">2016-11-16</td>
							</tr>

						</tbody>
					</table>
				</div>

				<div id="S_ContMy_14" style="DISPLAY: none">

					<div>
						<ul class="list">

							<li>·评论&nbsp;<a href=""
								title="模块建设中" target="_blank">模块建设中</a>
							</li>
							<li>·留言&nbsp;<a href=""
								title="模块建设中" target="_blank">模块建设中</a>
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
				<span class="more"><a href=""
					target="_blank"><img src="image/more.gif" alt="更多" width="28"
						height="9" border="0"> </a> </span><a href=""
					target="_blank">下属单位部门</a>
			</h2>
			<div class="bm slide_bg">
				<ul class="T_Menu_style">
					<li class="selectd" id="S_MenuMy_21"
						onclick="openurl('')"
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

								<td height="19">·<a href="" class="list"
									target="_blank">管理部</a></td>

								<td height="19">·<a href="" class="list"
									target="_blank">策划部</a></td>

								<td height="19">·<a href="" class="list"
									target="_blank">财务部</a></td>

								<td height="19">·<a href="" class="list"
									target="_blank">客户部</a></td>

								<td height="19">·<a href="" class="list"
									target="_blank">发改委</a></td>

								<td height="19">·<a href="" class="list"
									target="_blank">建管局</a></td>

							</tr>

							<tr>
								<td height="19">·<a href="" class="list"
									target="_blank">民政局</a></td>

								<td height="19">·<a href="" class="list"
									target="_blank">商务局</a></td>

								<td height="19">·<a href="" class="list"
									target="_blank">国税局</a></td>

								<td height="19">·<a href="" class="list"
									target="_blank">建设局</a></td>

								<td height="19">·<a href="" class="list"
									target="_blank">科技局</a></td>

							</tr>
						</tbody>
					</table>
				</div>

				<div id="S_ContMy_22" style="display: none;">
					<table width="98%" border="0" align="center" cellpadding="0"
						cellspacing="2">

						<tbody>
							<tr>
								<td height="21">·<a href=""
									target="_blank">办公室</a></td>

							</tr>
						</tbody>
					</table>
				</div>

				<div id="S_ContMy_23" style="display: none;">
					<table width="98%" border="0" align="center" cellpadding="0"
						cellspacing="2">
						<tbody>
							<tr>
								<td height="21">·
								<a href="" target="_blank">纪检委</a>
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
				<div class="zt_tit gg_tit">
					<a href="" target="_blank">廉政公告</a>
				</div>
				<div class="zt_list">
					<marquee direction="Up" id="scrollarea" onmouseover="this.stop();"
						onmouseout="this.start();" scrollamount="1" scrolldelay="10"
						height="190" style="height: 190px;">
						<div id="demoa"
							style="OVERFLOW: hidden; WIDTH: 240px; HEIGHT: 195px">
							<div id="demoa1">
								<ul>

									<li>·<a href="dologin?ID=49"
										class="link_style" target="_blank">模块建设中</a>
									</li>

								</ul>
							</div>
							<div id="demoa2"></div>
						</div>
					</marquee>
					<script language="JavaScript">
var version = "other";
browserName = navigator.appName;   
browserVer = parseInt(navigator.appVersion);
if (browserName == "Netscape" && browserVer >= 3) version = "n3";
else if (browserName == "Netscape" && browserVer < 3) version = "n2";
else if (browserName == "Microsoft Internet Explorer" && browserVer >= 4) version = "e4";
else if (browserName == "Microsoft Internet Explorer" && browserVer < 4) version = "e3";
function marquee1()
{
	if (version == "e4" | version == "n3")
	{
		document.write("<marquee style='BOTTOM: 0px; FONT-WEIGHT: 100px; HEIGHT:120px;  TEXT-ALIGN: left; TOP: 0px' id='news' scrollamount='1' scrolldelay='10' behavior='loop' direction='up' border='0' onmouseover='this.stop()' onmouseout='this.start()'>");
	}
}

function marquee2()
{
	if (version == "e4" | version == "n3")
	{
		document.write("</marquee>");
	}
}

function marquee_logo_news()
{
	if (version == "e4")
	{
		document.write("<marquee style='BOTTOM: 0px; FONT-WEIGHT: 1200px; HEIGHT:31px;  TEXT-ALIGN: left; TOP: 0px' id='link_map' scrollamount='2' scrolldelay='10' behavior='alternate' direction='right' border='0' onmouseover='this.stop()' onmouseout='this.start()'>");
	}
}

function marquee3()
{
	if (version == "e4" | version == "n3")
	{
		document.write("<marquee direction='left' border='0' onmouseover='this.stop()' onmouseout='this.start()'>");
	}
}

function marquee4()
{
	if (version == "e4" | version == "n3")
	{
		document.write("</marquee>");
	}
}

function marquee5()
{
	if (version == "e4" | version == "n3")
	{
		document.write("<marquee style='BOTTOM: 0px; FONT-WEIGHT: 100px; HEIGHT:100px;  TEXT-ALIGN: left; TOP: 0px' id='news' scrollamount='1' scrolldelay='10' behavior='loop' direction='up' border='0' onmouseover='this.stop()' onmouseout='this.start()'>");
	}
}

function marquee6()
{
	if (version == "e4" | version == "n3")
	{
		document.write("</marquee>");
	}
}

</script>
				</div>
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
			<div class="zt">
				<div class="zt_tit">
					<a href="" target="_blank">廉政专题</a>
				</div>
				<div class="zt_list">

					<ul class="pic_sp">

						<li><a href="" target="_blank">
								<img src="uploadfile/gif/2010-6-25/201062511359364.gif"
								width="240" height="50" border="0" align="center"> </a></li>

						<li><a href="" target="_blank">
								<img src="uploadfile/jpg/2010-6-25/2010625113435235.jpg"
								width="240" height="50" border="0" align="center"> </a></li>

					</ul>

				</div>
				<div class="zt_bottom"></div>
			</div>

			<div class="stat lianmu_bg">
				<h3>网上举报中心</h3>
				<div class="visit float_left">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tbody>
							<tr>
								<td height="65"><a href=""
									target="_blank"><img src="image/12380.gif" alt="我要举报"
										border="0"> </a>
								</td>
							</tr>
							<tr>
								<td height="65"><a href=""
									target="_blank"><img src="image/12380range.png" alt="受理范围"
										border="0"> </a>
								</td>
							</tr>
							<tr>
								<td height="65"><a href=""
									target="_blank"><img src="image/12380in.png" alt="举报须知"
										border="0"> </a>
								</td>
							</tr>
							<tr>
								<td height="65"><a href=""
									target="_blank"><img src="image/12380dep.png" alt="受理单位"
										border="0"> </a>
								</td>
							</tr>
							<tr>
								<td height="65"><a href=""
									target="_blank"><img src="image/12380aq.png" alt="举报问答"
										border="0"> </a>
								</td>
							</tr>
							<tr>
								<td height="65"><a href=""
									target="_blank"><img src="image/12380bulide.png"
										alt="制度建设" border="0"> </a>
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

						<li>·<a href=""
							title="网站建设中" target="_blank"> <font
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
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--右边部分结束-->
	<!--内容部分结束-->
</body>
</html>
