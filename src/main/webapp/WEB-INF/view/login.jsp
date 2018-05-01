<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<link rel="shortcut icon" type ="image/x-icon" href = "images/favicon.jpeg">
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<!-- <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"> -->
		<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script> -->
		<!-- <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script> -->
		
		<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
		<script src="js/jquery.min.js"></script>
		<script src="bootstrap/js/bootstrap.min.js"></script>
		<link href="css/style.css" rel="stylesheet">
		<style>
		
		td {
		padding-top: .5em;
		padding-bottom: .5em;
		}
		.panel-heading .msg { float:right }
		.panel-heading .login { float:left }
		
		.panel-default {
		opacity: 0.9;
		margin-top:50%;
		}
		
		</style>
		
		<title>Log in</title>
		<style>
			.err{
				color:red;
			}
		</style>
	</head>
<body background="images/background.jpg">
<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <span class="glyphicon glyphicon-lock login"></span> Login
                    <span class="err msg" style="text-align:right"> ${status }</span>
                </div>
                <div class="panel-body">
                    <form class="form-horizontal" role="form" action="signin.LoRe" method="post">
                    <div class="form-group">
                    <form:label cssClass="col-sm-3 control-label" path="loginForm.uid">User Id:</form:label>
                    
                        <div class="col-sm-9">
                        <form:input cssClass="form-control cl-sm-3" path="loginForm.uid" placeholder="Email" />
                        <form:errors path="loginForm.uid" class="err"/>
                        </div>
                    </div>
                    <div class="form-group">
                    <form:label cssClass="col-sm-3 control-label" path="loginForm.pwd">Password:</form:label>
                  
                        <div class="col-sm-9">
                        <form:password cssClass="form-control cl-sm-3" path="loginForm.pwd" placeholder="Password"></form:password>
                          <form:errors path="loginForm.pwd" class="err"/>
                        </div>
                    </div>
<!--                     <div class="form-group"> -->
<!--                         <div class="col-sm-offset-3 col-sm-9"> -->
<!--                             <div class="checkbox"> -->
<!--                                 <label> -->
<!--                                     <input type="checkbox"/> -->
<!--                                     Remember me -->
<!--                                 </label> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
                    <div class="form-group last">
                        <div class="col-sm-offset-3 col-sm-9">
                            <button type="submit" class="btn btn-success btn-sm">
                                Sign in</button>
                                 <button type="reset" class="btn btn-default btn-sm">
                                Reset</button>
                        </div>
                    </div>
                    </form>
                </div>
                <div class="panel-footer">
                    Not Registred? <a href="register.LoRe">Register here</a></div>
            </div>
        </div>
    </div>
</div>






















<!-- 

	<div class="container">
	<form:form action="http://localhost:8080/MyProject/loginUser.html" cssClass="form-inline"  method="POST" commandName="loginForm">
		
		<table style="margin: 0px auto;" align="center">
			<tr>
			<div class="cl-xs-2 cl-sm-12">
				<td class="cl-xs-12 cl-sm-12"><form:label cssClass="col-sm-3 control-label" path="uid">User Name:</form:label></td>
				<td class="cl-xs-12 cl-sm-12"><form:input cssClass="form-control cl-sm-3" path="uid"/></td>
				<td class="cl-xs-12 cl-sm-12"><form:errors path="uid" class="err"/></td>
			</div>
			</tr>
			<tr>
				<td><form:label cssClass="col-sm-3 control-label" path="pwd">Password:</form:label></td>
				<td><form:password cssClass="form-control cl-sm-3" path="pwd"></form:password></td>
				<td><form:errors path="pwd" class="err"/></td>
			</tr>
			<tr>
				<td></td><td><input class="form-control btn btn-warning" type="submit" value="Login"><input class="form-control btn btn-success btn-md" style=" float:right" type="reset" value="Reset"></td>
		</tr>
<%-- 		<tr><td><form:errors path="errors" class="err"/></td></tr> --%>
		</table>
		</div>
		</form:form>
	 -->	
</body>
</html>

