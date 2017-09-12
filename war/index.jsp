<html>
<head>
</head>
<body> 
<form onsubmit="return myfunction()">
      name <input type="text" id="name"> <br>
      email <input type="text" id="email"> <br>
      password <input type="password" id="password"><br>
      <input type="submit" id="mysubmit" value="register">
 </form>
     <div id="demo"></div>
     <div id="errormsg"></div>

<script type="text/javascript">
function myfunction()
{
var name = document.getElementById("name").value;
var email = document.getElementById("email").value;
var password = document.getElementById("password").value;
console.log(name);
var xhr = new XMLHttpRequest();
var url = "test/check";
xhr.open("POST", url, true);
xhr.setRequestHeader("Content-type", "application/json");
xhr.onreadystatechange = function () {
    if (xhr.readyState == 4 && xhr.status == 200) {
         var json = JSON.parse(xhr.responseText);
         console.log(json.key);
         //alert(json.email);
        //console.log(json.email);
        document.getElementById("demo").innerHTML = this.responseText;
        if(json.key=="success")
        {
        	debugger;
        alert("success");
        alert("launch other page");
        return true;
        }
        else{
        alert("fail");
        document.getElementById ("errormsg").innerHTML="user already registered you can login";
        alert("keep it in same page");
        return false;
        }
       	//window.location.href="/test/success";
        //document.getElementById("myform").reset();
   ; }
}; 
var data = JSON.stringify({"username":name,"email": email, "password": password, });
//console.log(name);
xhr.send(data);


}
</script>
</body>