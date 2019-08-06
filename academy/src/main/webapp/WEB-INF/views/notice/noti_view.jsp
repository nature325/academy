<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/button.css"/>
<style>
table{
border:0px solid black;
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
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$("#notice").click(function() {
			location.href = "/academy/notice.do?n_idx=${dto.n_idx }";
			self.close();
		});
	});
	function noti_del(n_idx){
		location.href='noti_delete.do?n_idx='+n_idx;
	} 

</script>
</head>
<body>
	
	<form name="form1" method="post">
	<input type="hidden" name="n_idx" value="${dto.n_idx}">
		<table  style="width:600px; height:400px;">
			<tr>
				<th colspan="4">공지사항</th>
			</tr>
			<tr>
				<th>분류</th>
				<td>
					${dto.n_head }					
				</td>	
				<th>작성일자: </th>
				<td>
					${dto.n_wdate}					
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="3">
					${dto.n_subject}					
				</td>
		
						
			</tr>
			<tr>		
				<th >내용</th>
				<td colspan="3" style="height:300px;vertical-align:top;padding:10px 0 0 10px;">
					${dto.n_content}					
				</td>
			</tr>

			<tr>
				<td colspan="4" align="center">
					<button type="button" id="notice" class="btn-gradient blue mini">닫기</button>
					<c:if test="${sessionScope.position == 'Manager' }">
					<button type="button" onclick="javascript:location='noti_viewForm.do?n_idx='+${dto.n_idx}" class="btn-gradient blue mini">수정</button>
					<a href="javascript:noti_del('${dto.n_idx }')"  class="btn-gradient blue mini">삭제</a>
					</c:if>
				</td>
			</tr>
		</table>
		<!--  <br>
		<div>
			작성일자 :
			<fmt:formatDate value="${dto.n_wdate}" pattern="yyyy-MM-dd" />

		</div>
		<div>
			제목 <input type="text" name="n_subject" id="n_subject" size="60"
				value="${dto.n_subject}" readonly>
		</div>
		<div>
			내용
			<textarea name="n_content" id="n_content" rows="4" cols="60"
				 readonly>${dto.n_content}</textarea>
		</div>
		<div style="width: 650px; text-align: center;">

			  input type="hidden" name="n_idx" value="${dto.n_idx}"-

			<button type="button" id="notice">목록</button>
			<button type="button"
				onclick="javascript:window.open('noti_viewForm.do?n_idx=${dto.n_idx}','view','width=550,height=500')">수정</button>
		</div>
		-->
	</form>
</body>
</html>