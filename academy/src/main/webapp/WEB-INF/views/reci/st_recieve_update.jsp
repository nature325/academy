<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>납부 편집</title>
</head>
<link rel="stylesheet" href="css/button.css"/>
<style>
table{
border:0px solid black;
width:400px;
}
th{
background:#044071;
color:white;
width:100px;
}
td{
background:#F6F6F6;
color:black;
padding:0 4px 0 4px;
}
tr{
height:27px;
}
</style>
<body>
<c:set var="up" value="${dto}"></c:set>
<form name="reci_update" action="reci_update.do">
<input type="hidden" name="p_idx" value="${up.p_idx}">
<table>
	<tr>
		<th colspan="2">납부 편집</th>
	</tr>
   <tr>
      <th>강좌명</th>
      <td><input type="text" value="${up.c_name}" readonly></td>
   </tr>
   <tr>
      <th>수강료</th>
      <td><input type="text" value="${up.c_price}" readonly></td>
   </tr>
   <tr>
      <th>원생명</th>
      <td><input type="text" value="${up.st_name}" readonly></td>
   </tr>
   <tr>
      <th>납부일자</th>
      <td><input type="date" name="p_paydate" value="${up.p_paydate.substring(0,10)}"></td>
   </tr>
   <tr>
       <th>납부구분</th>
       <td><select name="p_payment">
         <option value="이체" <c:if test="${up.p_payment=='이체'}">selected="selected"</c:if>>이체</option>
         <option value="카드" <c:if test="${up.p_payment=='카드'}">selected="selected"</c:if>>카드</option>
         <option value="현금" <c:if test="${up.p_payment=='현금'}">selected="selected"</c:if>>현금</option>
      </select></td>
   </tr>
   <tr>
      <th>납부금액</th>
      <td><input type="number" name="p_pay" value="${up.p_pay}" max="9999999999"></td>
   <tr>
      <th>비고</th>
      <td><textarea rows="5" cols="20" name="p_bigo" maxlength="33" style="resize: none;">${up.p_bigo}</textarea></td>
   </tr>
   <tr>
   <td colspan="2" style="text-align:center;">
      <input type="submit" value="저장" class="btn-gradient blue mini"> 
      <input type="button" value="삭제" onclick="reciDel(${up.p_idx})" class="btn-gradient blue mini"> 
      <input type="button" value="취소" onclick="closePopup()" class="btn-gradient blue mini">
   </td>
   </tr>
</table>
</form>
</body>
<script>
function reciDel(p_idx){
	var param='p_idx='+p_idx;
	location.href='reci_del.do?'+param;
}

function closePopup(){
	window.self.close();
}
</script>
</html>