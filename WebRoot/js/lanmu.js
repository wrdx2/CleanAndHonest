function addlmContent(){
	var div = document.getElementById("addLmFormContent");
	if (div == null){
		var str = '';
		str +="<div id='addLmFormContent'>&nbsp;&nbsp;&nbsp;<input type='text' id='addlm' name='addlm' placeholder='栏目名'/>&nbsp;&nbsp;&nbsp;";
		str +="<input class='right-button02' type='button' onclick='addLmAc()' value='提交'/>&nbsp;&nbsp;&nbsp;";
		str +="<input class='right-button02' type='button' onclick='removeLm()' value='取消'/></div>";
		$("#addLmForm").append(str);
	}
}
function addLmAc(){
	var addlm = $.trim($("#addlm").val());
	if(addlm==null || addlm==''){
		alert("请输入栏目名称");
		return false;
	}
	var data = $("#addLmForm").formToArray();
	
	$.ajax({
		type:"POST",
		url:"addlmArticleAction",
		data:data,
		dataType:"json",
		success:function(json){
		if(json.success){
			/*$("#addLmFormContent").remove();
			var str = '';
			str +="<tr id='show_table tr' bgcolor='#FFFFFF'>";
			str +="<td height='20'><input name='delid' type='checkbox' value='"+json.obj.lno+"'/></td>";
			str +="<td>"+json.obj.ltype+"</td>";
			str +="<td>未审核</td>";
			str +="<td>未显示</td>";
		    str +="<td><s:a name='renameLm' href='#'>修改</s:a>";
			str +="</td>";
			str +="</tr>";
			$("#show_table tr:eq(1)").before(str);*/
			location.reload();
		}else{
			alert(json.msg);
		}
		
	}
});
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
	console.log(ids);
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

function renameLm(id,ltype,lstate){
	console.log("所要修改的id值：" + id);
	/*$.layer({
		title: '在线调试',
		content: '<form><table><tr><td><input/></td></tr><tr><td></td></tr></table></form>',
		area: ['450px', '450px'],
	});*/
	var htmlpage;
	var lmtype = $.trim(ltype);
	htmlpage = "<form style='margin:2px;padding: 2px;' name='remLm' id='remLm' method='post' action='article/renameLmArticleAction'>";
	htmlpage += "<input type='hidden' name='lmlno' value='"+id+"' />";
	htmlpage += "<input id='reltype' name='lmtype' value='"+lmtype+"' />";
	htmlpage += "<select id='auditing' name='auditing' onchange='stateSelChange()'><option value='0' >未审核</option><option value='1' >已审核</option></select>";
	htmlpage += "<select id='lmDisplay' name='lmDisplay'><option value='1' >不显示</option><option value='2' >已显示</option></select>";
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