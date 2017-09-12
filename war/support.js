var date = null;
var time = null;
var timer = null;
function openBox() {
	document.getElementById("addingTime").style.display = "block";
}
function timecheck(){
//document.getElementById("giveTime").onkeydown = function(event) {
	var e = event || window.event;
	if (e.keyCode == 13) {
		// postTime();
		time = document.getElementById("giveTime").value;
		checkTimeFormat(time);
		//document.getElementById("giveTime").reset();
        
	}
}

function postTime() {
	document.getElementById("addingTime").style.display = "none";
	var time = document.getElementById("giveTime").value;
	var ul = document.getElementById("givenTime");
	var li = document.createElement("li");
	var lii = document.createElement("button");
	lii.setAttribute("id", time);
	lii.setAttribute("style","margin-right: -63px; float: right;");
	lii.setAttribute("class","glyphicon glyphicon-trash;");
	li.setAttribute("class", "list-group-item");
	li.setAttribute("class", "well");
	li.appendChild(document.createTextNode(time));
	ul.appendChild(li);
	ul.appendChild(lii);
	//document.getElementById("myForm").reset();

}
function stop() {
	clearInterval(timer);
}


function checkTimeFormat(event) {
	alert(event);
	var regex = new RegExp("([0-1][0-9]|2[0-3]):([0-5][0-9]):([0-5][0-9])");
	if (regex.test(event)) {
		
		postTime();
		console.log(event);
	} else {
		alert("please enter HH:MM:SS format only ");
	}
}
function startTimer(event) {
	var target = getEventTarget(event);
	var targetId = event.target.id;
	if (!targetId) {
		document.getElementById("display").innerHTML = target.innerHTML;
		// document.getElementsByTagName("button").onclick=function(){alert("sdf");}
		// document.getElementById(targetId);
		alert(target.innerHTML);
		// alert(targetId);
		date = new Date();
		var initialtime = target.innerHTML;
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
			document.getElementById("display").innerHTML = hrs+
					 ":" +min+ ":" + sec;
			date.setTime(date.getTime() + 1000);
		}, 1000);
		document.getElementById("stop").style.display = "block";
	} else {
		var deltime = targetId;
        alert(targetId);
		console.log(deltime);
		var xhr = new XMLHttpRequest();
		var url = "/delete";
		xhr.open("POST", url, true);
		xhr.setRequestHeader("Content-type", "application/json");
		xhr.onreadystatechange = function () {
		if (xhr.readyState == 4 && xhr.status == 200) {
		var json = JSON.parse(xhr.responseText);
		console.log("success");

		if(json.key=="success")
		{
		//alert("success");
		var targetToDelete = document.getElementById(targetId).previousSibling;
		document.getElementById(targetId).parentNode.removeChild(targetToDelete);
        target.style.display="none";
		}
		else{
		alert("fail");
		}
		//window.location.href="/test/success";
		//document.getElementById("myform").reset();
		; }
		}; 
		var data = JSON.stringify({"deltime":deltime});
		console.log(data);
		xhr.send(data);
	}
};

function getEventTarget(e) {
	e = e || window.event;
	return e.target || e.srcElement;
}
