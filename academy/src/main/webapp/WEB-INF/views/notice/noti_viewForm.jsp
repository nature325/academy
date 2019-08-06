<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/button.css"/>
<style>
table{
border:0px solid black;
}
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
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
</script>



<script>
function cancle(){
	window.self.close();
}

</script>
</head>
<body>
	<form name="form2" method="post" action="/academy/noti_update.do">						
		

	<input type="hidden" name="n_idx" value="${dto.n_idx}">
		<table  style="width:600px; height:400px;">
			<tr>
				<th colspan="4">공지사항 수정 페이지</th>
			</tr>
			<tr>
				<th>분류</th>
				<td>
					<input type="text" name="n_head" value="${dto.n_head}" maxlength="60">
				</td>
				<th>작성일자: </th>
				<td>
					${dto.n_wdate}					
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="3">
					<input type="text" name="n_subject" value="${dto.n_subject}" maxlength="60" style="width:450px;">
				</td>
							
			</tr>
			<tr>		
				<th >내용</th>
				<td colspan="3" style="height:300px">
					<textarea name="n_content" maxlength="1200" style="width:450px;height:300px;resize:none;">${dto.n_content}</textarea>					
					
				</td>
			</tr>
			<tr>
				<td colspan="4" align="center">					
					<button type="submit" id="btnUpdete" class="btn-gradient blue mini">수정</button>											
					<a href="javascript:cancle()"  class="btn-gradient blue mini">취소</a>
				</td>
			</tr>
		</table>	

	</form>
</body>
</html>