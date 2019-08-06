<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body{
background-color:#044071;
font-size:20px;
font-weight:bold;
color:#000063;
}

article{
background-color:white;
padding:30px 0px;
width:1200px;
margin:70px auto;
height:600px;
}
img{
display:block;
margin:55px auto;
}
.input_text{
border: 3px solid skyblue;
padding: 13px;
margin:9px 0;
width:375px; 
}
#loginTab{
margin:50px auto;
}
#selectBox{
border: 0px solid skyblue;
padding: 6px;
width:80px;
color:#8D8D8D;
}
#msg{
text-align:center;
color:red;
font-size:17px;
}
input::placeholder{
color:#8D8D8D;
}


</style>
<link rel="stylesheet" href="css/button.css"/>
<script src="js/httpRequest.js"></script>
<script>
function login(){
	var id=document.fm.id.value;
	var pwd=document.fm.pwd.value;
	var position=document.fm.position.value;
	var param='id='+id+'&pwd='+pwd+'&position='+position;	
	sendRequest('login.do',param,'GET',loginResult)	
}
function loginResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var temp=XHR.responseText;
			var temp2=eval('('+temp+')');			
			if(temp2.result=='2'){
				document.getElementById('msg').innerText='등록되지 않은 계정이거나 비밀번호가 맞지 않습니다.';
			}else if(temp2.result=='1'){				
				location.href='notice.do';
			}
		}
	}
}

</script>
</head>
<body>
<section>
<article>
	<img src="img/daemoon.jpg">	
	<form name="fm" action="login.do">
		<table id="loginTab">
		<tr>		
		<td><input type="text" name="id" class="input_text" placeholder="학번 혹은 ID"></td>
		</tr>
		<tr>		
		<td><input type="password" name="pwd" class="input_text" placeholder="비밀번호"></td>
		<tr/>
		<tr>
		<td>
		<select name="position" id="selectBox">
		<option value="1">학생</option>		
		<option value="2">관리자</option>
		</select>
		</td>
		<tr>
		<td style="text-align:center;">
		<br>
		<a class="btn-gradient blue block" onclick="login()">로그인</a>		
		</td>
		<tr>
		<tr>
		<td colspan="2">
		<div id="msg">
		</div>
		</td>
		</tr>		
		</table>		
		
		
	</form>	
</article>
</section>
</body>
</html>