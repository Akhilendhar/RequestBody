<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Alarm Application</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="support.js"></script>
</head>
<body background="images/bk4.jpg">
<div class="well" style="
width: 379px;
height: 466px;
margin-left: 471px;
margin-top: 90px;
">
<h1
style="text-align: center; padding-top: 30px; color: cornflowerblue;">Welcome!</h1>
<!-- <div class="Button" style="text-align: center"> -->
<center>	<button onclick="showSignUp()" style="color: brown;width: 82px;margin-left: -87px;" class="form-control" autofocus>SignUp</button>
<button onclick="showSignIn()" style="color: brown;width: 82px;margin-left: 95px;margin-top: -35px;" class="form-control">SignIn</button></center>
<!-- </div> -->
<script type="text/javascript" src="support.js"></script>
<script>
var valid = true, valid1 = true, valid2 = true, valid3 = true;
function showSignUp() {
document.getElementById("signUp").style.display = "block";
document.getElementById("signIn").style.display = "none";
}
function showSignIn() {
document.getElementById("signIn").style.display = "block";
document.getElementById("signUp").style.display = "none";
}
function firstname() {
	var firstname = document.getElementById('firstName').value;

	if (firstname.length > 1) {
	var icon = document.getElementById("as");
	icon.className = "glyphicon glyphicon-ok";

	valid = true;
	} else {
	var icon = document.getElementById("as");
	icon.className = "glyphicon glyphicon-remove";
	document.getElementById("errormessage").innerHTML = "Give appropriate firstname"
	valid = false;

	}

	}
	function lastname() {
	var lastname = document.getElementById('lastName').value;

	if (lastname.length > 1) {
	var icon = document.getElementById("as1");
	icon.className = "glyphicon glyphicon-ok";

	valid1 = true;
	/* var span=document.getElementById('as');
	var icon="glyphicon glyphicon-tick"
	span.append(icon);
	*/} else {
	var icon = document.getElementById("as1");
	icon.className = "glyphicon glyphicon-remove";
	document.getElementById("errormessage").innerHTML = "Give appropriate lastname"
	valid1 = false;

	}

	}

	function validate() {
	var email = document.getElementById("email").value;
	var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	//var pass = document.getElementById('password').value;

	if (email.match(mailformat)) {
	var icon = document.getElementById("as2");
	icon.className = "glyphicon glyphicon-ok";

	valid2 = true;
	} else {
	var icon = document.getElementById("as2");
	icon.className = "glyphicon glyphicon-remove";
	document.getElementById("errormessage").innerHTML = "Give appropriate mail"
	valid2 = false;

	}
	}
	function password() {

	var password = document.getElementById('password').value;

	if (password.length > 5) {
	var icon = document.getElementById("as3");
	icon.className = "glyphicon glyphicon-ok";

	valid3 = true;
	/* var span=document.getElementById('as');
	var icon="glyphicon glyphicon-tick"
	span.append(icon);
	*/} else {
	var icon = document.getElementById("as3");
	icon.className = "glyphicon glyphicon-remove";
	document.getElementById("errormessage").innerHTML = "password should be minimum of 6 characters"
	valid3 = false;
	}

	}
	function verify() {
	if (valid == true && valid1 == true && valid2 == true
	&& valid3 == true) {
	return true;
	} else {
	return false;
	}
	}	function firstname() {
	var firstname = document.getElementById('firstname').value;

	if (firstname.length > 1) {
	var icon = document.getElementById("as");
	icon.className = "glyphicon glyphicon-ok";
	icon.setAttribute("style","color:green");

	valid = true;
	} else {
	var icon = document.getElementById("as");
	icon.className = "glyphicon glyphicon-remove";
	icon.setAttribute("style","color:red");
	document.getElementById("errormessage").innerHTML = "Give appropriate firstname"
	valid = false;

	}

	}
	function lastname() {
	var lastname = document.getElementById('lastname').value;

	if (lastname.length > 1) {
	var icon = document.getElementById("as1");
	icon.className = "glyphicon glyphicon-ok";
	icon.setAttribute("style","color:green");

	valid1 = true;
	/* var span=document.getElementById('as');
	var icon="glyphicon glyphicon-tick"
	span.append(icon);
	*/} else {
	var icon = document.getElementById("as1");
	icon.className = "glyphicon glyphicon-remove";
	icon.setAttribute("style","color:red");
	document.getElementById("errormessage").innerHTML = "Give appropriate lastname"
	valid1 = false;

	}

	}

	function validate() {
	var email = document.getElementById("email").value;
	var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	//var pass = document.getElementById('password').value;

	if (email.match(mailformat)) {
	var icon = document.getElementById("as2");
	icon.className = "glyphicon glyphicon-ok";
	icon.setAttribute("style","color:green");

	valid2 = true;
	} else {
	var icon = document.getElementById("as2");
	icon.className = "glyphicon glyphicon-remove";
	icon.setAttribute("style","color:red");
	document.getElementById("errormessage").innerHTML = "Give appropriate mail"
	valid2 = false;

	}
	}
	function password() {

	var password = document.getElementById('password').value;

	if (password.length > 5) {
	var icon = document.getElementById("as3");
	icon.className = "glyphicon glyphicon-ok";
	icon.setAttribute("style","color:green");

	valid3 = true;
	/* var span=document.getElementById('as');
	var icon="glyphicon glyphicon-tick"
	span.append(icon);
	*/} else {
	var icon = document.getElementById("as3");
	icon.className = "glyphicon glyphicon-remove";
	icon.setAttribute("style","color:red");
	document.getElementById("errormessage").innerHTML = "password should be minimum of 6 characters"
	valid3 = false;
	}

	}
	function verify() {
	if (valid == true && valid1 == true && valid2 == true
	&& valid3 == true) {
	return true;
	} else {
	return false;
	}
	}
</script>

<div id="errorOnsignup"></div>
<div id='signUp'>
<center>
<div class="inner-addon left-addon">
<i class="glyphicon glyphicon-user"></i><input type="text" name="firstName" id="firstname" placeholder="firstname" required class="form-control" style="
margin-top: 14px;"onfocusout="firstname()">
<span id="as"></span></div>
<br>	
<div class="inner-addon left-addon">
<i class="glyphicon glyphicon-user"></i><input type="text" name="lastName" id="lastname"placeholder="lastname" required class="form-control"onfocusout="lastname();">
<span id="as1"></span></div>
<br>	
<div class="inner-addon left-addon">
<i class="glyphicon glyphicon-envelope"></i><input type="email" name="email" id="email" placeholder ="email" required class="form-control" onfocusout="validate()">
<span id="as2"></span></div>
<br>	
<div class="inner-addon left-addon">
<i class="glyphicon glyphicon-lock"></i><input type="password" name="password" id="password" placeholder="password" required class="form-control"onfocusout="password()">
<span id="as3"></span></div><br>
<div id="errormessage"></div><br>
<div class="inner-addon left-addon"><input type="submit" value="signup" class="form-control" onclick="if(verify()){myfunction();}" style="
width: 91px;
padding-left: 12px;
">
</div>
</div>
<div id="demo"></div>
<div id="errormsg"></div>
<center>
<div id='signIn' style="display: none;"> 
<br>	
<div class="inner-addon left-addon"><i class="glyphicon glyphicon-envelope"></i> <input type="email" class="form-control" id="email1" placeholder="Email" required/></div>
<br>

<div class="inner-addon left-addon">
<i class="glyphicon glyphicon-lock"></i><input type="password" name="password" id="password1" class="form-control" placeholder="Password" required></div>

<br>
<div class="inner-addon left-addon"><input type="submit" value="signin" class="form-control" onclick="login()" style="
width: 91px;
padding-left: 12px;
">
<div id="loginerror"></div>
</div>
</div>
</div>
</center>
</body>
</html>
<style>
.inner-addon {
position: relative;
width: 200px;
}
.inner-addon .glyphicon {
position: absolute;
padding: 10px;
pointer-events: none;
}

/* align icon */
.left-addon .glyphicon {
left: 0px;
}

.right-addon .glyphicon {
right: 0px;
}

/* add padding */
.left-addon input {
padding-left: 30px;
}

.right-addon input {
padding-right: 30px;
}
#as {
margin-left: 202px;
margin-top: -1px;
float: right;
}

#as1 {
margin-left: 202px;
margin-top: -1px;
float: right;
}

#as2 {
margin-left: 202px;
margin-top: -1px;
float: right;
}

#as3 {
margin-left: 202px;
margin-top: -1px;
float: right;
}
</style>