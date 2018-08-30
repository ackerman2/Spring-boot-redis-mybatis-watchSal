<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Home</title>
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
<div class="banner">

		<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
            <%@ taglib prefix="fn" 
           uri="http://java.sun.com/jsp/jstl/functions" %>
           
		
<c:import url="head.jsp" charEncoding="utf-8" />
</div>
   <div class="main">
    <div class="container">
    	<ul class="content-home">
    	<c:forEach items="${RandWatch}" var="item" >
      <li class="col-sm-4">
              <a href="single/${item.watchid}" class="item-link" title="">
                <div class="bannerBox">
                 <c:set var="pics" value="${fn:split(item.pics, ',')}"/>
                   <img src="${pageContext.request.contextPath}/watch/images/${pics[4] }" class="item-img" title="" alt="" width="100%" height="100%">
                   <div class="item-html">
                  <span>${item.watchname}</span><br><br><br>
                      <p><font color="green"></font></p><br>
                      <button >查看详情!</button>
                   </div>
                </div>
              </a>
           </li> 
           </c:forEach>
     
           <div class="clearfix"> </div>         
       </ul>
    </div>
    <div class="middle_content">
    	<div class="container">
    		
    		<h2>记录点滴生活!</h2>
    	</div>
    </div>
   	<div class="content_middle_bottom">
   		<div class="header-left" id="home">
		      <section>
				<ul class="lb-album" >
					<li>
						<a href="#image-1">
							<img src="images/g1.jpg"  class="img-responsive" alt="image01"/>
							<span>love</span>
						</a>
						<div class="lb-overlay" id="image-1">
							<a href="#page" class="lb-close">x Close</a>
							<img src="images/g1.jpg"  class="img-responsive" alt="image01"/>
							<div>
								<h3>love <span>/love/</span></h3>
								<p>Dance performed on the tips of the toes</p>
							</div>
						</div>
					</li>
					<li>
						<a href="#image-2">
							<img src="images/g2.jpg"  class="img-responsive" alt="image02"/>
							<span>Port de bras</span>
						</a>
						<div class="lb-overlay" id="image-2">
							<img src="images/g2.jpg"  class="img-responsive" alt="image02"/>
							<div>							
								<h3>port de bras <span>/ˌpôr də ˈbrä/</span></h3>
								<p>An exercise designed to develop graceful movement and disposition of the arms</p>
							</div>
							<a href="#page" class="lb-close">x Close</a>
						</div>
					</li>
					<li>
						<a href="#image-3">
							<img src="images/g3.jpg"  class="img-responsive" alt="image03"/>
							<span>Plié</span>
						</a>
						<div class="lb-overlay" id="image-3">
							<img src="images/g3.jpg"  class="img-responsive" alt="image03"/>
							<div>							
								<h3>pli·é <span>/plēˈā/</span></h3>
								<p>A movement in which a dancer bends the knees and straightens them again</p>
							</div>
							<a href="#page" class="lb-close">x Close</a>
						</div>
					</li>
					<li>
						<a href="#image-4">
							<img src="images/g4.jpg"  class="img-responsive" alt="image04"/>
							<span>Adagio</span>
						</a>
						<div class="lb-overlay" id="image-4">
							<img src="images/g4.jpg"  class="img-responsive" alt="image04"/>
							<div>							
								<h3>a·da·gio <span>/əˈdäjō/</span></h3>
								<p>A movement or composition marked to be played adagio</p>
							</div>
							<a href="#page" class="lb-close">x Close</a>
						</div>
					</li>
					<li>
						<a href="#image-5">
							<img src="images/g5.jpg"  class="img-responsive" alt="image05"/>
							<span>Frappé</span>
						</a>
						<div class="lb-overlay" id="image-5">
							<img src="images/g5.jpg"  class="img-responsive" alt="image05"/>
							<div>							
								<h3>frap·pé<span>/fraˈpā/</span></h3>
								<p>Involving a beating action of the toe of one foot against the ankle of the supporting leg</p>
							</div>
							<a href="#page" class="lb-close">x Close</a>
						</div>
					</li>
					<li>
						<a href="#image-6">
							<img src="images/g6.jpg"  class="img-responsive" alt="image06"/>
							<span>Glissade</span>
						</a>
						<div class="lb-overlay" id="image-6">
							<img src="images/g6.jpg"  class="img-responsive" alt="image06"/>
							<div>							
								<h3>glis·sade <span>/gliˈsäd/</span></h3>
								<p>One leg is brushed outward from the body, which then takes the weight while the second leg is brushed in to meet it</p>
							</div>
							<a href="#page" class="lb-close">x Close</a>
						</div>
					</li>
					<li>
						<a href="#image-7">
							<img src="images/g7.jpg"  class="img-responsive" alt="image07"/>
							<span>Jeté</span>
						</a>
						<div class="lb-overlay" id="image-7">
							<img src="images/g7.jpg"  class="img-responsive" alt="image07"/>
							<div>							
								<h3>je·té <span>/zhə-ˈtā/</span></h3>
								<p>A springing jump made from one foot to the other in any direction</p>
							</div>
							<a href="#page" class="lb-close">x Close</a>
						</div>
					</li>
					<li>
						<a href="#image-8">
							<img src="images/g8.jpg"  class="img-responsive" alt="image08"/>
							<span>Piqué</span>
						</a>
						<div class="lb-overlay" id="image-8">
							<img src="images/g8.jpg"  class="img-responsive" alt="image08"/>
							<div>							
								<h3>pi·qué <span>/pēˈkā/</span></h3>
								<p>Strongly pointed toe of the lifted and extended leg sharply lowers to hit the floor then immediately rebounds upward</p>
							</div>
							<a href="#page" class="lb-close">x Close</a>
						</div>
					</li>
					<div class="clearfix"></div>
				</ul>
			</section>
		</div>
	  </div>
   </div>
   <%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
           
<c:import url="foot.jsp" charEncoding="utf-8" />
</body>
</html>		