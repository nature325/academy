<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/button.css"/>
<style>
th{
background:#044071;
color:white;
width:130px;
}
th a{
text-decoration:none;
color:white;
}
td{
background:#F6F6F6;
color:black;
padding:0 4px 0 4px;
}
</style>
<script>
function cancle(){
	window.close();
}
function del(){
	var idx = document.getElementById('tc_idx').value;
	location='teach_del.do?idx='+idx;
}
</script>
</head>
<body>
<form name="fm" action="teach_update.do">
<table>
	<tr>
		<th>강사이름</th>
		<td><input type="text" name="tc_name" maxlength="10" required="required" value="${dto.tc_name }"><input type="hidden" id="tc_idx" name="tc_idx" value="${dto.tc_idx }"></td>
	</tr>
	<tr>
		<th>성별</th>
		<td>
		<input type="radio" id="tc_men" name="tc_gen" value="남성">남성
		<input type="radio" id="tc_women" name="tc_gen" value="여성">여성
		<c:choose>
			<c:when test="${dto.tc_gen eq '남성' }"><script>document.getElementById('tc_men').checked=true;</script></c:when>
			<c:when test="${dto.tc_gen eq '여성' }"><script>document.getElementById('tc_women').checked=true;</script></c:when>
		</c:choose>
		
		</td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td><input type="tel" name="tc_tel" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" value="${dto.tc_tel }" required="required" placeholder="010-0000-0000"></td>
	</tr>
	<tr>
		<th>주소</th>
		<td><input type="text" name="tc_addr" maxlength="60" value="${dto.tc_addr }"></td>
	</tr>
	<tr>
		<th>최종학력</th>
		<td><input type="text" name="tc_school" maxlength="30" value="${dto.tc_school }">
	</tr>
	<tr>
		<th>메모</th>
		<td><textarea rows="5" cols="20" name="tc_memo" maxlength="330" style="resize: none;">${dto.tc_memo }</textarea></td>
	</tr>
	<tr>
		<td align="center" colspan="2"><input type="submit" value="저장" class="btn-gradient blue mini">
		<input type="button" value="삭제" onclick="del()" class="btn-gradient blue mini">
		<input type="button" value="취소" onclick="cancle()" class="btn-gradient blue mini">
		</td>
	</tr>
</table>
</form>
</body>
</html>