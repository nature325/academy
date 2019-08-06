<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
margin-bottom:50px;
}
section{
width:1200px;
margin:0 auto;
}
tr{
height:30px;
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
table td{
text-align:center;
}

.list:hover td{
background:#A6A6A6;
}
.list{
cursor:pointer;
}
.footer{
clear:both;
margin:0 0 50px;
text-align:center;
}
/*
.chart rect {
  fill: steelblue;
}
*/
.chart .legend {
	fill: black;
	font: 14px sans-serif;
	text-anchor: start;
	font-size: 12px;
}

.chart text {
	fill: white;
	font: 10px sans-serif;
	text-anchor: end;
}

.chart .label {
	fill: black;
	font: 14px sans-serif;
	text-anchor: end;
}

.bar:hover {
	fill: brown;
}

.axis path, .axis line {
	fill: none;
	stroke: #000;
	shape-rendering: crispEdges;
}

</style>
<script src="http://d3js.org/d3.v3.min.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script>
if(${sessionScope.position == 'student'}){
	window.alert('관리자만 접근가능한 페이지 입니다. 다시 로그인 해주세요.')
	history.back();
}
function selectSt(st_idx,st_name){
	var btn = document.getElementById('addBtn');
	btn.removeAttribute('disabled');
	btn.setAttribute('onclick','sc_add('+st_idx+')');
	document.getElementById('st_name').innerHTML=st_name;
	document.getElementById('st_names').value=st_name;
	var param = 'st_idx='+st_idx;
	sendRequest('sc_stScoreList.do',param,'GET',showResult);
}
function showResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			document.getElementById('scoreList').innerHTML=XHR.responseText;
		}
	}
}
function sc_add(st_idx){
	var fmDiv = document.getElementById('addForm');
	if(fmDiv.style.display=='none'){
		fmDiv.style.display='block';
		document.getElementById('idx').value=st_idx;
	} else if(fmDiv.style.display=='block'){
		fmDiv.style.display='none';
	}
}
function chartShow(){
	if(d3.select('.chart')!=null){
		d3.selectAll('.chart').remove();
		d3.select('.graf').append('svg').attr("class","chart");
	}
	var s_date = document.chartFm.s_date.value;
	var st_level = document.chartFm.st_level.value;
	var param = 's_date='+s_date+'&st_level='+st_level;
	sendRequest('sc_chart.do',param,'GET',chartShowResult);
}
function chartShowResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var temp=XHR.responseText; // json 으로 넘겨야함
			var datas=eval('('+temp+')');
			if(datas.dto2==null){
				alert('해당 날에는 시험을 본 학생이없습니다.');
				}
			var s_kor1=parseInt(datas.dto2.s_kor); var s_eng1=parseInt(datas.dto2.s_eng); var s_mat1=parseInt(datas.dto2.s_mat); var s_soc1=parseInt(datas.dto2.s_soc); var s_sci1=parseInt(datas.dto2.s_sci); 
			var data = {
					  labels: [
					    'Korean', 'English', 'math',
					    'Society', 'Science'
					  ],
					  series: [
					    {
					      label: '전체평균',
					      values: [s_kor1, s_eng1, s_mat1, s_soc1, s_sci1]
					    }
					    ]
					};

					var chartWidth       = 850,
					    barHeight        = 30,
					    groupHeight      = barHeight * data.series.length,
					    gapBetweenGroups = 20,
					    spaceForLabels   = 100,
					    spaceForLegend   = 100;

					// Zip the series data together (first values, second values, etc.)
					var zippedData = [];
					for (var i=0; i<data.labels.length; i++) {
					  for (var j=0; j<data.series.length; j++) {
					    zippedData.push(data.series[j].values[i]);
					  }
					}

					// Color scale
					var color = d3.scale.category10();
					var chartHeight = barHeight * zippedData.length + gapBetweenGroups * data.labels.length;

					var x = d3.scale.linear()
					    .domain([0, d3.max(zippedData)])
					    .range([0, chartWidth]);

					var y = d3.scale.linear()
					    .range([chartHeight + gapBetweenGroups, 0]);

					var yAxis = d3.svg.axis()
					    .scale(y)
					    .tickFormat('')
					    .tickSize(0)
					    .orient("left");

					// Specify the chart area and dimensions
					var chart = d3.select(".chart")
					    .attr("width", spaceForLabels + chartWidth + spaceForLegend)
					    .attr("height", chartHeight);

					// Create bars
					var bar = chart.selectAll("g")
					    .data(zippedData)
					    .enter().append("g")
					    .attr("transform", function(d, i) {
					      return "translate(" + spaceForLabels + "," + (i * barHeight + gapBetweenGroups * (0.5 + Math.floor(i/data.series.length))) + ")";
					    });

					// Create rectangles of the correct width
					bar.append("rect")
					    .attr("fill", function(d,i) { return color(i % data.series.length); })
					    .attr("class", "bar")
					    .attr("width", x)
					    .attr("height", barHeight - 1);

					// Add text label in bar
					bar.append("text")
					    .attr("x", function(d) { return x(d) - 3; })
					    .attr("y", barHeight / 2)
					    .attr("fill", "red")
					    .attr("dy", ".35em")
					    .text(function(d) { return d; });

					// Draw labels
					bar.append("text")
					    .attr("class", "label")
					    .attr("x", function(d) { return - 10; })
					    .attr("y", groupHeight / 2)
					    .attr("dy", ".35em")
					    .text(function(d,i) {
					      if (i % data.series.length === 0)
					        return data.labels[Math.floor(i/data.series.length)];
					      else
					        return ""});

					chart.append("g")
					      .attr("class", "y axis")
					      .attr("transform", "translate(" + spaceForLabels + ", " + -gapBetweenGroups/2 + ")")
					      .call(yAxis);

					// Draw legend
					var legendRectSize = 18,
					    legendSpacing  = 4;

					var legend = chart.selectAll('.legend')
					    .data(data.series)
					    .enter()
					    .append('g')
					    .attr('transform', function (d, i) {
					        var height = legendRectSize + legendSpacing;
					        var offset = -gapBetweenGroups/2;
					        var horz = spaceForLabels + chartWidth + 40 - legendRectSize;
					        var vert = i * height - offset;
					        return 'translate(' + horz + ',' + vert + ')';
					    });

					legend.append('rect')
					    .attr('width', legendRectSize)
					    .attr('height', legendRectSize)
					    .style('fill', function (d, i) { return color(i); })
					    .style('stroke', function (d, i) { return color(i); });

					legend.append('text')
					    .attr('class', 'legend')
					    .attr('x', legendRectSize + legendSpacing)
					    .attr('y', legendRectSize - legendSpacing)
					    .text(function (d) { return d.label; });
		}
	}
}
function del(st_idx,s_date){
	if(confirm('삭제할꺼야?')){
		var param = 'st_idx='+st_idx+'&s_date='+s_date;
		sendRequest('sc_del.do',param,'GET',delResult);
		var st_name = document.getElementById('st_names').value;
		selectSt(st_idx,st_name);
	}
}
function delResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var temp = XHR.responseText;
			var datas=eval('('+temp+')');
			alert(datas.msg);
		}
	}
}
</script>
</head>
<body>
<%@ include file="../header.jsp"%>
<section>

	<table style="width:1200px;">
		<tr>
			<form name="fm" action="sc_stSelect.do">
			<th colspan="6">
			<input type="text" name="st_name" maxlength="60" placeholder="학생 이름을 입력해주세요">
			<input type="submit" value="검색" class="btn-gradient blue mini">
			</th>
			</form>
		</tr>
	
		<tr>
			<th>상태</th>
			<th>학생명</th>
			<th>학교</th>
			<th>학년</th>
			<th>전화번호</th>
			<th>비고</th>
		</tr>
		<c:if test="${empty lists }">
			<th colspan="6">재원중인 학생이 없습니다</th>
		</c:if>
		<c:forEach var="list" items="${lists }">
			<tr onclick="selectSt(${list.st_idx},'${list.st_name }')" class="list">
				<td>${list.st_status }</td>
				<td>${list.st_name }</td>
				<td>${list.st_school }</td>
				<td>${list.st_level }</td>
				<td>${list.st_hometel }</td>
				<td><div style="width:200px;height:40px;overflow:hidden;">${list.st_memo }</div></td>
			</tr>		
		</c:forEach>
		<tr>
			<th colspan="6"><input type="button" id="addBtn" value="점수추가" disabled="disabled" class="btn-gradient blue mini"></th>
		</tr>
	</table>

	<div id="scoreList">
	
	</div>
	<input type="hidden" id="st_names">
	<div id="addForm" style="display: none">
	<form name="addFm" action="sc_add.do">
	<table>
		<tr>
			<th>학생</th>
			<th>시험명</th>
			<th>날짜</th>
			<th>국어</th>
			<th>영어</th>
			<th>수학</th>
			<th>사회</th>
			<th>과학</th>
		</tr>
		<tr>
			<td id="st_name"></td>
			<td>
				<select name="s_cate">
					<option value="모의고사">모의고사</option>
				</select>
			</td>
			<td><input type="hidden" id="idx" name="st_idx"><input type="date" name="s_date" required="required"></td>
			<td><input type="number" name="s_kor" max="100"></td>
			<td><input type="number" name="s_eng" max="100"></td>
			<td><input type="number" name="s_mat" max="100"></td>
			<td><input type="number" name="s_soc" max="100"></td>
			<td><input type="number" name="s_sci" max="100"></td>
		</tr>
		<tr>
			<th colspan="8"><input type="submit" value="입력"></th>
		</tr>
	</table>
	</form>
	</div>


<form name="chartFm">
	<input type="date" name="s_date" required="required">
	<select name="st_level">
		<option value="고1">고1</option>
		<option value="고2">고2</option>
		<option value="고3">고3</option>
	</select>
	<input type="button" value="검색" onclick="chartShow()">
</form>
	<div class="graf">
		<svg class="chart"></svg>
	</div>

</section>
<%@ include file="../footer.jsp"%>
</body>
</html>