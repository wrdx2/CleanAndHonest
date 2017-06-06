function addVoteContent(){
	/*var div = document.getElementById("addLmFormContent");
	if (div == null){
		var str = '';
		str +="<div id='addLmFormContent'>&nbsp;&nbsp;&nbsp;<input type='text' id='addlm' name='addlm' placeholder='栏目名'/>&nbsp;&nbsp;&nbsp;";
		str +="<input class='right-button02' type='button' onclick='addLmAc()' value='提交'/>&nbsp;&nbsp;&nbsp;";
		str +="<input class='right-button02' type='button' onclick='removeLm()' value='取消'/></div>";
		$("#addLmForm").append(str);
	}*/
	var htmlpage = "";
	htmlpage = "<form style='margin:2px;padding: 2px;' name='remLm' id='remLm' method='post' onsubmit='return addVote();' action='./vote/addVoteAction'>";
	htmlpage += "<input type='hidden' id='vnodes' name='vnodes' />";
	htmlpage += "调查名称：<input id='vname' name='vname' /><input type='button' id='addNode' onclick='' value='添加选项'></button><br/>";
	htmlpage += "选项名称：<input class='vnode' /><br/>";
	htmlpage += "<center><input name='Submit2' type='submit' class='right-button08' value='添加' />";
	htmlpage += "<input id='pageclose' class='right-button08' onclick=''>关闭</input></center>";
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
	
	$("#addNode").on('click', function(){
		  var str = "";
		  var i = 0;
		  str += "选项名称：";
		  str += "<input class='vnode'/>";
		  str += "<br/>";
		  $(".vnode").each(function(){
			  if(i==0){
				  $(this).after(str);
				  i++;
			  }
		  });
		  		
	});
}

function addVote(){
	var vname = $.trim($("#vname").val());
	var vnode = [];
	
	$(".vnode").each(function(){
		if(this.value != null && this.value != ""){
			vnode.push(this.value);
		}
	});
	if(vname == null || vname == ''){
		alert("请输入调查名称");
		return false;
	}else if(vnode.length < 1){
		alert("请输入选项名称");
		return false;
	}
	else{
		var a = vnode.join(",");
		$("#vnodes").val(a);
		return true;
	}
}

function deleteVoteAll(){
	var ids = [];
	$("#show_table input[type=checkbox]").each(function(){
	if(this.checked == true && this.name == 'delid'){
		ids.push(this.value);
	}
	});
	if(ids.length>0){
		layer.confirm('删除提醒',function(index){
			$.post('${pageContext.request.contextPath}/vote/deleteVoteAction', {ids:ids.join(',')}, function(j) {
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

function change(id){
	window.location.href="./vote/changeVoteAction?vname=" + id;
}
function look(id){
	window.location.href="./vote/lookVoteAction?vname=" + id;
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