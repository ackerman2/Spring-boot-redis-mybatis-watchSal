<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Watches Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<!-- Custom Theme files -->
<link href="${pageContext.request.contextPath}/css/style.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<!--webfont-->
<link href='http://fonts.googleapis.com/css?family=PT+Sans+Narrow:400,700' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Dorsa' rel='stylesheet' type='text/css'>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
<!-- start menu -->
<link href="${pageContext.request.contextPath}/css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/megamenu.js"></script>
<script>$(document).ready(function(){$(".megamenu").megamenu();});</script>
<script src="${pageContext.request.contextPath}/js/jquery.easydropdown.js"></script>
<script src="${pageContext.request.contextPath}/js/simpleCart.min.js"> </script>
</head>
<body>
		<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
           
   <div class="account-in">
   	 <div class="container">
   	   <h3>${msg1}</h3>
		<div class="col-md-7 account-top">
		  <form action="/dologin1" method="post" >
			<div> 	
				<span>用户名*</span>
				<input type="text" name="adminname" id="u" value="${adminname}" onclick="document.getElementById('u').value='';document.getElementById('rem').checked=false;"> 
			</div>
			<div> 
				<span class="pass">密码*</span>
				<input type="password" name="adminpwd">
			</div>
				<br>
 <% 
 	Cookie[] ckArr=request.getCookies();
	String rem="";
	if(ckArr!=null){
	for(Cookie ck:ckArr){
	if("rem".equals(ck.getName())){
	rem=ck.getValue();
	
	}
	}
}%>
	
				记住用户:&nbsp<input type="checkbox" id="rem" name="rem"  <%if("on".equals(rem)){%>checked<%}%>  /><br><br>				
				<input type="submit" value="登陆" >
		   </form>
		</div>
	
	  </div>
   </div>
 
     <%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
           
</body>
</html>		