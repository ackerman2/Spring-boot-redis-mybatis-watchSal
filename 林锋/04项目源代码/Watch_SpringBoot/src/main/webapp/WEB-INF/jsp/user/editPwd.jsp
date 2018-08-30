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
   <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
    <script type="text/javascript">
        jQuery(function ($) {

            var chart3 = $('#geoChart').chartinator({
                tableSel: '.geoChart',

                columns: [{role: 'tooltip', type: 'string'}],
         
                colIndexes: [2],
             
                rows: [
                    ['China - 2015'],
                    ['Colombia - 2015'],
                    ['France - 2015'],
                    ['Italy - 2015'],
                    ['Japan - 2015'],
                    ['Kazakhstan - 2015'],
                    ['Mexico - 2015'],
                    ['Poland - 2015'],
                    ['Russia - 2015'],
                    ['Spain - 2015'],
                    ['Tanzania - 2015'],
                    ['Turkey - 2015']],
              
                ignoreCol: [2],
              
                chartType: 'GeoChart',
              
                chartAspectRatio: 1.5,
             
                chartZoom: 1.75,
             
                chartOffset: [-12,0],
             
                chartOptions: {
                  
                    width: null,
                 
                    backgroundColor: '#fff',
                 
                    datalessRegionColor: '#F5F5F5',
               
                    region: 'world',
                  
                    resolution: 'countries',
                 
                    legend: 'none',

                    colorAxis: {
                       
                        colors: ['#679CCA', '#337AB7']
                    },
                    tooltip: {
                     
                        trigger: 'focus',

                        isHtml: true
                    }
                }

               
            });                       
        });
    </script>
<!--geo chart-->

<!--skycons-icons-->
<script src="js/skycons.js"></script>
<!--//skycons-icons-->
</head>
<body>	
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  	<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
	<c:import url="import_jsp/head3.jsp" charEncoding="utf-8" />

 <script>
function chkOldPwd(obj){
		var userpwd=obj.value;
		var userid = ${user.userid};
	$.post(
		"${pageContext.request.contextPath}/user/doajax",{"userid":userid,"userpwd":userpwd},
		function(data){
				var tip="原密码正确,请修改密码";
				
				if(data=="N"){
				tip="原密码错误,请重新输入";
				document.getElementById("reg").disabled=true;
				document.getElementById("pwd").innerHTML="<font color='red'>原密码错误,请重新输入</font>";
				return false;
				}
				
			    else{
			    	document.getElementById("pwd").innerHTML="<font color='green'>原密码正确,请修改密码</font>";
			    	return true;
			    }}
				
			)		
		 }
	
		
	
		
	
	function chklength(){
		var pw1=document.getElementById("userpwd2").value;
		if(pw1.length<6){
			document.getElementById("pwd1").innerHTML="<font color='red'>密码长度不能小于6位</font>";
			document.getElementById("reg").disabled=true;
			return false;
		}
		else{
			document.getElementById("pwd1").innerHTML="<font color='green'>√</font>";
			document.getElementById("reg").disabled=false;
			return true;
		}
	}
	
function chkPwd(){
	
		var pw1=document.getElementById("userpwd2").value;
		var pw2=document.getElementById("userpwd3").value;
		if(pw1==pw2){
			document.getElementById("pwd2").innerHTML="<font color='green'>√</font>";
			document.getElementById("reg").disabled=false;
			return true;
		}
		else{
			document.getElementById("pwd2").innerHTML="<font color='red'>两次密码不同</font>";
			document.getElementById("reg").disabled=true;
			return false;
		}
		
}
	
		 function checkAll () {
             if ( chkPwd()==true &&  chklength()==true ) {
                 return true;
             } else{
                 return false;
             }
         }

</script>	
	
	<form class="form-horizontal" role="form" action="doEditPwd" method="post" onsubmit="return checkAll()">
	<input type="hidden" name="userid" id="userid" value="${user.userid}">
  <div class="form-group">
    <label for="firstname" class="col-sm-2 control-label" >原密码</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="userpwd1" placeholder="请输入原密码"  maxlength="9" onblur="chkOldPwd(this)"><span id="pwd"></span>
    </div>
  </div>
  <div class="form-group">
    <label for="lastname" class="col-sm-2 control-label">新密码</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="userpwd" id="userpwd2"  placeholder="请输入原密码" maxlength="9" onblur="chklength()"><span id="pwd1"></span>
    </div>
  </div>
  
  <div class="form-group">
    <label for="lastname" class="col-sm-2 control-label">确认密码</label>
    <div class="col-sm-10">
      <input type="text" class="form-control"  id="userpwd3"  placeholder="确认密码" maxlength="9" onblur="chkPwd()"><span id="pwd2"></span>
    </div>
    </div> 
    
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-lg" id="reg">修改</button>
    </div>
  </div>
</form>
</div>


<div class="copyrights">
</div>	

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


		<script src="js/jquery.nicescroll.js"></script>
		<script src="js/scripts.js"></script>
		<!--//scrolling js-->
<script src="js/bootstrap.js"> </script>

</body>
</html>                     