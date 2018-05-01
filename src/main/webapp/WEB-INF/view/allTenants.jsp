<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<link rel="shortcut icon" type ="image/x-icon" href = "images/favicon.jpeg">
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<script src="js/jquery.min.js"></script>
		<script src="bootstrap/js/bootstrap.min.js"></script>
		<script src = "js/jquery.searchable-1.1.0.min.js"></script>
		<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	    <link href="css/style.css" rel="stylesheet">
	    
	    <script src="js/jquery-1.11.1.min.js"></script>
<!-- 	    <link rel="stylesheet" href="bootstrap/css/font-awesome.min.css"> -->
		<link rel="stylesheet" href="bootstrap/css/bootstrap-datepicker3.css"/>	    
	    <link rel="stylesheet" href="bootstrap/css/bootstrap-iso.css" />
		<link rel="stylesheet" href="css/font-awesome.min.css" />	    
	    <link rel="stylesheet" href="bootstrap/css/bootstrap-select.min.css">
		<script src="bootstrap/js/bootstrap-select.min.js"></script>	    
	    <script type="text/javascript" src="bootstrap/js/bootstrap-datepicker.min.js"></script>
	    	
<!-- 	    <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script> -->
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
<!-- 		<link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'> -->
<!-- 		<link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'> -->
		
		<!-- 	    Date picker -->
<!-- 	    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script> -->
<!-- 		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/> -->
<!-- 	    <link rel="stylesheet" href="https://formden.com/static/cdn/bootstrap-iso.css" /> -->
		

		<!--Font Awesome (added because you use icons in your prepend/append)-->
<!-- 		<link rel="stylesheet" href="https://formden.com/static/cdn/font-awesome/4.4.0/css/font-awesome.min.css" /> -->
		<style>.bootstrap-iso .formden_header h2, .bootstrap-iso .formden_header p, .bootstrap-iso form{font-family: Arial, Helvetica, sans-serif; color: black}.bootstrap-iso form button, .bootstrap-iso form button:hover{color: white !important;} .asteriskField{color: red;}</style>
	    
		<!-- 	    Drop down -->
<!-- 	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/css/bootstrap-select.min.css"> -->
	    
		<!-- Latest compiled and minified JavaScript -->
<!-- 		<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.min.js"></script> -->

		    <style type="text/css">
			.main{
			 	margin-top: 30px;
			}
			
			hr{
				width: 10%;
				color: #fff;
			}
			
			.form-group{
				margin-bottom: 15px;
			}
			
			label{
				margin-bottom: 15px;
			}
			
			input,
			input::-webkit-input-placeholder {
			    font-size: 11px;
			    padding-top: 3px;
			}
			
			.main-login{
			 	background-color: #fff;
			    /* shadows and rounded borders */
			    -moz-border-radius: 2px;
			    -webkit-border-radius: 2px;
			    border-radius: 2px;
			    -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
			    -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
			    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
			
			}
			
			.main-center{
			 	margin-top: 30px;
			 	margin: 0 auto;
			 	max-width: 330px;
			    padding: 40px 40px;
			
			}
			
			.login-button{
				margin-top: 5px;
			}
			
			.login-register{
				font-size: 11px;
				text-align: center;
			}
			.err{
				color:red;
			}
			.form-group.required .control-label:after { 
			   content:"*";
			   color:red;
			}
			.jumbotron h1{
				color: white;
			}
			h2,h1,th {
 			   color: white;
			}
			.row-padding {
 			   	margin-top: 25px;
				margin-bottom: 25px;
			}
	    </style>

	</head>
	<body>
	    <!-- Start Logo Section -->
        <section id="logo-section" class="text-center">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div style = "background:transparent !important" class="jumbotron">
                            <h1><c:out value = "${hostelName}"/></h1>
                            
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Logo Section -->

		<div class="container" >
		   <div class="row">
			   <div class="form-group col-lg-2 col-lg-offset-2">
					<select class="form-control selectpicker show-menu-arrow show-tick ">
			   				<option value = "pmhb1">Loki Block_1</option>
							<option value = "pmhb2">Kanth Block_3</option>
							<option value = "pmhb3">Reddy Block_2</option>
		   			</select>		   		
	   			</div>
		   		<div class="form-group col-lg-6">
		           <input type="search" id="search" value="" class="form-control" placeholder="Start typing to Search">
		       	</div>
		   </div>
		   <br>
		   <div class="row">
		       <div class="table-responsive col-lg-12">
		           <table class="table" id="table">
		               <thead>
		                   <tr>
		                       <th>Update</th>
		                       <th>Name</th>
		                       <th>Mobile</th>
		                       <th>Room</th>
		                       <th>Gov. ID</th>
		                       <th>Email</th>
		                       <th>Date of Join</th>
		                       <th>Address</th>
		                       <th>Amount Paid</th>
		                       <th>Vacating Date</th>
		                       <th>Delete/Vacated</th>
		                   </tr>
		               </thead>
		               <tbody>
								<c:forEach items = "${ all}" var = "person">
								<tr>								
			                       <td align="center"><a href = "/manager/updatePerson.LoRe?pId=<c:out value =  "${person.autoId}"/>&bId=${bId }&bName=${hostelName}">Edit&nbsp&nbsp&nbsp<i class="fa fa-pencil-square-o" aria-hidden="true"></i></a></td>
			                       <td><c:out value = "${ person.name}"></c:out></td>
			                       <td><c:out value = "${ person.mobile}"></c:out></td>
			                       <td><c:out value = "${ person.room}"></c:out></td>
			                       <td><c:out value = "${ person.id}"></c:out></td>
			                       <td><c:out value = "${ person.email}"></c:out></td>
			                       <td><c:out value = "${ person.doj}"></c:out></td>
			                       <td><c:out value = "${ person.address}"></c:out></td>
			                       <td align="right"><c:out value = "${ person.amount}"></c:out></td>
			                       <c:choose>
			                       		<c:when test="${empty person.dov }">
			                       			<td align="center">None</td>
			                       		</c:when>
			                       		<c:otherwise>
											<td><c:out value = "${ person.dov}"></c:out></td>			                       		
			                       		</c:otherwise>
			                       </c:choose>
			                       <td align="center"><a  href = "/deletePerson?pId=<c:out value =  "${person.autoId}"/>&bId=${bId }&bName=${hostelName}">Delete &nbsp&nbsp&nbsp<i class="fa fa-trash fa" aria-hidden="true"></i></a></td>
			                   </tr>
			                   </c:forEach>
		               </tbody>
		           </table>
		           <hr>
		       </div>
		</div>
		</div>
		<script type="text/javascript">
		$(function () {
		    $( '#table' ).searchable({
		        striped: true,
		        oddRow: { 'background-color': '#f5f5f5' },
		        evenRow: { 'background-color': '#fff' },
		        searchType: 'fuzzy'
		    });
		    
		    $( '#searchable-container' ).searchable({
		        searchField: '#container-search',
		        selector: '.row',
		        childSelector: '.col-xs-4',
		        show: function( elem ) {
		            elem.slideDown(100);
		        },
		        hide: function( elem ) {
		            elem.slideUp( 100 );
		        }
		    })
		});
		</script>
	</body>
</html>