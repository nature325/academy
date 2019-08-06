<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<script type="text/javascript">
function st_del(st_idx){
    if (confirm("원생 정보를 삭제하시겠습니까?")==true) {
       
    } else{
    	return false;
    }
    location.href='st_delInfo.do?st_idx='+st_idx;
    
    opener.location.reload(); //st_updateForm의 부모창(원생main창) 리로드
}


</script>


<body>
<form name="st_update" action="st_update.do">
	<table style="width: 600px; height: 300px;">
	<tr style="width: 200px; height: 50px;" align="center" >
		<th colspan="4" style="text-align:center;">
			원생 편집
		</th>
	</tr>

	<c:forEach var="dto" items="${st_info}">
		<input type="hidden" id="st_idx" value="${dto.st_idx}"> <!--삭제할 때 쓸 idx -->
		<input type="hidden" name="st_idx" value="${dto.st_idx}"> <!-- 업데이트 할 때 쓸 idx -->
	<tr>
		<th width="100">학번</th>
		<td colspan="3" >
			<!--  <input type="text" name="st_idx" id="st_idx" value="${param.st_idx }" > 얘도 idx출력됨 -->
			${dto.st_idx }
		</td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td colspan="3"><input type="text" name="st_pwd" value="${dto.st_pwd}"></td>
	</tr>
	<tr>
		<th>이름</th>
		<td colspan="3"><input type="text" name="st_name" value="${dto.st_name}"></td>
	</tr>
	<tr>
		<th>성별</th>
		<td colspan="3">
			<input type="radio" name="st_gen" value="남자"
			<c:out value="${dto.st_gen == '남자'?'checked':'' }"/>>남자
			<input type="radio" name="st_gen" value="여자"
			<c:out value="${dto.st_gen == '여자'?'checked':'' }"/>>여자					
		</td>
	</tr>
	<tr>
		<th>어머니 전화</th>
		<td><input type="text" name="st_momtel" value="${dto.st_momtel}" required pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" placeholder="ex)000-0000-0000"></td>
		<th>아버지 전화</th>
		<td><input type="text" name="st_fatel" value="${dto.st_fatel}" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" placeholder="ex)000-0000-0000"></td>
	</tr>
	<tr>
		<th>학생 전화</th>
		<td><input type="text" name="st_hometel" value="${dto.st_hometel}" required pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" placeholder="ex)000-0000-0000"></td>
		<th>SMS여부</th>
		<td>		

			<input type="radio" name="st_sms" value="받음" selected
			<c:out value="${dto.st_sms == '받음'?'checked':'' }"/>>받음 
			<input type="radio" name="st_sms" value="받지않음"
			<c:out value="${dto.st_sms == '받지않음'?'checked':'' }"/>>받지않음
		</td>
	</tr>
	<tr>
		<th>주소</th>
		<td colspan="3">
			<textarea rows="2" cols="60" name="st_addr"  style="resize:none" maxlength="60">${dto.st_addr}</textarea>
		</td>
	</tr>
	<tr>
		<th>학교</th>
		<td><input type="text" name="st_school" value="${dto.st_school}" maxlength="13"></td>
		<th>학년</th>
		<td><select name="st_level">
			<option value="고1"
			<c:out value="${dto.st_level == '고1'?'selected':'' }"/>>고1</option>
			<option value="고2"
			<c:out value="${dto.st_level == '고2'?'selected':'' }"/>>고2</option>
			<option value="고3"
			<c:out value="${dto.st_level == '고3'?'selected':'' }"/>>고3</option></td>
	</tr>
	<tr>
		<th>메모</th>
		<td colspan="3">
			<textarea rows="5" cols="60" name="st_memo" style="resize:none" maxlength="300" >${dto.st_memo}</textarea>
		</td>
	</tr>
	<tr>
		<th>원생상태</th>
		<td>
			<select name="st_status">
				<option value="재원"
				<c:out value="${dto.st_status == '재원'?'selected':'' }"/>>재원 </option>
				<option value="퇴원"
				<c:out value="${dto.st_status == '퇴원'?'selected':'' }"/>>퇴원 </option>
				<option value="휴원"
				<c:out value="${dto.st_status == '휴원'?'selected':'' }"/>>휴원 </option>
				<option value="예비"
				<c:out value="${dto.st_status == '예비'?'selected':'' }"/>>예비</option>
			</select>	
		</td>
		<th>등록날짜</th>
		<td name="st_date">${dto.st_date}</td>
	</tr>
	<tr>
		<td align="center" colspan="4">
			<input type="submit" class="btn-gradient blue mini">수정</a>			
			<a href="javascript:st_update.reset()" class="btn-gradient blue mini">초기화</a>			
			<a href="javascript:st_del('${dto.st_idx}')" class="btn-gradient blue mini">삭제</a>			
		</td>
	</tr>
</c:forEach>
</table>
</form>
</body>
</html>