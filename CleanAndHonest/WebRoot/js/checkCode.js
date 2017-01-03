var xmlHttp;
var clock;
var nums = 3;

function doLoop() {
	nums--;
	if (nums > 0) {
		document.getElementById("first").attributes["onload"].nodeValue = null;
		document.getElementById("checkCode").src = "../images/pic05.gif?" + Math.random();
	} else {
		clearInterval(clock); // 清除js定时器
		nums = 4; // 重置时间
		document.getElementById("checkCode").attributes["onclick"].nodeValue = "change();";
	}
}

function createXMLHttpRequest() {
	if (window.ActiveXObject) {
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	} else if (window.XMLHttpRequest) {
		xmlHttp = new XMLHttpRequest();
	}
}

function change() {
	document.getElementById("checkCode").attributes["onclick"].nodeValue = null;
	createXMLHttpRequest();
	xmlHttp.open("get", "changeCheckCode", true);
	//xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	// document.getElementById("checkCode").innerHTML = "<img
	// onclick='change();' src='"+"../images/pic05.gif?"+Math.random()+"'
	// width='109' height='30' />";
	xmlHttp.onreadystatechange = onReadyState;
	clock = setInterval('doLoop()', 1000); // 一秒执行一次
	xmlHttp.send();
}

function onReadyState() {
	if (xmlHttp.readyState == 4) {
		if (xmlHttp.status == 200) {
			document.getElementById("checkCode").src = "../images/pic05.gif?" + Math.random();
			document.getElementById("checkCode").title=xmlHttp.responseText;
			//document.getElementById("chcode").value='<%=Session["chcode"] %>';
		};
	};
};