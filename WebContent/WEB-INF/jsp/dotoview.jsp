<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html>
<head>
     <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
     <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
     <link rel="stylesheet" href="//code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css">
     
     <script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
	 <script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	 <script src="//code.jquery.com/ui/1.11.3/jquery-ui.js"></script>
     <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
     <title>Spring 3.0 MVC</title>
     <script>
		  $(function() {
		    $( "#datepicker" ).datepicker();
		  });
  </script>
</head>
<body>
<div class="container">
	<table class="table table-hover" style="width:100%">
		<tr>
			<th>Finish</th>
			<th>Description</th>
			<th>Due Date</th>
			<th>Edit</th>
			<th>Delete</th>
		</tr>
		<c:if test="${not empty lists}">
		<c:forEach var="listValue" items="${lists}">
		<tr id="${message}">
			<td><input type="checkbox" value=""></td>
			<td>${listValue[0]}</td> 
	    	<td>${listValue[1]}</td>
	    	<td><button id="edit" type="button" class="btn btn-warning">Edit</button></td>
	    	 <form:form action="delete" method="post" commandName="userForm">
	    		<td><button id="delete" type="button" class="btn btn-danger">Delete</button></td>
	  		 </form:form>
	  	</c:forEach>
	  	</tr>
	  	</c:if>
	</table>
	
	<!-- Button trigger modal -->
	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
	  Add new
	</button>
</div>

<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">Add ToDo</h4>
	      </div>
	      <form:form action="dotoview" method="post" commandName="userForm">
	      	<div class="modal-body">
		      	<label>Description</label>
		      	<form:input path="description" class="form-control" />
		      	
				<div class="form-inline">
					<div class="form-group">
				   		<label>Date</label>
				   		<form:input path="date" class="form-control" type="text" id="datepicker" />
				  	</div>
				</div>
			
	      		</div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        <button type="submit" class="btn btn-primary">Add</button>
		      </div>
      	</form:form>
	    </div>
	  </div>
	</div>
</body>


