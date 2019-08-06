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
margin:0 0 50px 0;
}

select{
border: 0px solid #FFBB00;
padding: 3px;
width:60px;
font-size:15px;
vertical-align:-27%;

}
input{
border: 2px solid #FFBB00;
padding: 3px;
width:180px;
font-size:15px;
vertical-align:-17%;

}
#div1{
float:left;

}
#stListTab{
height:250px;
overflow:auto;
text-align:center;
}
#stListTab a{
text-decoration:none;
color:black;
}
section{
width:1200px;
margin:0  auto 300px;
clear:both;
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
.footer{
clear:both;
text-align:center;
}
</style>
<script src="js/httpRequest.js"></script>
<script>
if(${sessionScope.position == 'student'}){
	window.alert('관리자만 접근가능한 페이지 입니다. 다시 로그인 해주세요.')
	history.back();
}

function st_addForm(){
	window.open( "st_addForm.do", "st_addForm","width=650, height=600");
}
function st_updateForm(){
	var st_idx=document.getElementById("st_idx").value;		
	window.open( "st_updateForm.do?st_idx="+st_idx, "st_updateForm","width=650, height=600");
}
function showBt(){
	document.getElementById("st_updateBt").disabled=false;
}

function st_att(){	
	var st_idx='${st_info[0].st_idx}';		
	if(st_idx==''){
		window.alert('학생을 선택해주세요');
		return;
	}
	var param='st_idx='+st_idx;
	sendRequest('st_att.do',param,'GET',st_attResult);
}
function st_attResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			document.getElementById('detailMenu').innerHTML=XHR.responseText;			
		}
	}
}
function st_sub(){
	var st_idx='${st_info[0].st_idx}';		
	if(st_idx==''){
		window.alert('학생을 선택해주세요');
		return;
	}
	var param='st_idx='+st_idx;
	sendRequest('st_sub.do',param,'GET',st_subResult);
}
function st_subResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			document.getElementById('detailMenu').innerHTML=XHR.responseText;
		}
	}
}
function st_subAdd(){
	var st_idx='${st_info[0].st_idx}';
	open('st_subAddForm.do?st_idx='+st_idx,'subAdd','width=500,heigth=400');
}

function st_reci(){
	   var st_idx = '${st_info[0].st_idx}';
	   if(st_idx==''){
	      window.alert('학생을 선택해주세요');
	      return;
	   }
	   var param = 'st_idx='+st_idx;
	   sendRequest('st_reci.do',param,'GET',st_reciResult);
	}

	function st_reciResult(){
	   if(XHR.readyState==4){
	      if(XHR.status==200){
	         document.getElementById('detailMenu').innerHTML=XHR.responseText;
	      }
	   }
	}

</script>
</head>
<body>
<%@ include file="../header.jsp" %>
<section>
<!-- 1화면 -->
<div id="div1">
<form name="st_main" action="st_select.do"> 
<table style="width: 550px; height: 45px;">
	<tr>
		<th style="width: 200px; height: 45px;" align="center" >
		원생상태: 
		<select name="st_selectKey">
			<option value="재원">재원</option>
			<option value="퇴원">퇴원</option>
			<option value="휴원">휴원</option>
		</select>
		</th>
		<th colspan="4" align="center" width="400">
			<input type="text" name="st_name">
			<a href="javascript:st_main.submit()" class="btn-gradient blue mini">조회</a>			
			<a href="st.do" class="btn-gradient blue mini">초기화</a>
			
		</th>
	</tr>
</table>
</form>



<table style="width: 550px; ">
	
	<tr style="height: 40px;">
		<th style="width:60px">상태</th>
		<th style="width:80px">이름</th>
		<th style="width:100px">학교</th>
		<th style="width:60px">학년</th>
		<th style="width:170px">전화번호</th>
		
	</tr>
</table>
<div id="stListTab">
<table style="width: 550px; ">
<c:if test="${empty st_lists }">
		<tr>
			<td colspan="6" align="center">등록된 학원생이 없어요</td>
		</tr>
 </c:if>
<c:forEach var="dto" items="${st_lists}">
		<tr style="height: 30px;">
			<td style="width:60px">${dto.st_status}</td>					
			<td style="width:80px"><a href="st_info.do?st_idx=${dto.st_idx }" >${dto.st_name}</a></td>						
			<td style="width:100px">${dto.st_school}</td>
			<td style="width:60px">${dto.st_level}</td>
			<td style="width:170px">${dto.st_hometel}</td>
					
		</tr>
</c:forEach>				
</table>
</div>
</div>

<!-- 2화면 -->
<div id="studentInfo"  style="float: right; " >
<form name="d">
<table style="width: 600px; height: 400px;">
	<tr style="width: 200px; height: 50px;" align="center" >
		<th colspan="2">
			원생관리페이지 입니다. 
		</th>
		<th colspan="2">
			<a href="javascript:st_addForm()" class="btn-gradient blue mini">원생추가</a>
			<a href="javascript:st_updateForm()" class="btn-gradient blue mini">원생편집</a>
			<!-- <input type="button" value="원생 추가" onclick="st_addForm()">&nbsp;
			<input type="button" id="st_updateBt" value="원생 편집" onclick="st_updateForm()" ${empty st_info?'disabled':' '}>	
			
			 --> <!--  StController로 이동 -->
				<!-- st_info(학생1명개인정보가 있으면 버튼의 disabled가 블링크가 됨 -->
			
														
		
		</th>	
	</tr>
	
<c:if test="${empty st_info }">
		<tr>
			<td colspan="6" align="center">목록에서 학원생을 선택하세요.</td>
		</tr>
</c:if>
	<c:forEach var="dto" items="${st_info}" >			
	<tr>
		<th width="100">학번</th>
		<td colspan="2" >${dto.st_idx }<input type="hidden" name="st_idx" id="st_idx" value="${dto.st_idx}"></td>		
	</tr>
	<tr>
		<th>비밀번호</th>
		<td colspan="2">${dto.st_pwd }</td>
	</tr>
	<tr>
		<th>이름</th>
		<td colspan="2">${dto.st_name}</td>
	</tr>
	<tr>
		<th>성별</th>
		<td colspan="2">${dto.st_gen }</td>
	</tr>
	

	<tr>
		<th>어머니 전화</th>
		<td>${dto.st_momtel }</td>
		<th>아버지 전화</th>
		<td>${dto.st_fatel }</td>
	</tr>
	<tr>
		<th>집전화</th>
		<td>${dto.st_hometel }</td>
		<th>SMS여부</th>
		<td>${dto.st_sms}</td>
	</tr>
	<tr>
		<th>주소</th>
		<td colspan="3">${dto.st_addr}</td>
	</tr>
	<tr>
		<th>학교</th>
		<td>${dto.st_school }</td>
		<th>학년</th>
		<td>${dto.st_level }</td>
	</tr>
	<tr>
		<th>메모</th>
		<td colspan="3" style="padding:5px;height:60px;">
			<div style="height:60px;overflow:auto;">
			${dto.st_memo}
			</div>
		</td>
	</tr>
	<tr>
		<th>원생상태</th>
		<td>${dto.st_status }</td>
		<th>등록날짜</th>
		<td>${dto.st_date}</td>
	</tr>			
</c:forEach>


</table>
</form>		
</div>
<div style="clear:both;float:right;margin:0 0 100px 0;">
<table style="width: 600px; height: 30px;">
	<tr  style="width: 200px; height: 30px;" align="center" colspan="3">
		<th><a href="javascript:st_sub()">수강강좌</a></th>
		<th><a href="javascript:st_att()">출결현황</a></th>
		<th><a href="javascript:st_reci()">수납내역</a></th>		
	</tr>
</table>
<div id="detailMenu">
		
</div>
</div>
</section>
<%@ include file="../footer.jsp" %>

</body>
</html>