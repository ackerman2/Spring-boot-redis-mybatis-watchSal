<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Brands</title>
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
</head>
<body>
	<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
    
    <%@ taglib prefix="fn" 
           uri="http://java.sun.com/jsp/jstl/functions" %>
           
<c:import url="head.jsp" charEncoding="utf-8" />

   <div class="men">
   	<div class="container">
      <div class="col-md-9 single_top">
      	 <h1 class="page-heading product-listing">
			品牌
		    <span class="heading-counter">共${count}个品牌</span>
         </h1>
        
        
         <div class="product-count"></div>
      
     <c:forEach items="${brands}" var="item">
         
          <div class="brand_box">
	         <div class="left-side col-xs-12 col-sm-3">
	         <c:set var="pics" value="${fn:split(item.brandpics, ',')}"/>
		
				 <img src="${pageContext.request.contextPath}/watch/images/${pics[0] }" alt=""/>
			<!-- 	 width=145px height =61px -->
			 </div>
		     <div class="middle-side col-xs-12 col-sm-5">
		     	<h4><a href="#">${item.brandname}</a></h4>
		     	<p style="font-size:3px">
				${item.branddscr}
				</p>
			 </div>
			 <div class="right-side col-xs-12 col-sm-4">
			 	<p><a href="${pageContext.request.contextPath}/men/${item.brandid}">${item.brandcount} 个产品</a></p>
			    <a href="${pageContext.request.contextPath}/men/${item.brandid}" class="btn btn1 btn-primary btn-normal btn-inline " target="_self">查看 产品</a>     
			 </div>
			 <div class="clearfix"> </div>
		  </div>
		
	</c:forEach>
		 
		</div>
		
		<div class="col-md-3 tabs">
	      <h3 class="m_1">精选推荐</h3>
	      <ul class="product">
	      	<li class="product_img"><img src="watch/images/b1.jpg" class="img-responsive" alt=""/></li>
	      	<li class="product_desc">
	      		<h5><a href="single/2">劳力士日志型系列m279160-0014腕表</a></h5>
	      		<p class="single_price">￥47500</p>
	     
	      	    <a href="single" class="link-cart">查看详情</a>
	        </li>
	      	<div class="clearfix"> </div>
	      </ul>
	      <ul class="product">
	      	<li class="product_img"><img src="watch/images/l1.jpg" class="img-responsive" alt=""/></li>
	      	<li class="product_desc">
	      		<h5><a href="single/12">江诗丹顿传承系列25162/000R-9182腕表</a></h5>
	      		<p class="single_price">￥104000</p>
	      	
	      	    <a href="single" class="link-cart">查看详情</a>
	        </li>
	      	<div class="clearfix"> </div>
	      </ul>
	      <ul class="product">
	      	<li class="product_img"><img src="watch/images/k1.jpg" class="img-responsive" alt=""/></li>
	      	<li class="product_desc">
	      		<h5><a href="single/11">江诗丹顿传承系列30030/000P-8200腕表</a></h5>
	      		<p class="single_price">￥6815000</p>
	      		
	      	    <a href="single" class="link-cart">查看详情</a>
	        </li>
	      	<div class="clearfix"> </div>
	      </ul>
	      <ul class="product">
	      	<li class="product_img"><img src="watch/images/o1.jpg" class="img-responsive" alt=""/></li>
	      	<li class="product_desc">
	      		<h5><a href="single/15">天梭经典系列T41.1.483.33腕表</a></h5>
	      		<p class="single_price">￥4450</p>
	      		
	      	    <a href="single" class="link-cart">查看详情</a>
	        </li>
	      	<div class="clearfix"> </div>
	      </ul>
	     
        </div>
     <div class="clearfix"> </div>
	</div>
   </div>
   
   
   <%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
           
<c:import url="foot.jsp" charEncoding="utf-8" />
</body>
</html>		