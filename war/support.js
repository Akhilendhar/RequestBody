var date = null;
var time = null;
var timer = null;
function openBox() {
	document.getElementById("addingTime").style.display = "block";
	
}
function timecheck(){
	var e = event || window.event;
	if (e.keyCode == 13) {
		time = document.getElementById("giveTime").value;
		checkTimeFormat(time);
        
	}
	else if(e.keyCode==27){
		
		document.getElementById("addingTime").style.display="none";
		//document.getElementById("addingTime").autofocus;
	}
}

function postTime() {
	//alert("posting time");
	document.getElementById("addingTime").style.display = "none";
	document.getElementById("emptyMessage").style.display="none";
	document.getElementById("timerror").style.display="none";
	var time = document.getElementById("giveTime").value;
	console.log(time);
	var xhr = new XMLHttpRequest();
	var url = "/Timer";
	xhr.open("POST", url, true);
	xhr.setRequestHeader("Content-type", "application/json");
	xhr.onreadystatechange = function () {
	    if (xhr.readyState == 4 && xhr.status == 200) {
	        var json = JSON.parse(xhr.responseText);
	        if(json.key=="success")
	        {
	        	//alert("success");
	        	var ul = document.getElementById("givenTime");
	        	var li = document.createElement("li");
	        	var lii = document.createElement("button");
	        	lii.setAttribute("id", time);
	        	lii.className="glyphicon glyphicon-trash";
	        	lii.setAttribute("style","margin-right: -50px; float: right;margin-top: -73px;");
	        	li.setAttribute("class", "list-group-item");
	        	li.setAttribute("class", "well");
	        	li.appendChild(document.createTextNode(time));
	        	ul.appendChild(li);
	        	ul.appendChild(lii);
	        	document.getElementById("giveTime").value=" "
	        }
	        else{
	        	//alert("fail");
	        	document.getElementById("addingTime").style.display = "block";
	        	document.getElementById("timeExists").style.display="block";
	        	setTimeout(function()
	        	{
	        	document.getElementById("timeExists").style.display="none";
	        	},3000);
	        	//var targetToDelete = document.getElementById(giveTime).previousSibling;
				//document.getElementById(giveTime).parentNode.removeChild(targetToDelete);
	        	
	             }
	    }
	}
	var data = JSON.stringify({"time": time});
	console.log(data);
	xhr.send(data);
	

}
function stop() {
	clearInterval(timer);
}


function checkTimeFormat(event) {
	//alert(event);
	var regex = new RegExp("[0-1]?[0-9]:[0-5]?[0-9]:[0-5]?[0-9]");
	if (regex.test(event)) {
		
		postTime();
		console.log(event);
	} else {
		document.getElementById("timerror").style.display="block";
		
		//alert("please enter HH:MM:SS format only ");
	}
}
function startTimer(event) {
	var target = getEventTarget(event);
	var targetId = event.target.id;
	if (!targetId) {
		document.getElementById("display").innerHTML = target.innerHTML;
		// document.getElementsByTagName("button").onclick=function(){alert("sdf");}
		// document.getElementById(targetId);
		//alert(target.innerHTML);
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
			min = min<10?"0"+min:min;
			sec = sec<10?"0"+sec:sec;
			document.getElementById("display").innerHTML = hrs+
					 ":" +min+ ":" + sec;
			date.setTime(date.getTime() + 1000);
		}, 1000);
		document.getElementById("stop").style.display = "block";
	} else {
		var deltime = targetId;
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
			document.getElementById("delete").style.display="block";
			setTimeout(function()
					{
					document.getElementById("delete").style.display="none";
					},3000);
			
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
function myfunction()
{
var firstname = document.getElementById("firstname").value;
var lastname = document.getElementById("lastname").value;
var email = document.getElementById("email").value;
var password = document.getElementById("password").value;
console.log(firstname);
var xhr = new XMLHttpRequest();
var url = "/check";
xhr.open("POST", url, true);
xhr.setRequestHeader("Content-type", "application/json");
xhr.onreadystatechange = function () {
    if (xhr.readyState == 4 && xhr.status == 200) {
         var json = JSON.parse(xhr.responseText);
         console.log(json.key);
         //alert(json.email);
        //console.log(json.email);
       // document.getElementById("demo").innerHTML = this.responseText;
        if(json.key=="success")
        {
        	//debugger;
       // alert("success");
        //alert(json.name);
        console.log(json.name);
        window.location.href="/aftersignup";
        //alert("launch other pager");
        //return true;
        }
        else{
        //alert("fail");
        document.getElementById("errormsg").innerHTML="user already registered you can login";
        //alert("keep it in same page");
        }
       	//window.location.href="/test/success";
        //document.getElementById("myform").reset();
    }
}
var data = JSON.stringify({"firstname":firstname,"lastname":lastname,"email": email, "password": password, });
//console.log(name);
xhr.send(data);
}
function login()
{
var email = document.getElementById("email1").value;
var password = document.getElementById("password1").value;
console.log(email);
var xhr = new XMLHttpRequest();
var url = "/login";
xhr.open("POST", url, true);
xhr.setRequestHeader("Content-type", "application/json");
xhr.onreadystatechange = function () {
    if (xhr.readyState == 4 && xhr.status == 200) {
         var json = JSON.parse(xhr.responseText);
         //console.log(json.key);
         //alert(json.email);
        //console.log(json.email);
        //document.getElementById("demo").innerHTML = this.responseText;
        if(json.key=="success")
        {
        	//debugger;
       // alert("success");
        document.getElementById("loginerror").innerHTML="enter the valid details";
        }
        else{
        //alert("fail");
        //alert("move to other page");
        window.location.href="/aftersignup";
        }
       	//window.location.href="/test/success";
        //document.getElementById("myform").reset();
    }
}
var data = JSON.stringify({"email1": email, "password1": password});
//console.log(name);
xhr.send(data);
}
function hidetexbox(){
	document.getElementById("addingTime").style.display = "none";
	
	
}
	function signOut(){
		var xhr = new XMLHttpRequest();
		var url = "/signout";
		xhr.open("POST", url, true);
		xhr.setRequestHeader("Content-type", "application/json");
		xhr.onreadystatechange = function () {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var json = JSON.parse(xhr.responseText);
			console.log("responce");
			if(json.key=="success"){
				console.log("in the loop");
				window.location.href="/Aftersigout";
				
			}
  
		

		; }
		}; 
		//console.log(name);
		xhr.send("");
	}
	
