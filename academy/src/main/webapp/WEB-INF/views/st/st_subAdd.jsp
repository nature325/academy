<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
text-align:center;
overflow:hidden;
}
tr{
height:40px;
}
.subList:hover td{
background:#A6A6A6;
}
.subList{
cursor:pointer;
}

</style>

<script type="text/javascript" src="js/httpRequest.js"></script>
<script>
function cancle() {
	window.self.close();
}
function btn(code){
	var addBtn = document.getElementById('addBtn');
	addBtn.setAttribute('onclick','javasciprt:st_subAdd('+code+')');
	addBtn.removeAttribute('disabled');
	var delBtn = document.getElementById('delBtn');
	delBtn.setAttribute('onclick','javasciprt:st_subDel('+code+')');
	delBtn.removeAttribute('disabled');
}
function st_subAdd(code){
	var c_code = code;
	var st_idx = '${st_idx}';
	var param = 'c_code='+c_code+'&st_idx='+st_idx;
	sendRequest('st_subAdd.do',param,'GET',result);
}
function st_subDel(code){
	var c_code = code;
	var st_idx = '${st_idx}';
	var param = 'c_code='+c_code+'&st_idx='+st_idx;
	sendRequest('st_subDel.do',param,'GET',result);
}
function result(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var temp=XHR.responseText;
			var datas = eval('('+temp+')');
			alert(datas.msg);
			opener.location.reload();
		}
	}
}
</script>
</head>
<body>
<table style="width: 1000px; height: 30px;">
	<tr>
		<th colspan="5">수강등록</th>
	</tr>
	<tr>
		<th style="width:350px">강좌명</th>
		<th style="width:150px">요일</th>
		<th style="width:200px">수강료</th>
		<th style="width:100px">강사</th>
		<th style="width:200px">강의실</th>	
	</tr>

	<c:if test="${empty subList }">
		<tr>
			<th colspan="5">개설된 강좌가 없습니다.</th>
		</tr>
	</c:if>
	<c:forEach var="list" items="${subList }">
		<tr onclick="javascript:btn(${list.C_CODE })" class="subList">
			<td style="width:350px">${list.C_NAME }</td>
			<td style="width:150px">${list.C_DAY }</td>
			<td style="width:200px">${list.C_PRICE }원</td>
			<td style="width:100px">${list.TC_NAME }</td>
			<td style="width:200px">${list.C_PLACE }</td>
		</tr>
	</c:forEach>
		<tr>
			<td colspan="5" style="text-align:center">
			<input type="button" id="addBtn" value="수강신청하기" disabled="disabled">
			<input type="button" id="delBtn" value="수강취소" disabled="disabled">
			<input type="button" value="닫기" onclick="javascript:cancle()">
			</td>
		</tr>
</table>
</body>
