//table分页        
var pageSize = 14; // 每页显示的记录条数
var curPage = 0; // 显示第curPage页
var len; // 总行数
var page; // 总页数
$(function() {
	len = $("#show_shenpi tr").length - 1; // 去掉表头
	page = len % pageSize == 0 ? len / pageSize
			: Math.floor(len / pageSize) + 1;// 根据记录条数，计算页数
	console.log("len:" + len + "page:" + page);
	document.getElementById("page").innerHTML = page;
	curPage = 1;
	displayPage();// 显示第一页
	$("#firstpage").click(function() {//首页
		curPage = 1;
		displayPage();
	});
	$("#nextpage").click(function() {// 下一页
		if (curPage < page) {
			curPage += 1;
		} else {
			alert("已是最后一页");
		}
		displayPage();
	});
	$("#lastpage").click(function() {// 上一页
		if (curPage > 1) {
			curPage -= 1;
		} else {
			alert("已是第一页");
		}
		displayPage();
	});
	$("#endpage").click(function() {//末页
		curPage = page;
		displayPage();
	});
	$("#npage").click(function() {// 跳到固定某一页
		var npage = parseInt(document.getElementById("curPage").value);
		if (npage > page || npage < 1) {
			alert("该页不存在");
		} else {
			curPage = npage;
		}
		displayPage();
	});
});

function displayPage() {
	var begin = (curPage - 1) * pageSize;// 起始记录号
	var end = begin + pageSize;
	if (end > len){
		end = len;
	}
	console.log("  begin:" + len + "   end:" + end);
	$("#show_shenpi tr").hide();
	$('input:checkbox').attr('name','delid1');
	$("#show_shenpi tr").each(function(i) {
		if (i - 1 >= begin && i - 1 < end)// 显示第page页的记录
		{
			$("#show_shenpi_one").show();
			$(this).show();
			$(this).find("input").attr("name","delid");
			//$(this.input:checkbox).attr('name','delid');
			document.getElementById("curPage").value = curPage;
			document.getElementById("cpage").innerHTML = curPage;
		}
	});
}

//改变每页显示条数
function pageSize2() {
	curPage = 0; // 显示第curPage页
	pageSize = parseInt(document.getElementById("pageSize").value);
	len = $("#show_shenpi tr").length - 1; // 去掉表头
	page = len % pageSize == 0 ? len / pageSize
			: Math.floor(len / pageSize) + 1;// 根据记录条数，计算页数
	console.log("len:" + len + "   page:" + page);
	document.getElementById("page").innerHTML = page;
	curPage = 1;
	displayPage();// 显示第一页
}