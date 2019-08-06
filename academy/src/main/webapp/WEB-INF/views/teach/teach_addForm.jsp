<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</script>
</head>
<body>
<form name="fm" action="teach_add.do">
<table>
	<tr>
		<th>강사이름</th>
		<td><input type="text" name="tc_name" maxlength="10" required="required">
	</tr>
	<tr>
		<th>강사아이디</th>
		<td><input type="text" name="tc_id" maxlength="10" required="required">
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name="tc_pwd" maxlength="10" required="required">
	</tr>
	<tr>
		<th>성별</th>
		<td><input type="radio" name="tc_gen" value="남성">남성
		<input type="radio" name="tc_gen" value="여성">여성
		</td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td><input type="tel" name="tc_tel" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" required="required" placeholder="010-0000-0000"></td>
	</tr>
	<tr>
		<th>주소</th>
		<td><input type="text" name="tc_addr" maxlength="60"></td>
	</tr>
	<tr>
		<th>최종학력</th>
		<td><input type="text" name="tc_school" maxlength="30">
	</tr>
	<tr>
		<th>메모</th>
		<td><textarea rows="5" cols="20" name="tc_memo" maxlength="330" style="resize: none;"></textarea></td>
	</tr>
	<tr>
		<td align="center" colspan="2"><input type="submit" value="저장" class="btn-gradient blue mini">
		<input type="button" value="취소" onclick="cancle()" class="btn-gradient blue mini">
		</td>
	</tr>
</table>
</form>
</body>
</html>