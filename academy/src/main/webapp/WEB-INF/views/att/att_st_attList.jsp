<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
	<tr>		
		<th>날짜</th>
		<th>요일</th>
		<th>출석</th>
		<th>비고</th>	
	</tr>


	<c:forEach var="attList" items="${attList }">
	<tr>
		
		<td>${attList.ATT_DATE }</td>
		<td>${attList.DAY }</td>
		<td>${attList.ATT_DIVIDE}</td>
		<td>${attList.ATT_BIGO }</td>		
	</tr>
	</c:forEach>	
		
</table>


</body>
</html>