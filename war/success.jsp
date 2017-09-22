<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/support.js"></script>
<style>

.vertical_line {
	height: 3000px;
	width: 1px;
	background: #000;
}
</style>
<div id="name" style="margin-left: 1243px; margin-top: 14px;">
<script type="text/javascript">

<%String x = (String) (session.getAttribute("name"));%>
var name = "<%=x%>";

console.log(name);
document.getElementById("name").innerHTML = name;


</script>
</div>

</head>
<body onfocusout="hidetexbox()">

	<div class="col-md-6">
		<h2>TIME</h2>
		<div id="scrollBar" style="overflow-y: auto; height: 498px; margin-right: 217px;">
		<h4><div id="emptyMessage" style="display:block; text-align:center"></div></h4>
		<ul id="givenTime" class="list-group"
			style="width:355px;
    text-align: center; padding-left: 6px; font-size: 22px; border-left: 48;"
			onclick="startTimer(event)" ondrop="drop(event)" ondragover="allowDrop(event)">
		</ul>
		</div>

	</div>
 <div id="bottom" style="position: fixed; bottom: 0px;">
		<div id="addingTime" style="display: none;">
		 <p id ="timeExists" style ="display:none;text-align:center">Time Already Exists</p>
			<input type="text" step="2" id="giveTime" name="time"onKeyDown="timecheck()"
				style="width: 416px;margin-left: 4px;text-align: center;" autofocus>
				
		</div>
		 <p id ="timerror" style ="display:none">Enter the correct format</p>
		 <div id="errorDisplay">
	<p id="delete" style ="display:none">Deleted Successfully</p>
	</div>
		 
		<div onclick="openBox()" id="plus">

			<div id="hor">
			<h3 style="background-color:black; padding:2% 453px 0% 0; ">
			</div>
			<center>
				<h1>
					<div class="glyphicon glyphicon-plus" style="margin-left: 61px;"></div>
				</h1>
			</center>
			</div>
		</div>
	
	<div class="col-md-6">
   <div class="vertical_line" style="margin-left: -237px;"></div>
	</div>
	<div class="col-md-6">
		<nav class="navbar navbar-fixed-top">
		<ul class="nav navbar-nav navbar-right">
			<li><h5>
					<div class="glyphicon glyphicon-off" onclick="signOut()" 
					style="margin-right: 20px; font-size: 24px;"></div>
				</h5></li>
		</ul>
		</nav>
		<div id="startTime"></div>
		<div id="display" style="margin-top: -2926px;font-size: 90px;margin-left: 607px;">00:00:00</div>
		<div id="stop" style="display: none;" onclick="stop()">
			<span class="glyphicon glyphicon-stop" style="color: red;font-size =10px;font-size: 25px;margin-right: -2px;margin-left: 767px;">stop</span>
		</div>
		<button id="pauseButton" class="glyphicon glyphicon-pause"  onclick="pauseFunc()" style="display:none;color: blue;font-size :10px;font-size: 25px;margin-right: -2px;margin-left: 767px;">pause</button>
	</div>
	<div id="result1"></div>
	<div id="Time"> </div>
		<script>
			$(document).ready(function() {
				 $.ajax({
					type : 'POST',
				    url:'/ListOfTimersOfUser',
					success : function(list) {
						var arr = [];
						var a = JSON.parse(list);
						var arr = a.listOfStrings;
						if(arr.length>0){
						arr.forEach(function(time) {
							var ul = document.getElementById("givenTime");
							var li = document.createElement("li");
							var lii = document.createElement("button");
							lii.setAttribute("id", time);
							lii.className="glyphicon glyphicon-trash";
							lii.setAttribute("style","margin-right: -50px; float: right;margin-top: -73px;");
							li.setAttribute("class", "list-group-item");
							li.setAttribute("class", "well");
							/* li.setAttribute("draggable","true"); */
							li.appendChild(document.createTextNode(time));
							ul.appendChild(li);
							ul.appendChild(lii);

						});
					}else{
						document.getElementById("emptyMessage").innerHTML="No Timers are available";

					}
						
					}
				}) ;
	
			}); 
			
 		
 	</script>
 	</body>
	
 	<%
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setDateHeader("Expires", 0);
response.setHeader("Pragma", "no-cache");
String userName = (String) session.getAttribute("email");
if (null == userName) {
  RequestDispatcher rd = request.getRequestDispatcher("firstpage.jsp");
  rd.forward(request, response);
}
 %>
<script>

var time = localStorage.getItem("pausetime");
if(time!=null){
document.getElementById("pauseButton").style.display = "block";
document.getElementById("display").innerHTML = time;
date = new Date();
var initialtime = time;
var array = null;
	array = initialtime.split(':');
	console.log(array);
	var hours = array[0];
	var minutes = array[1];
	var seconds = array[2];
	date.setHours(hours);
	date.setMinutes(minutes);
	date.setSeconds(seconds);
	clearInterval(timer);
	timer = setInterval(function() {
		var hrs = date.getHours();
		var min = date.getMinutes();
		var sec = date.getSeconds();
		hrs = hrs<10?"0"+hrs:hrs;
		min = min<10?"0"+min:min;
		sec = sec<10?"0"+sec:sec;
		document.getElementById("display").innerHTML = hrs+
				 ":" +min+ ":" + sec;
		date.setTime(date.getTime() + 1000);
	}, 1000);
}
else{
	localStorage.removeItem("pausetime");
	document.getElementById("display").innerHTML = "00:00:00";
	
}
</script>

</html>