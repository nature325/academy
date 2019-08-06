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
function cancle(){
	window.close();
}
function unchk(c,cc){
	if(document.getElementById('day'+c).checked==true){
		document.getElementById(c).removeAttribute('disabled');
		document.getElementById(cc).removeAttribute('disabled');	
	} else {
		document.getElementById(c).setAttribute('disabled',true);
		document.getElementById(cc).setAttribute('disabled',true);
		document.getElementById(c).value='';
		document.getElementById(cc).value='';
	}
}
function c_sum(){
	var c_day='';
	for(var i=0;i<7;i++){
		if(document.getElementById('day'+i).checked==true){
			c_day+=document.getElementById('day'+i).value;
			}
		}
	document.getElementById('c_day').value=c_day;
	for(var i=0;i<7;i++){
		document.getElementById(i).removeAttribute('disabled');
		document.getElementById(i+'c').removeAttribute('disabled');
	}
}
function tc_add(){
	window.open('teach_addForm.do','teach_add','width=400,height=500');
}
</script>
</head>
<body>
<form id="fm" name="fm" action="sub_add.do">
<table>
	<tr>
		<th>강좌명</th>
		<td colspan="3"><input type="text" name="c_name" required="required" maxlength="60"></td>
	</tr>
	<tr>
		<th>수강료</th>
		<td colspan="3"><input type="number" name="c_price" max="9999999999" required="required"></td>
	</tr>
	<tr>
		<th>강사</th>
		<td>
			<select name="tc_idx">
			<c:if test="${empty lists }">
				<option>강사가 없습니다</option>			
			</c:if>
			<c:forEach var="list" items="${lists }">
				<option value="${list.tc_idx }" >${list.tc_name }</option>
			</c:forEach>
		</select>
		</td>
		<td><input type="button" value="강사추가" onclick="tc_add()" class="btn-gradient blue mini"></td>
	</tr>
	<tr>
		<th>최대 수강인원</th>
		<td colspan="3"><input type="number" min="0" max="30" name="c_maxp" required="required">명</td>
	</tr>
	<tr>
		<th>강의실</th>
		<td colspan="3"><input type="text" name="c_place" required="required" maxlength="10"></td>
	</tr>
	<tr>
		<th>강좌시간
		<input type="hidden" id="c_day" name="c_day" value="">
		</th>
	</tr>
	<tr>
		<th><input type="checkbox" id="day0" value="월" onchange="unchk('0','0c')">월</th>
		<td colspan="3"><input type="time" id="0" name="c_mon" disabled>~<input type="time" id="0c" name="c_mon1" disabled></td>
	</tr>
	<tr>
		<th><input type="checkbox" id="day1" value="화" onchange="unchk('1','1c')">화</th>
		<td colspan="3"><input type="time" id="1" name="c_tue" disabled>~<input type="time" id="1c" name="c_tue1" disabled></td>
	</tr>
	<tr>
		<th><input type="checkbox" id="day2" value="수" onchange="unchk('2','2c')">수</th>
		<td colspan="3"><input type="time" id="2" name="c_wedn" disabled>~<input type="time" id="2c" name="c_wedn1" disabled></td>
	</tr>
	<tr>
		<th><input type="checkbox" id="day3" value="목" onchange="unchk('3','3c')">목</th>
		<td colspan="3"><input type="time" id="3" name="c_thur" disabled>~<input type="time" id="3c" name="c_thur1" disabled></td>
	</tr>
	<tr>
		<th><input type="checkbox" id="day4" value="금" onchange="unchk('4','4c')">금</th>
		<td colspan="3"><input type="time" id="4" name="c_fri" disabled>~<input type="time" id="4c" name="c_fri1" disabled></td>
	</tr>
	<tr>
		<th><input type="checkbox" id="day5" value="토" onchange="unchk('5','5c')">토</th>
		<td colspan="3"><input type="time" id="5" name="c_sat" disabled>~<input type="time" id="5c" name="c_sat1" disabled></td>
	</tr>
	<tr>
		<th><input type="checkbox" id="day6" value="일" onchange="unchk('6','6c')">일</th>
		<td colspan="3"><input type="time" id="6" name="c_sun" disabled>~<input type="time" id="6c" name="c_sun1" disabled></td>
	</tr>
	<tr>
		<th>시작일</th>
		<td><input type="date" name="c_sdate" required="required"></td>
	</tr>
	<tr>
		<th>종료일</th>
		<td><input type="date" name="c_edate" required="required"></td>
	</tr>
	<tr>
		<th>비고</th>
		<td colspan="3"><textarea rows="5" cols="28" name="c_memo" maxlength="330" style="resize: none;"></textarea></td>
	</tr>
	<tr>
		<td colspan="4" align="center">
			<input type="submit" value="저장" onclick="c_sum()" class="btn-gradient blue mini">
			<input type="button" value="취소" onclick="cancle()" class="btn-gradient blue mini">
		</td>
	</tr>
	
</table>

</form>
</body>
</html>