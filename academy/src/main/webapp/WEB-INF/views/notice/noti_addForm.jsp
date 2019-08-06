<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>

function showSubList(){
	var n_head=document.form1.n_head.value;
	if(n_head=='전체공지'){
		document.getElementById('c_code').disabled=true;
	}else{
		if(${empty subList}){
			alert('개설된 강좌가 없습니다.');
			return false;
		}
		document.getElementById('c_code').disabled=false;
	}
}   
function cancle(){
	window.self.close();
}
   


</script>

</head>
<body>


<form name="form1" method="POST" action="noti_addForm_ok.do">
    <table style="width:600px; height:300px;">
    	<tr>
    		<th colspan="2">공지사항 작성</th>
    	</tr>
    	<tr>
    		<th>종류</th>
    		<td>
	    		<select name="n_head" id="n_head" onchange="showSubList()">
	    			<option value="전체공지">전체공지</option>
	    			<option value="강좌별공지">강좌별공지</option>
	    		</select>
	    		<select name="c_code" id="c_code" disabled>
	    			<c:if test="${empty subList }">
	 						<option>개설된 강좌가 없습니다.</option>
	 				</c:if>	
	    			<c:forEach var="subList" items="${subList }">
	    				<option value="${subList.c_code }">${subList.c_name }</option>
	    			</c:forEach>	
	    		</select>
    		</td>
    	</tr>
    	<tr>
    		<th>제목</th>
    		<td> <input type="text" name="n_subject" size="60" placeholder="공지 제목을 입력해주세요" maxlength="60" required></td>
    	</tr>
    	<tr>
    		<th> 내용</th>
    		<td> 
    			<textarea name="n_content" rows="15" cols="60" placeholder="공지 내용을 입력해주세요" maxlength="1200" style="resize:none" required></textarea>   			
    		</td>
    	</tr>
    	<tr>
    		
    		<td colspan="2" align="center">
    			<button type="submit" id="btnSave">확인</button>
      			<button type="button" onclick="cancle()">취소</button>
    		</td>
    	</tr>
    </table>
    
    
    
   <%--  <div>
    
    <td>공지</td>
    	<td>
    		<select name="n_head" id="n_head" onchange="showSubList()">
    			<option value="전체공지">전체공지</option>
    			<option value="강좌별공지">강좌별공지</option>
    		</select>
    		<select name="c_code" id="c_code" disabled>
    			<c:if test="${empty subList }">
 						<option>개설된 강좌가 없습니다.</option>
 				</c:if>	
    			<c:forEach var="subList" items="${subList }">
    				<option value="${subList.c_code }">${subList.c_name }</option>
    			</c:forEach>	
    		</select>
    	</td>
    	
    </div>

    
    <div>
    	  제목 
       <input type="text" name="n_subject" id="n_subject" size="60" placeholder="제목을 입력해주세요" maxlength="60">
    </div>
    <div>
        내용
        <textarea name="n_content" id="n_content" rows="4" cols="60" placeholder="내용을 입력해주세요" maxlength="1200" resize="none"></textarea>
    </div>    
    <div style="width:650px; text-align: center;">
        <button type="submit" id="btnSave">확인</button>
        <button type="button" onclick="cancle()">취소</button>
    </div> --%>
</form>
</body>
</html>