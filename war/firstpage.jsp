<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1
		style="text-align: center; padding-top: 30px; color: cornflowerblue;">Welcome!</h1>
	<div class="Button" style="text-align: center">
		<button onclick="showSignUp()" style="color: brown;">SignUp</button>
		<button onclick="showSignIn()" style="color: brown;">SignIn</button>
	</div>
	
	<div id='signUp'>

		<table border="2" , align="center" style="margin-top: 35px;">
			
				<tr>
					<td>First Name:</td>
					<td><input type="text" name="firstName" id="firstname" required></td>
				</tr>				<tr>
					<td>Last Name:</td>
					<td><input type="text" name="lastName" id="lastname" required></td>
				</tr>
				<tr>
					<td>Email:</td>
					<td><input type="email" name="email" id="email"required></td>
				</tr>
				<tr>
					<td>Password:</td>
					<td><input type="password" name="password" id="password"required></td>
				</tr>
				<tr>
					<td><input type="submit" value="submit" onclick="myfunction()"></td>
				</tr>
				</td>
				</tr>
			
		</table>
		<div id="demo"></div>
		<div id="errormsg"></div>

	
	</div>

	<div id='signIn' style="display: none;">
		<table border="2" , align="center" style="margin-top: 35px;">

				<tr>
					<td>Email:</td>
					<td><input type="email" name="email" id="email1"></td>
				</tr>
				<tr>
					<td>Password:</td>
					<td><input type="password" name="password" id="password1"></td>
				</tr>
				<tr>
					<td><input type="submit" name="SignIn" value="login" onclick="login()"></td>
				</tr>
		</table>
	  <div id="loginerror"></div>
			</div>
	 
<script>
		function showSignUp() {
			document.getElementById("signUp").style.display = "block";
			document.getElementById("signIn").style.display = "none";
		}
		function showSignIn() {
			document.getElementById("signIn").style.display = "block";
			document.getElementById("signUp").style.display = "none";
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
		        return false;
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
		        document.getElementById("demo").innerHTML = this.responseText;
		        if(json.key=="success")
		        {
		        	//debugger;
		       // alert("success");
		        document.getElementById("loginerror").innerHTML="enter the valid details";
		        }
		        else{
		        //alert("fail");
		        document.getElementById("errormsg").innerHTML="user is not present";
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
	</script>
</body>
</html>