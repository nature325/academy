<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>납부 추가</title>
<link rel="stylesheet" href="css/button.css"/>
<style>
table{
border:0px solid black;
width:400px;
}
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
tr{
height:27px;
}
</style>
<script>
window.self.onload=function(){
	var now = new Date();
	var y = now.getFullYear();
	var m = now.getMonth()+1;
	var d = now.getDate();
	var today = m>9?y+'-'+m+'-'+d:y+'-0'+m+'-'+d;
	
	document.getElementById('today').value=today;
}

function closePopup(){
	window.self.close();
}
</script>
</head>
<body>
<c:set var="addparam" value="${dto}"></c:set>
<form name="reci_add" action="reci_add.do">
	<input type="hidden" name="c_code" value="${addparam.c_code}">
	<input type="hidden" name="p_st_idx" value="${addparam.st_idx}">

	<table>
		<tr>
		<th colspan="2">납부등록</th>
		</tr>
		<tr>
		<th>강좌명</th>
		<td><input type="text" value="${addparam.c_name}" readonly></td>
		</tr>
		<tr>
		<th>수강료</th>
		<td><input type="text" value="${addparam.c_price}" readonly></td>
		</tr>
		<tr>
		<th>원생명</th>
		<td><input type="text" value="${addparam.st_name}" readonly></td>
		</tr>
		<tr>
		<th>납부일자</th>
		<td><input type="date" name="p_paydate" id="today" required></td>
		</tr>
		<tr>
		<th>납부구분</th>
		<td>
		<select name="p_payment">
			<option value="이체">이체</option>
			<option value="카드">카드</option>
			<option value="현금">현금</option>
		</select>
		</td>
		</tr>
		<tr>
		<th>납부금액</th>
		<td><input type="number" name="p_pay" value="${addparam.c_price}" max="9999999999"></td>
		</tr>
		<tr>
		<th>비고</th>
		<td><textarea rows="5" cols="30" name="p_bigo" maxlength="33" style="resize: none;"></textarea></td>
		</tr>
		<tr>
		<td colspan="2" style="text-align:center;">		
		<input type="submit" value="저장" class="btn-gradient blue mini"> <input type="button" value="취소" onclick="closePopup()" class="btn-gradient blue mini">
		</td>
		</tr>

	</table>
</form>
</body>
</html>