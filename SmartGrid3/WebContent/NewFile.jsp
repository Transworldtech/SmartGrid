 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%@ include file="headernew.jsp"%>
<html>
<head>
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
		Statement st = null, st1 = null, st3 = null, st4 = null,st2 = null;
        st = con1.createStatement();
		st1 = con1.createStatement();
		st2 = con1.createStatement();
		st3 = con1.createStatement();
		st4 = con1.createStatement();
		System.out.println("ok");
		
%>

<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/jquery-ui-1.8.13.custom.css"></link>
<link rel="stylesheet" type="text/css" href="css/ui.dropdownchecklist.themeroller.css"></link>
 <script type="text/javascript" src="Jquery/jquery-1.6.1.min.js"></script>
    <script type="text/javascript" src="Jquery/jquery-ui-1.8.13.custom.min.js"></script>
      <script type="text/javascript" src="Jquery/ui.dropdownchecklist.js"></script> 

<!-- <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script> -->
<!-- <link href="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/css/bootstrap-multiselect.css" -->
<!--     rel="stylesheet" type="text/css" /> -->
<!-- <script src="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/js/bootstrap-multiselect.js" -->
<!--     type="text/javascript"></script> -->
 <script type="text/javascript"> 



 $(document).ready(function() {
        
        $("#country1").dropdownchecklist( {
   onItemClick: function(checkbox, selector){
    var justChecked = checkbox.prop("checked");

    var checkCount = (justChecked) ? 1 : -1;

    for( i = 0; i < selector.options.length; i++ ){
     if ( selector.options[i].selected ) checkCount += 1;
     

     
    }
       if ( checkCount > 20 ) {
     alert( "Limit is 20 State to choose" );
     throw "too many";
    }
       
       
   },width: 250 
               });    
       });
    

</script>

<script>
$(document).ready(function() {
    
    $("#state").dropdownchecklist( {
onItemClick: function(checkbox, selector){
var justChecked = checkbox.prop("checked");

var checkCount = (justChecked) ? 1 : -1;

for( i = 0; i < selector.options.length; i++ ){
 if ( selector.options[i].selected ) checkCount += 1;
 

 
}
   if ( checkCount > 20 ) {
 alert( "Limit is 20 City to choose" );
 throw "too many";
}
   
   
},width: 250 
           });    
   });


</script>


    <script>
    
    
    
    
    
    
    
    
    
    function showbox()
       {

    		//alert("hi");
    		var country = document.getElementById("country1").value;
    		//var country=e.options[e.selectedIndex].Text;
    	/* if(country!=null)
    		{
    		document.getElementById("f13").style.display="";
    		
    		}
    	else
    		{
    		document.getElementById("f13").style.display='none';
    		
    		} */
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
    			//	alert(reslt);
//     				document.getElementById("state").disabled = false;
    				//alert("after true");
    				document.getElementById("state").innerHTML=reslt;
    				
    				
    			
    			} 
    		};
    		
    		var queryString = "?country="+country;
    		//alert("reslt");
    		ajaxRequest.open("GET", "AjaxGetState.jsp" + queryString, true);
    		ajaxRequest.send(null); 
    		
    		
    	}
    
    //document.getElementById("locationlist").innerHTML="";
     function showbox3()
    {

 		//alert("hi");
 		var city = document.getElementById("city").value;
 		//var country=e.options[e.selectedIndex].Text;
 	/* if(country!=null)
 		{
 		document.getElementById("f13").style.display="";
 		
 		}
 	else
 		{
 		document.getElementById("f13").style.display='none';
 		
 		} */
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
 			//	alert(reslt);
//  				document.getElementById("loc").disabled = false;
 				//alert("after true");
 			//alert(document.getElementById("locationlist").innerHTML=document.getElementById("locationlist").innerHTML+reslt);
 				document.getElementById("loc").innerHTML=reslt;
 				//document.getElementById("locationlist").innerHTML=reslt;
 			
 			} 
 		};
 		
 		var queryString = "?city="+city;
 		//alert("reslt");
 		//ajaxRequest.open("GET", "AjaxLocation1.jsp"+queryString, true);
 	 ajaxRequest.open("GET", "AjaxGetLocation.jsp"+queryString, true);
 		ajaxRequest.send(null); 
 		
 		
 	}
  
    
     
     
    
     
     
     
     
     
     
    function showbox4()
    {

 		//alert("hi");
 		var country = document.getElementById("country1").value;
 		//var country=e.options[e.selectedIndex].Text;
 	/* if(country!=null)
 		{
 		document.getElementById("f13").style.display="";
 		
 		}
 	else
 		{
 		document.getElementById("f13").style.display='none';
 		
 		} */
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
 			//	alert(reslt);
//  				document.getElementById("loc").disabled = false;
 				//alert("after true");
 				document.getElementById("loc").innerHTML=reslt;
 				
 				
 			
 			} 
 		};
 		
 		var queryString = "?country="+country;
 		//alert("reslt");
 		ajaxRequest.open("GET", "AjaxGetLocation.jsp" + queryString, true);
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
       			//document.getElementById("city").disabled = false;
       			document.getElementById("city").innerHTML=reslt;
       			
       		} 
       	};
       	
       	var queryString = "?country="+country;
       	ajaxRequest.open("GET", "AjaxGetCity.jsp" + queryString, true);
       	ajaxRequest.send(null); 
       	
       	
       }
       
       function showbox1()
       {

       	//alert("hi");
       	var state = document.getElementById("state").value;
       //alert(state);
       	//var country=e.options[e.selectedIndex].Text;
      /*  if(state!=null)
       	{
       	document.getElementById("f11").style.display="";
       	
       	}
       else
       	{
       	document.getElementById("f11").style.display='none';
       	
       	} */
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
       	
       	var queryString = "?state="+state;
       	//alert(queryString);
       	ajaxRequest.open("GET", "AjaxGetCity.jsp" + queryString, true);
       	ajaxRequest.send(null); 
       	
       	
       }
       
       function showbox5()
       {

       	//alert("hi");
       	var state = document.getElementById("state").value;
       //alert(state);
       	//var country=e.options[e.selectedIndex].Text;
      /*  if(state!=null)
       	{
       	document.getElementById("f11").style.display="";
       	
       	}
       else
       	{
       	document.getElementById("f11").style.display='none';
       	
       	} */
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
       			document.getElementById("loc").disabled = false;
       			document.getElementById("loc").innerHTML=reslt;
       		
       		} 
       	};
       	
       	var queryString = "?state="+state;
       	//alert(queryString);
       	ajaxRequest.open("GET", "AjaxGetLocation.jsp" + queryString, true);
       	ajaxRequest.send(null); 
       	
       	
       }







</script>


</head>


<body>




<div class="absolute1" align="center" >


<table width="90%">


<tr>
<td>
    <label><b>Country :</b></label> </td><td>
    <div class="styled-select slate">
				<select  id="country1" name="country1" multiple onchange="showbox();showbox2();showbox4();"    >
				  	<option value="Select">     </option>
				  		<% System.out.println("HHHHHHHHHHHHHHHHHH"); 
				  		String sqlDropdown3="SELECT Distinct(Country) FROM smartgrid.t_polmaster ";
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
	<label ><b>State :</b></label></td><td>
	<div class="styled-select slate">
				<select    id="state" multiple  onchange="showbox1();showbox5();" > 
					<option value="Select">    </option>
						<% String sqlDropdown2="SELECT Distinct(State) FROM smartgrid.t_polmaster";
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
	<label ><b>City :</b> </label></td><td>
	<div class="styled-select slate">
				<select    id="city" name="city" onchange="showbox3()" style='width: px; height: auto;'>
					<option value="Select">    </option>
				  		<% String sqlDropdown1="SELECT Distinct(City) FROM smartgrid.t_polmaster";
				  			ResultSet rsDropdown1=st2.executeQuery(sqlDropdown1);
				  			while(rsDropdown1.next()){
				  		%>
				  	<option><%=rsDropdown1.getString(1)%></option>
							
						<% 	}%> 
				</select></div>
			</td>
			<!-- </tr>
			<tr> -->
			<td>	
	<label ><b>Location :</b> </label></td><td>
	<div class="styled-select slate">
				<select    id="loc" name="loc" style='width: px; height: auto;'>
					<option value="Select">    </option>
				  		<% String sqlDropdown11="SELECT Distinct(Location) FROM smartgrid.t_polmaster";
				  			ResultSet rsDropdown11=st2.executeQuery(sqlDropdown11);
				  			while(rsDropdown11.next()){
				  		%>
				  	<option><%=rsDropdown11.getString(1)%></option>
							
						<% 	}%> 
				</select></div>
			</td>
<td  style="text-align: right;">
		<font size="2">	<input id="saveForm" name="submit" class="button_text"   type="button"  value="Show" onclick="showexpence()" /></font>
				</td>	
</tr>

</table>



</div>


</body>
</html>