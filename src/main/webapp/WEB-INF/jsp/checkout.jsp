<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Checkout</title>
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
           
             <%@ taglib prefix="fn" 
           uri="http://java.sun.com/jsp/jstl/functions" %>
           
		<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
           
<c:import url="head.jsp" charEncoding="utf-8" />

   <div class="account-in">
   	 <div class="container">
		  <div class="check_box">	 
		<div class="col-md-9 cart-items">
			 <h1>我的购物车 (${Ccart})</h1>
			 <c:set var="tot" value="0"/>
			  <c:forEach items="${Cart}" var="item"> 
		   
			 <div class="cart-header">
				 <a href="${pageContext.request.contextPath}/editChk?cartid=${item.cartid}">
				  <div class="close1">  </div>
				  </a>
				   <div class="cart-sec simpleCart_shelfItem">
						<div class="cart-item cyc">
						 <c:set var="pics" value="${fn:split(item.watch.pics, ',')}"/>
				
							 <img  src="${pageContext.request.contextPath}/watch/images/${pics[0] }" class="img-responsive" alt=""/>
							
						</div>
					   <div class="cart-item-info">
						<h3><a href="${pageContext.request.contextPath}/single/${item.watch.watchid}">${item.watch.watchname}</a></h3>
						<ul class="qty">
						<li><p>数量 : ${item.cartcount}</p>
				 
						</li>
						<br><br>
						<p>单价:${item.watch.price}</p>
						<c:set var="tot" value="${tot+item.watch.price*item.cartcount}"/>
						</ul>
						<div class="delivery">
							
							  <p>总价:${item.watch.price*item.cartcount}</p>
							 <span>2-3天送达</span>
							 <div class="clearfix"></div>
				        </div>	
					   </div>
					   <div class="clearfix"></div>
				    </div>
			 </div>
			 
			 </c:forEach>
					
		 </div>
		 <div class="col-md-3 cart-total">
		 	<a class="continue" href="${pageContext.request.contextPath}/edit">清空购物车</a>
			 <a class="continue" href="${pageContext.request.contextPath}/men">继续购物</a>
			 <div class="price-details">
				 <h3></h3>		
				 <div class="clearfix"></div>				 
			 </div>	
			 <ul class="total_price">
			   <li class="last_price"> <h4>总计</h4></li>	
			   <li class="last_price"><span>￥<c:out value="${tot}"/></span></li>
			   <div class="clearfix"> </div>
			 </ul>
			
			 <div class="clearfix"></div>
			 <a class="order" href="${pageContext.request.contextPath}/editAll" onclick="if(confirm('确定付款?')==false)return false;">结算</a>
			 <div class="total-item">
				
				<!--  <p><a href="login">登录</a> 使用购物车</p> -->
				 
			 </div>
			</div>
			<div class="clearfix"></div>
	     </div>
	  </div>
   </div>
   <div class="map">
	 
   </div>
  <%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
           
<c:import url="foot.jsp" charEncoding="utf-8" />
</body>
</html>		