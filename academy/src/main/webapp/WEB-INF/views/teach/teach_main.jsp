<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/button.css"/>

<style>
header{
margin:0 0 50px;
}
body{
margin:0;
}
section{
width:1200px;
margin:0 auto;
clear:both;
}
input[type=text]{
border: 2px solid #FFBB00;
padding: 2px;
width:170px;
font-size:15px;
vertical-align:-10%;
}
th{
background:#044071;
color:white;
width:100px;
text-align:center;
}
th a{
text-decoration:none;
color:white;
}
td{
background:#F6F6F6;
color:black;
padding:0 4px 0 4px;
text-align:center;
}
tr{
height:30px;
}
.footer{
clear:both;
text-align:center;
}
.list:hover td{
background:#A6A6A6;
}
.list{
cursor:pointer;
}

</style>
<script type="text/javascript" src="js/httpRequest.js"></script>

<script>
if(${sessionScope.position == 'student'}){
	window.alert('관리자만 접근가능한 페이지 입니다. 다시 로그인 해주세요.')
	history.back();
}
function addForm(){
	window.open('teach_addForm.do','teach','width=400,height=500');
}
function show(tc_idx){
	document.getElementById('idx').value=tc_idx;
	document.getElementById('btn').removeAttribute('disabled');
	var param='idx='+tc_idx;
	sendRequest('teach_subList.do',param,'GET',showResult);
}
function showResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			document.getElementById('subList').innerHTML=XHR.responseText;
		}
	}
}
function updateForm(){
	var idx = document.getElementById('idx').value;
	window.open('teach_updateForm.do?idx='+idx,'teach_up','width=400,height=500');
}
function subInfo(c_code){
	var param = '?c_code='+c_code;
	window.open('teach_subInfo.do'+param,'subInfo','width=450,height=550');
}
</script>
</head>
<body>
<%@ include file="../header.jsp" %>
<section>
<article>
<div>
	
</div>
<div>	
	<table style="width:1200px">
		<tr>
			<th colspan="5">
			<form name="fm" action="teach_select.do">			
			<input type="text" name="tc_name" placeholder="강사명 입력" maxlength="10">
			<a href="javascript:fm.submit()" class="btn-gradient blue mini">조회</a>			
			</form>
			</th>
		</tr>
		<tr>
			<th>강사명</th>
			<th>연락처</th>
			<th>성별</th>
			<th>학력</th>
			<th>비고</th>
		</tr>
		<c:if test="${empty lists }">
		<tr>
			<th colspan="3">강사가 없습니다.</th>
		</tr>
		</c:if>
		<c:forEach var="list" items="${lists }">
			<tr class="list" onclick="show(${list.tc_idx})">
				<td>${list.tc_name }</td>
				<td>${list.tc_tel }</td>
				<td>${list.tc_gen }</td>
				<td>${list.tc_school }</td>
				<td>${list.tc_memo }</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="5">
				<input type="hidden" id="idx">
				<input type="button" value="강사추가" onclick="addForm()" class="btn-gradient blue mini">
				<input type="button" value="강사편집" id="btn" onclick="updateForm()" disabled="disabled" class="btn-gradient blue mini">
			</td>
		</tr>
	</table>
</div>	
</article>
<article>
<div id="subList">
</div>
</article>
</section>
<%@ include file="../footer.jsp" %>
</body>
</html>