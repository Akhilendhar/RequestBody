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

</head>
<body>

	<div class="col-md-6">
		<h2>TIME</h2>
		<div id="scrollBar" style="overflow-y: scroll; height: 369px; margin-right: 244px;">
		<ul id="givenTime" class="list-group"
			style="width:154px; padding-left: 6px; font-size: 22px; border-left: 48;"
			onclick="startTimer(event)">
		</ul>
		</div>

	</div>



	<div id="bottom" style="position: fixed; bottom: 0px;">
		<div id="addingTime" style="display: none;">
           <form id="reset">
			<input type="text" id="giveTime" name="time" onclick="this.select()"
				onKeyDown="timecheck()"
				style="margin-bottom: -5px; margin-left: 17px;" autofocus></form>
		</div>
		<div onclick="openBox()" id="plus">

			<div id="hor">
				<hr width="446px">
			</div>
			<center>
				<h1>
					<div class="glyphicon glyphicon-plus" style="margin-left: 61px;"></div>
				</h1>
			</center>
			</div>
		</div>
	
	<div class="col-md-5">
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
		<div id="display" style="margin-top: -2926px;font-size: 90px;margin-left: 607px;">12:26:2</div>
		<div id="stop" style="display: none;" onclick="stop()">
			<span class="glyphicon glyphicon-stop" style="color: red;font-size =10px;font-size: 25px;margin-right: -2px;margin-left: 767px;">stop</span>
		</div>
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
						arr.forEach(function(time) {
							var ul = document.getElementById("givenTime");
							var li = document.createElement("li");
							var lii = document.createElement("button");
							lii.setAttribute("id", time);
							lii.setAttribute("style","margin-right: -63px; float: right;");
							li.setAttribute("class", "list-group-item");
							li.setAttribute("class", "well");
							li.appendChild(document.createTextNode(time));
							ul.appendChild(li);
							ul.appendChild(lii);

						})
					}
				}); 
            	  
              
				  $('#giveTime').keydown(function(e) {
					if (e.which == 13) {
						alert('You pressed enter!');

						//alert("button pressed");
						var giveTime = $('#giveTime').val();
						var data = {
							"giveTime" : giveTime
						};
						var jsonobject = JSON.stringify(data);
						$.ajax({
							type : 'POST',
							dataType : "json",
						    contentType: "application/json; charset=utf-8",
							data : jsonobject,
							url : 'Timer',
							
							success : function(result) {
								  //var json = JSON.parse(result);
								  console.log(result);
								  if(result.key=="success"){
									
									alert("data inserted");
									$("#result1").html(result);
									$("#reset")[0].reset();
									
								}
								else{
									alert("time already exists");
									var targetToDelete = document.getElementById(giveTime).previousSibling;
									document.getElementById(giveTime).parentNode.removeChild(targetToDelete);
									giveTime.style.display="none";
									
								}
							},
							error : function(result) {
								alert("error");
							}

						});
					}
				});
 
			}); 
			
 	</script>
	
 	
 	
 
</body>
</html>