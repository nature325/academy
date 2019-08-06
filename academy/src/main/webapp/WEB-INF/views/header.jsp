<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<style>
header #daemoon{
display: block; 
margin: 20px auto;

}

header #headerDiv{
background-color:#044071;
width:2100px;
height:80px;
text-align:center;
margin:0 0 auto;
display:table-cell; vertical-align:middle;
}

#headerDiv a{

margin:40px;
text-decoration:none;
color:white;
font-size:22px;
}

#headerDiv img{
    vertical-align: bottom;
    width:30px;height:30px;
}

</style>
</head>
<header>
<div>${sessionScope.name }님 로그인중 | <a href="logout.do">로그아웃</a></div>
<img id="daemoon" src="img/daemoon.jpg">
	<div id="headerDiv">
		<c:if test="${sessionScope.position=='Manager' }">	
			<a href="notice.do"><img src="img/Announcement.png">&nbsp;공지</a>
			<a href="st.do"><img src="img/wonseng.png">&nbsp;원생</a>
			<a href="att_main.do"><img src="img/Clipboard.png">&nbsp;출결</a>
			<a href="reci.do"><img src="img/Visa.png">&nbsp;수납</a>
			<a href="sub.do"><img src="img/Scroll.png">&nbsp;강좌</a>
			<a href="teach.do"><img src="img/gangsa.png">&nbsp;강사</a>
			<a href="score.do"><img src="img/Sungjuck.png">&nbsp;성적</a>	
		</c:if>
		<c:if test="${sessionScope.position=='student' }">	
			<a href="notice.do"><img src="img/Announcement.png">&nbsp;공지</a>			
			<a href="att_st_main.do"><img src="img/Clipboard.png">&nbsp;출석</a>
			<a href="score.do"><img src="img/Sungjuck.png">&nbsp;성적</a>
			<a href="qna.do"><img src="img/Scroll.png">&nbsp;QnA</a>	
			<a href="st_recieve_List.do"><img src="img/Visa.png">&nbsp;납부</a>			
		</c:if>
	</div>	
</header>