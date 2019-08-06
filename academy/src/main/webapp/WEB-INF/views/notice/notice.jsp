<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<link rel="stylesheet" href="css/button.css"/>
<style>
header{
margin:0 0 50px;
}
select{
border: 0px solid #FFBB00;
padding: 3px;
width:100px;
font-size:15px;
vertical-align:-27%;

}
input{
border: 2px solid #FFBB00;
padding: 3px;
width:200px;
font-size:15px;
vertical-align:-17%;

}
body{
margin:0;
}
tr{
height:40px;
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
section{

}
.list:hover td{
background:#A6A6A6;
}
table{
text-align:center;
}

</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<title>notice</title>
<script>
	$(document).ready(function() {
		$("#Write").click(function() {			
			window.open('noti_addForm.do','addForm','width=630px,height=400')
		});
	});

	function notice(cr_path) {
		var crpath=cr_path;
		var n_head=document.getElementById('n_head').value;	
		var searchOption=document.getElementById('searchOption').value;				
		var keyword=document.getElementById('keyword').value;		
		location.href = '/academy/notice.do?crpath='+crpath+'&searchOption='+searchOption+'&keyword='+keyword+'&n_head='+n_head;
	}	
	
	
	
</script>

</head>
<body>
	<%@ include file="../header.jsp"%>



	<section>						
		<table style="width: 1300px; height: 50px; margin:0 auto;">
			<thead>
				<tr>
			<th colspan="5">				
						<select name="n_head" id="n_head">
							<option value=""
							<c:out value="${n_head == ''?'selected':''}"/>>모든공지</option>
							<option value="전체공지"
							<c:out value="${n_head == '전체공지'?'selected':''}"/>>전체공지</option>
							<option value="강좌별공지"
							<c:out value="${n_head == '강좌별공지'?'selected':''}"/>>강좌별공지</option>
							
						</select> 
					
					

			<select name="searchOption" id="searchOption">
				<option value="all"
					<c:out value="${searchOption == 'all'?'selected':''}"/>>제목+내용</option>
				<option value="n_subject"
					<c:out value="${searchOption == 'n_subject'?'selected':''}"/>>제목</option>
				<option value="n_Content"
					<c:out value="${searchOption == 'n_content'?'selected':''}"/>>내용</option>				

			</select> <input type="text" name="keyword" id="keyword" maxlength="60" value="${keyword }">
				<a href="javascript:notice(1)" class="btn-gradient blue mini">검색</a>				
				</th>
				</tr>			
				<tr>
					<th style="width: 50px;">글번호</th>
					<th style="width: 50px;">분류</th>
					<th style="width: 180px;">강좌명</th>
					<th style="width: 400px;">제목</th>					
					<th style="width: 50px;">작성일</th>
				</tr>
				<c:if test="${empty list }">
					<tr>
						<td colspan="5" align="center">등록된 공지사항이 없어요</td>
					</tr>
				</c:if>
			</thead>
			<tfoot>			
			<tr>
				<td colspan="5" style="text-align:center;">${page}
				<c:if test="${sessionScope.position == 'Manager' }">
				<button style="float: right;" type="button" id="Write">글쓰기</button>
				</c:if>
				</td>
			</tr>
			
			</tfoot>
			<tbody>
				<c:forEach items="${list}" var="dto">
					<tr class="list">
						<td>${dto.n_idx}</td>
						<td>${dto.n_head }</td>
						<td>${dto.c_name }</td>
						<td style="text-align:left;"><a
							href="javascript:window.open('noti_view.do?n_idx=${dto.n_idx}','view','width=620,height=450')">${dto.n_subject}</a></td>	
						<td><fmt:formatDate pattern="yyyy-MM-dd"
								value="${dto.n_wdate}" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		
		
		</section>




		<%@ include file="../footer.jsp"%>
</body>
</html>