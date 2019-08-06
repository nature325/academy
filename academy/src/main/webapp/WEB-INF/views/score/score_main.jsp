<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/httpRequest.js"></script>
<link rel="stylesheet" href="css/button.css"/>
<style type="text/css">

<!-- 여기 위는 공용으로 쓸꺼 -->
body{
margin:0;
}
header{
margin: 0 0 50px;
}
tr{
height:35px;
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
input[type=date]{
border: 2px solid #FFBB00;
padding: 2px;
width:140px;
font-size:15px;
vertical-align:-27%;
}
table{
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






body{
margin:0;
}
section{
width:1100px;
margin:0 auto;
}
article{
width:1100px;
margin:0 auto;
overflow:hidden;
}
.graf{
width:650px;
float:left;

}
.scoreTable{
float:right;
width:570px;
}
</style>
<style>

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
<script>
function show(d, s){
	if(d3.select('.chart')!=null){
		d3.selectAll('.chart').remove();
		d3.select('.graf').append('svg').attr("class","chart");
	}
	var level = '${sessionScope.level}';
	var param = 's_date='+d+'&st_idx='+s+'&st_level='+level;
	sendRequest('sc_selectOne.do',param,'GET',showResult);
}

function showResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var temp=XHR.responseText; // json 으로 넘겨야함
			var datas=eval('('+temp+')');
			// 여기 아래부터 그래프 그리는 스크립트
			console.log(datas.scList[0].ST_NAME);
			var s_kor=parseInt(datas.dto.s_kor); var s_eng=parseInt(datas.dto.s_eng); var s_mat=parseInt(datas.dto.s_mat); var s_soc=parseInt(datas.dto.s_soc); var s_sci=parseInt(datas.dto.s_sci);
			var s_kor1=parseInt(datas.dto2.s_kor); var s_eng1=parseInt(datas.dto2.s_eng); var s_mat1=parseInt(datas.dto2.s_mat); var s_soc1=parseInt(datas.dto2.s_soc); var s_sci1=parseInt(datas.dto2.s_sci); 
			var data = {
					  labels: [
					    'Korean', 'English', 'math',
					    'Society', 'Science'
					  ],
					  series: [
					    {
					      label: datas.dto.st_name,
					      values: [s_kor, s_eng, s_mat, s_soc, s_sci]
					    },
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
					var avg = (s_kor+s_eng+s_mat+s_soc+s_sci)/5;
					var a_avg = (s_kor1 + s_eng1 + s_mat1 + s_soc1 + s_sci1)/5;
					document.getElementById('name').innerHTML=datas.dto.st_name;
					document.getElementById('avg').innerHTML=avg;
					document.getElementById('date').innerHTML=datas.dto.s_date;
					document.getElementById('kor').innerHTML=s_kor;
					document.getElementById('eng').innerHTML=s_eng;
					document.getElementById('mat').innerHTML=s_mat;
					document.getElementById('soc').innerHTML=s_soc;
					document.getElementById('sci').innerHTML=s_sci;
					document.getElementById('a_avg').innerHTML=a_avg;
					document.getElementById('a_kor').innerHTML=s_kor1;
					document.getElementById('a_eng').innerHTML=s_eng1;
					document.getElementById('a_mat').innerHTML=s_mat1;
					document.getElementById('a_soc').innerHTML=s_soc1;
					document.getElementById('a_sci').innerHTML=s_sci1;			
		}
	}
}

</script>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<section>
		<article class="scoreHead" >
		<div style="float:left">
			<div>
				
			</div>
			<div >
			
					<table style="width:500px;">
					
						<tr>
							
							<th colspan="3">
								<form name="fm" action="sc_select.do">
								<input type="date" name="s_date" required="required"> 
								<input type="date" id="now_date" name="s_date1">
						 		<input type="hidden" name="st_idx" value="${sessionScope.id}">
						 		<a href="javascript:fm.submit()" class="btn-gradient blue mini">검색</a>
						 		</form>								 						
							</th>
													
						</tr>
						
						<tr>
							<th>시험일자</th>
							<th>시험명</th>
							<th>과목수</th>
						</tr>
						<c:if test="${empty lists }">
							<tr>
								<td colspan="3">조회 된 데이터가 없습니다.</td>
							</tr>
						</c:if>
						<c:forEach var="list" items="${lists }" varStatus="idx">

							<tr class="list" onclick="show('${list.s_date}',${list.st_idx })">
								<td>${list.s_date }</td>
								<td>${list.s_cate }</td>
								<td id="num${idx.count}"></td>
								<script>
					var st_num=0;
					if(${list.s_kor}!=null || ${list.s_kor}!='') st_num+=1;
					if(${list.s_eng}!=null || ${list.s_eng}!='') st_num+=1;
					if(${list.s_mat}!=null || ${list.s_mat}!='') st_num+=1;
					if(${list.s_soc}!=null || ${list.s_soc}!='') st_num+=1;
					if(${list.s_sci}!=null || ${list.s_sci}!='') st_num+=1;
					document.getElementById('num${idx.count}').innerHTML=st_num;
					</script>
							</tr>
						</c:forEach>
					</table>
				
				</div>
			</div>
			
			
			
			
			<table class="scoreTable" >
				<tr>
					<th >이름</th>
					<td id="name" colspan="2">&nbsp;</td>
					<th>개인평균</th>
					<td id="avg" colspan="2">&nbsp;</td>
				</tr>
				<tr>
					<th>시험일</th>
					<th>국어</th>
					<th>영어</th>
					<th>수학</th>
					<th>사회</th>
					<th>과학</th>
				</tr>
				<tr>
					<td id="date">&nbsp;</td>
					<td id="kor">&nbsp;</td>
					<td id="eng">&nbsp;</td>
					<td id="mat">&nbsp;</td>
					<td id="soc">&nbsp;</td>
					<td id="sci">&nbsp;</td>
				</tr>
				<tr>
					<th>전체학생평균</th>
					<th>국어</th>
					<th>영어</th>
					<th>수학</th>
					<th>사회</th>
					<th>과학</th>
				</tr>
				<tr>
					<td id="a_avg">&nbsp;</td>
					<td id="a_kor">&nbsp;</td>
					<td id="a_eng">&nbsp;</td>
					<td id="a_mat">&nbsp;</td>
					<td id="a_soc">&nbsp;</td>
					<td id="a_sci">&nbsp;</td>
				</tr>
			</table>
		</article>
		<article>
			<div class="graf">
			<svg class="chart" style="float:right;"></svg>
			</div>		
		</article>	
		<article class="scoreFoot">
			
		</article>
	</section>
	<%@ include file="../footer.jsp"%>
</body>
<script>
var date = new Date();
var y = date.getFullYear();
var m = ""+(date.getMonth()+1);
var d = ""+date.getDate();
if(m.length<2) m ="0"+m;
if(d.length<2) d ="0"+d;
var v = y+'-'+m+'-'+d;
document.getElementById('now_date').value=v;

</script>
</html>