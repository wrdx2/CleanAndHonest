<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>栏目工具栏</title>

<link href="${pageContext.request.contextPath}/css/home.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/index.css"
	rel="stylesheet">
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/jquery.js"></script>

</head>
<body onload="init();" leftmargin="0" topmargin="0" marginwidth="0"
	marginheight="0">
	<input type="hidden" id="lanmu" value="" />
	<!--导航部分开始-->
	<script language="javascript">
		//==========================
		//        菜单开始
		//==========================
		//具有栏目隐藏与外部链接功能
		//mtDropDown.spacerGif = "images/Menu_x.gif";
		//mtDropDown.dingbatOn = "images/Menu_expand-1.gif";
		//mtDropDown.dingbatOff = "images/Menu_expand-0.gif";
		mtDropDown.dingbatSize = 14;
		mtDropDown.menuPadding = 0;
		mtDropDown.itemPadding = 4;
		mtDropDown.shadowSize = 2;
		mtDropDown.shadowOffset = 3;
		mtDropDown.shadowColor = "#D2D1D1";
		//mtDropDown.shadowPng = "images/005.png";
		mtDropDown.backgroundColor = "#EBEBEB";
		//mtDropDown.backgroundPng = "images/004.png";
		mtDropDown.hideDelay = 100;
		mtDropDown.slideTime = 100;

		mtDropDown.reference = {
			topLeft : 1,
			topRight : 2,
			bottomLeft : 3,
			bottomRight : 4
		};
		mtDropDown.direction = {
			down : 1,
			right : 2
		};
		mtDropDown.registry = [];
		mtDropDown._maxZ = 100;

		mtDropDown.isSupported = function() {
			if (typeof mtDropDown.isSupported.r == "boolean")
				return mtDropDown.isSupported.r;
			var ua = navigator.userAgent.toLowerCase();
			var an = navigator.appName;
			var r = false;
			if (ua.indexOf("gecko") > -1)
				r = true;
			else if (an == "Microsoft Internet Explorer") {
				if (document.getElementById)
					r = true;
			}
			mtDropDown.isSupported.r = r;
			return r;
		};

		mtDropDown.initialize = function() {
			for ( var i = 0, menu = null; menu = this.registry[i]; i++) {
				menu.initialize();
			}
		};

		mtDropDown.renderAll = function() {
			var aMenuHtml = [];
			for ( var i = 0, menu = null; menu = this.registry[i]; i++) {
				aMenuHtml[i] = menu.toString();
			}
			document.write(aMenuHtml.join(""));
		};

		function mtDropDown(oActuator, iDirection, iLeft, iTop,
				iReferencePoint, parentMenuSet) {

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
				if (!oMenuItem.parentMenu == this)
					throw new Error("Cannot add a menu here");
				if (childMenuSet == null)
					childMenuSet = new mtDropDownSet(
							mtDropDown.direction.right, -5, 2,
							mtDropDown.reference.topRight);
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
					for ( var i = 0, item = null; item = elmCache.item[i]; i++)
						dehighlight(item);
					if (childMenuSet)
						childMenuSet.hide();
					slideStart();
					_this.ondeactivate();
				}
			}
			function setContainerPos() {
				var sub = oActuator.constructor == mtDropDownItem;
				var act = sub ? oActuator.parentMenu.elmCache["item"][oActuator._index]
						: oActuator;
				var el = act;
				var x = 0;
				var y = 0;
				var minX = 0;
				var maxX = (window.innerWidth ? window.innerWidth
						: document.body.clientWidth)
						- parseInt(elmCache["clip"].style.width);
				var minY = 0;
				var maxY = (window.innerHeight ? window.innerHeight
						: document.body.clientHeight)
						- parseInt(elmCache["clip"].style.height);

				while (sub ? el.parentNode.className.indexOf("mtDropdownMenu") == -1
						: el.offsetParent) {
					x += el.offsetLeft;
					y += el.offsetTop;
					if (el.scrollLeft)
						x -= el.scrollLeft;
					if (el.scrollTop)
						y -= el.scrollTop;
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
				if (a != null)
					a.stop();
				a = new Accelimation(x0, x1, mtDropDown.slideTime, slideAccel);
				a.onframe = slideFrame;
				a.onend = slideEnd;
				a.start();
			}
			function slideFrame(x) {
				elmCache["content"].style[pos] = x + "px";
			}
			function slideEnd() {
				if (!_this.isOpen)
					elmCache["clip"].style.visibility = "hidden";
				animating = false;
			}
			function initSize() {

				var ow = elmCache["items"].offsetWidth;
				var oh = elmCache["items"].offsetHeight;
				var ua = navigator.userAgent.toLowerCase();

				elmCache["clip"].style.width = ow + mtDropDown.shadowSize + 2
						+ "px";
				elmCache["clip"].style.height = oh + mtDropDown.shadowSize + 2
						+ "px";

				elmCache["content"].style.width = ow + mtDropDown.shadowSize
						+ "px";
				elmCache["content"].style.height = oh + mtDropDown.shadowSize
						+ "px";
				contentHeight = oh + mtDropDown.shadowSize;
				contentWidth = ow + mtDropDown.shadowSize;
				dim = iDirection == mtDropDown.direction.down ? contentHeight
						: contentWidth;

				elmCache["content"].style[pos] = -dim - mtDropDown.shadowSize
						+ "px";
				elmCache["clip"].style.visibility = "hidden";

				if (ua.indexOf("mac") == -1 || ua.indexOf("gecko") > -1) {

					elmCache["background"].style.width = ow + "px";
					elmCache["background"].style.height = oh + "px";
					elmCache["background"].style.backgroundColor = mtDropDown.backgroundColor;

					elmCache["shadowRight"].style.left = ow + "px";
					elmCache["shadowRight"].style.height = oh
							- (mtDropDown.shadowOffset - mtDropDown.shadowSize)
							+ "px";
					elmCache["shadowRight"].style.backgroundColor = mtDropDown.shadowColor;

					elmCache["shadowBottom"].style.top = oh + "px";
					elmCache["shadowBottom"].style.width = ow
							- mtDropDown.shadowOffset + "px";
					elmCache["shadowBottom"].style.backgroundColor = mtDropDown.shadowColor;
				}

				else {

					elmCache["background"].firstChild.src = mtDropDown.backgroundPng;
					elmCache["background"].firstChild.width = ow;
					elmCache["background"].firstChild.height = oh;

					elmCache["shadowRight"].firstChild.src = mtDropDown.shadowPng;
					elmCache["shadowRight"].style.left = ow + "px";
					elmCache["shadowRight"].firstChild.width = mtDropDown.shadowSize;
					elmCache["shadowRight"].firstChild.height = oh
							- (mtDropDown.shadowOffset - mtDropDown.shadowSize);

					elmCache["shadowBottom"].firstChild.src = mtDropDown.shadowPng;
					elmCache["shadowBottom"].style.top = oh + "px";
					elmCache["shadowBottom"].firstChild.height = mtDropDown.shadowSize;
					elmCache["shadowBottom"].firstChild.width = ow
							- mtDropDown.shadowOffset;
				}
			}
			function initCache() {
				var menu = document.getElementById(id);
				var all = menu.all ? menu.all : menu.getElementsByTagName("*");
				elmCache = {};
				elmCache["clip"] = menu;
				elmCache["item"] = [];
				for ( var i = 0, elm = null; elm = all[i]; i++) {
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

				for ( var i = 0, item = null; item = elmCache.item[i]; i++) {
					item.onmouseover = item_mouseover;
					item.onmouseout = item_mouseout;
					item.onclick = item_click;
				}

				if (typeof(oActuator.tagName) != "undefined") {
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
					else if (childMenuSet)
						childMenuSet.hide();
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
				for ( var i = 0; i < childMenus.length; i++) {
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
				var sClassName = "mtDropdownMenu"
						+ (oActuator.constructor != mtDropDownItem ? " top"
								: "");
				for ( var i = 0, item = null; item = this.items[i]; i++) {
					aHtml[i] = item.toString(childMenus[i]);
				}
				return '<div id="' + id + '" class="' + sClassName + '">'
						+ '<div class="content"><table class="items" cellpadding="0" cellspacing="0" border="0">'
						+ '<tr><td colspan="2"><img src="' + mtDropDown.spacerGif + '" width="1" height="' + mtDropDown.menuPadding + '"></td></tr>'
						+ aHtml.join('')
						+ '<tr><td colspan="2"><img src="' + mtDropDown.spacerGif + '" width="1" height="' + mtDropDown.menuPadding + '"></td></tr></table>'
						+ '<div class="shadowBottom"><img src="' + mtDropDown.spacerGif + '" width="1" height="1"></div>'
						+ '<div class="shadowRight"><img src="' + mtDropDown.spacerGif + '" width="1" height="1"></div>'
						+ '<div class="background"><img src="' + mtDropDown.spacerGif + '" width="1" height="1"></div>'
						+ '</div></div>';
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
				var m = new mtDropDown(oActuator, iDirection, iLeft, iTop,
						iReferencePoint, this);
				menus[menus.length] = m;
				return m;
			}
			function showMenu(oMenu) {
				if (oMenu != current) {

					if (current != null)
						hide(current);

					current = oMenu;

					oMenu.show();
				} else {

					cancelHide(oMenu);
				}
			}
			function hideMenu(oMenu) {

				if (current == oMenu && oMenu.isOpen) {

					if (!oMenu.hideTimer)
						scheduleHide(oMenu);
				}
			}
			function scheduleHide(oMenu) {

				oMenu.onqueue();
				oMenu.hideTimer = window.setTimeout("mtDropDownSet.registry["
						+ _this.index + "].hide(mtDropDown.registry["
						+ oMenu.index + "])", mtDropDown.hideDelay);
			}
			function cancelHide(oMenu) {

				if (oMenu.hideTimer) {
					window.clearTimeout(oMenu.hideTimer);
					oMenu.hideTimer = null;
				}
			}
			function hide(oMenu) {
				if (!oMenu && current)
					oMenu = current;
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
				var sDingbat = bDingbat ? mtDropDown.dingbatOff
						: mtDropDown.spacerGif;
				var iEdgePadding = mtDropDown.itemPadding
						+ mtDropDown.menuPadding;
				var sPaddingLeft = "padding:" + mtDropDown.itemPadding
						+ "px; padding-left:" + iEdgePadding + "px;";
				var sPaddingRight = "padding:" + mtDropDown.itemPadding
						+ "px; padding-right:" + iEdgePadding + "px;";
				return '<tr class="item"><td nowrap style="' + sPaddingLeft + '">'
						+ sText
						+ '</td><td width="14" style="' + sPaddingRight + '">'
						+ '<img src="' + sDingbat + '" width="14" height="14"></td></tr>';
			}
		}

		function Accelimation(from, to, time, zip) {
			if (typeof zip == "undefined")
				zip = 0;
			if (typeof unit == "undefined")
				unit = "px";
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
				this.onframe(Accelimation._getBezier(elapsed / this.dt,
						this.x0, this.x1, this.c1, this.c2));
			} else
				this._end();
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
				this.timerID = window.setInterval("Accelimation._paintAll()",
						this.targetRes);
			}
		};

		Accelimation._remove = function(o) {
			for ( var i = 0; i < this.instances.length; i++) {
				if (o == this.instances[i]) {
					this.instances = this.instances.slice(0, i).concat(
							this.instances.slice(i + 1));
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
			for ( var i = 0; i < this.instances.length; i++) {
				this.instances[i]._paint(now);
			}
		};

		Accelimation._B1 = function(t) {
			return t * t * t;
		};
		Accelimation._B2 = function(t) {
			return 3 * t * t * (1 - t);
		};
		Accelimation._B3 = function(t) {
			return 3 * t * (1 - t) * (1 - t);
		};
		Accelimation._B4 = function(t) {
			return (1 - t) * (1 - t) * (1 - t);
		};

		Accelimation._getBezier = function(percent, startPos, endPos, control1,
				control2) {
			return endPos * this._B1(percent) + control2 * this._B2(percent)
					+ control1 * this._B3(percent) + startPos
					* this._B4(percent);
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
	</script>

	<div class="global_nav" algin="center">
		<ul class="glo_nav2">
			
		</ul>
		<script language="javascript">
			var lanmu;
			$.ajax({
					type : "POST",
					url : "${pageContext.request.contextPath}/article/seleLMArticleAction",
					data : "",
					//async : false,
					dataType : "json",
					success : function(json) {
						if (json.success) {
							$("#lanmu").val = json.obj;
							lanmu = json.obj;
							console.log("栏目:" + typeof(lanmu[2].ltype2));
							var str = "";
							for ( var i = 0; i < lanmu.length; i++) {
								if (lanmu[i].ltype2 ==null || typeof(lanmu[i].ltype2)=="undefined" || lanmu[i].ltype2 == "") {
									str += "<li><a href='lanmu_src?type=1&cont=";
									str += lanmu[i].ltype;
									str += "' id='menu";
									str += i;
									str += "' title='";
									str += lanmu[i].ltype;
									str += "'>";
									str += lanmu[i].ltype + "</a></li>";
								}
							}
							$(".glo_nav2").append(str);
							
							loadAjax();
						} else {
							alert(json.msg);
						}
					}
				});
				
			function loadAjax(){
				if (mtDropDown.isSupported()) {
					var ms = new mtDropDownSet(mtDropDown.direction.down, 0, 0,
							mtDropDown.reference.bottomLeft);
	
					var menu1 = ms.addMenu(document.getElementById('menu1'));
					menu1.addItem('123', '');
					menu1.addItem('- 文件精神', '');
					menu1.addItem('- 政策法规', '');
					menu1.addItem('- 重要讲话', '');
	
					var subMenu0 = menu1.addMenu(menu1.items[0]);
					subMenu0.addItem('- 人物简介', '');
	
					var menu2 = ms.addMenu(document.getElementById('menu2'));
					menu2.addItem('- 工作决策', '');
					menu2.addItem('- 干部任免', '');
					menu2.addItem('- 事项研究', '');
	
					var menu3 = ms.addMenu(document.getElementById('menu3'));
					menu3.addItem('- 廉政信息', '');
					menu3.addItem('- 文件精神', '');
					menu3.addItem('- 政策法规', '');
	
					var menu7 = ms.addMenu(document.getElementById('menu4'));
					menu7.addItem('- 干部作风', '');
					menu7.addItem('- 效能投诉', '');
					menu7.addItem('- 制度建设', '');
	
					var menu10 = ms.addMenu(document.getElementById('menu5'));
					menu10.addItem('- 队伍建设', '');
					menu10.addItem('- 机构设置', '');
					menu10.addItem('- 领导分工', '');
	
					var menu11 = ms.addMenu(document.getElementById('menu6'));
					menu11.addItem('- 纠风工作', '');
					menu11.addItem('- 监督检查', '');
					menu11.addItem('- 源头治理', '');
	
					var menu12 = ms.addMenu(document.getElementById('menu12'));
					menu12.addItem('- 廉政制度', '');
	
					mtDropDown.renderAll();
				}
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
</body>
</html>
