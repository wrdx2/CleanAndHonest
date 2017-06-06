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
								+ json.obj[i].ltype ;
						if(json.obj[i].ltype2 != null){
							optionStr += ">>" + json.obj[i].ltype2;
							if(json.obj[i].ltype3 != null){
								optionStr += ">>" + json.obj[i].ltype3;
							}
						}
						optionStr += "</option>";
					}
				}
				for ( var i = 0; i < json.obj.length; i++) {
					if (json.obj[i].lstate == 1) {
						optionStr += "<option style= 'color:#9C9900' value=\""
								+ json.obj[i].lno
								+ "\" >"
								+ json.obj[i].ltype;
						if(json.obj[i].ltype2 != null){
							optionStr += ">>" + json.obj[i].ltype2;
							if(json.obj[i].ltype3 != null){
								optionStr += ">>" + json.obj[i].ltype3;
							}
						}
						optionStr += "</option>";

					}
				}
				$("#type").html(optionStr);
			} else {
				alert(json.msg);
			}
		}
	});
}