<%@page import="com.Project"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%


//Save---------------------------------
if (request.getParameter("projectCode") != null) 
{ 
	Project itemObj = new Project(); 
String stsMsg = ""; 

//Insert--------------------------
if (request.getParameter("hidItemIDSave") == "") 
{ 
stsMsg = itemObj.insertProject(request.getParameter("projectCode"), 
		request.getParameter("projectCategory"),
		request.getParameter("projectName"),
		request.getParameter("projectDescrip"),
		request.getParameter("projectPrice"),
		request.getParameter("no_of_pro")); 
} 



else//Update----------------------
{ 
stsMsg = itemObj.updateProject(request.getParameter("hidItemIDSave"), 
		request.getParameter("projectCode"),
		request.getParameter("projectCategory"),
		request.getParameter("projectName"),
		request.getParameter("projectDescrip"),
		request.getParameter("projectPrice"),
		request.getParameter("no_of_pro")); 
} 
session.setAttribute("statusMsg", stsMsg); 
} 



//Delete project----------------------------------
if (request.getParameter("hidItemIDDelete") != null)

  {
	
		Project itemObj = new Project();
		
		String stsMsg = itemObj.deleteProject(request.getParameter("hidItemIDDelete"));
		
		session.setAttribute("statusMsg", stsMsg);

} 



%>    
    
    
    
    
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

<div class="container">
 <div class="row">
 <div class="col">

<h1 style="text-align:center">Project Management</h1>

<form id="formItem" name="formItem" method="post" action="Projects.jsp">
 		Project Code: 
 	    <input id="projectCode" name="projectCode" type="text"  class="form-control form-control-sm">
 	    
 		<br> Project Category:
 		<input id="projectCategory" name="projectCategory" type="text" class="form-control form-control-sm">
 		
 		<br>Project Name:
 	    <input id="projectName" name="projectName" type="text" class="form-control form-control-sm">
 	    
 		<br>Project Description:
 		<input id="projectDescrip"name="projectDescrip" type="text" class="form-control form-control-sm">
 		
 		<br>Project price:
 		<input id="projectPrice"name="projectPrice" type="text" class="form-control form-control-sm">
 		<br>
 		
 		<br>No of Projects Available:
 		<input id="no_of_pro"name="no_of_pro" type="text" class="form-control form-control-sm">
 		<br>
 		
 		<br>
 		<input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-primary"> 
 		<input type="hidden" id="hidItemIDSave" name="hidItemIDSave" value="">
 		
</form>




<div id="alertSuccess" class="alert alert-success">
<% out.print(session.getAttribute("statusMsg"));%>
</div>
<div id="alertError" class="alert alert-danger">
<% out.print(session.getAttribute("statusMsg"));%>
</div>



		<br>
<%
		Project itemObj = new Project();
 		out.print(itemObj.readProjects());
%>

</div>
</div>
</div>


</body>
</html>