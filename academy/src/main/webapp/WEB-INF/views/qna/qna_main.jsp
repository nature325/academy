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
body {
	margin: 0;	
}
select{
border: 2px solid #FFBB00;
padding: 3px;
width:400px;
font-size:15px;
vertical-align:-17%;

}
header{
margin:0 0 50px 0;
}
section{
margin:0 auto 50px;
width:1300px;
background: #eaedf1;
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
tr{
height:40px;
}
#c_name{
overflow:hidden;
}
.footer{
clear:both;
margin:0 0 50px;
text-align:center;
}








</style>
<script src="js/jquery.min.js"></script>
</head>
<script type="text/javascript">
function qna_writeForm(){
	if(${empty subList}){
		alert('개설된 강좌가 없습니다.');
		return false;
	}
	
	window.open("qna_writeForm.do","qna_write","width=800, height=630");
}
function qna_content(q_idx){
	
	window.open("qna_content.do?q_idx="+q_idx,"qna_content","width=650, height=530")
}
function qna(crpath){
	
	location.href="qna.do?crpath="+crpath+"&c_code=${c_code}";
}

</script>
<body>
<%@ include file="../header.jsp" %>
<section>
<table style="width: 1300px;" >
	<form name="qna_search" action="qna.do">
		<tr>
			<th colspan="6">			
				강좌명
				<select name="c_code">
					<c:if test="${empty subList}">
						<option>개설된 강좌가 없습니다</option>
					</c:if>
					<c:forEach var="sub" items="${subList }">						
						<option value=${sub.c_code } <c:out value="${c_code==sub.c_code?'selected':'' }"/>>
						${sub.c_name }</option>
					</c:forEach>
				</select>				
			 	<!--  <input type="submit" value="검색"  >-->
			 	<a href="javascript:qna_search.submit()" class="btn-gradient blue mini">검색</a>
			 	
			</th>
		</tr>
	</form>	
	<tr>
		<th style="width: 50px;">글번호</th>			
		<th style="width: 180px;">강좌명</th>
		<th style="width: 400px;">제목</th>
		<th style="width: 60px;">답변</th>
		<th style="width: 70px;">글쓴이</th>	
		<th style="width: 80px;">작성일</th>	
	</tr>
	
<c:if test="${empty qna_list }">	
	<tr>
		<td colspan="5" align="center">질문글이 아직 없습니다.</td>
	</tr>
</c:if>

<c:forEach var="dto" items="${qna_list}" >	

	<tr>
		<td style="width: 50px;" align="center" id="q_idx">${dto.q_idx}</td>		
		<td style="width: 180px;" id="c_name" align="center">${dto.c_name}</td>
		<td style="width: 400px;" id="q_content"><a href="#" onclick="qna_content('${dto.q_idx}')">${dto.q_subject}</a></td>
		<td style="width: 60px; color:red;" align="center" id="c_code">${dto.r_result}</td>
		<td style="width: 70px;" align="center" id="tc_name">${dto.st_name}</td>
		<td style="width: 80px;" align="center" id="q_wDate">${dto.q_wDate}</td>
	</tr>
</c:forEach>
	<tr>
		<td align="center" colspan="4">${page }</td>
		<td colspan="2" align="center">
			<a href="javascript:qna_writeForm()" class="btn-gradient blue mini">글쓰기</a><a href="javascript:location='qna.do'" class="btn-gradient blue mini">목록으로</a>			
		</td>
	</tr>
</table>
</section>
<%@ include file="../footer.jsp" %>
</body>
</html>