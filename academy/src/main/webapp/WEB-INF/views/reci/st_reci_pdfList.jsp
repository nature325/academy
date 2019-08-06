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
 h1 {
 	text-align: center;
 	color: black;
 	margin: 40px;
 }
 table{
 	margin: 0px auto;
 	width: 700px;
 	text-align: left;
 	border: 1px solid gray; 	
 	border-spacing: 0px;
 	background-color:;
 	text-align:center;
 }
 td,th {
 	border: 1px solid gray;
 	height:30px;
 }

 
</style>
</head>
<body>
<div id="pdf-list">
<fieldset>
<h1>납부내역서</h1>
	<table>
		<tr>
			<th>학생이름</th>
			<td colspan="5">${st_name}</td>
		</tr>
		<tr>
			<th>강좌명</th>
			<th>수강료</th>
			<th>강좌 시작일</th>
			<th>강좌 종료일</th>
			<th>납부액</th>
			<th>납부일자</th>
		</tr>
		<c:if test="${empty lists}">
			<tr>
				<td colspan="6">납부한 납부금액이 없습니다.</td>
			</tr>
		</c:if>
		<c:forEach var="list" items="${lists}">
			<tr>
				<td>${list.c_name}</td>
				<td>${list.c_price}</td>
				<td>${list.c_sdate}</td>
				<td>${list.c_edate}</td>
				<td>${list.p_pay}</td>
				<td>${list.p_paydate}</td>
			</tr>
		</c:forEach>
	</table>
	
	<img src="img/daemoon.jpg" style="display:block;margin:60px auto;">
	</fieldset>
</div>
<div style="text-align:center;"><button class="btn-gradient blue large" id="pdf-download" ${empty lists?'disabled':''}>PDF파일로 저장</button></div>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="js/jspdf.min.js"></script>
<script type="text/javascript" src="js/FileSaver.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.debug.js" integrity="sha256-DupmmuWppxPjtcG83ndhh/32A9xDMRFYkGOVzvpfSIk=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/dom-to-image/2.6.0/dom-to-image.js" integrity="sha256-Tw0/gX6aFDMese6GHQJFL/ZjF+f7edyF9okFVY/B9oU=" crossorigin="anonymous"></script>
<script type = "text/javascript" src = "https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
<script>
$("#pdf-download").click(function(){
html2canvas($('#pdf-list')[0]).then(function(canvas) {
        var imgData = canvas.toDataURL();
        var doc = new jsPDF('p', 'mm', 'a4');
        doc.addImage(imgData, 'IPEG',10,10);
        doc.save('개인납부내역서.pdf');
	});
});

 
</script>
</body>
</html>








