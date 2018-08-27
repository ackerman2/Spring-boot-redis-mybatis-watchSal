<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Single</title>
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
<script src="${pageContext.request.contextPath}/js/easyResponsiveTabs.js" type="text/javascript"></script>
		    <script type="text/javascript">
			    $(document).ready(function () {
			        $('#horizontalTab').easyResponsiveTabs({
			            type: 'default', //Types: default, vertical, accordion           
			            width: 'auto', //auto or any width like 600px
			            fit: true   // 100% fit in a container
			        });
			    });
            </script>	
<script src="${pageContext.request.contextPath}/js/simpleCart.min.js"> </script>
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
      	<div class="single_left">
      	  <div class="labout span_1_of_a1">
			<div class="flexslider">
			
			<c:set var="pics" value="${fn:split(Idwatch.pics, ',')}"/>
					 <ul class="slides">
						<li data-thumb="${pageContext.request.contextPath}/watch/images/${pics[0]}">
							<img src="${pageContext.request.contextPath}/watch/images/${pics[0]}" />
						</li>
						<li data-thumb="${pageContext.request.contextPath}/watch/images/${pics[1]}">
							<img src="${pageContext.request.contextPath}/watch/images/${pics[1]}" />
						</li>
						<li data-thumb="${pageContext.request.contextPath}/watch/images/${pics[2]}">
							<img src="${pageContext.request.contextPath}/watch/images/${pics[2]}" />
						</li>
						<li data-thumb="${pageContext.request.contextPath}/watch/images/${pics[3]}">
							<img src="${pageContext.request.contextPath}/watch/images/${pics[3]}" />
						</li>
					 </ul>
				  </div>
		          <div class="clearfix"></div>	
	    </div>
		<div class="cont1 span_2_of_a1 simpleCart_shelfItem">
				<h1>${Idwatch.watchname}</h1><br>
				<p class="availability">库存数量: <span class="color">${Idwatch.amount}</span></p><br>
			    <div class="price_single">
				  <span class="amount item_price actual">￥${Idwatch.price}</span>
				</div>
				<p class="availability">销量: <span class="color">${Idwatch.xl}</span></p><br>
				<!-- <h2 class="quick">Quick Overview:</h2> -->
				<p style="font-size:10px "class="quick_desc">2018新款，${Idwatch.brands.brandname}全新正品${Idwatch.type}，火热销售中 !</p>
			    <div class="wish-list">
				 	<ul>
				 		
				 	</ul>
				 </div>
				<ul class="size">
					
				</ul>
				<div class="quantity_box">
					<ul class="product-qty">
					   <span>数量:</span>
					   <select name="c" id="c" onchange="javascript:se()">
						 <option>1</option>
						 <option>2</option>
						 <option>3</option>
						 <option>4</option>
						 <option>5</option>
						 <option>6</option>
					   </select>
   
				    </ul>
				    			    
				    <ul class="single_social">
						<li><a href="#"><i class="fb1"> </i> </a></li>
						<li><a href="#"><i class="tw1"> </i> </a></li>
						<li><a href="#"><i class="g1"> </i> </a></li>
						<li><a href="#"><i class="linked"> </i> </a></li>
		   		    </ul>
		   		    <div class="clearfix"></div>
	   		    </div>
	   		    <br><br><br>
			   <a id="gwc" href="${pageContext.request.contextPath}/checkout/${Idwatch.watchid}" class="btn btn-primary btn-normal btn-inline btn_form button item_add item_1" target="_self" >加入购物车</a>
			</div>

			<script type="text/javascript">	
			var str="${pageContext.request.contextPath}/checkout/${Idwatch.watchid}";
			var a="${Idwatch.amount}";
			var b=document.getElementById("c").value;
			
			function se()
			{
				var a1=${Idwatch.amount};
				var b1=document.getElementById("c").value;	
				c =document.getElementById("c").value;
				document.getElementById("gwc").href =str+"?count="+c+"" ; 
				if(a1<b1) {
					
					
					 alert("库存不足！");
					 document.getElementById("c").value=1; 
						
				}
				else{ 
					
					alert(bl);
				}
				
	
			}
		
			 window.onload=se(); 
			
</script>	
		    <div class="clearfix"> </div>
		</div>
        <div class="sap_tabs">	
	       <div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
			  <ul class="resp-tabs-list">
			  	  <li class="resp-tab-item" aria-controls="tab_item-0" role="tab"><span>主要参数</span></li>
				  
			  </ul>				  	 
			  <div class="resp-tabs-container">
			    <div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
					<div class="facts">
					  <ul class="tab_list">
					  	
					  	<li>${Idwatch.descr}</li>
					  	
					  </ul>           
			        </div>
			     </div>	
			 
			  </div>
		    </div>
		  </div>	
		</div>
		
		
		<div class="col-md-3 tabs">
	      <h3 class="m_1">相关产品</h3>
	       <c:forEach items="${RelateWatch}" var="item1">
	      <ul class="product">
	      	<li class="product_img">
	      	 <c:set var="pics" value="${fn:split(item1.pics, ',')}"/>
				
	      	<img src="${pageContext.request.contextPath}/watch/images/${pics[0]}" class="img-responsive" alt=""/></li>
	      	<li class="product_desc">
	      		<h4><a href="${pageContext.request.contextPath}/single/${item1.watchid}">${item1.watchname}</a></h4>
	      		<p class="single_price">￥${item1.price}</p>
	      		
	      	    <a href="${pageContext.request.contextPath}/single/${item1.watchid}" class="link-cart">查看详情</a>
	        </li>
	      	<div class="clearfix"> </div>
	      </ul>
	    </c:forEach>
        </div>
     <div class="clearfix"> </div>
	</div>
   </div>
   <%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
           
<c:import url="foot.jsp" charEncoding="utf-8" />
<!-- FlexSlider -->
<script defer src="${pageContext.request.contextPath}/js/jquery.flexslider.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/flexslider.css" type="text/css" media="screen" />
<script>
// Can also be used with $(document).ready()
$(window).load(function() {
  $('.flexslider').flexslider({
    animation: "slide",
    controlNav: "thumbnails"
  });
});
</script>
</body>
</html>		