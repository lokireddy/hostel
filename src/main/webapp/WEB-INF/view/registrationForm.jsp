<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<link rel="shortcut icon" type ="image/x-icon" href = "images/favicon.jpeg">
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
		<script src="//code.jquery.com/jquery-1.10.2.js"></script>
		  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
		  <link rel="stylesheet" href="/resources/demos/style.css">
		  <script>
		  $(function() {
		    $( "#join_date" ).datepicker();
		  });
		  </script>
		<title>Add User</title>
	</head>
<body>
	<form:form action="http://localhost:8080/MyProject/registerStudent.html" method="POST" commandName="registrationFormCommand">
		<table align="center">
			<tr>
				<td><form:label path="name">NAME:</form:label></td>  
           		<td><form:input path="name" ></form:input></td>
				<td><form:errors path="name"></form:errors></td>
			</tr>
			<tr>
				<td><form:label path="email">Email:</form:label></td>
				<td><form:input path="email"/></td>
				<td><form:errors path="email"></form:errors></td>
			</tr>
			<tr>
				<td><form:label path="mobile">Phone:</form:label></td>
				<td><form:input path="mobile"/></td>
				<td><form:errors path="mobile"></form:errors></td>
			</tr>
			<tr>
				<td><form:label path="age">Age:</form:label></td>
				<td><form:input path="age"/></td>
<%-- 				<td><form:errors path="age"></form:errors></td> --%><td><c:out value="${ageError}"></c:out></td>
			</tr>
			<tr>
				<td><form:label path="address">Address:</form:label></td>
				<td><form:textarea path="address"/></td>
				<td><form:errors path="address"></form:errors></td>
			</tr>
			<tr>
				<td><form:label path="id_proof">ID_Proof:</form:label></td>
				<td><form:input path="id_proof"/></td>
				<td><form:errors path="id_proof"></form:errors></td>
			</tr>
			<tr>
				<td><form:label path="join_date">Join Date</form:label></td>
				<td><form:input path="join_date"></form:input></td>
				<td><form:errors path="join_date"></form:errors></td>
			</tr>
			<tr>
				<td><form:label path="room">Room:</form:label></td>
				<td><form:input path="room"/></td>
				<td><form:errors path="room"/></td>
			</tr>
			<tr>
				<td><form:label path="fee">Amount</form:label></td>
				<td><form:input path="fee" value=""/></td>
				<%-- <td><form:errors path="fee"></form:errors></td> --%><td><c:out value="${feeError}"></c:out></td>
			</tr>
			<tr><td></td><td><input type="submit" value="Register"><input type="reset" value="Reset"></tr>
		</table>
	</form:form>
</body>
</html>