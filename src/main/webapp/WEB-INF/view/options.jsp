
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<link rel="shortcut icon" type ="image/x-icon" href = "images/favicon.jpeg">
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Options</title>
	    <script src="js/jquery.min.js"></script>
		<script src="bootstrap/js/bootstrap.min.js"></script>
		<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	    <link href="css/style.css" rel="stylesheet">
		<style>
		        p{
		        	font-size:50px;
		        }
		</style>
	</head>
<body>
<!-- 	<div class="container">  -->
<%-- 			<h1>Welcome... <c:out value = "${hostelName}"/></h1> --%>
		
<%-- 			<c:forEach items = "${BlockNames }" var = "block"> --%>
			
<%-- 				<h2> ${block.value} </h2> --%>
			
<%-- 			</c:forEach> --%>
        <!-- Start Logo Section -->
        <section id="logo-section" class="text-center">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="logo text-center">
                            <h1><c:out value = "${hostelName}"/></h1>
                            
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Logo Section -->
        
        
        <!-- Start Main Body Section -->
        <div class="mainbody-section text-center">
            <div class="container">
                <div class="row">
                    
                    <div class="col-md-6">
                        
                        <div class="menu-item blue">
                            <a href="addTenant.LoRe?bId=${bId }&bName=${hostelName}">
                                <br><br>
                                <p style="font-size:50px">New Tenant</p>
                                <br><br>
                            </a>
                        </div>
                        
                        <div class="menu-item green">
                            <a href="voruTenant.LoRe?bId=${bId }&bName=${hostelName} ">
								<br><br>
                                <p style="font-size:50px">View/Update Tenant </p>
                                <br><br>
                            </a>
                        </div>
                        
                        <div class="menu-item light-red">
                            <a href="#">
								<br><br>
                                <p style="font-size:50px">Pay Rent</p>
                                <br><br>
                            </a>
                        </div>
                        
                    </div>
                    <div class="col-md-6">
                        
                        <div class="menu-item light-red">
                            <a href="#">
								<br><br>
                                <p style="font-size:50px">Vacancies</p>
                                <br><br>
                            </a>
                        </div>
                        
                        <div class="menu-item color">
                            <a href="#">
								<br><br>
                                <p style="font-size:50px">Vacating Tenants</p>
                                <br><br>
                            </a>
                        </div>
                        
                        <div class="menu-item blue">
                            <a href="#">
								<br><br>
                                <p style="font-size:50px">All Tenants</p>
                                <br><br>
                            </a>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
</body>
</html>