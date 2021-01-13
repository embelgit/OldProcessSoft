<!DOCTYPE html>
<%@page import="com.itextpdf.text.log.SysoLogger"%>
<%@ page contentType="text/html; charset=utf-8" language="java" %>

<%-- <%
   String abc = "english";
%> --%>

<% 
   String abc = "english";
   if (session != null) {
   
   if (session.getAttribute("lan") != null) {
	   abc = (String) session.getAttribute("lan");
   }}
   else{
	   abc="english";
   }
 %>


<head>

   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="description" content="" />
   
    <title>Login Page</title>
<script src="/processSoft/staticContent/js/jquery-1.12.3.min.js"></script>
<script src="/processSoft/staticContent/js/logout.js"></script>
<script src="/processSoft/staticContent/js/Authentication.js"></script>
    <!-- Bootstrap Core CSS -->
    <link href="/processSoft/staticContent/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/processSoft/staticContent/css/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/processSoft/staticContent/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/processSoft/staticContent/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- jQuery -->
    <script src="/processSoft/staticContent/js/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/processSoft/staticContent/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/processSoft/staticContent/js/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/processSoft/staticContent/js/sb-admin-2.js"></script>

</head>
<body  background="/processSoft/staticContent/images/offshore-oil-rig-drilling-platform-footage-009925989_prevstill.jpeg" >
	<div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title" style="font-weight: bold;">Please Login :</h3>
                                                                            
                    </div>
                    <div class="panel-body">
                        <form name="Login" action="Login" method="post">
                            <div>
                                <div class="form-group">
								<!-- 	<label><span class="glyphicon glyphicon-user"></span>User Name :</label> -->
										<label><span class=""></span>User Name :</label>
                                    <input class="form-control" placeholder="Username" name="uname" id="uname" type="text" autofocus onchange="getShopNameForLogin()">
                                </div>
                                <div class="form-group">
									<!-- <label><span class="glyphicon glyphicon-eye-open"></span>Password :</label> -->
									<label><span class=""></span>Password :</label>
                                    <input class="form-control" placeholder="Password" name="pass" id="pass" type="password" value="">
                                </div>
                                
                               <div class="form-group">
									<label><span class=""></span>Shop Name:</label><br>
									<input list="shopname_drop"  placeholder="Shop Name" name="pass" id="shopname">
									<datalist id="shopname_drop"></datalist>
								</div><br>
					
								<!-- <div class="login-check">
									 <label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i> </i> Keep me logged in</label>
								</div> -->
                              
                                <!-- Change this to a button or input when using this as a form -->
                                <div class="wrapper">
	                                <button type="button" onclick="login2()" class="btn btn-md btn-lg btn-success"> <span class=""></span>Login</button>
	                                <button type="reset"  class="btn btn-md btn-lg btn-danger"> <span class=""></span>Reset</button>
	                            </div>
	                            <!-- <div class="form-group">
	                            <a href="/Fertilizer/jsp/userDetails.jsp">New User Registration</a>
	                            </div>  -->
                            </div>
                        </form>
                    </div>
                </div>
            </div>
       <!--      <div class="col-md-4" style="float: right;">
            	<div class="col-md-2">
            		<label>Select language:</label>
            	</div>
            	<div class="col-md-2">
            		<select class="selectpicker" id="language" name="language" data-style="btn-primary" onchange="language()">
            		    <option value="select">select Language</option>
 						<option value="marathi">Marathi</option>
 						<option value="english">English</option>
					</select>
            	</div>
            </div> -->
        </div>
    </div>
</body>
</html>