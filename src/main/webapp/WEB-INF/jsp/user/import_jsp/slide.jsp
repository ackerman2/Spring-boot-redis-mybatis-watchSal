   <%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
    
    <%@ taglib prefix="fn" 
           uri="http://java.sun.com/jsp/jstl/functions" %>
  <div class="sidebar-menu">
		  	<div class="logo"> <a href="#" class="sidebar-icon"> <span class="fa fa-bars"></span> </a> <a href="#"> <span id="logo" ></span> 
			      <!--<img id="logo" src="" alt="Logo"/>--> 
			  </a> </div>		  
		    <div class="menu">
		      <ul id="menu" >
		        <li id="menu-home" ><a href="index"><i class="fa fa-tachometer"></i><span>主页</span></a>
		      
		        </li>
		        <br>
		          	        
		         <li><a href="index"><i class="fa fa-shopping-cart"></i><span>管理中心</span><span class="fa fa-angle-right" style="float: right"></span></a>
		         	<ul id="menu-academico-sub" >
			            <li id="menu-academico-avaliacoes" ><a href="editUser">修改个人信息</a></li>
			            <li id="menu-academico-boletim" ><a href="editPwd">修改密码</a></li>
		             </ul>
		         </li>
		      </ul>
		    </div>
	 </div>
	<div class="clearfix"> </div>
</div>