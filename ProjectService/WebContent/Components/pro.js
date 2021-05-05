$(document).ready(function()
{ 
if ($("#alertSuccess").text().trim() == "") 
 { 
 $("#alertSuccess").hide(); 
 } 
 $("#alertError").hide(); 
}); 
//SAVE ============================================
$(document).on("click", "#btnSave", function(event) 
{ 
// Clear alerts---------------------
 $("#alertSuccess").text(""); 
 $("#alertSuccess").hide(); 
 $("#alertError").text(""); 
 $("#alertError").hide(); 
//Form validation-------------------
 var status = validateItemForm(); 
 if (status != true) 
  { 
  $("#alertError").text(status); 
  $("#alertError").show(); 
  return; 
  } 
 // If valid-------------------------
  $("#formItem").submit(); 
 });


// UPDATE==========================================
$(document).on("click", ".btnUpdate", function(event) 
{ 
 $("#hidItemIDSave").val($(this).closest("tr").find('#hidItemIDUpdate').val()); 
 $("#projectCode").val($(this).closest("tr").find('td:eq(0)').text()); 
 $("#projectCategory").val($(this).closest("tr").find('td:eq(1)').text()); 
 $("#projectName").val($(this).closest("tr").find('td:eq(2)').text()); 
 $("#projectDescrip").val($(this).closest("tr").find('td:eq(3)').text()); 
 $("#projectPrice").val($(this).closest("tr").find('td:eq(4)').text()); 
 $("#no_of_pro").val($(this).closest("tr").find('td:eq(5)').text()); 

});


//CLIENT-MODEL================================================================
function validateItemForm() 
{ 
// CODE
if ($("#projectCode").val().trim() == "") 
 { 
 return "Insert Project Code."; 
 } 
// CATEGORY
if ($("#projectCategory").val().trim() == "") 
 { 
 return "Insert Project Category."; 
 } 
//NAME
if ($("#projectName").val().trim() == "") 
 { 
 return "Insert Project Name."; 
 }
//DESCRIPTION
if ($("#projectDescrip").val().trim() == "") 
 { 
 return "Insert Project Description."; 
 }

//PRICE-------------------------------
if ($("#projectPrice").val().trim() == "") 
 { 
 return "Insert Project Price."; 
 } 
// is numerical value
var tmpPrice = $("#projectPrice").val().trim(); 
if (!$.isNumeric(tmpPrice)) 
 { 
 return "Insert a numerical value for Project Price."; 
 } 
// convert to decimal price
 $("#projectPrice").val(parseFloat(tmpPrice).toFixed(2)); 
// Available------------------------
if ($("#no_of_pro").val().trim() == "") 
 { 
 return "Insert available no of projects."; 
 } 
return true; 
}