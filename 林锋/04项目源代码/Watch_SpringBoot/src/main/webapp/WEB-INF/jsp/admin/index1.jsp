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
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
   
   	<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
	
		<c:import url="import_jsp/head1.jsp" charEncoding="utf-8" />
	<table>
	
	
	 <tr>
      <th width="100">手表编号</th>
      <th width="100">类型</th>
      <th width="400" style="vertical-align:middle; text-align:center;">手表名称</th>
      <th width="100">品牌</th>
      <th width="100">价格</th>
      <th width="100">库存</th>
      <th width="100">销量</th>
      <th width="120">封面</th>
      <th style="vertical-align:middle; text-align:center;"> 操作</th>
    </tr>
    
     <c:forEach items="${watch}" var="item">
    <tr>
      <td>${item.watchid}</td>
      <td>${item.type }</td>
      <td>${item.watchname}</td>
      <td>${item.brands.brandname}</td>
      <td>${item.price}</td>
      <td>${item.amount}</td>
      <td>${item.xl}</td>
      
      <td>
      <c:set var="pics" value="${fn:split(item.pics, ',')}" />
      <img  class="img-responsive"
    	src="${pageContext.request.contextPath}/watch/images/${pics[0]}" alt="" title="" border="0" /></td>
      <td>${book.bookSpecil }</td>
      <td>${book.bookDiscount }</td>
      <td><a href="edit?id=${item.watchid}"  class="btn btn-primary btn-normal btn-inline btn_form button item_add item_1" target="_self" href="/css/" target="_blank">修改</a></td> 
     <td><a href="delete?id=${item.watchid}"  class="btn btn-primary btn-normal btn-inline btn_form button item_add item_1" target="_self" href="/css/" target="_blank" onclick="if(confirm('确认删除此商品?')==false)return false;">删除</a></td> 
    </tr>
   </c:forEach>
	
	
	</table>
	
	
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