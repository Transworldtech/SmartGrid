<%@ include file="headernew.jsp"%>

<%! Connection conn = null;
	Statement st = null;
	Statement st1 = null;
	Statement st2 = null;
%>
<script type="text/javascript" language="javascript" src="calendar/prototype-1.js"></script>
<script type="text/javascript" language="javascript" src="calendar/prototype-base-extensions.js"></script>
<script type="text/javascript" language="javascript" src="calendar/prototype-date-extensions.js"></script>
<script type="text/javascript" language="javascript" src="calendar/behaviour.js"></script>
<script type="text/javascript" language="javascript" src="calendar/datepicker.js"></script>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="calendar/datepicker.css">
<script type="text/javascript" language="javascript" src="calendar/behaviors.js"></script>
<%-- <%@page contentType="text/html" pageEncoding="UTF-8"%> --%>
<!DOCTYPE html>
<html >
    <head>
      <link type="text/css" rel="stylesheet" href="style.css" />
  <!--   <link type="text/css" rel="stylesheet" href="reset.css" />  -->      
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><!--         <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
 -->
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>
 
 <script type="text/javascript">
jQuery(function($){
	var $email = $('#mediafile1'), count = 1;

	$('#addemail').click(function(e){
		e.preventDefault();
		var idname = 'mediafile' + (++count);
		$email.parent().append($email.clone().attr({id: idname, name: idname}));
	});
	$( '#btRemove' ).click(function() {
		$('#mediafile1').remove();
		});

});


</script>



 <script type="text/javascript">

 function validate() 
 {
		/* var $email = $('#mediafile1'), count = 1;
		var idname = 'mediafile' + (++count); */
	 	 var schname=document.getElementById("schname").value;
	 	 var mediatype=document.getElementById("mediatype").value;

	 	 var media=document.getElementById("mediafile1").value;
	 	 var Duration=document.getElementById("Duration").value;

	 	
	 	var letters = /^[0-9a-zA-Z]+$/; 
	if(schname.trim()=="")
	{
    swal("Please Enter Schedule Name.");

	return false;
	}
 

	 	if(schname.trim().match(letters)) 
	 	{ 
	 	} 
	 	else 
	 	{ 
	 		swal('Please Enter Valide Schedule Name.'); 
	 	return false; 
	 	} 

	 	
	 if(mediatype=="select")
	{
	//alert("Please Select mediatype");
	    swal("Please Select mediatype.");

	return false;
	}
 	if(media=="Select")
 		{
 		//alert("Please Select media");
 		swal("Please Select media.");

 		return false;
 		}
 	
 	if(Duration.trim()=="")
	{
//	alert("Please Enter Schedule Name");
    swal("Please Enter Duration.");

	return false;
	}
 	 	
 }
        function showmediafile()
       {

       	//alert("hi");
       	var mediatype = document.getElementById("mediatype").value;
       
       	
       	var ajaxRequest;  // The variable that makes Ajax possible!
       	try{
       		// Opera 8.0+, Firefox, Safari
       		ajaxRequest = new XMLHttpRequest();
       	}  
       	catch (e)
       	{
       		// Internet Explorer Browsers
       		try
       		{
       			ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
       		} 
       		catch (e)
       		{
       			try
       			{
       				ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
       			} 
       			catch (e)
       			{
       				// Something went wrong
       				alert("Your browser broke!");
       				return false;
       			}
       		}
       	}
       	ajaxRequest.onreadystatechange = function()
       	{
       		if(ajaxRequest.readyState == 4)
       		{
       			var reslt=ajaxRequest.responseText;
       			//alert(reslt);
       			document.getElementById("mediafile1").disabled = false;
       			document.getElementById("mediafile1").innerHTML=reslt;
       		
       		} 
       	};
       	
       	var queryString = "?mediatype="+mediatype;
       	//alert(queryString);
       	ajaxRequest.open("GET", "AjaxMediaFile.jsp" + queryString, true);
       	ajaxRequest.send(null); 
       	
       	
       }
        </script>
        
     
        <title>Registration</title>
                
    </head>
   
    <body  >
        <form name=userinfo method="post" action="CreateDefaultScheduleAction.jsp" >
    
            <br>
            <div class="module form-module"  >
           <div class="toggle">
           </div>
           <div class="form" >
          
    <h2 align="center">Create Default Schedule</h2>

     
     <% 
     
     Class.forName(MM_dbConn_DRIVER);
	 conn = DriverManager.getConnection(MM_dbConn_STRING, MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
st=conn.createStatement();
st1=conn.createStatement();
st2=conn.createStatement();
 	String company = session.getAttribute("company").toString();
     String VehregNo = "select distinct(VehicleRegNumber)  from db_gps.t_vehicledetails where ownername like '%"+company+"%' and description='SmartGrid' and status='-' ";
     String route="select distinct(Routename)  from smartgrid.t_routemaster where owner like '%"+company+"%'";
    
     ResultSet resultset =st2.executeQuery("select typevalue  as  CompanyName from db_gps.t_transporter where ActiveStatus='Yes' and category='SMARTGRID'") ;
     
     ResultSet rs=st.executeQuery(VehregNo);
     ResultSet rs1=st1.executeQuery(route);
     /* String Value="<script>document.writeln(idname)</script>";

	 System.out.println("Value==>"+Value); */

     %>
     <%int i=1;
        %>
     
    
     <font color="red">*</font> <font color="black" size="2">Schedule Name:</font>
          <input type="text" placeholder="Schedule Name" id="schname" name="schname" value="">
               <font color="red">*</font>  <font color="black" size="2">Media Type:</font><br>
<select class="element select medium" name="mediatype" id="mediatype" onchange="showmediafile();">
<option value="select">Select</option>
 <option value="image">Image</option>
 <option value="video">Video</option>
 

</select>
 <div id="emails">
     <table  style="width: 107%;">
     <tr>
     <td>
<font color="red">*</font> <font color="black" size="2">Media File:</font>
		 <br> <select   class="element select medium" disabled="disabled"  id="mediafile1" name="mediafile1" >
			 <option value="Select">Select &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
</select>
        </td>

    
    <%--  <select  name="email1" id="email1" onchange="AjaxLocVehreg();">
        <option value="select"  selected="selected">*Select Company</option>
        <%  while(resultset.next()){ %>
        	
            <option value="<%= resultset.getString("CompanyName").trim()%>"><%= resultset.getString("CompanyName").trim()%></option>
        <% } %>
        </select> 
                     --%>          <input type="hidden" placeholder="*Schedule Name" id="ij" name="ij" value="<%=i%>">
        
        <%i++; %>
       
        <td>
        
             <a id="addemail" href="#">+</a> 
             </td>   
             <td>  <a id="btRemove" href="#">-</a>   <!-- <input type="button" id="btRemove" value="Remove Element" class="bt" /> --></td>
            
            
             </tr> 
        </table>
  </div>
  <font color="red">*</font> <font color="black" size="2">Duration:</font>
          <input type="text" placeholder="Duration" id="Duration" name="Duration" value="">
      <button onclick="return validate();">Submit</button>

     </div>
      </div>
      <%@ include file="footer.jsp"%>
</form>
 



</div>



</body>

</html>




           