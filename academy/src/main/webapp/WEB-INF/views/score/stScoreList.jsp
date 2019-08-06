<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
div.table{
display:table;
width: 550px;}
form.tr, div.tr{display:table-row;}
span.td{
display:table-cell;
}
input[type=number] {
	width: 150px;
	height:20px;
	font-size:20px;
	text-align:center;
}
input[type=date] {
	width: 160px;
	height:23px;
	font-size:15px;
	text-align:center;
}
input[type=text] {
	width: 160px;
	height:20px;
	font-size:15px;
	text-align:center;
}
.tr span{
text-align:center;
background:#044071;
color:white;

}


</style>
<div class="table">
	<c:choose>
	<c:when test="${not empty lists }">
	<div class="tr">
		<span class="td">시험명</span>
		<span class="td">날짜</span>
		<span class="td">국어</span>
		<span class="td">영어</span>
		<span class="td">수학</span>
		<span class="td">사회</span>
		<span class="td">과학</span>
		<span class="td" style="width:300px;">&nbsp;&nbsp;&nbsp;&nbsp;</span>
	</div>
	</c:when>
	<c:otherwise>
	<div style="text-align:center;">저장된 성적데이터가 없습니다.</div>	
	</c:otherwise>
	</c:choose>
	

	<c:forEach var="list" items="${lists }" varStatus="c">
		<form name="fm${c.count}" class="tr" action="sc_stScoreUpdate.do">
			<span class="td">
			<input type="hidden" name="st_idx" value="${list.st_idx }">
			<input type="text" name="s_cate" value="${list.s_cate }">
			</span>
			<span class="td"><input type="date" name="s_date" value="${list.s_date }" readonly="readonly"></span>
			<span class="td"><input type="number" name="s_kor" max="100" value="${list.s_kor }"></span>
			<span class="td"><input type="number" name="s_eng" max="100" value="${list.s_eng }"></span>
			<span class="td"><input type="number" name="s_mat" max="100" value="${list.s_mat }"></span>
			<span class="td"><input type="number" name="s_soc" max="100" value="${list.s_soc }"></span>
			<span class="td"><input type="number" name="s_sci" max="100" value="${list.s_sci }"></span>
			<div class="td" style="width:100px;" align="center">
			<input type="submit" value="수정" ><input type="button" value="삭제" onclick="del('${list.st_idx}','${list.s_date }')">
			</div>
		</form>
	</c:forEach>
	
</div>
