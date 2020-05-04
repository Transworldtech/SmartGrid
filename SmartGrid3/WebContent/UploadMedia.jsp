<%@ include file="headernew.jsp"%>

<%@page import="java.util.*" %> 
<%-- <%@page contentType="text/html" pageEncoding="UTF-8"%> --%>

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
		java.util.Date d = new java.util.Date();
		int hours = (d.getHours());
		int minutes = (d.getMinutes());
		int seconds = (d.getSeconds());
		/* String nwfrmtdte = new SimpleDateFormat("dd-MMM-yyyy")
		.format(new java.util.Date()); */
		 /* DateFormat dateFormat = new SimpleDateFormat("dd-MMM-yyyy");

		Calendar now123=Calendar.getInstance();
		
		String sysdate22 = dateFormat.format(now123.getTime());
		System.out.println(">>>>>>>>>>>>>>>n "+sysdate22);  */
		String nwfrmtdte ="16-NOV-2016";
		String sysdate22 ="16-NOV-2016";
		%>
<!DOCTYPE html>
<html>
    <head>
      <link type="text/css" rel="stylesheet" href="style.css" />
 <!--    <link type="text/css" rel="stylesheet" href="reset.css" />  -->
    <!-- <link type="text/css" rel="stylesheet" href="css/calander.css" /> -->  
    <style type="text/css">@import url(jscalendar-1.0/calendar-brown.css);</style>
<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
    <script >function showbox()
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
    				document.getElementById("state").disabled = false;
    				//alert("after true");
    				document.getElementById("state").innerHTML=reslt;
    				
    				
    			
    			} 
    		};
    		
    		var queryString = "?country="+country;
    		//alert("reslt");
    		ajaxRequest.open("GET", "AjaxGetState.jsp" + queryString, true);
    		ajaxRequest.send(null); 
    		
    		
    	}
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
 				document.getElementById("loc").disabled = false;
 				//alert("after true");
 				document.getElementById("loc").innerHTML=reslt;
 				
 				
 			
 			} 
 		};
 		
 		var queryString = "?city="+city;
 		//alert("reslt");
 		ajaxRequest.open("GET", "AjaxGetLocation.jsp" + queryString, true);
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
 				document.getElementById("loc").disabled = false;
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <br><br><br><br><br><br>
        <title>Registration</title>
               
    </head>
    <body>
        <form name=userinfo method="post" action="UploadMedia1.jsp" enctype="multipart/form-data">
            <center>
            <br>
            <div class="module form-module">
           <div class="toggle"><!-- <i class="fa fa-times fa-pencil"> --></i>
           </div>
           <div class="form">
    <h2>Upload Media</h2>
    <!-- <form> -->
    <table>
    <tr>
    <td>
    
    <label><b>Country :</b> </label> </td><td>
    <div class="styled-select slate">
				<select  id="country1" name="country1"  onchange="showbox();showbox2();showbox4();"  class="element select medium"  >
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
		</tr>
		<tr>	
		<td>	
	<label ><b>State :</b></label></td><td>
	<div class="styled-select slate">
				<select  disabled  id="state"  name="state"   onchange="showbox1();showbox5();" > 
					<option value="Select">    </option>
						<% String sqlDropdown2="SELECT Distinct(State) FROM smartgrid.t_polmaster";
				  			ResultSet rsDropdown2=st2.executeQuery(sqlDropdown2);
				 			 while(rsDropdown2.next()){
				  		%>
				  	<option value="<%=rsDropdown2.getString(1)%>"><%=rsDropdown2.getString(1)%></option>
							
						<% 	}%> 

            	</select></div>
			</td>
			</tr>
			<tr>
			<td>	
	<label ><b>City :</b> </label></td><td>
	<div class="styled-select slate">
				<select  disabled  id="city" name="city" onchange="showbox3()" style='width: px; height: auto;'>
					<option value="Select">    </option>
				  		<% String sqlDropdown1="SELECT Distinct(City) FROM smartgrid.t_polmaster";
				  			ResultSet rsDropdown1=st2.executeQuery(sqlDropdown1);
				  			while(rsDropdown1.next()){
				  		%>
				  	<option><%=rsDropdown1.getString(1)%></option>
							
						<% 	}%> 
				</select></div>
			</td>
			</tr>
			<tr>
			<td>	
	<label ><b>Location :</b> </label></td><td>
	<div class="styled-select slate">
				<select  disabled  id="loc" name="loc" style='width: px; height: auto;'>
					<option value="Select">    </option>
				  		<% String sqlDropdown11="SELECT Distinct(Location) FROM smartgrid.t_polmaster";
				  			ResultSet rsDropdown11=st2.executeQuery(sqlDropdown11);
				  			while(rsDropdown11.next()){
				  		%>
				  	<option><%=rsDropdown11.getString(1)%></option>
							
						<% 	}%> 
				</select></div>
			</td>
			</tr>
			<tr>
	 			
	      			<td valign="top">
	      			 <input type="hidden" id="current1" name="current1" value="<%=sysdate22 %>"></input>  
	      			<!-- <input type="hidden" id="current1" name="current1" value="2016-Nov-14"></input> --> 
	      	 			<label ><b>Date :</b> </label>
	      	 		 </td>
	      	 		 
					<td > 
						<input type="text" id="fueldate" name="fueldate" size="13"   value="<%=nwfrmtdte %>" readonly  />
             			<script type="text/javascript">
				             Calendar.setup(
				             {
				                 inputField  : "fueldate",         // ID of the input field
				                 ifFormat    : "%d-%b-%Y",     // the date format
				                 button      : "fueldate"       // ID of the button
				             }
				                           );
             			</script> <!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
             			
             			</td>
			</tr>
			<tr>
			<td>
             			<label ><b>HH :</b> </label></td>
             			<td> <div class="styled-select slate">
	            						<select  style="width: 50px" name="fueltime1" id="fueltime1">
						                   <option value="Select">Select</option>
						                   <option value="00" <%if ("00".equals("hours")) {%> Selected <%}%> >00</option>
						                   <option value="01" <%if (01 == hours) {%> Selected <%}%>>01</option>
						                   <option value="02" <%if (02 == hours) {%> Selected <%}%>>02</option>
						                   <option value="03" <%if (03 == hours) {%> Selected <%}%>>03</option>
						                   <option value="04" <%if (04 == hours) {%> Selected <%}%>>04</option>
						                   <option value="05" <%if (05 == hours) {%> Selected <%}%>>05</option>
						                   <option value="06" <%if (06 == hours) {%> Selected <%}%>>06</option>
						                   <option value="07" <%if (07 == hours) {%> Selected <%}%>>07</option>
						                   <option value="08" <%if (8 == hours) {%> Selected <%}%>>08</option>
						                   <option value="09" <%if (9 == hours) {%> Selected <%}%>>09</option>
						                   <option value="10" <%if (10 == hours) {%> Selected <%}%>>10</option>
						                   <option value="11" <%if (11 == hours) {%> Selected <%}%> >11</option> 
						                   <option value="12" <%if (12 == hours) {%> Selected <%}%> >12</option>
						                   <option value="13" <%if (13 == hours) {%> Selected <%}%>>13</option>
						                   <option value="14" <%if (14 == hours) {%> Selected <%}%>>14</option>
						                   <option value="15" <%if (15 == hours) {%> Selected <%}%>>15</option>
						                   <option value="16" <%if (16 == hours) {%> Selected <%}%>>16</option>
						                   <option value="17" <%if (17 == hours) {%> Selected <%}%>>17</option>
						                   <option value="18" <%if (18 == hours) {%> Selected <%}%>>18</option>
						                   <option value="19" <%if (19 == hours) {%> Selected <%}%>>19</option>
						                   <option value="20" <%if (20 == hours) {%> Selected <%}%>>20</option>
						                   <option value="21" <%if (21 == hours) {%> Selected <%}%>>21</option> 
						                   <option value="22" <%if (22 == hours) {%> Selected <%}%>>22</option>
						                   <option value="23" <%if (23 == hours) {%> Selected <%}%>>23</option>
            	 						</select>  
            	 						</div>
            	 						</td></tr><tr><td>
            	 				
             			<label ><b>MM :</b> </label></td> <td><div class="styled-select slate"><select  style="width: 50px" name="fueltime2" id="fueltime2">
						                  
						                  <option value="00" <%if (00 == minutes ) {%> Selected <%}%>>00</option>
					        	          <option value="01" <%if (01 == minutes) {%> Selected <%}%>>01</option>
					        	          <option value="02" <%if (02 == minutes) {%> Selected <%}%>>02</option>
					        	          <option value="03" <%if (03 == minutes) {%> Selected <%}%>>03</option>
					        	          <option value="04" <%if (04 == minutes) {%> Selected <%}%>>04</option>
					        	          <option value="05" <%if (05 == minutes) {%> Selected <%}%>>05</option>
					        	          <option value="06" <%if (06 == minutes) {%> Selected <%}%>>06</option>
					        	          <option value="07" <%if (07 == minutes) {%> Selected <%}%>>07</option>
					        	          <option value="08" <%if (8 == minutes) {%> Selected <%}%>>08</option>
					        	          <option value="09" <%if (9 == minutes) {%> Selected <%}%>>09</option> 
					        	          <option value="10" <%if (10 == minutes) {%> Selected <%}%>>10</option>
					        	          <option value="11" <%if (11 == minutes) {%> Selected <%}%>>11</option>
					        	          <option value="12" <%if (12 == minutes) {%> Selected <%}%>>12</option>
					        	          <option value="13" <%if (13 == minutes) {%> Selected <%}%>>13</option>
					        	          <option value="14" <%if (14 == minutes) {%> Selected <%}%>>14</option>
					        	          <option value="15" <%if (15 == minutes) {%> Selected <%}%>>15</option>
					        	          <option value="16" <%if (16 == minutes) {%> Selected <%}%>>16</option>
					        	          <option value="17" <%if (17 == minutes) {%> Selected <%}%>>17</option>
					        	          <option value="18" <%if (18 == minutes) {%> Selected <%}%>>18</option>
					        	          <option value="19" <%if (19 == minutes) {%> Selected <%}%>>19</option>
					        	          <option value="20" <%if (20 == minutes) {%> Selected <%}%>>20</option>
					        	          <option value="21" <%if (21 == minutes) {%> Selected <%}%>>21</option>
					        	          <option value="22" <%if (22 == minutes) {%> Selected <%}%>>22</option>
					        	          <option value="23" <%if (23 == minutes) {%> Selected <%}%>>23</option>
					        	          <option value="24" <%if (24 == minutes) {%> Selected <%}%>>24</option>
					        	          <option value="25" <%if (25 == minutes) {%> Selected <%}%>>25</option>
					        	          <option value="26" <%if (26 == minutes) {%> Selected <%}%>>26</option>
					        	          <option value="27" <%if (27 == minutes) {%> Selected <%}%>>27</option>
					        	          <option value="28" <%if (28 == minutes) {%> Selected <%}%>>28</option>
					        	          <option value="29" <%if (29 == minutes) {%> Selected <%}%>>29</option>
					        	          <option value="30" <%if (30 == minutes) {%> Selected <%}%>>30</option>
					        	          <option value="31" <%if (31 == minutes) {%> Selected <%}%>>31</option>
					        	          <option value="32" <%if (32 == minutes) {%> Selected <%}%>>32</option>
					        	          <option value="33" <%if (33 == minutes) {%> Selected <%}%>>33</option>
					        	          <option value="34" <%if (34 == minutes) {%> Selected <%}%>>34</option>
					        	          <option value="35" <%if (35 == minutes) {%> Selected <%}%>>35</option>
					        	          <option value="36" <%if (36 == minutes) {%> Selected <%}%>>36</option>
					        	          <option value="37" <%if (37 == minutes) {%> Selected <%}%>>37</option>
					        	          <option value="38" <%if (38 == minutes) {%> Selected <%}%>>38</option>
					        	          <option value="39" <%if (39 == minutes) {%> Selected <%}%>>39</option>
					        	          <option value="40" <%if (40 == minutes) {%> Selected <%}%>>40</option>
					        	          <option value="41" <%if (41 == minutes) {%> Selected <%}%>>41</option>
					        	          <option value="42" <%if (42 == minutes) {%> Selected <%}%>>42</option>
					        	          <option value="43" <%if (43 == minutes) {%> Selected <%}%>>43</option>
					        	          <option value="44" <%if (44 == minutes) {%> Selected <%}%>>44</option>
					        	          <option value="45" <%if (45 == minutes) {%> Selected <%}%>>45</option>
					        	          <option value="46" <%if (46 == minutes) {%> Selected <%}%>>46</option>
					        	          <option value="47" <%if (47 == minutes) {%> Selected <%}%>>47</option>
					        	          <option value="48" <%if (48 == minutes) {%> Selected <%}%>>48</option>
					        	          <option value="49" <%if (49 == minutes) {%> Selected <%}%>>49</option>
					        	          <option value="50" <%if (50 == minutes) {%> Selected <%}%>>50</option>
					        	          <option value="51" <%if (51 == minutes) {%> Selected <%}%>>51</option>
					        	          <option value="52" <%if (52 == minutes) {%> Selected <%}%>>52</option>
					        	          <option value="53" <%if (53 == minutes) {%> Selected <%}%>>53</option>
					        	          <option value="54" <%if (54 == minutes) {%> Selected <%}%>>54</option>
					        	          <option value="55" <%if (55 == minutes) {%> Selected <%}%>>55</option>
					        	          <option value="56" <%if (56 == minutes) {%> Selected <%}%>>56</option>
					        	          <option value="57" <%if (57 == minutes) {%> Selected <%}%>>57</option>
					        	          <option value="58" <%if (58 == minutes) {%> Selected <%}%>>58</option>
					        	          <option value="59" <%if (59 == minutes) {%> Selected <%}%>>59</option>
					        	          <option value="60" <%if (60 == minutes) {%> Selected <%}%>>60</option>
					        	    </select>				</div>
				
							</td>
						 </tr>
						 <tr><td>
            	 				
             			<label ><b>SS :</b> </label></td> <td><div class="styled-select slate"><select  style="width: 50px" name="fueltime3" id="fueltime3">
						                  
						                  <option value="00" <%if (00 == seconds ) {%> Selected <%}%>>00</option>
					        	          <option value="01" <%if (01 == seconds) {%> Selected <%}%>>01</option>
					        	          <option value="02" <%if (02 == seconds) {%> Selected <%}%>>02</option>
					        	          <option value="03" <%if (03 == seconds) {%> Selected <%}%>>03</option>
					        	          <option value="04" <%if (04 == seconds) {%> Selected <%}%>>04</option>
					        	          <option value="05" <%if (05 == seconds) {%> Selected <%}%>>05</option>
					        	          <option value="06" <%if (06 == seconds) {%> Selected <%}%>>06</option>
					        	          <option value="07" <%if (07 == seconds) {%> Selected <%}%>>07</option>
					        	          <option value="08" <%if (8 == seconds) {%> Selected <%}%>>08</option>
					        	          <option value="09" <%if (9 == seconds) {%> Selected <%}%>>09</option> 
					        	          <option value="10" <%if (10 == seconds) {%> Selected <%}%>>10</option>
					        	          <option value="11" <%if (11 == seconds) {%> Selected <%}%>>11</option>
					        	          <option value="12" <%if (12 == seconds) {%> Selected <%}%>>12</option>
					        	          <option value="13" <%if (13 == seconds) {%> Selected <%}%>>13</option>
					        	          <option value="14" <%if (14 == seconds) {%> Selected <%}%>>14</option>
					        	          <option value="15" <%if (15 == seconds) {%> Selected <%}%>>15</option>
					        	          <option value="16" <%if (16 == seconds) {%> Selected <%}%>>16</option>
					        	          <option value="17" <%if (17 == seconds) {%> Selected <%}%>>17</option>
					        	          <option value="18" <%if (18 == seconds) {%> Selected <%}%>>18</option>
					        	          <option value="19" <%if (19 == seconds) {%> Selected <%}%>>19</option>
					        	          <option value="20" <%if (20 == seconds) {%> Selected <%}%>>20</option>
					        	          <option value="21" <%if (21 == seconds) {%> Selected <%}%>>21</option>
					        	          <option value="22" <%if (22 == seconds) {%> Selected <%}%>>22</option>
					        	          <option value="23" <%if (23 == seconds) {%> Selected <%}%>>23</option>
					        	          <option value="24" <%if (24 == seconds) {%> Selected <%}%>>24</option>
					        	          <option value="25" <%if (25 == seconds) {%> Selected <%}%>>25</option>
					        	          <option value="26" <%if (26 == seconds) {%> Selected <%}%>>26</option>
					        	          <option value="27" <%if (27 == seconds) {%> Selected <%}%>>27</option>
					        	          <option value="28" <%if (28 == seconds) {%> Selected <%}%>>28</option>
					        	          <option value="29" <%if (29 == seconds) {%> Selected <%}%>>29</option>
					        	          <option value="30" <%if (30 == seconds) {%> Selected <%}%>>30</option>
					        	          <option value="31" <%if (31 == seconds) {%> Selected <%}%>>31</option>
					        	          <option value="32" <%if (32 == seconds) {%> Selected <%}%>>32</option>
					        	          <option value="33" <%if (33 == seconds) {%> Selected <%}%>>33</option>
					        	          <option value="34" <%if (34 == seconds) {%> Selected <%}%>>34</option>
					        	          <option value="35" <%if (35 == seconds) {%> Selected <%}%>>35</option>
					        	          <option value="36" <%if (36 == seconds) {%> Selected <%}%>>36</option>
					        	          <option value="37" <%if (37 == seconds) {%> Selected <%}%>>37</option>
					        	          <option value="38" <%if (38 == seconds) {%> Selected <%}%>>38</option>
					        	          <option value="39" <%if (39 == seconds) {%> Selected <%}%>>39</option>
					        	          <option value="40" <%if (40 == seconds) {%> Selected <%}%>>40</option>
					        	          <option value="41" <%if (41 == seconds) {%> Selected <%}%>>41</option>
					        	          <option value="42" <%if (42 == seconds) {%> Selected <%}%>>42</option>
					        	          <option value="43" <%if (43 == seconds) {%> Selected <%}%>>43</option>
					        	          <option value="44" <%if (44 == seconds) {%> Selected <%}%>>44</option>
					        	          <option value="45" <%if (45 == seconds) {%> Selected <%}%>>45</option>
					        	          <option value="46" <%if (46 == seconds) {%> Selected <%}%>>46</option>
					        	          <option value="47" <%if (47 == seconds) {%> Selected <%}%>>47</option>
					        	          <option value="48" <%if (48 == seconds) {%> Selected <%}%>>48</option>
					        	          <option value="49" <%if (49 == seconds) {%> Selected <%}%>>49</option>
					        	          <option value="50" <%if (50 == seconds) {%> Selected <%}%>>50</option>
					        	          <option value="51" <%if (51 == seconds) {%> Selected <%}%>>51</option>
					        	          <option value="52" <%if (52 == seconds) {%> Selected <%}%>>52</option>
					        	          <option value="53" <%if (53 == seconds) {%> Selected <%}%>>53</option>
					        	          <option value="54" <%if (54 == seconds) {%> Selected <%}%>>54</option>
					        	          <option value="55" <%if (55 == seconds) {%> Selected <%}%>>55</option>
					        	          <option value="56" <%if (56 == seconds) {%> Selected <%}%>>56</option>
					        	          <option value="57" <%if (57 == seconds) {%> Selected <%}%>>57</option>
					        	          <option value="58" <%if (58 == seconds) {%> Selected <%}%>>58</option>
					        	          <option value="59" <%if (59 == seconds) {%> Selected <%}%>>59</option>
					        	          <option value="60" <%if (60 == seconds) {%> Selected <%}%>>60</option>
					        	    </select>				</div>
				
							</td>
						 </tr>
			</table>	
			
			
      <!--  <input type="text" name="fname" value="" id="fname" placeholder="First Name"/> -->
       <!-- <input type="text" name="lname" value="" id=lname placeholder="Last Name"/> --> 
      <!-- <select type="text" name="stat" value="12" id=stat placeholder="Status"/> --> 
      <!-- <input type="text" name="rol" value="" id=rol placeholder="Role"/> -->
     <!-- <input type="text" name="usr" value="" id=usr placeholder="User Name"/>  -->
     <input type="text" name="slot" value="" id="slot" placeholder="Slot"/>
       <!-- <input type="text" name="entryby" value="" id=entryby placeholder="Entryby"/> -->
      <!-- <input type="file" name="uProperty" value="" /> <br> -->
  <!-- <input type="button" name="goUpload" value="Upload" /> --> 
      <input type="file" name="document" id=document /> <br>
      <button>Upload</button>

</div>
</div>
</form>
</body>
</html>
<%@ include file="footer.jsp"%>

           