<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<table style="width: 600px; height: 30px;text-align:center;">
	<tr>
		<th style="width:250px;">강좌명</th>
		<th style="width:130px;">요일</th>		
		<th style="width:70px;">강사</th>
		<th style="width:150px;">강의실</th>	
	</tr>
	<c:if test="${empty subList }">
		<tr>
			<td colspan="5">등록한 강좌가 없습니다.</td>
		</tr>
	</c:if>
	<c:forEach var="list" items="${subList }">
		<tr>
			<td>${list.C_NAME }</td>
			<td>${list.C_DAY }</td>			
			<td>${list.TC_NAME }</td>
			<td>${list.C_PLACE }</td>
		</tr>
	</c:forEach>
		<tr>
			<td colspan="5" >
			<a href="javascript:st_subAdd()" class="btn-gradient blue mini">수강강좌 등록</a>			
			</td>
		</tr>
</table>
