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
			$("#addLmFormContent").remove();
			var str = '';
			str +="<tr id='show_table tr' bgcolor='#FFFFFF'>";
			str +="<td height='20'><input name='delid' type='checkbox' value='"+json.obj.lno+"'/></td>";
			str +="<td>"+json.obj.ltype+"</td>";
			str +="<td>未审核</td>";
			str +="<td>未显示</td>";
		    str +="<td><s:a name='renameLm' href='#'>修改</s:a>";
			str +="</td>";
			str +="</tr>";
			$("#show_table tr:eq(1)").before(str);
			//location.reload();
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
	if(this.checked==true){
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

	$("#renameLm").click(function() {//栏目重命名
		
	});