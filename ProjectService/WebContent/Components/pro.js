$(document).ready(function(){
 
		if ($("#alertSuccess").text().trim() == ""){ 
				$("#alertSuccess").hide(); 
		} 
		$("#alertError").hide(); 
				
}); 


//SAVE ============================================
$(document).on("click", "#btnSave", function(event){ 
 
		// Clear alerts---------------------
		$("#alertSuccess").text(""); 
		$("#alertSuccess").hide(); 
		$("#alertError").text(""); 
		$("#alertError").hide();  
		
		
		//Form validation-------------------
		var status = validateProjectForm(); 
		if (status != true) {

			$("#alertError").text(status); 
			$("#alertError").show(); 
			return; 
  } 
		
		// If valid identify the method-------------------------
		var type = ($("#hidProIDSave").val() == "") ? "POST" : "PUT"; 
		
		//sending data to the DC Bus
		
		$.ajax({ 
				url : "ProjectsAPI", 
				type : type, 
				data : $("#formProject").serialize(), 
				dataType : "text", 
				complete : function(response, status) { 
						onProjectSaveComplete(response.responseText, status); 
			  } 
		
		}); 
 
 });



function onProjectSaveComplete(response, status){   
 
		if (status == "success") { 
 
			var resultSet = JSON.parse(response); 
			if (resultSet.status.trim() == "success") { 
 
				$("#alertSuccess").text("Project details have been saved successfully."); 
				$("#alertSuccess").show(); 
				$("#divProjectsGrid").html(resultSet.data); 
				
			} else if (resultSet.status.trim() == "error") {  

				$("#alertError").text(resultSet.data); 
				$("#alertError").show(); 
			} 
			
			} else if (status == "error")  {
 
				$("#alertError").text("Error while saving the projects."); 
				$("#alertError").show(); 
			} else {
 
				$("#alertError").text("Unknown error while saving.."); 
				$("#alertError").show(); 
			} 
		
			$("#hidProIDSave").val(""); 
			$("#formProject")[0].reset(); 
}



//UPDATE==========================================
$(document).on("click", ".btnUpdate", function(event) { 
 
	$("#hidProIDSave").val($(this).closest("tr").find('#hidProIDUpdate').val()); 
	$("#projectCode").val($(this).closest("tr").find('td:eq(0)').text()); 
	$("#projectCategory").val($(this).closest("tr").find('td:eq(1)').text()); 
	$("#projectName").val($(this).closest("tr").find('td:eq(2)').text()); 
	$("#projectDescrip").val($(this).closest("tr").find('td:eq(3)').text()); 
	$("#projectPrice").val($(this).closest("tr").find('td:eq(4)').text()); 
	$("#no_of_pro").val($(this).closest("tr").find('td:eq(5)').text()); 

});




//DELETE implementation
$(document).on("click", ".btnRemove", function(event) {
	
	$.ajax({
			url : "ProjectsAPI",
			type : "DELETE",
			data : "project_Id=" + $(this).data("proid"),
			dataType : "text",
			complete : function(response, status) {
					onProjectDeleteComplete(response.responseText, status);
			}
	});
	
});



function onProjectDeleteComplete(response, status) {   
	 
	if (status == "success") {

		var resultSet = JSON.parse(response); 
		if (resultSet.status.trim() == "success"){ 

			$("#alertSuccess").text("Project has been successfully deleted."); 
			$("#alertSuccess").show(); 
			$("#divProjectsGrid").html(resultSet.data);
			
		} else if (resultSet.status.trim() == "error") {

			$("#alertError").text(resultSet.data); 
			$("#alertError").show(); 
		} 
		
		} else if (status == "error") {

			$("#alertError").text("Error while deleting the project."); 
			$("#alertError").show(); 
		} else {

			$("#alertError").text("Unknown error while deleting.."); 
			$("#alertError").show(); 
		} 
}





//CLIENT-MODEL================================================================
function validateProjectForm() { 

	//CODE
	if ($("#projectCode").val().trim() == "") {
 
		return "Insert Project Code."; 
	} 
	
	//CATEGORY
	if ($("#projectCategory").val().trim() == "") {
 
		return "Insert Project Category."; 
	} 
	
	//NAME
	if ($("#projectName").val().trim() == "") {
 
		return "Insert Project Name."; 
	} 
	
	//DESCRIPTION
	if ($("#projectDescrip").val().trim() == "") {
 
		return "Insert Project Description."; 
	}

	//PRICE-------------------------------
	if ($("#projectPrice").val().trim() == "") {
 
		return "Insert Project Price."; 
	} 
	
	//is numerical value
	var tmpPrice = $("#projectPrice").val().trim(); 
	if (!$.isNumeric(tmpPrice)) {
 
		return "Insert a numerical value for Project Price."; 
	} 
	
	//convert to decimal price
	$("#projectPrice").val(parseFloat(tmpPrice).toFixed(2)); 
	
	//AVAILABLE PROJECTS------------------------
	if ($("#no_of_pro").val().trim() == ""){ 
 
		return "Insert available no of projects."; 
	} 
	
	//is numerical value
	var tmpPro = $("#no_of_pro").val().trim(); 
	if (!$.isNumeric(tmpPro)) {
 
		return "Insert a numerical value for available projects."; 
	}
	
	return true; 
}
