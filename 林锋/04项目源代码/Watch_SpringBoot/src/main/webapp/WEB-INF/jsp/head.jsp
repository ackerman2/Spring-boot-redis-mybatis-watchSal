<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
	<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
    
    <%@ taglib prefix="fn" 
           uri="http://java.sun.com/jsp/jstl/functions" %>
 	
 	<script type="text/javascript">	

 	function a(){
 		var watch_id =watch_id;
 	
 	$.post
 	(
 		"${pageContext.request.contextPath}/Cajax",
 	/* 	{"watch_id":watch_id}, */
 		function(data){
 				
 				if(data=="N"){
 					document.getElementById("ph1").innerHTML="";
 				
 				}
 				else{
 				
 		}
 		 
 		}
 	)
 	}
</script>
<div class="men_banner">
   	  <div class="container">
   	  	<div class="header_top">
   	  	   <div class="header_top_left">
	  	      <div class="box_11"><a href="${pageContext.request.contextPath}/checkout">
		      <%-- <h4><p>购物车: <span class="simpleCart_total"></span> (<span id="simpleCart_quantity" class="simpleCart_quantity"></span> 件)</p><img src="${pageContext.request.contextPath}/images/bag.png" alt=""/><div class="clearfix"> </div></h4> --%>
		      <h4><p>购物车: <span ></span> (<span id="ph1" >${Ccart}</span> 件)</p><img src="${pageContext.request.contextPath}/images/bag.png" alt=""/><div class="clearfix"> </div></h4>
		      </a></div>
	          <p class="empty" ><a " href="javascript:void(0)" onclick="a()" class="simpleCart_empty" >清空购物车</a></p>
	          <div class="clearfix"> </div>
	       </div>
           <div class="header_top_right">
		  <div class="lang_list">
				<select tabindex="4" class="dropdown">
					<option value="" class="label" value="">￥RMB</option>
					<option value="1">支付宝</option>
					<option value="2">微信</option>
				</select>
			 </div>
			 <ul class="header_user_info">
			  <c:if test="${user==null}">
			  <a class="login" href="${pageContext.request.contextPath}/login">
				<i class="user"> </i> 			
				<li class="user_desc">请登陆</li>				
			  </a>
			  </c:if>
			  
			  <c:if test="${user!=null}">
			  <i class="user"> </i> 			
			<%-- 	<li class="user_desc" ><font color="white">欢迎，${user.username}</font></li>	 --%>
				 <%-- <a class="user_desc" href="${pageContext.request.contextPath}/logout">欢迎，${user.username}</a> --%>
				  <a class="user_desc" href="${pageContext.request.contextPath}/user/index">欢迎，${user.username}</a>
				</c:if>
			  <div class="clearfix"> </div>
		     </ul>
		    <!-- start search-->
				<div class="search-box">
				   <div id="sb-search" class="sb-search">
					  <form action="${pageContext.request.contextPath}/men/搜索 " method="get">
						 <input class="sb-search-input" placeholder="请输入你要搜索的手表" type="search" name="search" id="search">
						 <input class="sb-search-submit" type="submit" value="">
						 <span class="sb-icon-search"> </span>
					  </form>
				    </div>
				 </div>
				 <!----search-scripts---->
				 <script src="${pageContext.request.contextPath}/js/classie1.js"></script>
				 <script src="${pageContext.request.contextPath}/js/uisearch.js"></script>
				   <script>
					 new UISearch( document.getElementById( 'sb-search' ) );
				   </script>
					<!----//search-scripts---->
		            <div class="clearfix"> </div>
			 </div>
		     <div class="clearfix"> </div>
	  </div>
	  <div class="header_bottom">
	   <div class="logo">
		  <h1><a href="${pageContext.request.contextPath}/index"><span class="m_1">W</span>atches</a></h1>
	   </div>
   	   <div class="menu">
	     <ul class="megamenu skyblue">
			<li><a class="color2" href="${pageContext.request.contextPath}/men/男表">男士</a>
			
			</li>
            <div class="copyrights">Collect from <a href="http://www.cssmoban.com/" >企业网站模板</a></div>
			<li><a class="color4" href="${pageContext.request.contextPath}/men/女表">女士</a>
				
				</li>				
				<li><a class="color10" href="${pageContext.request.contextPath}/brands">品牌</a></li>
				<li class="active grid"><a class="color3" href="${pageContext.request.contextPath}/men/热销">热销</a></li>
				<li >wwwwwwwwwwwww</li>
				<div class="clearfix"> </div>
			</ul>
			</div>
	        <div class="clearfix"> </div>
	        </div>
	    </div>
   </div>