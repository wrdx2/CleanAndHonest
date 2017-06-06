Date.prototype.format = function(format) {
	var o = {
		"M+" : this.getMonth() + 1, // month
		"d+" : this.getDate(), // day
		"h+" : this.getHours(), // hour
		"m+" : this.getMinutes(), // minute
		"s+" : this.getSeconds(), // second
		"q+" : Math.floor((this.getMonth() + 3) / 3), // quarter
		"S" : this.getMilliseconds()
	// millisecond
	};
	if (/(y+)/.test(format))
		format = format.replace(RegExp.$1, (this.getFullYear() + "")
				.substr(4 - RegExp.$1.length));
	for ( var k in o)
		if (new RegExp("(" + k + ")").test(format))
			format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k]
					: ("00" + o[k]).substr(("" + o[k]).length));
	return format;
};
console.log("ajax开始");
// 栏目文章信息查询
$
		.ajax({
			type : "POST",
			url : "./article/pageLmArArticleAction",
			data : "",
			dataType : "json",
			success : function(json) {
				if (json.success) {
					var str = "";
					console.log("ajax success");
					if (json.obj.length > 0) {
						console.log("有要显示的栏目");
						for ( var i = 0; i < json.obj.length; i++) {
							if (i % 2 == 0) {
								console.log("左");
								str += "<div class='art float_left'>";
								str += "<h2>";
								str += "<span class='more'>";
							} else {
								console.log("右");
								str += "<div class='art art_right float_right'>";
								str += "<h2>";
								str += "<span class='more'>";
							}
							console.log("添加more链接" + i);
							str += "<a href='./article/moreLmArArticleAction?";

							if (json.obj[i].ltype2 == null) {
								str += "type= " + 1;
								str += "&cont=" + json.obj[i].ltype + "'>";

								str += "<img src='image/more.gif' alt='更多' width='39' height='9' border='0'>";
								str += "</a>";
								str += "</span>";

								str += "<a style='float: left;' href='./article/selLmArArticleAction?";
								str += "type=" + 1 + "&cont="
										+ json.obj[i].ltype + "'>";
								str += json.obj[i].ltype;
								str += "</a>";
							} else if (json.obj[i].ltype3 == null) {
								str += "type= " + 2;
								str += "&cont=" + json.obj[i].ltype2 + "'>";

								str += "<img src='image/more.gif' alt='更多' width='39' height='9' border='0'>";
								str += "</a>";
								str += "</span>";

								str += "<a style='float: left;' href='./article/selLmArArticleAction?";
								str += "type=" + 2 + "&cont="
										+ json.obj[i].ltype2 + "'>";
								str += json.obj[i].ltype;
								str += "</a>";
							} else {
								str += "type= " + 3;
								str += "&cont=" + json.obj[i].ltype3 + "'>";

								str += "<img src='image/more.gif' alt='更多' width='39' height='9' border='0'>";
								str += "</a>";
								str += "</span>";

								str += "<a style='float: left;' href='./article/selLmArArticleAction?";
								str += "type=" + 3 + "&cont="
										+ json.obj[i].ltype3 + "'>";
								str += json.obj[i].ltype;
								str += "</a>";
							}
							str += "</h2>";
							str += "<ul class='list'>";
							console.log("设置文章信息");
							for ( var j = 0; j < json.obj2.length && j < 10; j++) {
								if (json.obj[i].lno == json.obj2[j].atype) {
									var dt = new Date(json.obj2[j].atime)
											.format('yyyy-MM-dd');
									console.log("article add successfully");
									str += "<li>";
									str += "<span>" + dt + "</span>·";
									str += "<a href='./article/selArArticleAction?arId=";
									str += json.obj2[j].ano + "'";
									str += " title='" + json.obj2[j].atitle
											+ "' target='_blank'>";
									str += "<font color=''>"
											+ json.obj2[j].atitle + "</font>";
									str += "</a></li>";
								}
							}
							str += "</div>";
						}
					} else {
						str += "<div align='center'>";
						str += "<font size='10px' color='red'>";
						str += "请在后台设置需要显示的栏目";
						str += "</font></div>";
					}
					console.log("显示到搜索栏下");
					$(".sitesearch").after(str);
				} else {
					alert(json.msg);
				}

			}
		});

// 投票信息查询
$.ajax({
	type : "POST",
	url : "./vote/pageIndexVoteAction",
	data : "",
	dataType : "json",
	success : function(json) {
		if (json.success) {
			var str = '';
			$("#pageVoteName").text(json.obj[0].vname);
			for ( var i = 0; i < json.obj.length; i++) {
				str += "<input style='border:0' ";
				str += "name='Options' type='CheckBox' value='"
						+ json.obj[i].vno + "'>";
				str += "" + (i + 1) + "." + json.obj[i].vnode + "<br/>";
			}

		} else {
			alert(json.msg);
		}

		$("#pageVote").append(str);

	}
});

// 投票信息提交
function voteSubmit() {
	var ids = [];
	$("#pageVoteNode input[type=checkbox]").each(function() {
		if (this.checked == true) {
			ids.push(this.value);
		}
	});
	console.log(ids);
	if (ids.length > 0) {
		$.post('./vote/subIDsVoteAction', {
			ids : ids.join(',')
		}, function(json) {
			if (json.success) {
				alert(json.msg);
				// location.reload();
			} else {
				alert(json.msg);
			}
		}, 'json');
	} else {
		alert('你没有选择');
	}
}

// 投票信息查看
function voteLook() {
	var vname = $("#pageVoteName").text();
	window.location.href = "./vote/lookVoteAction?vname=" + vname;
}

// 事项查询-显示
/*
 * $.ajax({ type:"POST", url:"./vote/pageIndexVoteAction", data:"",
 * dataType:"json", success:function(json){ if(json.success){ var str = "";
 * if(json.obj.length > 0){ console.log("有要显示的投票"); $("#pageVoteName").Text =
 * json.obj[0].vname; for(var i = 0; i < json.obj.length; i++){ str += "<input
 * style='border:0' name='Options' type='CheckBox' value='" + (i+1) + "'>"; str +=
 * (i+1) + "."; str += json.obj[i].vnode; str += "<br>"; } }else{
 * console.log("没有要显示的投票"); } console.log("显示"); $("#pageVoteNode").append(str);
 * }else{ alert(json.msg); } } });
 */
