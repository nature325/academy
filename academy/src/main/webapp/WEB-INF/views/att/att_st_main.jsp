<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/httpRequest.js"></script>
<script src="js/getSubjectSize.js"></script>
<script>
function att_st_attList(c_sdate,c_edate,c_code,c_day){
	var param='c_sdate='+c_sdate+'&c_edate='+c_edate+'&c_code='+c_code+'&c_day='+c_day;
	sendRequest('att_st_attList.do',param,'GET',att_st_attListResult)
}
function att_st_attListResult(){
	if(XHR.readyState==4){
		if(XHR.status=200){
			document.getElementById('attList').innerHTML=XHR.responseText;
		}
	}
}
function att_st_subjectInfo(c_code){
	window.open('att_st_subjectInfo.do?c_code='+c_code,'subjectInfo','width=400,height=600');
}
</script>
<style>
body{
margin:0;
}
section{
width:1100px;
margin:0 auto;
}
header{
margin: 0 0 50px;
}
tr{
height:35px;
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
table{
text-align:center;
margin:0 0 30px;
}
.footer{
clear:both;
text-align:center;
}
</style>
</head>
<body>
<%@ include file="../header.jsp" %>
	<section>
	<table style="width: 1100px; ">
		<thead>
			<tr>
				<th>강좌명</th>
				<th>강좌시작일</th>
				<th>강좌 종료일</th>
				<th>출석률</th>
				<th>상세보기</th>				
			</tr>
		</thead>
		<tbody>
		<c:forEach var="dto" items="${subList }">
			<tr>
				<td><a href="javascript:att_st_attList('${dto.c_sdate}','${dto.c_edate}','${dto.c_code}','${dto.c_day}')">${dto.c_name }</a></td>
				<td>${dto.c_sdate }</td>
				<td>${dto.c_edate }</td>
				<td>				
				<script>document.write(('${dto.c_maxp}'/getSubjectSize('${dto.c_sdate }','${dateInfo}','${dto.c_day }')*100).toFixed(2))</script>
				%
				
				</td>
				<td><a href="javascript:att_st_subjectInfo('${dto.c_code}')">상세보기</a></td>				
			</tr>
		</c:forEach>		
		</tbody>
	</table>
	
	<div id="attList" style="height:300px;overflow:auto;">
	</div>
	
	</section>
	<%@ include file="../footer.jsp" %>
</body>
</html>