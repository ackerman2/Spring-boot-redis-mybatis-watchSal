<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Men</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Watches Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<link href="${pageContext.request.contextPath}/css/bootstrap.css"
	rel='stylesheet' type='text/css' />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<!-- Custom Theme files -->
<link href="${pageContext.request.contextPath}/css/style.css"
	rel='stylesheet' type='text/css' />
<link href="${pageContext.request.contextPath}/css/component.css"
	rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<!--webfont-->
<link
	href='http://fonts.googleapis.com/css?family=PT+Sans+Narrow:400,700'
	rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Dorsa'
	rel='stylesheet' type='text/css'>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
<!-- start menu -->
<link href="${pageContext.request.contextPath}/css/megamenu.css"
	rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/megamenu.js"></script>
<script>$(document).ready(function(){$(".megamenu").megamenu();});</script>
<script
	src="${pageContext.request.contextPath}/js/jquery.easydropdown.js"></script>
<script src="${pageContext.request.contextPath}/js/simpleCart.min.js"> </script>
</head>
<body>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<c:import url="head.jsp" charEncoding="utf-8" />

	<script>

function chk(watch_id){
	var watch_id =watch_id;
$.post
(
	"${pageContext.request.contextPath}/SingleChk",{"watch_id":watch_id},
	function(data){
			
			if(data=="N"){
			alert("添加成功，在购物车等待亲");
			
			}
			else{
			if(data=="W"){
			alert("添加失败，你尚未登陆，请登陆再进行购物");
			}
			
			else if(data=="Y")
			{
			alert("添加成功，在购物车等待亲");	
			var a=document.getElementById("ph1").innerHTML;
			var b=(a-0)+1;
			var c=document.getElementById("ph1").innerHTML=b;
			}
	}
	 
	}
)
}

</script>


	<div class="men">
		<div class="container">
			<div class="col-md-4 sidebar_men">
				<h3>品牌</h3>

				<ul class="product-categories color">
					<li class="cat-item cat-item-60"><a
						href="${pageContext.request.contextPath}/men">全部</a> <span
						class="count">(${Cwatch})</span></li>
					<c:forEach items="${watch1}" var="item">

						<li class="cat-item cat-item-60"><a
							href="${pageContext.request.contextPath}/men/${item.brandid}">${item.brandname}</a>
							<span class="count">(${item.brandcount})</span></li>

					</c:forEach>
				</ul>



			</div>
			<div class="col-md-8 mens_right">
				<div class="dreamcrub">
					<ul class="breadcrumbs">
						<li class="home"><a href="index" title="回到首页">回到首页</a>&nbsp;
							<span></span></li>
						<li class="home">&nbsp; &nbsp;</li>
					</ul>
					<ul class="previous">

					</ul>
					<div class="clearfix"></div>
				</div>
				<div class="mens-toolbar">
					<div class="sort">
						<div class="sort-by"></div>
					</div>
					<ul class="women_pagenation dc_paginationA dc_paginationA06">
						<li><a href="#" class="previous">Page : </a></li>
						<li class="active"><a href="#">1</a></li>
						<li><a href="#">2</a></li>
					</ul>
					<div class="clearfix"></div>
				</div>
				<div id="cbp-vm" class="cbp-vm-switcher cbp-vm-view-grid">
					<div class="cbp-vm-options">
						<a href="#" class="cbp-vm-icon cbp-vm-grid cbp-vm-selected"
							data-view="cbp-vm-view-grid" title="grid">Grid View</a> <a
							href="#" class="cbp-vm-icon cbp-vm-list"
							data-view="cbp-vm-view-list" title="list">List View</a>
					</div>
					<div class="pages">
						<div class="limiter visible-desktop"></div>
					</div>
					<div class="clearfix"></div>
					<ul>
						<c:set var="i" value="1" />
						<c:forEach items="${Typewatch}" var="item">
							<c:if test="${i%3==0}">
								<li class="last simpleCart_shelfItem"><a
									class="cbp-vm-image"
									href="${pageContext.request.contextPath}/single/${item.watchid}">
										<div class="view view-first">
											<div class="inner_content clearfix">
												<div class="product_image">
													<div class="mask1">
														<c:set var="pics" value="${fn:split(item.pics, ',')}" />
														<img
															src="${pageContext.request.contextPath}/watch/images/${pics[0] }"
															alt="image" class="img-responsive zoom-img">
													</div>

													<div class="mask">
														<div class="info">查看详情</div>
													</div>
													<div class="product_container">
														<h4>${item.watchname}</h4>
														<p>${item.brands.brandname}</p>
														<div class="price mount item_price">￥${item.price}</div>
								</a> <!--  <a class="button item_add cbp-vm-icon cbp-vm-add" href="#">加入购物车</a> -->
									<input type="button"
									class="button item_add cbp-vm-icon cbp-vm-add"
									onclick="chk(${item.watchid})" value="加入购物车" />
				</div>
			</div>
		</div>
	</div>
	<!--   </a> -->
	</li>
	</c:if>
	<c:if test="${i%3!=0 }">
		<li class="simpleCart_shelfItem"><a class="cbp-vm-image"
			href="${pageContext.request.contextPath}/single/${item.watchid}">
				<div class="view view-first">
					<div class="inner_content clearfix">
						<div class="product_image">
							<div class="mask1">
								<c:set var="pics" value="${fn:split(item.pics, ',')}" />
								<img width=242px height=322px
									src="${pageContext.request.contextPath}/watch/images/${pics[0] }"
									alt="image" class="img-responsive zoom-img">
							</div>

							<div class="mask">
								<div class="info">查看详情</div>
							</div>
							<div class="product_container">
								<h4>${item.watchname}</h4>
								<p>${item.brands.brandname}</p>
								<div class="price mount item_price">￥${item.price}</div>
		</a> <!--  <a class="button item_add cbp-vm-icon cbp-vm-add" href="#">加入购物车</a> -->
			<input type="button" class="button item_add cbp-vm-icon cbp-vm-add"
			onclick="chk(${item.watchid})" value="加入购物车" />
			</div>
			</div>
			</div>
			</div> </a></li>
	</c:if>
	<c:set var="i" value="${i+1}" />
	</c:forEach>

	</ul>
	</div>
	<script
		src="${pageContext.request.contextPath}/js/cbpViewModeSwitch.js"
		type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/classie.js"
		type="text/javascript"></script>
	</div>
	</div>
	</div>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<c:import url="foot.jsp" charEncoding="utf-8" />
</body>
</html>
