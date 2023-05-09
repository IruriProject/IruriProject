<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
</head>

<script type="text/javascript">

google.charts.load('current', {
	  packages:['corechart']
	}).then(function () {
	  $.ajax({
	    url: "/test",
	    data:{"p_num":"22"},
	    dataType: "JSON",
	    success: function(result){
	      drawChart(result);
	    }
	  });

	  function drawChart(result) {
	    var data = new google.visualization.DataTable();
	    data.addColumn('string', 'gender');
	    data.addColumn('number', 'count');

	    var dataArray = [];

	    $.each(result, function(i, obj) {
	      dataArray.push([obj.gender, parseInt(obj.count)]);
	    });

	    data.addRows(dataArray);

	    var piechart_options = {
	      width : 500,
	      height: 300,
	      colors: ['#4E9F3D', '#cce891']
	    };
	    var piechart = new google.visualization.PieChart(document.getElementById('ageChart'));
	    piechart.draw(data, piechart_options);
	  }
	});

</script>
<body>
<div>
<h3>지원자 성별 분포도</h3>
<div id="ageChart"></div>
</div>
</body>
</html>