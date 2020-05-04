<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<html>
<%@ include file="headernew.jsp"%>
<%!
Connection con1;
%>


<%
System.out.println("MM_dbConn_DRIVER--->"+MM_dbConn_DRIVER);
System.out.println("MM_dbConn_STRING--->"+MM_dbConn_STRING);
System.out.println("MM_dbConn_STRING--->"+MM_dbConn_USERNAME);
System.out.println("MM_dbConn_STRING--->"+MM_dbConn_PASSWORD);
		Class.forName(MM_dbConn_DRIVER);
		con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
		Statement st = null, st1 = null, st3 = null, st4 = null,st2 = null,st5=null;
        st = con1.createStatement();
		st1 = con1.createStatement();
		st2 = con1.createStatement();
		st3 = con1.createStatement();
		st4 = con1.createStatement();
		st5 = con1.createStatement();
		System.out.println("ok");
		
		
		 String lattit="";
			String longitude="";
		
%>




    <head>
    
    

    
   <style>
 
    
    
    table.tbh {
    border-collapse: collapse;
}

 table.tbh
 {
  border: 1px solid black;
 }
 th.tbh {
    border: 1px solid black;
   color:  white;
    background-color: #3a3f51;
}
td.tbh {
    border: 1px solid black;
  	/* background-color: #f37a4d; */
	color:  #3a3f51;
}
    
   

.popup {
background-color: #98AFC7;
position: absolute;
visibility: hidden;
}
.popupnew {
background-color: #98AFC7;
position: absolute;
visibility: visible;
}



div.absolute1 {
    position: absolute;
   margin-left: 30px;
    width:100%;
    border:0;
}    
</style>
    
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Location Registration</title>
        
 
<head>


<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>


<link href="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/css/bootstrap-multiselect.css"
    rel="stylesheet" type="text/css" />
<script src="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/js/bootstrap-multiselect.js"
    type="text/javascript"></script>

</head>
        
        
      <script>
      function showexpence() {

    	  var state=document.getElementById("country1").value;
//     	  alert(state);
    	  if(state=="Select")
		  {
		  alert("Please Select State");
		  return false;
		  }
    	  
    	  var city=document.getElementById("state").value;
    	 
    	  if(city=="Select")
		  {
		  alert("Please Select City");
		  return false;
		  }
    	  
    	  var area=document.getElementById("city").value;
     	 
     	  if(area=="Select")
 		  {
 		  alert("Please Select Area");
 		  return false;
 		  }


    	/*     var state = [];
    	    var s = document.getElementById("country1");
    	    for (var i = 0; i < s.options.length; i++) {
   	    	if (s.options[i].selected == true) {
   	            var stateid = s.options[i].value;
   	            state.push(stateid);
   	        }
    	       
     	    }
        	var state1=state;

    	    var city = [];
    	    var s = document.getElementById("state");
    	    for (var i = 0; i < s.options.length; i++) {
   	    	if (s.options[i].selected == true) {
   	            var cityid = s.options[i].value;
   	            city.push(cityid);
   	        }
    	       
     	    }
        	var city1=city;
    	 
        
        	
        	var area = [];
     	    var s = document.getElementById("city");
     	    for (var i = 0; i < s.options.length; i++) {
    	    	if (s.options[i].selected == true) {
    	            var areaid = s.options[i].value;
    	            area.push(areaid);
    	        }
     	       
      	    }
         	var area1=area; */
    	
              window.location.replace("BusBooking1.jsp?state="+state+"&city="+city+"&area="+area+"&chk=Bus");
   }
      function addarea()
      {
    	  var state1=document.getElementById("country1").value;
    	  var city1=document.getElementById("state").value;
    	  if(state1=="Select")
    		  {
    		  alert("Please Select State");
    		  return false;
    		  }
    	  if(city1=="Select")
		  {
		  alert("Please Select City");
		  return false;
		  }
    	  
    	
      	var state = document.getElementById("newcountry").value;
//             alert("state:-"+state);
           	
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
     			alert(reslt.trim());
     			window.location.reload();
     			
     		} 
     	};
     	
     	var queryString = "?area="+state+"&state1="+state1+"&city1="+city1;
      	ajaxRequest.open("GET", "AjaxAddArea.jsp" + queryString, true);
     	ajaxRequest.send(null); 
     	
           	
      }

       function showbox()
      {
   		var country = document.getElementById("country1").value;
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
   			//	alert(reslt);
   				document.getElementById("state").disabled = false;
   				//alert("after true");
   				document.getElementById("state").innerHTML=reslt;
   				
   				
   			
   			} 
   		};
   		
   		var queryString = "?country="+country;
   		//alert("reslt");
   		ajaxRequest.open("GET", "AjaxGetState1.jsp" + queryString, true);
   		ajaxRequest.send(null); 
   		
   		
   	}
   
  
  
   
      function showbox2()
      {

      	//alert("hi");
      	var country = document.getElementById("country1").value;
      	//var country=e.options[e.selectedIndex].Text;

      	//alert(country);
      	
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
      			document.getElementById("city").disabled = false;
      			document.getElementById("city").innerHTML=reslt;
      			
      		} 
      	};
      	
      	var queryString = "?country="+country;
      	ajaxRequest.open("GET", "AjaxGetCity1.jsp" + queryString, true);
      	ajaxRequest.send(null); 
      	
      	
      }
      
      function showbox1()
      {

      	//alert("hi");
      	var state = document.getElementById("state").value;

      	
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
      			document.getElementById("city").disabled = false;
      			document.getElementById("city").innerHTML=reslt;
      		
      		} 
      	};
      	
      	var queryString = "?state="+state;
      	//alert(queryString);
      	ajaxRequest.open("GET", "AjaxGetCity1.jsp" + queryString, true);
      	ajaxRequest.send(null); 
      	
      	
      }
      
     

      
    
      
    
						</script>          
   
    <body >
     <form  name="locinfo"  >
 
       
    <div align="center">
    <table width="70%">


</div>


	
	</div>
	</table>
<br>
	
</form>
 
 
 
 <script>

//  "&id"+i+"="
 
 function changeAction() {
	
// 	 var url="AddEditMultipleEmp.jsp?";
	 

		var cntr=document.getElementById("cntr").value;
		var url="FinalBus.jsp?cntr="+cntr;
		var i=0;
	      for(var j=1;j<=cntr;j++)
	    	{	

	   		if(document.getElementById("chkbus"+j).checked==true)
			   {
	   	      url=url+"&bus"+i+"="+document.getElementById("bus"+j).value;
              i++;
	           }
	        }
	      
	      
	      if(i=="0")
	    	  {
	    	  alert("Please select check-box");
	    	  return false;
	    
	    	  }
	      
     
	           document.rohit.action =url+"&cntbus="+i+"&chk=Bus";
	         		 document.rohit.submit();
    
 }
 function checkUncheckAll(sender) {
	    var chkElements = document.getElementsByName('chkbus');
	    for (var i = 0; i < chkElements.length; i++) {
	        chkElements[i].checked = sender.checked;
	    }
	}
	function checkUnCheckParent() {
	    var chkHeader = document.getElementById('allchk');
	    var chkElements = document.getElementsByName('chkbus');
	    var checkedCount = 0;
	    for (var i = 0; i < chkElements.length; i++) {
	        if (chkElements[i].checked) {
	            checkedCount += 1;
	        }
	    }
	    chkHeader.checked = (checkedCount === chkElements.length);
	}
 

	function showentryform2()
	 {
	 	
	 
	 	document.getElementById("newcountry").style.display="";
	 	document.getElementById("f14").style.display="";
	 	document.getElementById("f15").style.display='none';
	 	document.getElementById("Go").style.display='';
	 	
	 	//document.getElementById("city").value='-';
	 	//document.addCustomer.city.style.visibility="hidden";
	 }
	 function showminus2(id)
	 {
//	 	 document.getElementById("Go").style.display='none';
	 document.getElementById("f14").style.display='none';
	 document.getElementById("newcountry").style.display='none';
	 document.getElementById("f15").style.display="";
	 document.getElementById("newcountry").value="";
	 document.getElementById("Go").style.display='none';



	 }
 
 
    
            </script>
<div align="center">

<tr>
<td>
	<div style="margin-center: 200px">
	<font size="3"><B>Bus Booking</B></font></div>
	</td>
</tr>

</div>

<br>






<form name="rohit" method="post">


<div class="absolute1" align="center" >


<table width="90%">


   <tr>
    <td>
    <label><b>State:</b></label> </td><td>
    <div class="styled-select slate">
				<select  id="country1" name="country1"  onchange="showbox();showbox2();"    >
				  	<option value="Select">Select</option>
				  		<%  
				  		String sqlDropdown3="SELECT Distinct(State) FROM smartgrid.t_areamaster ";
				  			ResultSet rsDropdown3=st2.executeQuery(sqlDropdown3);
				  			System.out.println("sqlDropdown3-->"+sqlDropdown3); 
				  			while(rsDropdown3.next()){System.out.println("rsDropdown3.getString(1)"+rsDropdown3.getString(1));
				  		%>
				  	<option value="<%=rsDropdown3.getString(1)%>"><%=rsDropdown3.getString(1)%></option>
							
						<% 	}%> 
				</select></div>
				
		</td>
		<!-- </tr>
		<tr>	 -->
		<td>	
	<label ><b>City:</b></label></td><td>
	<div class="styled-select slate">
				<select  disabled  id="state"  name="state"   onchange="showbox1()" > 
					<option value="Select">Select</option>
						<% String sqlDropdown2="SELECT Distinct(City) FROM smartgrid.t_areamaster";
						System.out.println("sqlDropdown2-->"+sqlDropdown2); 
				  			ResultSet rsDropdown2=st2.executeQuery(sqlDropdown2);
				 			 while(rsDropdown2.next()){
				  		%>
				  	<option value="<%=rsDropdown2.getString(1)%>"><%=rsDropdown2.getString(1)%></option>
							
						<% 	}%> 

            	</select></div>
			</td>
		<!-- 	</tr>
			<tr> -->
			<td>	
	<label ><b>Area:</b> </label></td><td>
	<div class="styled-select slate">
				<select  disabled  id="city" name="city"  style='width: px; height: auto;'>
					<option value="Select">Select</option>
				  		<% String sqlDropdown1="SELECT Distinct(Area) FROM smartgrid.t_areamaster";
				  			ResultSet rsDropdown1=st2.executeQuery(sqlDropdown1);
				  			System.out.println("sqlDropdown1-->"+sqlDropdown1); 
				  			while(rsDropdown1.next()){
				  		%>
				  	<option><%=rsDropdown1.getString(1)%></option>
							
						<% 	}%> 
				</select>
				  	 <input type="text" class="element text medium" name="newcountry" id="newcountry" style="display: none"/> <input type="button" id="Go" value="Go" onclick="addarea();" style="display: none"> <a href="#" style="font-weight: bold; color: blue;display: none " id="f14" onclick="showminus2('-')"><font  size="2" >(-)</font></a>
	
				
				<a href="#" style="font-weight: bold; color: blue;" id="f15" onclick="showentryform2();">Add Area</a>
				</div>
			</td>
			
	
            	
		
	<td  style="text-align: right;">
			<input id="saveForm" name="submit" class="button_text"   type="button"  value="Show" onclick="showexpence();return false;" />
				</td>	
	
	</tr>
		
		
		
		
</table>
</div>

<br>
<br>



<div class="absolute1" align="center" >

<table width="95%">
<tr>

<!-- <td align="right"><a href="PoleBooking.jsp"><font color="Black" size="2"><b>Pole Booking</b></font></a> -->
<!-- </td> -->

</tr>
</table>
 <table  class="tbh" width="95%" >

						<% 
						int j=1;
						 String Sqlday="";
						 String lat="",lon="";
						 if(request.getParameter("chk")!=null)
						 {
				if(request.getParameter("chk").equalsIgnoreCase("Bus"))
				{
			
		        Sqlday="Select Lattiude,Longitude from smartgrid.t_areamaster where  state='"+request.getParameter("state")+"' and city='"+request.getParameter("city")+"' and area='"+request.getParameter("area")+"' ";
		        
				}
				
						 
	ResultSet rst2= st4.executeQuery(Sqlday);
	System.out.println("From AreaMaster:-"+Sqlday);

	while(rst2.next())
	{ %>
	
	<%
	
	 lat=rst2.getString("Lattiude");
    
	 lon=rst2.getString("Longitude");
     
	
	%>
	
   
	<%
	}
	%>
	<%
String distance="SELECT b.duration,c.AssetType,c.End_Customer,b.Routeid,b.TripStartTime,b.TripEndTime,b.Destination,b.Origin,a.Lattiude,a.Longitude,(2.0 * 3958.75 * ATAN(SQRT(SIN(RADIANS(a.Lattiude -"+ lat +" )*0.5) * SIN(RADIANS(a.Lattiude - "+ lat +")*0.5) + COS(RADIANS(18.471)) * COS(RADIANS(a.Lattiude)) *SIN(RADIANS(a.Longitude - "+ lon +")*0.5) *SIN(RADIANS(a.Longitude - "+ lon +")*0.5)), SQRT(1.0-(SIN(RADIANS(a.Lattiude - 18.471)*0.5) *SIN(RADIANS(a.Lattiude - "+ lat +")*0.5) +COS(RADIANS(19.4672)) * COS(RADIANS(a.Lattiude)) *SIN(RADIANS(a.Longitude - "+ lon +")*0.5) *SIN(RADIANS(a.Longitude - "+ lon +")*0.5)) )) * 1609.344)/1000 as distance FROM smartgrid.t_routepoints a inner join smartgrid.t_routemaster b on a.Routeid=b.Routeid inner join smartgrid.t_polmaster c on  c.vehiclecode=b.vehiclecode where  ((2.0 * 3958.75 * ATAN(SQRT(SIN(RADIANS(a.Lattiude - "+ lat +" )*0.5) * SIN(RADIANS(a.Lattiude - "+ lat +")*0.5) + COS(RADIANS(18.471)) * COS(RADIANS(a.Lattiude)) *SIN(RADIANS(a.Longitude - "+ lon +")*0.5) *SIN(RADIANS(a.Longitude - "+ lon +")*0.5)), SQRT(1.0-(SIN(RADIANS(a.Lattiude - 18.471)*0.5) *SIN(RADIANS(a.Lattiude - "+ lat +")*0.5) +COS(RADIANS(19.4672)) * COS(RADIANS(a.Lattiude)) *SIN(RADIANS(a.Longitude - "+ lon +")*0.5) *SIN(RADIANS(a.Longitude - "+ lon +")*0.5)) )) * 1609.344)/1000) <=2.5  and c.AssetType='Bus' order by distance asc ;";
ResultSet rst= st5.executeQuery(distance);
int i=0;
System.out.println("For distance:-"+distance);
while(rst.next())
{
%>		
   
   
   
  <%
		 
} %>	
 	
 		<%}%>	
		
 	
 	
 	
 	
 	
 	
 	
</table>


	
			                      
</div>                   
</form>
      </body>
             
            </html>
           <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
 <br><br>
<%@ include file="footer.jsp"%>      
            