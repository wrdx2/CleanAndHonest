function startTime() {
	var today = new Date();
	var y = today.getFullYear();
	var mo = today.getMonth() + 1;
	var d = today.getDate();
	var h = today.getHours();
	var m = today.getMinutes();
	var s = today.getSeconds();
	var time = document.getElementById('top_time');
	// add a zero in front of numbers<10
	m = checkTime(m);
	s = checkTime(s);
	time.innerHTML = "" + y + "年" + mo + "月" + d + "日 " + h + ":" + m + ":" + s;
	t = setTimeout('startTime()', 500);
}

function checkTime(i) {
	if (i < 10) {
		i = "0" + i;
	}
	return i;
};