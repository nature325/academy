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
</head>
<script>
	function qna_del(q_idx){
		if(confirm("질문글을 삭제하시겠습니까?")==true){		
			location.href='qna_conDel.do?q_idx='+q_idx;							
		}else{		
			return false;
		}
		opener.location.reload();
	}
</script>
<body onunload="opener.location.reload()">
<table style="width:600px; ">
		<tr>
			<th colspan="4">QnA</th>
		</tr>
	 	<tr>	
	 		<th style="width:100px">과목</th>
	 		<td colspan="3">${dto.c_name}</td>
	 	</tr>
		<tr>
	 		<th>제목</th>
	 		<td colspan="3">${dto.q_subject}</td>
		</tr>
		<tr>
	 		<th>글쓴이</th>
	 		<td colspan="3">${dto.st_name }</td>
		</tr>
		<tr>
			<th colspan="4">질문내용</th>
		</tr>
		<tr>
			<td colspan="4" style="height:300px;vertical-align:top;padding:10px 0 0 10px;"">
				${dto.q_content}				
			</td>
		</tr>
		<c:if test="${sessionScope.id == dto.st_idx}">
		<tr>	
			<td colspan="4" align="right" >				
				
				<input type="button" value="편집하기" onclick="javascript:location='qna_conUpdate.do?q_idx='+${dto.q_idx}" class="btn-gradient blue mini">
				<input type="button" value="삭제하기" onclick="qna_del('${dto.q_idx}')" class="btn-gradient blue mini">
				
			</td>
		</tr> 
		</c:if>
		<c:choose>
		<c:when test="${empty rdto and sessionScope.position == 'Manager'}">
		<tr>
			<th>답변</th>
			<td colspan="3" align="right">
				<form name="qna_reply" action="qna_reply.do">
				<textarea cols="66" rows="8"  name="r_content" style="resize:none;" maxlength="660"></textarea>
				<input type="hidden" name="q_idx" value="${dto.q_idx }">
				<input type="submit" value="답변하기" class="btn-gradient blue mini">
				</form>				
			</td>
			
		</tr>
		</c:when>
		<c:when test="${not empty rdto }">		
		<tr>
			<th>답변자 </th>
			<td>관리자&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<th>답변날짜</th>
			<td>${rdto.r_wdate }</td>
		</tr>		
		<tr>
			<td colspan="4" style="height:100px;">
				${rdto.r_content }	
			</td>
		</tr>
		<c:if test="${sessionScope.position=='Manager'}">
		<tr>
			<td colspan="4" align="right">
				
				<input type="button" value="답변  삭제" class="btn-gradient blue mini" onclick="location.href='qna_replyDel.do?q_idx=${dto.q_idx}'">	
			</td>
		</tr>
		</c:if>
		</c:when>
		</c:choose>
		
		
		

	
</table>


</body>
</html>