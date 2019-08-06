<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<button onClick="changeData()">Change Data</button>
<script src="http://d3js.org/d3.v3.min.js"></script>
<script src="gradientPie.js"></script>
<script>

var salesData=[
	{label:"Basic", color:"#3366CC"},
	{label:"Plus", color:"#DC3912"},
	{label:"Lite", color:"#FF9900"},
	{label:"Elite", color:"#109618"},
	{label:"Delux", color:"#990099"}
];

var svg = d3.select("body").append("svg").attr("width", 700).attr("height", 400);

svg.append("g").attr("id","salespie");
svg.append("g").attr("id","quotespie");
	
gradPie.draw("salespie", randomData(), 200, 200, 160);
gradPie.draw("quotespie", randomData(), 500, 200, 100);

function changeData(){
	gradPie.transition("salespie", randomData(), 160);
	gradPie.transition("quotespie", randomData(), 100);
}

function randomData(){
	return salesData.map(function(d){ 
		return {label:d.label, value:1000*Math.random(), color:d.color};});
}
</script>
</body>
</html>