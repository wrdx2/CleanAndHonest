function addlmContent(){
	var div = document.getElementById("addLmFormContent");
	/*if (div == null){
		var str = '';
		str +="<div id='addLmFormContent'>&nbsp;&nbsp;&nbsp;<input type='text' id='addlm' name='addlm' placeholder='栏目名'/>&nbsp;&nbsp;&nbsp;";
		str +="<input class='right-button02' type='button' onclick='addLmAc()' value='提交'/>&nbsp;&nbsp;&nbsp;";
		str +="<input class='right-button02' type='button' onclick='removeLm()' value='取消'/></div>";
		$("#addLmForm").append(str);
	}*/
	var htmlpage = "";
	htmlpage = "<form style='margin:2px;padding: 2px;' name='remLm' id='remLm' method='post' action='article/addlmArticleAction'>";
	htmlpage += "总栏名称：<input id='lmtype' name='lmtype' /><br/>";
	htmlpage += "大类名称：<input id='lmtype2' name='lmtype2' /><br/>";
	htmlpage += "小类名称：<input id='lmtype3' name='lmtype3' /><br/>";
	htmlpage += "<center><input name='Submit2' type='submit' onclick='addLmAc();' class='right-button08' value='添加' />";
	htmlpage += "<button id='pageclose' class='right-button08' onclick=''>关闭</button></center>";
	htmlpage += "</form>";
	var pageii = $.layer({
		type:1,
		title: '添加栏目',
		closeBtn: false,
		page: {
			html:htmlpage,
			},
		});
	
	$("#pageclose").on('click', function(){
		  layer.close(pageii);
	});
}
function addLmAc(){
	var lmtype = $.trim($("#lmtype").val());
	if(lmtype == null || lmtype == ''){
		alert("请输入栏目名称");
		return false;
	}else{
		return true;
	}
	
}
function removeLm(){
	$("#addLmFormContent").remove();
}
function deleteLmAll(){
	var ids = [];
	$("#show_table input[type=checkbox]").each(function(){
	if(this.checked == true && this.name == 'delid'){
		ids.push(this.value);
	}
	});
	if(ids.length>0){
		layer.confirm('删除提醒',function(index){
			$.post('${pageContext.request.contextPath}/article/deleteLmArticleAction', {ids:ids.join(',')}, function(j) {
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

function renameLm(id,ltype,ltype2,ltype3,lstate){
	var htmlpage;
	htmlpage = "<form style='margin:2px;padding: 2px;' name='remLm' id='remLm' method='post' action='article/renameLmArticleAction'>";
	htmlpage += "<input type='hidden' name='lmlno' value='"+id+"' />";
	htmlpage += "总栏名称：<input id='lmtype' name='lmtype' value='"+ltype+"' /><br/>";
	htmlpage += "大类名称：<input id='lmtype2' name='lmtype2' value='"+ltype2+"' /><br/>";
	htmlpage += "小类名称：<input id='lmtype3' name='lmtype3' value='"+ltype3+"' /><br/>";
	htmlpage += "审核状态：<select id='auditing' name='auditing' onchange='stateSelChange()'><option value='0' >未审核</option><option value='1' >已审核</option></select><br/>";
	htmlpage += "页面显示：<select id='lmDisplay' name='lmDisplay'><option value='1' >不显示</option><option value='2' >已显示</option></select><br/>";
	htmlpage += "<center><input name='Submit2' type='submit' onclick='resub();' class='right-button08' value='修改' />";
	htmlpage += "<button id='pageclose' class='right-button08' onclick=''>关闭</button></center>";
	htmlpage += "</form>";
	var pageii = $.layer({
		type:1,
		title: '修改栏目',
		closeBtn: false,
		page: {
			html:htmlpage,
			},
		});
	if(lstate == 0){
		$("#lmDisplay").attr('disabled',"disabled");
	}else{
		
	}
	
	$("#pageclose").on('click', function(){
		  layer.close(pageii);
	});
}

function stateSelChange(){
	console.log("选择值"+$("#auditing").val());
	if(($("#auditing").val()) == 0){
		$("#lmDisplay").attr('disabled',"disabled");
	}else{
		$("#lmDisplay").removeAttr("disabled");
	}
}

function resub() {//栏目重命名
		if($("#reltype").val() != null){
			return true;
		}else{
			layer.close(pageii);
			$.layer({
				type:0,
				title:'警告',
				content:'请输入栏目名！'
			});
		}
}