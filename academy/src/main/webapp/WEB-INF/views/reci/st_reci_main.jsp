<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#reci-tab-month{
		font-size:25px;
		text-align: center;
		color: #044071;
	}
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
width:1100px;
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
table{
text-align:center;
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
</head>
<body>
<%@ include file="../header.jsp" %>
<section>
<table style="width:1100px; margin-bottom: 50px;">
	<thead>
		<tr>
			<td colspan="6" id="reci-tab-month">
				<span onclick="showFm(${year}, ${month-1})">◀</span>
				<span id="year">${year}</span>년 <span id="month">${month}</span>월 납부내역
				<span><span onclick="showLm(${year}, ${month+1})">▶</span></span>
			</td>	
		</tr>
	
		<tr>
			<th>강좌명</th>
			<th>수강료</th>
			<th>강좌 시작일</th>
			<th>강좌 종료일</th>
			<th>총납부액</th>
			<th></th>
		</tr>
	</thead>
	<tbody id="reci-all-list">
	</tbody>
</table>
<div id="reci-detail-list-div" style="display:none;">
<table  style="width:1100px;">
	<thead>
		<tr>
			<th>강좌명</th>
			<th>수강료</th>
			<th>강좌 시작일</th>
			<th>강좌 종료일</th>
			<th>납부액</th>
			<th>납부일자</th>
		</tr>	
	</thead>
	<tfoot>
		<tr>
			<td colspan="6"><input type="button" value="납부내역서 확인" id="pdf-btn" onclick="showpdfbtn()" style="display:none;"></td>
		</tr>
	</tfoot>
	<tbody id="reci-detail-list">
	</tbody>
</table>
</div>

</section>
<%@ include file="../footer.jsp" %>

<script src="js/httpRequest.js"></script>
<script>

//이전달 페이징
function showFm(year, month){
	var year = document.getElementById('year');
	var month = document.getElementById('month');
	var y = year.innerText;
	var m = month.innerText;
	
	if(m-1==0){
		month.innerText = 12;
		year.innerText = y-1;
	}
	else{
		month.innerText = (m-1);	
	}
	
	var param = 'year='+year.innerText+'&month='+month.innerText;
	
	sendRequest('getReciAllList.do',param,'GET',showAllList);
}

//다음달 페이징
function showLm(year, month){
	var year = document.getElementById('year');
	var month = document.getElementById('month');
	var y = year.innerText;
	var m = month.innerText;
	
	if(parseInt(m)+1 == 13){
		month.innerText = 1;
		year.innerText = parseInt(y)+1;
	}
	else{
		month.innerText = parseInt(m)+1;
	}
	
	var param = 'year='+year.innerText+'&month='+month.innerText;
	
	sendRequest('getReciAllList.do',param,'GET',showAllList);
}

//onload시 현재 날짜 수납내역
window.onload=function(){
	var year = document.getElementById('year');
	var month = document.getElementById('month');
	var y = year.innerText;
	var m = month.innerText;
	
	var param = 'year='+y+'&month='+m;
	
	sendRequest('getReciAllList.do',param,'GET',showAllList);
}


function showAllList(){
	if(XHR.readyState==4 && XHR.status==200){
		var data = XHR.responseText;
		var data2 = eval("("+data+")");
		var allList = data2.allList;
		var alllisttag = document.getElementById('reci-all-list');
		var detaillisttag = document.getElementById('reci-detail-list-div');
		
		var pdfbtn = document.getElementById('pdf-btn');		
		
		var year = document.getElementById('year');
		var month = document.getElementById('month');
		var y = year.innerText;
		var m = month.innerText;
		
		var param = 'year='+y+'&month='+m;
		
		var str='';
		
		if(allList.length==0){
			alllisttag.innerHTML = '<tr><td colspan="6">납부한 기록이 없습니다.</td></tr>'
			pdfbtn.style.display='none';
			detaillisttag.style.display='none'
		}
		else{
			for(var i=0; i<allList.length; i++){
				var list = allList[i];
				str += '<tr><td>'+list.c_name+'</td><td>'+list.c_price+'</td><td>'+list.c_sdate+'</td><td>'+list.c_edate+'</td><td>'+list.p_pay+'</td><td><div style="cursor:pointer;" onclick="getReciDetailList('+list.c_code+')">[세부내역]</div></td></tr>'
			}
			alllisttag.innerHTML = str;
			detaillisttag.style.display='none'
			pdfbtn.style.display='';
		}
		
	}
}


//pdf 파일 저장하기 위해 보여주는 페이지
function showpdfbtn(){
	var year = document.getElementById('year');
	var month = document.getElementById('month');
	var y = year.innerText;
	var m = month.innerText;
	
	var param = 'year='+y+'&month='+m;
	
	window.open('st_reci_pdf.do?'+param,'pdf','width=750px, height=650px');
}


//상세 납부내역
function getReciDetailList(c_code){
	var year = document.getElementById('year');
	var month = document.getElementById('month');
	var y = year.innerText;
	var m = month.innerText;
	
	var param = 'year='+y+'&month='+m+'&c_code='+c_code;
	
	sendRequest('getReciDetailList.do',param,'GET',showDetailList);
}

//callback
function showDetailList(){
	if(XHR.readyState==4 && XHR.status==200){
		var data = XHR.responseText;
		var data2 = eval("("+data+")");
		var detailList = data2.detailList;
		
		var detailListdiv = document.getElementById('reci-detail-list-div');
		var detaillisttag = document.getElementById('reci-detail-list');
		
		var str='';
		
		
		
		for(var i=0; i<detailList.length; i++){
			var list = detailList[i];
			str += '<tr><td>'+list.c_name+'</td><td>'+list.c_price+'</td><td>'+list.c_sdate+'</td><td>'+list.c_edate+'</td><td>'+list.p_pay+'</td><td>'+list.p_paydate+'</td></tr>'
		}
		
		detaillisttag.innerHTML = str;
		
		if(detailListdiv.style.display=='none'){
			detailListdiv.style.display=''; //보여주기
		} else {
			detailListdiv.style.display='none'; //가리기
		}
	}
}
</script>
</body>
</html>












