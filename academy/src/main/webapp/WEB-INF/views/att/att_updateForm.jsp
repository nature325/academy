<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출결편집</title>
<style>
th{
background:#044071;
color:white;
width:100px;
}
td{
background:#F6F6F6;
color:black;
padding:0 4px 0 4px;
}
.input_text{
border: 1px solid black;
padding: 4px;
margin:5px 0;
}
textarea{
border: 1px solid black;
padding: 4px;
margin:5px 0;
resize:none;
}
select{
border: 1px solid black;
padding: 2px;
margin:5px 0;
}
#buttonCell{
text-align:center;
heigth:170px;
background:white;
}

</style>
<script src="js/httpRequest.js"></script>
<script>
function att_update(){
	var st_idx='${st_idx }';
	var c_code='${c_code }';
	var att_bigo=document.fm.att_bigo.value;
	var att_divide=document.fm.att_divide.value;
	var att_date='${dateInfo}';
	att_date=att_date.substring(0,10);
	
	param='st_idx='+st_idx+'&c_code='+c_code+'&att_bigo='+att_bigo+'&att_divide='+att_divide+'&att_date='+att_date;	
	sendRequest('att_update.do',param,'GET',att_updateResult)	
}
function att_updateResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var str=XHR.responseText;
			window.alert(str);			
			opener.att_showRelSt();
			self.close();
		}
	}
	
}

</script>


</head>
<body>
<form name="fm">
<div>
<table>
<tr>
	<th>강좌명</th><td><input type="text" class="input_text" readonly value="${c_name }"></td>
</tr>
<tr>
	<th>강사명</th><td><input type="text" class="input_text" readonly value="${tc_name }"></td>
</tr>
<tr>
	<th>강좌일자</th><td><input type="text" class="input_text" readonly value="${dateInfo }"></td>
</tr>
<tr>
	<th>원생명</th><td><input type="text" class="input_text" name="st_name" readonly value="${st_name }"></td>
</tr>
<tr>
	<th>출결구분</th>
	<td>
	<select name="att_divide">
		<option value="출석">출석</option>
		<option value="결석">결석</option>
		<option value="지각">지각</option>
		<option value="조퇴">조퇴</option>
	</select>
	</td>
</tr>
<tr>
	<th>비고</th><td><textarea name="att_bigo" cols="40" rows="10" maxlength="333">${att_bigo }</textarea></td>
</tr>
<tr>
	<td id="buttonCell" colspan="2"><input type="button" value="저장" onclick="att_update()"><input type="button" value="취소" onclick="window.self.close()"></td>
</tr>
</table>

</div>
</form>
</body>
</html>