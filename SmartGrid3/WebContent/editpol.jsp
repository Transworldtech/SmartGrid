<%-- <%@page contentType="text/html" pageEncoding="UTF-8"%> --%>
<%@page import="com.sun.org.apache.xalan.internal.xsltc.compiler.sym"%>
<%@ include file="headernew.jsp"%>
<%! Connection conn = null;
	Statement st = null;
	
%>
<!DOCTYPE html>
<html>
    <head>
    <link type="text/css" rel="stylesheet" href="style.css" />
    
    <style>
    body {
	
   /*  background-repeat: no-repeat; */
}
    </style>
    
    <!-- <link type="text/css" rel="stylesheet" href="reset.css" />    -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Location Registration</title>
      <script LANGUAGE="JavaScript">
      
      function showbox11()
      {


      	var company = document.getElementById("company").value;
   
      	
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
      			
      			document.getElementById("AssetType").disabled = false;
      			document.getElementById("AssetType").innerHTML=reslt;
      		
      		} 
      	};
      	
      	var queryString = "?company="+company;
      	//alert(queryString);
      	ajaxRequest.open("GET", "AjaxAssetType.jsp" + queryString, true);
      	ajaxRequest.send(null); 
      	
      	
      }
      
      
      function showstate()
      {


      	var country = document.getElementById("country").value;
   
      	if(country == "Other")
      		{
      		document.getElementById("Country1").style.visibility="";
      		document.getElementById("State1").style.visibility="";
      		document.getElementById("state").innerHTML="'<option value='Other'> Other State </option>'";
      		document.getElementById("City1").style.visibility="";
      		document.getElementById("City").innerHTML="'<option value='Other'> Other City </option>'";
      		document.getElementById("Area1").style.visibility="";
      		document.getElementById("Area").innerHTML="'<option value='Other'> Other Area </option>'";  		
			}
      	
      	
      	else {
      		
      		document.getElementById("Country1").style.visibility="hidden";
      		document.getElementById("State1").style.visibility="hidden";
      		document.getElementById("City1").style.visibility="hidden";
      		document.getElementById("Area1").style.visibility="hidden";
      		
      		
      		

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
										//alert(reslt);

										document.getElementById("state").disabled = false;
										document.getElementById("state").innerHTML = reslt;

									}
								};

								var queryString = "?country=" + country;
								//alert(queryString);
								ajaxRequest.open("GET", "AjaxShowState.jsp"
										+ queryString, true);
								ajaxRequest.send(null);
      	}//else
							}

							function showcity() {

								var state = document.getElementById("state").value;
								if(state == "Other")
					      		{
					      		//document.getElementById("Country1").style.visibility="";
					      		document.getElementById("State1").style.visibility="";
					      		document.getElementById("City1").style.visibility="";
					      		document.getElementById("City").innerHTML="'<option value='Other'> Other City </option>'";
					      		document.getElementById("Area1").style.visibility="";
					      		document.getElementById("Area").innerHTML="'<option value='Other'> Other Area </option>'";
								}
								else
									{
								
									document.getElementById("State1").style.visibility="hidden";
						      		document.getElementById("City1").style.visibility="hidden";
						      		document.getElementById("Area1").style.visibility="hidden";
								

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
										//alert(reslt);

										document.getElementById("City").disabled = false;
										document.getElementById("City").innerHTML = reslt;

									}
								};

								var queryString = "?state=" + state;
								//alert(queryString);
								ajaxRequest.open("GET", "AjaxShowCity.jsp"
										+ queryString, true);
								ajaxRequest.send(null);
									}//else
							}

							function showarea() {

								var city = document.getElementById("City").value;
								
								if(city =="Other")
								{
									document.getElementById("City1").style.visibility="";
						      		document.getElementById("Area1").style.visibility="";
									document.getElementById("Area").innerHTML="'<option value='Other'> Other Area </option>'";
									
								}
								
								else
									{

									document.getElementById("City1").style.visibility="hidden";
						      		document.getElementById("Area1").style.visibility="hidden";
									
									
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
										//alert(reslt);

										document.getElementById("Area").disabled = false;
										document.getElementById("Area").innerHTML = reslt;

									}
								};

								var queryString = "?city=" + city;
								//alert(queryString);
								ajaxRequest.open("GET", "AjaxShowArea.jsp"
										+ queryString, true);
								ajaxRequest.send(null);

									}//else
								
							}
							
							
							function showareatext()
							{
								
								var area=document.getElementById("Area").value;
								if(area =="Other")
									{
									
									document.getElementById("Area1").style.visibility="";
									}
								
								
								
								else
									{
									document.getElementById("Area1").style.visibility="hidden";
									}
								
								
							}
							
							
							

							function validate() 
						   {
								
								var company=document.getElementById("company").value;
								var country=document.getElementById("country").value;
					
								
								
								
								 var country1=document.getElementById("Country1").value;
							
									
								var state=document.getElementById("state").value;
						
								
								 var state1=document.getElementById("State1").value;
						
								var city=document.getElementById("City").value;
							
								var city1=document.getElementById("City1").value;
								
								var area=document.getElementById("Area").value;
								var area1=document.getElementById("Area1").value; 
								
								
								
								var location=document.getElementById("Location").value;
								var poleid=document.getElementById("polid").value;
								var deviceid=document.getElementById("Deviceid").value;
								var route=document.getElementById("Route").value;
								var endcustomer=document.getElementById("EndCustomer").value;
								var assettype=document.getElementById("AssetType").value;
								var seat_capacity=document.getElementById("seatcapacity").value;
								var status=document.getElementById("Status").value;
								try{
								if(company=="select")
									{
									alert("Please Select Company");
									return false;
									}
								
								
								
								
								if(country=="Select")
								{
									alert("Please Select Country");
									 return false;
								}
								
								
								
								
								
								
								
							
								if(state=="Select" && country!="Other")
								{
									alert("Please Select State");
									 return false;
								}
								
							
								
								if(city=="Select" && state!="Other" && country!="Other")
								{
									alert("Please Select City");
									 return false;
								}
								
							
								if(area=="Select" && city!="Other" && state!="Other" && country!="Other")
								{
									alert("Please Select Area");
									 return false;
								}
								
								
								
							   if(document.getElementById("Country1").style.visibility=="")
								   {
																   
								   if(country1.trim()=="")
									  {
									   
									   alert("Please Add Country");
									   return false;
									  } 
									   
								   if(state1.trim()=="")
									   {
									   
									   alert("Pleas Add State");
									   return false;
									   
									   }
									if(city1.trim()=="")
										{
										alert("Please Add City");
										return false;
										}
								   
								   if(area1.trim()=="")
								   {
									   
									   alert("Please Add Area");
									   
									   return false;
								   }
									  
								   
								   
								   
							   }
									
							   if(document.getElementById("State1").style.visibility=="")
							   {
							   
							  
								   
							   if(state1.trim()=="")
								   {
								   
								   alert("Please Add State");
								   return false;
								   
								   }
								if(city1.trim()=="")
									{
									alert("Please Add City");
									return false;
									}
							   
							   if(area1.trim()=="")
							   {
								   
								   alert("Please Add Area");
								   
								   return false;
							   }
								  						   
						   }
									
							   if(document.getElementById("City1").style.visibility=="")
							   {
							   
							  
								   
							   
								if(city1.trim()=="")
									{
									alert("Please Add City");
									return false;
									}
							   
							   if(area1.trim()=="")
							   {
								   
								   alert("Please Add Area");
								   
								   return false;
							   }
								  						   
						   }
									
							   if(document.getElementById("Area1").style.visibility=="")
							   {
					
							   
							   if(area1.trim()=="")
							   {
								   
								   alert("Please Add Area");
								   
								   return false;
							   }
								  						   
						   }
									
								
							   var invalidnumber=/^[0-9]+$/;
								
								if(location.trim()=="")
								{
									alert("Please Enter Location");
									 return false;
								}
								
								if(poleid.trim()=="")
									{
									alert("Please Enter Pole id");
									return false;
									}
								
								if(!invalidnumber.test(poleid))
								{
								
								alert("Enter Numeric Value Only For Pole ID");
								return false;
								
								}
								
								
								
								
								if(deviceid.trim()=="")
								{
									alert("Please Enter Device ID");
									return false;
									
								}
								
								if(!invalidnumber.test(deviceid))
									{
									
									alert("Enter Numeric Value Only For Device ID");
									return false;
									
									}
								
								if(route.trim()=="")
									{
									
									alert("Please Enter Route");
									return false;
									}
								
								
								if(endcustomer.trim()=="")
									{
									
									alert("Please Enter End Customer");
									return false;
									}
								
								
								
								if(assettype=="Select")
									{
									alert("Please Select Asset Type");
									return false;
									}
								
								if(status=="Select")
									{
									
									alert("Please Select Status");
									return false;
									
									}
									
								
								
								
								if(seat_capacity.trim()=="")
								{
								if(!invalidnumber.test(seat_capacity))
									{
									alert("Enter Numeric Value Only For Seating Capacity");
									return false;
									
									}
								
								}
								
								}
								catch(e)
								{
									alert(e);
								}
							
									
							}
						</script>          
    </head>
    <body >
     <br><br><br> <br><br>
        <form  name=locinfo method="post" action="editpol1.jsp" >
      
            <center>
            <br><br><br>
            <div class="module form-module">
           <div class="toggle"><!-- <i class="fa fa-times fa-pencil"></i> -->
           </div>
           <div class="form">
    <h2>Edit  Device Information</h2>
    <form>
    <% 
    
    String country="",state="",city="",location="",company="",polid="",Deviceid="",Route="",Area="",End_Customer="",seating_capacity="",AssetType="";
    String status="";
    String id=request.getParameter("id");
    %>
      <%
    try{
//Class.forName("com.mysql.jdbc.Driver").newInstance();
Class.forName(MM_dbConn_DRIVER);
	 conn = DriverManager.getConnection(MM_dbConn_STRING1, MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
	 st = conn.createStatement();
Statement st1=conn.createStatement();



ResultSet s1=st1.executeQuery("select * from smartgrid.t_polmaster where id='"+id+"'");
  while(s1.next())
  {
	  
	country=s1.getString("Country");  
	state=s1.getString("State");  
	city=s1.getString("City");
	location=s1.getString("Location");
	company=s1.getString("Company");
	polid=s1.getString("polid");
	Deviceid=s1.getString("Deviceid");
	Route=s1.getString("Route");
	Area=s1.getString("Area");
	End_Customer=s1.getString("End_Customer");
	seating_capacity=s1.getString("seating_capacity");
	AssetType=s1.getString("AssetType");
	
	status=s1.getString("status");
	  
  }
System.out.println("Country===>"+country);
System.out.println("State===>"+state);
System.out.println("City===>"+city);
System.out.println("Location==>"+location);
System.out.println("Company===>"+company);
System.out.println("Poleid===>"+polid);
System.out.println("Deviceid===>"+Deviceid);
System.out.println("Route===>"+Route);
System.out.println("Area===>"+polid);
System.out.println("End_customer===>"+Deviceid);
System.out.println("seating capacity===>"+Route);
System.out.println("AssetType===>"+AssetType);
System.out.println("Status==>"+status);


	 ResultSet resultset =st.executeQuery("select CompanyName from smartgrid.t_companymaster where CompanyName!='"+company+"'") ;
%>


        <select type="text" name="company" id=company onchange="showbox11()">
        <option value="<%=company%>" selected="selected"><%=company %> </option>
       <!--  <option value="select" >Select Company</option> -->
        <%  while(resultset.next()){ %>
        	
            <option value="<%= resultset.getString("CompanyName").trim()%>"><%= resultset.getString("CompanyName").trim()%></option>
        <% } %>
        </select>


<%
//**Should I input the codes here?**
        }
        catch(Exception e)
        {
             out.println("wrong entry"+e);
        }
%>

   <select  name="country" id="country" onchange="showstate()">
        <option value="<%=country%>" selected="selected"><%=country%> </option>
      <option value="Select">Select Country&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </option>
      <% 
      ResultSet reslset=st.executeQuery("select distinct(Country) from smartgrid.t_countrycitystateinfo where Country!='"+country+"'   order by Country asc");
      while(reslset.next()) { %>
         
       <option value="<%=reslset.getString("Country").trim()%>"><%= reslset.getString("Country").trim()%></option>
     
     <% }
      
      %>
      <option value="Other">Other Country</option>
     </select>
         <input type="text" name="Country1" value="" id="Country1" placeholder="*Add Country" style="visibility: hidden;"  />
        
         <select      name="State" id="state" onchange="showcity()">
          <option value="<%=state%>" selected="selected"><%=state%> </option>
      <option value="Other">Other State&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </option>
    
     </select>
     
      <input type="text" name="State1" value="" id="State1" placeholder="*Add State" style="visibility: hidden;"  />
     
     
          <select   name="City" id="City" onchange="showarea()">
          
           <option value="<%=city%>" selected="selected"><%=city%> </option>
      <option value="Other">Other City&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </option>
    
     </select>
        <input type="text" name="City1" value="" id="City1" placeholder="*Add City" style="visibility: hidden;"   />
         <select  name="Area" id="Area" onchange="showareatext()"   >
          <option value="<%=Area%>" selected="selected"><%=Area%> </option>
         <option value="Other">Other Area&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </option>
     </select>
        
         <input type="text" name="Area1" value="" id="Area1" placeholder="*Add Area"style="visibility: hidden;"  />
            

   <!--    <input type="text" name="Countrytext" value="" id="Countrytext" placeholder="Country" style="visibility: hidden;"/>
      <input type="text" name="State" value="" id="State" placeholder="State" style="visibility: hidden;"  />
      <input type="text" name="City" value="" id="City" placeholder="City"   style="visibility: hidden;"  />
        <input type="text" name="Area" value="" id="Area" placeholder="Area" style="visibility: hidden;"   /> -->
      <input type="text" name="Location" value="<%=location %>" id="Location" placeholder="*Location/Vehicle No"/>
      <input type="text" name="polid" value="<%=polid %>" id=polid placeholder="*Pole Id"/>
      <input type="text" name="Deviceid" value="<%=Deviceid %>" id="*Device Id" placeholder="*Deviceid"/>
      <input type="text" name="Route" value="<%=Route %>" id="*Route" placeholder="Route"/>
      <input type="text" name="EndCustomer" value="<%=End_Customer %>" id="EndCustomer" placeholder="*End Customer"/>
   <select  class="element select medium"   id="AssetType" name="AssetType"  style="width: 400 px;">
	   <option value="<%=AssetType%>" selected="selected"><%=AssetType%> </option>
	<option value="Select">*Select Asset Type&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;              </option>
				 
  </select>
      
      <select  class="element select medium"   id="Status" name="Status"  style="width: 400 px;">
	   <option value="<%=status%>" selected="selected"><%=status%> </option>
	<option value="Select">*Select Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;              </option>
			<%if(status.equals("1")){%>
			<option value="0" >0</option>
			<% }else{%>
				<option value="1" >1</option> 
				 
			<%} %>	 
				 
  </select>

      
      <input type="hidden" name="id" value=<%=id%>>
      
      <input type="text" name="seatcapacity" value="<%=seating_capacity%>" id="seatcapacity" placeholder="Seating Capacity"/>
     
      <!-- <input type="text" name="status" value="" id=Status placeholder="Status"/> -->
      <!-- <input type="text" name="entryby" value="" id=entryby placeholder="Entryby"/> -->
      <!-- <input type="button"  value="Submit" placeholder="submit" /> -->
     <!--  <input type="submit"  value="Submit" placeholder="submit" /> -->
     
      </form>
       <button onclick="return validate();">Submit</button>
      <!-- <button>Reset</button> --> 
    </form> 
  </div>
           
           
 
            <!-- <table border="1" width="30%" cellpadding="5">
                <thead>
                    <tr>
                    <br><br>
                        <th colspan="2">Enter Location Information </th>
                    </tr>
                </thead>
                <tbody>
                <tr>
                        <td>ID</td>
                        <td><input type="text" name="rid"  value="" /></td>
                    </tr>
                    <tr>
                        <td>Code</td>
                        <td><input type="text" name="code"  value="" /></td>
                    </tr>
                    <tr>
                        <td>Location</td>
                        <td><input type="text" name="location"  value="" /></td>
                    </tr>
             -->        <!--  <tr>
                        <td>Poles</td>
                        <td><input type="text" name="pols"  value="" /></td>
                    </tr>
                    <tr>
                        <td>Premium</td>
                        <td><input type="text" name="premium"  value="" /></td>
                    </tr> -->
                    <tr>    
                   <!--  <td>Status</td>
                        <td><input type="text" name="status" value="" /></td>
                    </tr>
                    
                    <tr>
                        <td>Entry By</td>
                        <td><input type="text" name="entryby"  value="" /></td>
                    </tr>
                    
                    
                    <tr>
                       
                        <td><input type="reset" value="Reset" /></td>
                         <td><input type="submit" value="Submit" /></td>
                    </tr> -->
                   <!--  <tr>
                        <td colspan="2">Already registered!! <a href="index.jsp">Login Here</a></td>
                    </tr> -->
                </tbody>
            </table>
            </center>
            
            <%@ include file="footer.jsp"%>