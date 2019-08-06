<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="css/button.css"/>
<style>
th{
background:#044071;
color:white;
width:100px;
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
tr{
height:40px;
}
</style>
<script>
var st_gens = document.getElementsByName('st_gen');
var st_smss = document.getElementsByName('st_sms');
var st_gen_value; // 여기에 선택된  버튼의 값이 담기게 된다.
var st_sms_value; 
for(var i=0; i<st_gens.length; i++) {
    if(st_gens[i].checked) {
    	st_gen = st_gens[i].value;
    }
for(var i=0; i<st_smss.length; i++) {
    if(st_smss[i].checked) {
    	st_sms = st_smss[i].value;
    }    
}
</script>


<body>
<form name="st_addInfo" action="st_addInfo.do"> <!-- >StController -->
<table style="width: 600px; height: 300px;">
	<tr style="width: 200px; height: 50px;" align="center" >
		<th colspan="4">
			원생 추가
		</th>
	</tr>
	<tr>
		<th width="100">학번</th>
		<td colspan="3">
			<input type="text" value="${st_maxIdx+1 }" name="st_idx" readonly="readonly">
		</td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td colspan="3"><input type="text" required name="st_pwd"></td>
	</tr>
	<tr>
		<th>이름</th>
		<td colspan="3"><input type="text" required name="st_name"></td>
	</tr>
	<tr>
		<th>성별</th>
		<td colspan="3">
			<input type="radio" name="st_gen" value="남자" checked>남자
			<input type="radio" name="st_gen" value="여자">여자		
		</td>
	</tr>
	

	<tr>
		<th>어머니 전화</th>
		<td><input type="text" required name="st_momtel" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" placeholder="ex)000-0000-0000"></td>
		<th>아버지 전화</th>
		<td><input type="text" name="st_fatel" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" placeholder="ex)000-0000-0000"></td>
	</tr>
	<tr>
		<th>학생 전화</th>
		<td><input type="text" required name="st_hometel" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" placeholder="ex)000-0000-0000"></td>
		<th>SMS수신여부</th>
		<td>
			<input type="radio" name="st_sms" value="받음" checked>받음	
			<input type="radio" name="st_sms" value="받지않음">받지않음
		</td>
	</tr>
	<tr>
		<th>주소</th>
		<td  colspan="3"><textarea rows="2" cols="60" name="st_addr"  style="resize:none" maxlength="60"></textarea></td>
	</tr>
	<tr>
		<th>학교</th>
		<td><input type="text" name="st_school" maxlength="13"></td>
		<th>학년</th>
		<td><select name="st_level">
			<option value="고1">고1</option>
			<option value="고2">고2</option>
			<option value="고3">고3</option>
		</select></td>
	</tr>
	<tr>
		<th>메모</th>
		<td colspan="3">
			<textarea rows="5" placeholder="300자 이내로 작성해주세요" maxlength="300" cols="60" name="st_memo" style="resize:none"></textarea>
		</td>
	</tr>
	<tr>
		<th>원생상태</th>
		<td>		
			<select name="st_status">			
				<option value="재원"> 재원 </option>
				<option value="퇴원"> 퇴원 </option>
				<option value="휴원"> 휴원 </option>
				<option value="예비"> 예비</option>
			</select>
		</td>
	</tr>
		<tr>
		<td align="center" colspan="4">
			<input type="submit" class="btn-gradient blue mini">	
			
			<a href="javascript:st_addInfo.reset()" class="btn-gradient blue mini">초기화</a>
			
		</td>
	</tr>
</table>
</form>
</body>
</html>