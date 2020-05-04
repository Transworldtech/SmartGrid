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
<link rel="stylesheet" href="calendar/datepicker.css">
<script type="text/javascript" language="javascript" src="calendar/behaviors.js"></script>
<%-- <%@page contentType="text/html" pageEncoding="UTF-8"%> --%>
<!DOCTYPE html>
<html >
    <head>
      <link type="text/css" rel="stylesheet" href="style.css" />
  <!--   <link type="text/css" rel="stylesheet" href="reset.css" />  -->      
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        
        
        <script>
        
       function AjaxLocVehreg()
       {
     var company=document.getElementById("company").value;
     document.getElementById("originlat").readOnly=false;
	   document.getElementById("originlong").readOnly=false;
	   document.getElementById("destlat").readOnly=false;
	   document.getElementById("destlong").readOnly=false;
	  
	   document.getElementById("origin").readOnly=false;
	   document.getElementById("destination").readOnly=false;
	   
	   
	   document.getElementById("origin").value="";
	   document.getElementById("destination").value="";
	   document.getElementById("originlat").value="";
	   document.getElementById("originlong").value="";
	   document.getElementById("destlat").value="";
	   document.getElementById("destlong").value="";
     
     Ajaxroute();
     
     var ajaxRequest; // The variable that makes Ajax possible!
		try {
			// Opera 8.0+, Firefox, Safari
			ajaxRequest = new XMLHttpRequest();
		} catch (e) {
			// Internet Explorer Browsers
			try {
				ajaxRequest = new ActiveXObject(
						"Msxml2.XMLHTTP");
			} catch (e) {
				try {
					ajaxRequest = new ActiveXObject(
							"Microsoft.XMLHTTP");
				} catch (e) {
					// Something went wrong
					alert("Your browser broke!");
					return false;
				}
			}
		}
		ajaxRequest.onreadystatechange = function() {
			if (ajaxRequest.readyState == 4) {
				var reslt = ajaxRequest.responseText;
				document.getElementById("vehno").innerHTML = reslt;
				//alert(reslt);

			/* 	document.getElementById("City").disabled = false;
				document.getElementById("City").innerHTML = reslt; */

			}
		};

		var queryString = "?company="+company;
		//alert(queryString);
		ajaxRequest.open("GET", "AjaxVehLoc.jsp"
				+ queryString, true);
		ajaxRequest.send(null);
			}//else
     
     
     
     
				
			 function Ajaxroute()
		       {
		     var company=document.getElementById("company").value;
		       
			   
		     
		     var ajaxRequest; // The variable that makes Ajax possible!
				try {
					// Opera 8.0+, Firefox, Safari
					ajaxRequest = new XMLHttpRequest();
				} catch (e) {
					// Internet Explorer Browsers
					try {
						ajaxRequest = new ActiveXObject(
								"Msxml2.XMLHTTP");
					} catch (e) {
						try {
							ajaxRequest = new ActiveXObject(
									"Microsoft.XMLHTTP");
						} catch (e) {
							// Something went wrong
							alert("Your browser broke!");
							return false;
						}
					}
				}
				ajaxRequest.onreadystatechange = function() {
					if (ajaxRequest.readyState == 4) {
						var reslt = ajaxRequest.responseText;
						document.getElementById("Route").innerHTML = reslt;
						//alert(reslt);

					/* 	document.getElementById("City").disabled = false;
						document.getElementById("City").innerHTML = reslt; */

					}
				};

				var queryString = "?company="+company;
				//alert(queryString);
				ajaxRequest.open("GET", "AjaxRoute.jsp"
						+ queryString, true);
				ajaxRequest.send(null);
					}//else
		     
				
					function AjaxLatLong()
				       {
				     var company=document.getElementById("company").value;
				     var route=document.getElementById("Route").value;
				     
				     
				     var ajaxRequest; // The variable that makes Ajax possible!
						try {
							// Opera 8.0+, Firefox, Safari
							ajaxRequest = new XMLHttpRequest();
						} catch (e) {
							// Internet Explorer Browsers
							try {
								ajaxRequest = new ActiveXObject(
										"Msxml2.XMLHTTP");
							} catch (e) {
								try {
									ajaxRequest = new ActiveXObject(
											"Microsoft.XMLHTTP");
								} catch (e) {
									// Something went wrong
									alert("Your browser broke!");
									return false;
								}
							}
						}
						ajaxRequest.onreadystatechange = function() {
							if (ajaxRequest.readyState == 4) {
								var reslt = ajaxRequest.responseText;
							   if(reslt.trim()!="")
								   {
								  var arr=reslt.split("#");
								   document.getElementById("originlat").value=arr[0];
								   document.getElementById("originlong").value=arr[1];
								   document.getElementById("destlat").value=arr[2];
								   document.getElementById("destlong").value=arr[3];
								   document.getElementById("origin").value=arr[4];
								   document.getElementById("destination").value=arr[5];
								   
								   
								   
								   
								   document.getElementById("originlat").readOnly=true;
								   document.getElementById("originlong").readOnly=true;
								   document.getElementById("destlat").readOnly=true;
								   document.getElementById("destlong").readOnly=true;
								   document.getElementById("origin").readOnly=true;
								   document.getElementById("destination").readOnly=true;
								   
								   }
							   else
								   {document.getElementById("originlat").value="";
								   document.getElementById("originlong").value="";
								   document.getElementById("destlat").value="";
								   document.getElementById("destlong").value="";
								   document.getElementById("origin").value="";
								   document.getElementById("destination").value="";
								   document.getElementById("originlat").readOnly=false;
								   document.getElementById("originlong").readOnly=false;
								   document.getElementById("destlat").readOnly=false;
								   document.getElementById("destlong").readOnly=false;
								   document.getElementById("origin").readOnly=false;
								   document.getElementById("destination").readOnly=false;
								   
								   
								   
								   }
								
								
								
							}
						};

						var queryString = "?company="+company+"&route="+route;
						//alert(queryString);
						ajaxRequest.open("GET", "AjaxLatLong.jsp"
								+ queryString, true);
						ajaxRequest.send(null);
							}//el
				
				
				
    	   
    	   
       
        
        
        
        
        function validate() 
        {
        	 var company=document.getElementById("company").value;
        	var vehno=document.getElementById("vehno").value;
        	var route=document.getElementById("Route").value;
        	var AddRoute=document.getElementById("AddRoute").value;
        	var origin=document.getElementById("origin").value;
        	var destination=document.getElementById("destination").value;
        	var originlat=document.getElementById("originlat").value;
        	var originlong=document.getElementById("originlong").value;
        	var destlat=document.getElementById("destlat").value;
        	var destlong=document.getElementById("destlong").value;
        	
        	
        	var tripstart=document.getElementById("tripstart").value;
        	var tripend=document.getElementById("tripend").value;
        	var invalid=/^[0-9 .]+$/;
        	
        	if(company=="select")
        		{
        		alert("Please Select Company ");
        		return false;
        		}
        	
        	
        	
        	if(vehno=="select")
        		{
        		alert("Please Select VehNo/Location");
        		return false;
        		}
       
        	if(route=="select")
        	{
        		
        		alert("Please select Route");
        		return false;
        		
        	}
        	
        	
        	if(route=="Other")
        		{
        		if(AddRoute.trim()=="")
        			{
        			alert("Please Add Route");
        			return false;
        			
        			}
        		
        		
        		}
        	
        	if(origin.trim()=="")
        		{
        		
        		alert("Enter Origin");
        		return false;
        		}
        	
        	
        	if(destination.trim()=="")
    		{
    		
    		alert("Enter Destination");
    		return false;
    		}
        			
        	
        	
        	if(originlat.trim()=="")
        		{
        		alert("Please Enter Original Latitude");
        		return false;
        		}
        	
        	
        	if(!invalid.test(originlat))
        		{
        		alert("Please Enter Numeric Value Only for Original Latitude");
        		return false;
        		}
        	
        	
        	
        	 var dot=".";
 	        
 	       
        	
        	if(originlat.indexOf(dot)>2 || originlat.indexOf(dot)==0 )
        		{
        		
        		alert("Please Enter Valid  Original Latitude");
        		return false;
        		
        		}
        
 	    	  if(originlat.indexOf(dot)==originlat.length-1)
 	    	   
 	    	  {
 	        		
 	        		alert("Please Enter Valid  Original Latitude");
 	        		return false;
 	        		
 	        		} 
        	
 	    	   
 	    	   
 	    	   if((originlat.split(".").length)>2)
 	    		   {
 	    		   
 	    		  alert("Please Enter Valid  Original Latitude");
	        		return false;
 	    		   } 
        	
        	
        	if(originlong.trim()=="")
    		{
    		alert("Please Enter Original Longitude");
    		return false;
    		}
    	
        	
        	if(!invalid.test(originlong))
    		{
    		alert("Please Enter Numeric Value Only for Original Longitude");
    		return false;
    		}
        	
        	
        	if(originlong.indexOf(dot)>2 || originlong.indexOf(dot)==0 )
    		{
    		
    		alert("Please Enter Valid  Original Longitude");
    		return false;
    		
    		}
    
	    	   if(originlong.indexOf(dot)==originlong.length-1)
	    	   
	    	  {
	        		
	        		alert("Please Enter Valid  Original Longitude");
	        		return false;
	        		
	        		}

        	
	    	   if((originlong.split(".").length)>2)
	    		   {
	    		   
	    		  alert("Please Enter Valid  Original Longitude");
        		return false;
	    		   }
        	
        	
        	
        	if(destlat.trim()=="")
    		{
    		alert("Please Enter Destination Latitude");
    		return false;
    		}
    	
    	
        	if(!invalid.test(destlat))
    		{
    		alert("Please Enter Numeric Value Only for Destination Latitude");
    		return false;
    		}
        	
        	
        	if(destlat.indexOf(dot)>2 || destlat.indexOf(dot)==0 )
    		{
    		
    		alert("Please Enter Valid Destination Latitude");
    		return false;
    		
    		}
    
	    	   if(destlat.indexOf(dot)==destlat.length-1)
	    	   
	    	  {
	        		
	        		alert("Please Enter Valid Destination Latitude");
	        		return false;
	        		
	        		}

        	
	    	   if((destlat.split(".").length)>2)
    		   {
    		   
    		  alert("Please Enter Valid Destination Latitude ");
    		return false;
    		   }
        	
        	
        	
    	if(destlong.trim()=="")
		{
		alert("Please Enter Destination Longitude");
		return false;
		}
        	
        	
    	
    	if(!invalid.test(destlong))
		{
		alert("Please Enter Numeric Value Only for Destination Longitude");
		return false;
		}
    	
    	
    	if(destlong.indexOf(dot)>2 || destlong.indexOf(dot)==0 )
		{
		
		alert("Please Enter Valid Destination Longitude");
		return false;
		
		}

    	   if(destlong.indexOf(dot)==destlong.length-1)
    	   
    	  {
        		
        		alert("Please Enter Valid Destination Longitude");
        		return false;
        		
        		}
    	
    	
    	   if((destlong.split(".").length)>2)
		   {
		   
		  alert("Please Enter Valid Destination Longitude");
		return false;
		   }
    	
    	
    	
    	
    	
        	
        	
        	if(tripstart.trim()=="")
    		{
    		
    		alert("Please Enter Trip Start Time");
    		return false;
    		}
    	
    	
    	if(tripend.trim()=="")
		{
		
		alert("Please Enter Trip End Time");
		return false;
		}
        	
        	
        	
        	
        	
        	
        
        	
        }
        
        
        function  route1() 
        {
        	var route=document.getElementById("Route").value;
        	
        	
        	
        	
        	
        	if(route=="Other")
        		{
        		document.getElementById("AddRoute").style.visibility="";
        		document.getElementById("originlat").value="";
				document.getElementById("originlong").value="";
				document.getElementById("destlat").value="";
				document.getElementById("destlong").value="";
				document.getElementById("origin").value="";
				   document.getElementById("destination").value="";
				   
				   document.getElementById("originlat").readOnly=false;
				   document.getElementById("originlong").readOnly=false;
				   document.getElementById("destlat").readOnly=false;
				   document.getElementById("destlong").readOnly=false;
				   document.getElementById("origin").readOnly=false;
				   document.getElementById("destination").readOnly=false;
				 }
        	else
        		{
        		AjaxLatLong();
        		document.getElementById("AddRoute").style.visibility="hidden";
        		}
        	
        	
		}
        
        
        
        
        </script>
        <br><br>
     
        <title>Registration</title>
                
    </head>
   
    <body  >
        <form name=userinfo method="post" action="RouteEntry1.jsp" >
    
            <br>
            <div class="module form-module"  >
           <div class="toggle">
           </div>
           <div class="form" >
          
    <h2 align="center">Enter Route Information</h2>

     
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
     
     %>
     
     
     
     
     
     <select  name="company" id="company" onchange="AjaxLocVehreg();">
        <option value="select"  selected="selected">*Select Company</option>
        <%  while(resultset.next()){ %>
        	
            <option value="<%= resultset.getString("CompanyName").trim()%>"><%= resultset.getString("CompanyName").trim()%></option>
        <% } %>
        </select>
     
      <select  name="vehno" id="vehno">
        <option value="select"  selected="selected">*Select Location/Vehicle No</option>
       <%--  <%  while(rs.next()){ %>
        	
            <option value="<%= rs.getString("VehicleRegNumber").trim()%>"><%= rs.getString("VehicleRegNumber").trim()%></option>
        <% } %> --%>
        </select>
     
       <select  name="Route"  id="Route" onchange="route1();">
        <option value="select" selected="selected">*Select Route</option>
       <%--   <%  while(rs1.next()){ %>
        	
            <option value="<%= rs1.getString("Routename").trim()%>"><%= rs1.getString("Routename").trim()%></option>
        <% } %> --%>
        	
        
            <!-- <option value="Other">Other</option> -->
        
        </select>
     <input type="text" placeholder="*Add Route"  id="AddRoute" name="AddRoute"  value="";  style="visibility: hidden;">
     
     <input type="text" placeholder="*Origin" id="origin" name="origin" value="">
     
          <input type="text" placeholder="*Destination" id="destination" name="destination" value="">
           
     <input type="text" placeholder="*Origin Latitude" name="originlat"  id="originlat" value="" readonly="">
     <input type="text" placeholder="*Origin Longitude" name="originlong" id="originlong"   value="" readonly="">
      <input type="text" placeholder="*Destination Latitude" name="destlat" id="destlat"   value="" readonly=""  >
     <input type="text" placeholder="*Destination Longitude" name="destlong"  id="destlong" value="" readonly="">
     
          <input type="text" placeholder="*Trip Start Time"  id="tripstart"   name="tripstart" class="timepicker" readonly="readonly">
         <input type="text" placeholder="*Trip End Time"    id="tripend"  name="tripend"     class="timepicker" readonly="readonly">
     
  
  
      <button onclick="return validate();">Submit</button>

     </div>
      </div>
      <%@ include file="footer.jsp"%>
</form>
 



</div>



</body>

</html>




           