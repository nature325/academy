<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수납</title>
<link rel="stylesheet" href="css/button.css"/>
<style>
header{
margin:0 0 50px;
}

body{
margin:0;
}
section{
width:1100px;
margin:0 auto;
clear:both;
}
#reci-tab-month{
font-size:25px;
text-align: center;
color: #044071;
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
height:30px;
}
.btn{
cursor:pointer;
}

.footer{
clear:both;
text-align:center;
}

.list:hover td{
background:#A6A6A6;
}
.list{
cursor:pointer;
}
table{
text-align:center;
margin-bottom:50px;
}
</style>
<script>
if(${sessionScope.position == 'student'}){
	window.alert('관리자만 접근가능한 페이지 입니다. 다시 로그인 해주세요.')
	history.back();
}
</script>
</head>
<body>
<%@ include file="../header.jsp" %>
<section>
<!-- 1화면: 강의목록 -->
<div>
<table width="1100px">
	<thead>
		<tr>
			<td colspan="5" id="reci-tab-month">
				<span class="btn" onclick="showFm(${year}, ${month-1})">◀</span>
				<span id="year">${year}</span>년 <span id="month">${month}</span>월
				<span><span class="btn" onclick="showLm(${year}, ${month+1})">▶</span></span>
			</td>
		</tr>
		<tr>
			<th>강좌명</th>
			<th>수강료</th>
			<th>강좌시작일</th>
			<th>강좌종료일</th>
			<th>수강</th>
		</tr>
	</thead>
	<tbody id="subLists">
	</tbody>
</table>
</div>


<!-- 2화면: 수납관리 / 강의 수강생 정보 출력 -->
<div id="reci-title-div" style="display:none;">수납관리</div>
<div id="subTc">
</div>
<div id="st-table-div" style="display:none;float:left;">
	<table width="500px">
		<thead>
			<tr>
				<th>수납</th>
				<th>이름</th>
				<th>납부액</th>
			</tr>
		</thead>
		<tbody id="students">
		</tbody>
	</table>
</div>

<!-- 3화면: 학생의 개인 납부내역 및 납부등록, 납부편집 버튼 -->
<div id="personal-reci-div" style="display:none;float:right">

	<table width="500px"  >	
		<thead>
			<tr>
				<th colspan="4">
				<div id="personal-reci-title"></div>
				</th>
			</tr>
			<tr>
				<th>납부일자</th>
				<th>결제수단</th>
				<th>납부금액</th>
				<th>비고</th>
			</tr>
		</thead>
		<tfoot>
			<tr>
				<td colspan="4">
					<div id="button-div" style="display:none;">
					<input type="button" value="납부등록" onclick="showReciAdd()" id="addbutton" class="btn-gradient blue mini">
					<input type="button" value="납부편집" onclick="showReciUpdate()" id="upbutton" class="btn-gradient blue mini">
					</div>				
				</td>
			</tr>
		</tfoot>
		<tbody id="reci-content">
		</tbody>
	</table>
	
	
</div>

</section>
<%@ include file="../footer.jsp" %>

<script src="js/httpRequest.js"></script>
<script>

	//납부등록 팝업창
	function showReciAdd(){
		
		var btn = document.getElementById('addbutton');
		
		var st_idx = btn.getAttribute('data-st-idx');
		var c_code = btn.getAttribute('data-c-code');
		
		var param='st_idx='+st_idx+'&c_code='+c_code;
		
		window.open('reci_addForm.do?'+param,'reciAdd','width=500px, height=500px');
	}
	
	//납부편집 팝업창
	function showReciUpdate(){
		
	var btn = document.getElementById('upbutton');
		
		var p_idx = btn.getAttribute('data-p-idx');
		var st_idx = btn.getAttribute('data-st-idx');
		var c_code = btn.getAttribute('data-c-code');
		
		var param='p_idx='+p_idx+'&st_idx='+st_idx+'&c_code='+c_code;
		
		window.open('reci_updateForm.do?'+param,'reciAdd','width=500px, height=500px');
	}
	
	//onload시 현재날짜 수강내역
	window.onload=function(){
		var year = document.getElementById('year');
		var month = document.getElementById('month');
		var y = year.innerText;
		var m = month.innerText;
		
		var param = 'year='+y+'&month='+m;
		
		sendRequest('getSubList.do',param,'GET',showSubList);
	}
	
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
		
		sendRequest('getSubList.do',param,'GET',showSubList);
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
		
		sendRequest('getSubList.do',param,'GET',showSubList);
	}
	
	//강좌 리스트 callback
	function showSubList(){
		if(XHR.readyState==4 && XHR.status==200){
			var data = XHR.responseText;
			var data2 = eval("("+data+")");
			var subLists = data2.subject;
			
			var sublisttag = document.getElementById('subLists');
			var subtctag = document.getElementById('subTc');
			var studentstag = document.getElementById('students');
			var sttablediv = document.getElementById('st-table-div');
			var recidiv = document.getElementById('personal-reci-div');
			var buttondiv = document.getElementById('button-div');
			var titlediv = document.getElementById('reci-title-div');
			sttablediv.style.display='';
			
			var str='';
			if(subLists.length==0){
				sublisttag.innerHTML = '<tr><td colspan="5">등록된 강좌가 없습니다.</td></tr>'
				subtctag.style.display='none';
				studentstag.style.display='none';
				sttablediv.style.display='none';
				recidiv.style.display='none';
				buttondiv.style.display='none';
				titlediv.style.display='none';
			}
			else{
				for(var i=0; i<subLists.length; i++){
					var subject = subLists[i];
					str += '<tr class="list" onmouseover="this.style.backgroundColor='+'\'#fff4e9'+'\'" onmouseout="this.style.backgroundColor='+'\'#ffffff'+'\'" onclick="showSubTc('+'\''+subject.st_idxs+'\','+subject.tc_idx+',\''+subject.c_name+'\')"><td>'+subject.c_name+'</td><td>'+subject.c_price+'원</td><td>'+subject.c_sdate+'</td><td>'+subject.c_edate+'</td><td>'+subject.c_nowp+'</td></tr>'
					subtctag.style.display='none';
					studentstag.style.display='none';
					sttablediv.style.display='none';
					recidiv.style.display='none';
					buttondiv.style.display='none';
					titlediv.style.display='none';
				}
				sublisttag.innerHTML = str;
			}
		}
	}
	
	//강좌명, 강사명, 수강료 요청함수
	function showSubTc(st_idxs,tc_idx,c_name){
		
		if(st_idxs=='null'){
			st_idxs='';
		}
		
		var param ='tc_idx='+tc_idx+'&c_name='+c_name;
		
		sendRequest('getSubTcList.do',param,'GET',showSubTcList);
	}
	
	//위 함수 callback함수 and 학생정보 요청함수
	function showSubTcList(){
		if(XHR.readyState==4 && XHR.status==200){
			var data = XHR.responseText;
			var data2 = eval("("+data+")");
			var subtc = data2.subtc;
			
			var subtctag = document.getElementById('subTc');
			var sttablediv = document.getElementById('st-table-div');
			var recidiv = document.getElementById('personal-reci-div');

			recidiv.style.display='none';
			subtctag.style.display='';
			sttablediv.style.display='';
			
			
			var param='';
			
			if(!(subtc.st_idxs==null)){
				param ='st_idxs='+subtc.st_idxs+'&c_code='+subtc.c_code;
			}
			
			sendRequest('getStudents.do',param,'GET',showStudents);
		}
	}
	
	// 학생정보 callback
	function showStudents(){
		if(XHR.readyState==4 && XHR.status==200){
			var data = XHR.responseText;
			var data2 = eval("("+data+")");
			var students = data2.students;
			
			var studentstag = document.getElementById('students');
			var sttablediv = document.getElementById('st-table-div');
			var buttondiv = document.getElementById('button-div');
			buttondiv.style.display='none';

			studentstag.style.display='';
			sttablediv.style.display='';
			
			var str='';
			if(students.length==0){
				
				studentstag.innerHTML = '<tr><td colspan="3">등록된 학생이 없습니다.</td></tr>'
			}
			else{
				for(var i=0; i<students.length; i++){
					var student = students[i];
					str += '<tr class="list" onmouseover="this.style.backgroundColor='+'\'#fff4e9'+'\'" onmouseout="this.style.backgroundColor='+'\'#ffffff'+'\'" onclick="showStPay('+student.p_st_idx+','+student.st_idx+','+student.c_code+')"><td>'+student.p_state+'</td><td>'+student.st_name+'</td><td>'+student.p_pay+'원</td></tr>'
				}
				studentstag.innerHTML = str;
			}
		}
	}
	
	// 학생 개인 납부내역 요청 함수
	function showStPay(p_st_idx,st_idx,c_code){
		
		//수강생이 있다는 가정하에 버튼에 속성 추가
		var btn = document.getElementById('addbutton');
		btn.setAttribute('data-st-idx', st_idx);
		btn.setAttribute('data-c-code', c_code);
		
		var param = 'st_idx='+st_idx+'&c_code='+c_code;
		
		sendRequest('getReciList.do',param,'GET',showReciList);
	}
	
	
	//callback
	function showReciList(){
		if(XHR.readyState==4 && XHR.status==200){
			var data = XHR.responseText;
			var data2 = eval("("+data+")");
			var recilist = data2.reciList;
		
			var recititletag = document.getElementById('personal-reci-title');
			recititletag.style.display='';
			
			var recicontenttag = document.getElementById('reci-content');
			var recidiv = document.getElementById('personal-reci-div');
			
			var buttondiv = document.getElementById('button-div');
			var upbutton = document.getElementById('upbutton');
			
			recidiv.style.display='';
			
			for(var i=0; i<recilist.length; i++){
				var pRecilist = recilist[i];
				recititletag.innerText=pRecilist.st_name+'원생 '+'${year}년 ${month}월 납부내역';
			}
			
			var str='';
			
			if(recilist.length==0){
				recicontenttag.innerHTML='<tr><td colspan="4">납부내역이 없습니다.</td></tr>'
				buttondiv.style.display='';
				upbutton.disabled=true;
			}
			else{
				for(var i=0; i<recilist.length; i++){
					var pReciList = recilist[i]
					
					buttondiv.style.display='';
					
					var p_paydate = pReciList.p_paydate
					
					if(pReciList.p_paydate==null||pReciList.p_paydate==''){
						p_paydate = '0000-00-00'
					}

					str+='<tr onclick="setParam('+pReciList.p_idx+','+pReciList.st_idx+','+pReciList.c_code+')"><td>'+p_paydate+'</td><td>'+pReciList.p_payment+'</td><td>'+pReciList.p_pay+'원</td><td>'+pReciList.p_bigo+'</td></tr>';
					upbutton.disabled=true;
				}
				recicontenttag.innerHTML=str;
			}
		}
	}
	
	
	//편집 onclick 함수
	function setParam(p_idx,st_idx,c_code){
		
		// 편집 버튼에 속성 추가
		var btn = document.getElementById('upbutton');
		btn.setAttribute('data-p-idx', p_idx);
		btn.setAttribute('data-st-idx', st_idx);
		btn.setAttribute('data-c-code', c_code);
		btn.removeAttribute('disabled');
	}
	

	
</script>
</body>
</html>