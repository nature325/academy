<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/button.css"/>

<script src="js/httpRequest.js"></script>
<script src="js/getSubjectSize.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>

<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>

<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script> 


<link rel="stylesheet" href="css/button.css"/>
<style>
body {
	margin: 0;	
}
section{
width:1100px;
margin:0px auto;

}
#attTabHead{
color:black;;
font-size:25px;
}
#attTab{
margin:50px auto;
width:1100px;
text-align:center;
}

#attTab a{
text-decoration:none;
color:black;
}

#attSt{
float:left;
}

#attStTab{
margin:0 0 50px 0;
}
tr{
height:30px;
}


#attList{
float:right;
overflow:auto;
width:560px;
height:250px;
margin:0 0 150px 0;
}
#attListTab{
float:right;
}
th{
background:#044071;
color:white;
}
td{
background:#F6F6F6;
color:black;
}
table{
text-align:center;
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

</style>
<script>
if(${sessionScope.position == 'student'}){
	window.alert('관리자만 접근가능한 페이지 입니다. 다시 로그인 해주세요.')
	history.back();
}
$(function()
{
$("#sdate").datepicker({showOn: 'button', changeMonth: true, changeYear: true, showMonthAfterYear:false});
$('#sdate').datepicker('option', {dateFormat: 'yy-mm-dd(D)'});
});
function att_main(dateInfo){	
	location.href='att_main.do?dateInfo='+dateInfo;
}
function att_Yesterday(){
	var temp='${dateInfo}';
	var dat=new Date(temp.substring(0,10).replace(/-/gi,'/'));
	dat.setDate(dat.getDate()-1);
	var day=dat.getDay();
	switch(day){
	case 0:day='일';break;
	case 1:day='월';break;
	case 2:day='화';break;
	case 3:day='수';break;
	case 4:day='목';break;
	case 5:day='금';break;
	case 6:day='토';
	}
	var month=(dat.getMonth()+1);
	month=month>0?'0'+month:month;
	
	var dateInfo=dat.getFullYear()+'-'+month+'-'+dat.getDate()+'('+day+')';
	location.href='att_main.do?dateInfo='+dateInfo;
}
function att_Tomorrow(){
	var temp='${dateInfo}';
	var dat=new Date(temp.substring(0,10).replace(/-/gi,'/'));
	dat.setDate(dat.getDate()+1);
	var day=dat.getDay();
	switch(day){
	case 0:day='일';break;
	case 1:day='월';break;
	case 2:day='화';break;
	case 3:day='수';break;
	case 4:day='목';break;
	case 5:day='금';break;
	case 6:day='토';
	}
	var month=(dat.getMonth()+1);
	month=month>0?'0'+month:month;
	
	var dateInfo=dat.getFullYear()+'-'+month+'-'+dat.getDate()+'('+day+')';
	location.href='att_main.do?dateInfo='+dateInfo;
}



var selectedC_code='';
var selectedC_name='';
var selectedTc_name='';
var selectedSt_idxs='';
var selectedC_sdate='';
var selectedC_edate='';
var selectedC_day='';

var selectedSt_idx='';
var selectedSt_name='';
var selectedAtt_divide='';
var selectedAtt_bigo='';
var parameter='';

function selectSubject(c_code,c_name,tc_name,st_idxs,c_sdate,c_edate,c_day){
	selectedC_code=c_code;
	selectedC_name=c_name;
	selectedTc_name=tc_name;
	selectedSt_idxs=st_idxs;
	selectedC_sdate=c_sdate;
	selectedC_edate=c_edate;
	selectedC_day=c_day;
	
	
	att_showRelSt()
	
}


function att_showRelSt(){
	param='c_code='+selectedC_code+'&st_idxs='+selectedSt_idxs+'&dateInfo=${dateInfo}';		
	sendRequest('att_showRelSt.do',param,'GET',att_showRelStResult);
}
function att_showRelStResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){			
			var temp=XHR.responseText;
			var temp2=eval('('+temp+')');
			var datas=temp2.data;
			var result='';
			if (datas==''){
				result='<tr><td colspan="3">수강하는 학생이 없습니다.</td></tr>'
				document.getElementById('checkAllBtn').disabled=true;
			}else{
				for(i=0; i<datas.length;i++){				
					var data=datas[i];
					data.ATT_DIVIDE=data.ATT_DIVIDE==null?'':data.ATT_DIVIDE;
					data.ATT_BIGO=data.ATT_BIGO==null?'':data.ATT_BIGO;
					result+='<tr class="list" id="relStList'+i+'" onclick="selectStudent(\''+data.ST_IDX+'\',\''+data.ST_NAME+'\',\''+data.ATT_DIVIDE+'\',\''+data.ATT_BIGO+'\',\''+i+'\',\''+datas.length+'\')"><td>'+data.ST_NAME+'</td><td>'+data.ATT_DIVIDE+'</td><td>'+data.ATT_BIGO+'</td></tr>';
				}
				document.getElementById('checkAllBtn').disabled=false;
			}
						
			document.getElementById('att_RelSt').innerHTML=result;			
			document.getElementById('att_RelStAtt').innerHTML=''
		}	
	}	
}

function selectStudent(st_idx,st_name,att_divide,att_bigo,index,length){
	for(i=0;i<length;i++){
		document.getElementById('relStList'+i).style="background:white";
	}
	document.getElementById('relStList'+index).style="background:#D5D5D5";
	selectedSt_idx=st_idx;
	selectedSt_name=st_name;
	selectedAtt_divide=att_divide;	
	selectedAtt_bigo=att_bigo;
	att_showRelStAtt();
	document.getElementById('updateBtn').disabled=false;
}



function att_updateForm(date){
	var dateInfo=date;
	parameter='c_code='+selectedC_code+'&c_name='+selectedC_name+'&tc_name='+selectedTc_name
	+'&st_idx='+selectedSt_idx+'&st_name='+selectedSt_name+'&att_divide='+selectedAtt_divide
	+'&att_bigo='+selectedAtt_bigo+'&dateInfo='+dateInfo+'&st_idxs='+selectedSt_idxs;	
	window.open('att_updateForm.do?'+parameter,'att_updateForm','width=440,height=480');
}

function att_showRelStAtt(){
	param='c_sdate='+selectedC_sdate+'&c_edate='+selectedC_edate+'&st_idx='+selectedSt_idx+'&c_code='+selectedC_code+'&c_day='+selectedC_day;
	sendRequest('att_showRelStAtt.do',param,'GET',att_showRelStAttResult);	
}

function att_showRelStAttResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			
			var temp=XHR.responseText;
			var temp2=eval('('+temp+')');
			var datas=temp2.data
			var result='';
			for(i=0; i<datas.length; i++){
				var data=datas[i];
				data.ATT_DIVIDE=data.ATT_DIVIDE==null?'':data.ATT_DIVIDE;
				result+='<tr class="list" onclick="att_updateForm(\''+data.NAL+'('+data.DAY+')'+'\')"><td>'+data.NAL+'</td><td>'+data.DAY+'</td><td>'+data.ATT_DIVIDE+'</td></tr>'
			}
			document.getElementById('att_RelStAtt').innerHTML=result;		
		}
	}
}

function att_checkAll(){
	var confirm=window.confirm('모든 학생을 출석처리 하시겠습니까?');
	if(confirm==false){
		return;	
	}
	
	
	param='st_idxs='+selectedSt_idxs+'&c_code='+selectedC_code+'&att_date=${dateInfo}';	
	sendRequest('att_checkAll.do',param,'GET',att_checkAllResult);	
}

function att_checkAllResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){			
			att_showRelSt();
		}
	}	
}






</script>
</head>
<body>
<%@ include file="../header.jsp" %>
<section>
<div>
<table id="attTab">
<tr>
	<td colspan="6" id="attTabHead">
	<a href="javascript:att_Yesterday()">◀</a>
	${dateInfo}	
	<input type="hidden" name="sdate" id="sdate" onchange="att_main(this.value)">
	<a href="javascript:att_Tomorrow()">▶</a>	
	</td>
</tr>
<tr>
	<th>강좌명</th>
	<th>요일</th>
	<th>강사</th>
	<th>강의시작</th>
	<th>강의종료</th>
	<th>수업일수</th>	
</tr>
<c:if test="${empty dto}">
<tr>
	<td colspan="6">금일 진행되는 강좌가 없습니다.</td>
</tr>
</c:if>
<c:forEach var="temp" items="${dto }">
<tr class="list" onclick="selectSubject('${temp.c_code}','${temp.c_name}','${temp.tc_name}','${temp.st_idxs}','${temp.c_sdate }','${temp.c_edate }','${temp.c_day }')">
	<td>${temp.c_name }</td>
	<td>${temp.c_day }</td>
	<td>${temp.tc_name }</td>
	<td>${temp.c_sdate }</td>
	<td>${temp.c_edate }</td>
	<td><script>document.write(getSubjectSize('${temp.c_sdate}','${temp.c_edate}','${temp.c_day}'))</script>일</td>

</tr>
</c:forEach>
</table>
</div>
<div id="attSt">	
	<table id="attStTab" width="540">
		<tr>
			<th>이름</th>
			<th>출결</th>
			<th>비고</th>
		</tr>
	<tbody id="att_RelSt">
	</tbody>		
		<tr>
			<td colspan="3" style="background:white;">
			
				<input id="checkAllBtn" type="button" value="전체출석" onclick="att_checkAll()" disabled  class="btn-gradient blue mini">
				<input id="updateBtn" type="button" value="출결편집" onclick="att_updateForm('${dateInfo}')" disabled  class="btn-gradient blue mini">
			</td>
		</tr>
	</table>
</div>
<div id="attList">
<table id="attListTab" width="540">
<thead>
	<tr>
		<th>날짜</th>
		<th>요일</th>
		<th>출결</th>
	</tr>
</thead>
<tbody id="att_RelStAtt">
</tbody>
</table>

</div>

</section>

<%@ include file="../footer.jsp" %>
</body>

</html>