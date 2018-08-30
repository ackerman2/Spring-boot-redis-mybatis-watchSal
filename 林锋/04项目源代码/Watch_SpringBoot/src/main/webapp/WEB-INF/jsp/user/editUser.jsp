<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE HTML>
<html>
<head>
<title>Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Shoppy Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
<!-- Custom Theme files -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
<!--js-->
<script src="js/jquery-2.1.1.min.js"></script> 
<!--icons-css-->
<link href="css/font-awesome.css" rel="stylesheet"> 
<!--Google Fonts-->
<link href='https://fonts.googleapis.com/css?family=Carrois+Gothic' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Work+Sans:400,500,600' rel='stylesheet' type='text/css'>
<!--static chart-->
<script src="js/Chart.min.js"></script>
<!--//charts-->
<!-- geo chart -->
    <script src="http://cdn.jsdelivr.net/modernizr/2.8.3/modernizr.min.js" type="text/javascript"></script>
    <script>window.modernizr || document.write('<script src="lib/modernizr/modernizr-custom.js"><\/script>')</script>
    <!--<script src="lib/html5shiv/html5shiv.js"></script>-->
     <!-- Chartinator  -->
    <script src="js/chartinator.js" ></script>
    	<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
	<c:import url="import_jsp/head2.jsp" charEncoding="utf-8" />
	 <script>

	function chkAdress(){
	var ad=document.getElementById("adress").value;
	if(ad.length==0){
		document.getElementById("ad1").innerHTML="<font color='red'>地址不能为空</font>";
		document.getElementById("reg").disabled=true;
		return false;
	}
	else{
		document.getElementById("ad1").innerHTML="<font color='green'>地址格式正确</font>";
		document.getElementById("reg").disabled=false;
		return true;
	}
}
	
	


		function chkPhone(){
		var em=document.getElementById("phone").value;
        var pattern=/^[1][3,4,5,7,8][0-9]{9}$/
        	if(pattern.test(em)){
		    document.getElementById("ph1").innerHTML="<font color='green'>手机号格式正确</font>";
			document.getElementById("reg").disabled=false;
			return true;
		}
		else 
		{
		if(em.length!=11){
			document.getElementById("ph1").innerHTML="<font color='red'>手机位数必须为11位</font>";
			document.getElementById("reg").disabled=true;
			return false;
		}
		else{
			document.getElementById("ph1").innerHTML="<font color='red'>手机格式不正确</font>";
			document.getElementById("reg").disabled=true;
			return false;
		}
	}
	}
		 function checkAll () {
             if ( chkAdress()==true && chkPhone()==true &&  chkName(this)==true ) {
                 return true;
             } else{
                 return false;
             }
         }

</script>
	<form class="form-horizontal" role="form" action="doEditUser" method="post" onsubmit="return checkAll()">
	<input type="hidden" name="userid" id="userid" value="${user.userid}">
  <div class="form-group">
    <label for="firstname" class="col-sm-2 control-label" >用户昵称</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name ="username" id="user" value="${user.username}" size="58" maxlength="9" readonly="readonly" >
    </div>
  </div>
  <div class="form-group">
    <label for="lastname" class="col-sm-2 control-label">用户地址</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="adress" id="adress" value="${NewUser.adress}"  size="58" maxlength="20" onblur="chkAdress()"><span id="ad1"></span>
    </div>
  </div>
  
  <div class="form-group">
    <label for="lastname" class="col-sm-2 control-label">用户电话</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="phone" id="phone"  value="${NewUser.phone}" size="58" maxlength="11" onblur="chkPhone()"><span id="ph1"></span>
    </div>
    </div> 
    
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-lg" id="reg" onClick="return confirm('修改成功');">修改</button>
    </div>
  </div>
</form>
	
<!--climate end here-->
</div>

<!--inner block end here-->
<!--copy rights start here-->
<div class="copyrights">
</div>	
<!--COPY rights end here-->
</div>
</div>
<!--slider menu-->
   <c:import url="import_jsp/slide.jsp" charEncoding="utf-8" />	
<!--slide bar menu end here-->
<script>
var toggle = true;
            
$(".sidebar-icon").click(function() {                
  if (toggle)
  {
    $(".page-container").addClass("sidebar-collapsed").removeClass("sidebar-collapsed-back");
    $("#menu span").css({"position":"absolute"});
  }
  else
  {
    $(".page-container").removeClass("sidebar-collapsed").addClass("sidebar-collapsed-back");
    setTimeout(function() {
      $("#menu span").css({"position":"relative"});
    }, 400);
  }               
                toggle = !toggle;
            });
</script>
<!--scrolling js-->
		<script src="js/jquery.nicescroll.js"></script>
		<script src="js/scripts.js"></script>
		<!--//scrolling js-->
<script src="js/bootstrap.js"> </script>
<!-- mother grid end here-->
</body>
</html>                     