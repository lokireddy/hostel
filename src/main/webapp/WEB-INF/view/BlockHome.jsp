<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<link rel="shortcut icon" type ="image/x-icon" href = "images/favicon.jpeg">
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!-- 		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"> -->
<!-- 		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> -->
<!-- 		<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script> -->
		<script src="js/jquery.min.js"></script>
		<script src="bootstrap/js/bootstrap.min.js"></script>
		<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
		<title>Blocks Home</title>
	</head>
	<body>

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
        <div class="mainbody-section text-center">
            <div class="container">
                <div class="row">
	                <div class="col-md-4 col-md-offset-4">
	                    <c:forEach items = "${BlockNames }" var = "block">
	                        <div class="menu-item blue">
	                            <a href="options.LoRe?bId=${block.key }&bName=${block.value}" >
	                                <br><br>
		                                <p style="font-size:50px">${block.value}</p>
	                                <br><br>
	                            </a>
	                        </div>
                        </c:forEach>
                     </div>
                </div>
            </div>
        </div>
	</body>
</html>