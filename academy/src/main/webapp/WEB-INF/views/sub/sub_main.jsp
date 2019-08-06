<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/button.css"/>
<style>
body{
margin:0;
}
header{
margin:0 0 50px;
}
#searchValue{
border: 2px solid #FFBB00;
padding: 2px;
width:170px;
font-size:15px;
vertical-align:-10%;
}
select{
border: 0px solid #FFBB00;
padding: 2px;
width:70px;
font-size:15px;
vertical-align:-24%;
}
tr{
height:30px;
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
td a{
text-decoration:none;
color:black;
}
.footer{
clear:both;
text-align:center;
}
table{
text-align:center;
}
#subListTab{
width:1100px;
margin:0 auto;
}
#subInfoTab{
float:left;
width:	400px;
height: 300px;
}
#subTimeTab{
float:right
width: 400px;
height: 300px;
}
section{
width:1100px;
margin:0 auto;
}
.list:hover td{
background:#A6A6A6;
}
.list{
cursor:pointer;
}
</style>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
if(${sessionScope.position == 'student'}){
	window.alert('관리자만 접근가능한 페이지 입니다. 다시 로그인 해주세요.')
	history.back();
}
function qna(crpath,c_code){
	
	location.href="qna.do?crpath="+crpath+"&c_code="+c_code;
}
$(document).ready(function(){
	$("#subTimeTab").hide();
});

function show(c){
	var param='c_code='+c;
	sendRequest('sub_selectOne.do',param,'GET',showResult);
}
function showResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var temp=XHR.responseText;
			var datas=eval('('+temp+')');
			document.getElementById('rc_code').value=datas.dto.c_code;
			document.getElementById('rc_name').value=datas.dto.c_name;
			document.getElementById('rc_price').value=datas.dto.c_price;
			document.getElementById('rtc_name').value=datas.dto.tc_name;
			document.getElementById('rc_place').value=datas.dto.c_place;
			document.getElementById('rc_memo').innerHTML=datas.dto.c_memo;
			document.getElementById('btn').removeAttribute('disabled');
			document.getElementById('rc_mon').value=datas.dto.c_mon;
			document.getElementById('rc_mon1').value=datas.dto.c_mon1;
			document.getElementById('rc_tue').value=datas.dto.c_tue;
			document.getElementById('rc_tue1').value=datas.dto.c_tue1;
			document.getElementById('rc_wedn').value=datas.dto.c_wedn;
			document.getElementById('rc_wedn1').value=datas.dto.c_wedn1;
			document.getElementById('rc_thur').value=datas.dto.c_thur;
			document.getElementById('rc_thur1').value=datas.dto.c_thur1;
			document.getElementById('rc_fri').value=datas.dto.c_fri;
			document.getElementById('rc_fri1').value=datas.dto.c_fri1;
			document.getElementById('rc_sat').value=datas.dto.c_sat;
			document.getElementById('rc_sat1').value=datas.dto.c_sat1;
			document.getElementById('rc_sun').value=datas.dto.c_sun;
			document.getElementById('rc_sun1').value=datas.dto.c_sun1;
			$("#subTimeTab").slideDown();
		}
	}
}
function addForm(){
	window.open('sub_addForm.do','add','width=500,height=600');
}
function updateForm(){
	var a = document.getElementById('rc_code').value;
	var param = 'c_code='+a;
	window.open('sub_updateForm.do?'+param,'update','width=500,height=600');
}
</script>
</head>
<body>
<%@ include file="../header.jsp" %>
<section>
<table id="subListTab">
	<tr>
		<th colspan="6">
		<form name="fm" action="sub_select.do">
		<select name="cho">
			<option value="c_name">강좌명</option>
			<option value="tc_name">강사명</option>
		</select>
		<input type="text" name="name" id="searchValue" placeholder="강좌명  및 강사명 입력" maxlength="60">
		<a href="javascript:fm.submit()" class="btn-gradient blue mini">조회</a>				
		</form>
		</th>
	</tr>
	<tr>
		<th>강좌명</th>
		<th>요일</th>
		<th>수강료</th>
		<th>강사</th>
		<th>강의실</th>
		<th>　</th>
	</tr>
	<c:if test="${empty lists }">
		<tr>
			<th>개설 된 강좌가 없습니다.</th>
		</tr>
	</c:if>
	<c:forEach var="list" items="${lists }">
		<tr class="list" onclick="show(${list.C_CODE})">
			<td>${list.C_NAME }</td>
			<td>${list.C_DAY }</td>
			<td>${list.C_PRICE }원</td>
			<td>${list.TC_NAME }</td>
			<td>${list.C_PLACE }</td>
			<td>
			<a href="javascript:qna('1','${list.C_CODE}')" class="btn-gradient blue mini">QnA게시판</a>
			</td>
		</tr>
	</c:forEach>
		<tr>
			<td colspan="6">
				<input type="button" value="강좌추가" onclick="addForm()">
				<input type="button" value="강좌편집" id="btn" disabled="disabled" onclick="updateForm()">
			</td>
		</tr>
</table>
<div>
<table id="subInfoTab" >
	<tr>
		<th>강좌명</th>
		<td colspan="3"><input type="hidden" id="rc_code">
		<input type="text" id="rc_name" readonly="readonly"></td>
	</tr>
	<tr>
		<th>수강료</th>
		<td colspan="3"><input type="text" id="rc_price" readonly="readonly"></td>
	</tr>
	<tr>
		<th>강사</th>
		<td colspan="3"><input type="text" id="rtc_name" readonly="readonly"></td>
	</tr>
	<tr>
		<th>강의실</th>
		<td colspan="3"><input type="text" id="rc_place" readonly="readonly"></td>
	</tr>
	<tr>
		<th>비고</th><td colspan="3">
		<textarea rows="10" cols="30" id="rc_memo" readonly="readonly" style="resize: none;"></textarea>
		</td>
	</tr>	
</table>
<div id="subTimeTab">
<table style="height:300px;">
	<tr>
		<th colspan="6">시간표</th>		
	</tr>
	<tr>
		<th>월</th>
		<td><input type="time" id="rc_mon" readonly="readonly">~<input type="time" id="rc_mon1" readonly="readonly"></td>
	</tr>
	<tr>
		<th>화</th>
		<td><input type="time" id="rc_tue" readonly="readonly">~<input type="time" id="rc_tue1" readonly="readonly"></td>
	</tr>
	<tr>
		<th>수</th>
		<td><input type="time" id="rc_wedn" readonly="readonly">~<input type="time" id="rc_wedn1" readonly="readonly"></td>
	</tr>
	<tr>
		<th>목</th>
		<td><input type="time" id="rc_thur" readonly="readonly">~<input type="time" id="rc_thur1" readonly="readonly"></td>
	</tr>
	<tr>
		<th>금</th>
		<td><input type="time" id="rc_fri" readonly="readonly">~<input type="time" id="rc_fri1" readonly="readonly"></td>
	</tr>
	<tr>
		<th>토</th>
		<td><input type="time" id="rc_sat" readonly="readonly">~<input type="time" id="rc_sat1" readonly="readonly"></td>
	</tr>
	<tr>
		<th>일</th>
		<td><input type="time" id="rc_sun" readonly="readonly">~<input type="time" id="rc_sun1" readonly="readonly"></td>
	</tr>
</table>
</div>
</section>
<%@ include file="../footer.jsp" %>
</body>
</html>