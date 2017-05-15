var i = 0;
function addFile() {
	var str;
	var flag = true;
	str = "<input type='file' id='file";
	str += i++;
	str += "' name='upload' />";

	$(":file").each(function() {
		if ($(this).val() == "" && $(this) != null) {
			flag = false;
			return 0;
		}
	});
	if (flag) {
		$("#fileTd").append(str);
	}
}

function ajaxUpload() {
	var id = "";
	var today = new Date();
	var y = today.getFullYear();
	var mo = today.getMonth() + 1;
	if(mo<10){
		mo = "0" + mo.toString();
	}
	var d = today.getDate();
	if(d<10){
		d = "0" + d.toString();
	}
	$("input:file").each(function() {
		id = $(this).attr("id");
		
		if ($(this).val() != "") {
			$.ajaxFileUpload({
				type : "post",
				secureuri : false,
				url : "../UploadAction",
				fileElementId : id,
				data : {
					name : "WRD",
					attPath : "article/" + y + mo + d
				},
				dataType : "json",
				success : function(data, status) {
					console.log(data + status);
					alert(data);
				},
				error : function(data, status, e) {
					console.log(data);
					alert(e);
				}
			});
		}
	});
	return true;
}

function sub() {
	var text = window.frames["text"].document.getElementById("textarea").value;
	document.getElementById("text").value = text;
	var flag = true;
	$("input").each(
			function() {
				if ($(this).attr("name") == "title" || $(this).attr("name") == "text") {
					if ($(this).val() == "") {
						flag = false;
					}
				}
			});
	if (flag) {
		var f = ajaxUpload();
		if(f){
			var names = [];
		   $(":file").each(function(){
			   if($(this).val() != "" && $(this).attr("id").length <= 6){
				   names.push($(this).prop("files")[0].name);
				}
		   });
		   $("#files").val(names);
		   document.forms[0].submit();
		}
	} else {
		alert("请填写完整信息！");
	}
}

function loadSelect() {
	var data = "";
	var optionStr = "";
	$.ajax({
		type : "POST",
		url : "../article/selectLmArticleAction",
		data : data,
		dataType : "json",
		success : function(json) {
			if (json.success) {
				for ( var i = 0; i < json.obj.length; i++) {
					if (json.obj[i].lstate == 2) {
						optionStr += "<option value=\""
								+ json.obj[i].lno + "\" >"
								+ json.obj[i].ltype + "</option>";
					}
				}
				for ( var i = 0; i < json.obj.length; i++) {
					if (json.obj[i].lstate == 1) {
						optionStr += "<option style= 'color:#9C9900' value=\""
								+ json.obj[i].lno
								+ "\" >"
								+ json.obj[i].ltype + "</option>";
					}
				}
				$("#type").html(optionStr);
			} else {
				alert(json.msg);
			}
		}
	});
}