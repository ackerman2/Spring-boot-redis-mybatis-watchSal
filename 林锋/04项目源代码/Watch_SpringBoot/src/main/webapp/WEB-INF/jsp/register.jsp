<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Register</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Watches Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<!-- Custom Theme files -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<!--webfont-->
<link href='http://fonts.googleapis.com/css?family=PT+Sans+Narrow:400,700' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Dorsa' rel='stylesheet' type='text/css'>
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<!-- start menu -->
<link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/megamenu.js"></script>
<script>$(document).ready(function(){$(".megamenu").megamenu();});</script>
<script src="js/jquery.easydropdown.js"></script>
<script src="js/simpleCart.min.js"> </script>

<script src="js/jquery-2.1.1.min.js"></script>
<link href="css/bootstrap.css" rel="stylesheet">
<script src="js/bootstrap.js"></script>
</head>
<body>

		<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
           
<c:import url="head.jsp" charEncoding="utf-8" />

 <script>
function chkName(obj){
		var username=obj.value;

	$.post(
		"${pageContext.request.contextPath}/doajax",{"username":username},
		function(data){
				var tip="该用户名可用";
				
				if(data=="N"){
				tip="该用户名已注册";
				document.getElementById("reg").disabled=true;
				document.getElementById("tip").innerHTML="<font color='red'>该用户名已注册</font>";
				return false;
				}
				else{
				if(data=="W"){
				tip="用户长度不能小于4位";
				document.getElementById("reg").disabled=true;
				document.getElementById("tip").innerHTML="<font color='red'>用户长度不能小于3位</font>";
				return false;
				 }
			    else{
			    	document.getElementById("tip").innerHTML="<font color='green'>该用户名可用</font>";
			    	return true;
			    }
				
					
		} }
	)
		
	}
	
	function chkAdress(){
	var ad=document.getElementById("ad").value;
	if(ad.length==0){
		document.getElementById("ad1").innerHTML="<font color='red'>地址不能为空</font>";
		document.getElementById("reg").disabled=true;
		return false;
	}
	else{
		document.getElementById("ad1").innerHTML="<font color='green'>√</font>";
		document.getElementById("reg").disabled=false;
		return true;
	}
}
	
	
	function chklength(){
		var pw1=document.getElementById("pwd1").value;
		if(pw1.length<6){
			document.getElementById("tt").innerHTML="<font color='red'>密码长度不能小于6位</font>";
			document.getElementById("reg").disabled=true;
			return false;
		}
		else{
			document.getElementById("tt").innerHTML="<font color='green'>√</font>";
			document.getElementById("reg").disabled=false;
			return true;
		}
	}
	
function chkPwd(){
	
		var pw1=document.getElementById("pwd1").value;
		var pw2=document.getElementById("pwd2").value;
		if(pw1==pw2){
			document.getElementById("t").innerHTML="<font color='green'>√</font>";
			document.getElementById("reg").disabled=false;
			return true;
		}
		else{
			document.getElementById("t").innerHTML="<font color='red'>两次密码不同</font>";
			document.getElementById("reg").disabled=true;
			return false;
		}
		
}
		function chkPhone(){
		var em=document.getElementById("ph").value;
        var pattern=/^[1][3,4,5,7,8][0-9]{9}$/
        	if(pattern.test(em)){
		    document.getElementById("ph2").innerHTML="<font color='green'>√</font>";
			document.getElementById("reg").disabled=false;
			return true;
		}
		else 
		{
		if(em.length!=11){
			document.getElementById("ph2").innerHTML="<font color='red'>手机位数必须为11位</font>";
			document.getElementById("reg").disabled=true;
			return false;
		}
		else{
			document.getElementById("ph2").innerHTML="<font color='red'>手机格式不正确</font>";
			document.getElementById("reg").disabled=true;
			return false;
		}
	}
	}
		 function checkAll () {
             if ( chkPwd()==true && chkAdress()==true && chkPhone()==true &&  chklength()==true ) {
                 return true;
             } else{
                 return false;
             }
         }

</script>

 <form  action="/doreg" method="post" onsubmit="return checkAll()"> 
    <div class="account-in">
   	  <div class="container">
   	    
		   <div class="register-top-grid">
			<h2>个人信息</h2>
			 <div>
				<span>用户名<label>*</label></span>
				<input type="text" name="username" id="username" onblur="chkName(this)"> 
				<span id="tip"></span>
			 </div>
			 <div>
				<span>地址<label>*</label></span>
				<input type="text" name="adress" id="ad" onblur="chkAdress()"> 
				<span id="ad1"></span>
			 </div>
			 <div>
				 <span>电话<label>*</label></span>
				 <input type="text" name="phone" id="ph" onblur="chkPhone()" maxlength="11"> <br><br>
				 <span id="ph2"></span>
			 </div>
			 <div class="clearfix"> </div>
			   <a class="news-letter" href="#">
				 <label class="checkbox"><input type="checkbox" name="checkbox" checked><i> </i>我同意《名牌手表在线商城条款》</label>
			   </a>
			 </div>
		     <div class="register-bottom-grid">
				    <h2>登陆信息</h2>
					 <div>
						<span>密码<label>*</label></span>
						<input type="password" name="userpwd" onblur="chklength()" id="pwd1">
						<span id="tt"></span>
					 </div>
					 <div>
						<span>确认密码<label>*</label></span>
						<input type="password" onblur="chkPwd()" id="pwd2">
						<span id="t"></span>
					 </div>
					 <div class="clearfix"> </div>
			 </div>
		  
		<div class="clearfix"> </div>
		<div class="register-but">
			  	    
			   <input type="submit" id="reg" value="注册" class="btn btn-lg" >
			   <div class="clearfix"> </div>
		
		</div>
		 
	   </div>
   </div>
  </form>
 
     <%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
           
<c:import url="foot.jsp" charEncoding="utf-8" />
</body>
</html>		