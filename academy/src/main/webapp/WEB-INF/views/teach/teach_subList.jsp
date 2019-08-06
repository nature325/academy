<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<table style="width:1200px;">
	<tr>
		<th style="width:320px;">강좌명</th>
		<th style="width:150px;">요일</th>
		<th style="width:210px;">수강료</th>
		<th style="width:120px;">강사</th>
		<th style="width:150px;">강의실</th>
		<th style="width:250px;">비고</th>
	</tr>
	<c:if test="${empty lists }">
		<tr>
			<td colspan="6">진행 중인 강좌가 없습니다.</td>
		</tr>
	</c:if>
	<c:forEach var="list" items="${lists }" >
		<tr class="list" onclick="subInfo(${list.c_code})">
			<td style="width:320px;">${list.c_name }</td>
			<td style="width:150px;">${list.c_day }</td>
			<td style="width:210px;">${list.c_price }</td>
			<td style="width:120px;">${list.tc_name }</td>
			<td style="width:150px;">${list.c_place }</td>
			<td style="width:250px;">${list.c_memo }</td>
		</tr>
	</c:forEach>
</table>