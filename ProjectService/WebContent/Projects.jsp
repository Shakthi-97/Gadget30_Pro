<%@page import="com.Project"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Project Management</title>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/pro.js"></script>
</head>
<body>

 <div class="container"><div class="row"><div class="col-6">

<h1 style="text-align:center">Project Management</h1>

<form id="formProject" name="formProject" method="post">

 		Project Code: 
 	    <input id="projectCode" name="projectCode" type="text"  
 	    		class="form-control form-control-sm">
 	    
 		<br> Project Category:
 		<input id="projectCategory" name="projectCategory" type="text"
 				 class="form-control form-control-sm">
 		
 		<br>Project Name:
 	    <input id="projectName" name="projectName" type="text" 
 	    		class="form-control form-control-sm">
 	    
 		<br>Project Description:
 		<input id="projectDescrip"name="projectDescrip" type="text"
 				 class="form-control form-control-sm">
 		
 		<br>Project price:
 		<input id="projectPrice"name="projectPrice" type="text"
 				 class="form-control form-control-sm">
 		
 		
 		<br>No of Projects Available:
 		<input id="no_of_pro"name="no_of_pro" type="text"
 				 class="form-control form-control-sm">
 		
 		<br>
 		<input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-primary"> 
 		<input type="hidden" id="hidProIDSave" name="hidProIDSave" value="">
 		
</form>



<!-- ---Alert Messagaes  -->
<div id="alertSuccess" class="alert alert-success"></div>
<div id="alertError" class="alert alert-danger"></div>


<br>

<div id="divProjectsGrid">
	<%
		Project itemObj = new Project();
 		out.print(itemObj.readProjects());
	%>

</div>

</div></div></div>



</body>
</html>