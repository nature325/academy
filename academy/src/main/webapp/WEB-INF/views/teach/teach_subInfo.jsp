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
th{
background:#044071;
color:white;
width:130px;
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
<script type="text/javascript" src="js/httpRequest.js"></script>
<script>
function unchk(){
	for(var i=0; i<7; i++ ){
		if(document.getElementById(i).value==''){
			document.getElementById(i).disabled=true;
			document.getElementById(i+'c').disabled=true;
		} else {
			document.getElementById('day'+i).checked=true;		
		}
	}
}
</script>
</head>
<body onload="unchk()">

<form id="fm" name="fm" action="sub_add.do">
<table>
	<tr>
		<th>강좌명</th>
		<td colspan="3"><input type="text" name="c_name" readonly value="${subdto.c_name}"></td>
	</tr>
	<tr>
		<th>수강료</th>
		<td colspan="3"><input type="text" name="c_price" readonly value="${subdto.c_price}"></td>
	</tr>
	<tr>
		<th>강사</th>
		<td>
		<input type="text" name="tc_name" readonly value="${subdto.st_idxs }">
		</td>
		<td></td>
	</tr>
	<tr>
		<th>최대 수강인원</th>
		<td colspan="3"><input type="number" min="0" max="30" name="c_maxp" readonly value="${subdto.c_maxp }">명</td>
	</tr>
	<tr>
		<th>강의실</th>
		<td colspan="3"><input type="text" name="c_place" readonly value="${subdto.c_place }"></td>
	</tr>
	<tr>
		<th colspan="3">강좌시간
		<input type="hidden" id="c_day" name="c_day" readonly value="${subdto.c_day}">
		</th>
	</tr>
	<tr>
		<th><input type="checkbox" id="day0" value="월" onclick='return false;'>월</th>
		<td colspan="3"><input type="time" id="0" name="c_mon" readonly value="${subdto.c_mon}">~<input type="time" id="0c" name="c_mon1" readonly value="${subdto.c_mon1}"></td>
	</tr>
	<tr>
		<th><input type="checkbox" id="day1" value="화" onclick='return false;'>화</th>
		<td colspan="3"><input type="time" id="1" name="c_tue" readonly value="${subdto.c_tue}">~<input type="time" id="1c" name="c_tue1" readonly value="${subdto.c_tue1}"></td>
	</tr>
	<tr>
		<th><input type="checkbox" id="day2" value="수" onclick='return false;'>수</th>
		<td colspan="3"><input type="time" id="2" name="c_wedn" readonly value="${subdto.c_wedn}">~<input type="time" id="2c" name="c_wedn1" readonly value="${subdto.c_wedn1}"></td>
	</tr>
	<tr>
		<th><input type="checkbox" id="day3" value="목" onclick='return false;'>목</th>
		<td colspan="3"><input type="time" id="3" name="c_thur" readonly value="${subdto.c_thur}">~<input type="time" id="3c" name="c_thur1" readonly value="${subdto.c_thur1}"></td>
	</tr>
	<tr>
		<th><input type="checkbox" id="day4" value="금" onclick='return false;'>금</th>
		<td colspan="3"><input type="time" id="4" name="c_fri" readonly value="${subdto.c_fri}">~<input type="time" id="4c" name="c_fri1" readonly value="${subdto.c_fri1}"></td>
	</tr>
	<tr>
		<th><input type="checkbox" id="day5" value="토" onclick='return false;'>토</th>
		<td colspan="3"><input type="time" id="5" name="c_sat" readonly value="${subdto.c_sat}">~<input type="time" id="5c" name="c_sat1" readonly value="${subdto.c_sat1}"></td>
	</tr>
	<tr>
		<th><input type="checkbox" id="day6" value="일" onclick='return false;'>일</th>
		<td colspan="3"><input type="time" id="6" name="c_sun"  readonly value="${subdto.c_sun}">~<input type="time" id="6c" name="c_sun1" readonly value="${subdto.c_sun1}"></td>
	</tr>
	<tr>
		<th>시작일</th>
		<td colspan="2"><input type="date" name="c_sdate" readonly value="${subdto.c_sdate }"></td>
	</tr>
	<tr>
		<th>종료일</th>
		<td colspan="2"><input type="date" name="c_edate" readonly value="${subdto.c_edate }"></td>
	</tr>
	<tr>
		<th>비고</th>
		<td colspan="3"><textarea rows="5" cols="20" name="c_memo" readonly value="${subdto.c_memo }" style="resize:none;"></textarea></td>
	</tr>
	<tr>
		<td colspan="4" align="center">			
			<input type="button" value="취소" onclick="self.close()" class="btn-gradient blue mini">
		</td>
	</tr>
	
</table>

</form>
</body>
</html>