<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<table style="width: 600px; height: 30px; text-align:center;">
	<tr>
		<th style="width:250px;">강좌명</th>		
		<th style="width:170px;">요일</th>
		<th style="width:100px;">강사</th>	
		<th style="width:80px;">결석</th>			
	</tr>
	<c:if test="${empty attInfo}">
		<tr>
			<td colspan="5">수강중인 강좌가 없습니다.</td>
		</tr>
	</c:if>
	<c:forEach var="dto" items="${attInfo }">
		<tr>
			<td>${dto.C_NAME }</td>			
			<td>${dto.C_DAY }</td>
			<td>${dto.TC_NAME }</td>
			<td>${dto.ABSENCE }</td>
		</tr>
	</c:forEach>
</table>