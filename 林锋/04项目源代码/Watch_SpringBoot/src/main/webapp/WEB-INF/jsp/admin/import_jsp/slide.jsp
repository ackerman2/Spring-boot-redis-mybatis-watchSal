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
		        <li id="menu-home" ><a href="index1"><i class="fa fa-tachometer"></i><span>主页</span><span class="fa fa-angle-right" style="float: right"></span></a>
		        <ul id="menu-academico-sub" >
			            <li id="menu-academico-avaliacoes" ><a href="index2">查看品牌</a></li>
			            <li id="menu-academico-boletim" ><a href="index1">查看手表</a></li>
		             </ul>
		        </li>
		        <br>
		          
		            <li id="menu-academico" ><a href="index"><i class="fa fa-file-text"></i><span>订单管理</span><span class="fa fa-angle-right" style="float: right"></span></a>
		          <ul id="menu-academico-sub" >
		          	 <li id="menu-academico-boletim" ><a href="index_1">已送达订单</a></li>
		            <li id="menu-academico-avaliacoes" ><a href="index_0">未送达订单</a></li>		           
		          </ul>
		        </li> 
		          
		          <br>	        
		         <li><a href="index1"><i class="fa fa-shopping-cart"></i><span>产品管理</span><span class="fa fa-angle-right" style="float: right"></span></a>
		         	<ul id="menu-academico-sub" >
			            <li id="menu-academico-avaliacoes" ><a href="Badd">新增品牌</a></li>
			            <li id="menu-academico-boletim" ><a href="add">新增手表</a></li>
		             </ul>
		         </li>
		      </ul>
		    </div>
	 </div>
	<div class="clearfix"> </div>
</div>