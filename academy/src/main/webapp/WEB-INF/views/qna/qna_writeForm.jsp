<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/button.css"/>
<style type="text/css">

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
</head>
<body>
<form name="qna_write" action="qna_write.do" >

<table style="width:700px; height:500px;">
 	<tr>
 		<th colspan="2">QnA 작성하기</th>
 	</tr>	
 	<tr>	
 		<th style="width:100px">과목</th>		
 		<td>
 			<select name="c_code">	
 				<c:if test="${empty c_codes }">
 						<option>개설된 강좌가 없습니다.</option>
 				</c:if>	
 				<c:forEach var="dto" items="${c_codes}">		
 					<option  value="${dto.c_code}" >${dto.c_name}</option>				
 				</c:forEach>				
 			</select>
 		</td> 							
 	</tr>
	<tr>
 		<th>제목</th>
 		<td><input type="text" name="q_subject" style="width:650px;height:30px;border:0px;" required></td>
	</tr>
	<tr>
		<th  colspan="2">질문내용</th>
	</tr>
	<tr>
		<th colspan="2">
			<textarea rows="25" cols="105" name="q_content" style="resize:none" required></textarea>
		</th>
	</tr>
	<tr>
		<td colspan="2" align="right">
			<input type="submit" value="질문글올리기" class="btn-gradient blue mini">
			<input type="reset" value="다시쓰기" class="btn-gradient blue mini">
		</td>
	</tr> 

</table>
<input type="hidden" value="${sessionScope.id }" name="st_idx">

</form>

</body>
</html>