<%@ include file="headernew.jsp"%>

<%! Connection conn = null;
	Statement st = null,st1 = null;
	
%>
<%-- <%@page contentType="text/html" pageEncoding="UTF-8"%> --%>
<!DOCTYPE html>
<html>
    <head>
      <link type="text/css" rel="stylesheet" href="style.css" />
  <!--   <link type="text/css" rel="stylesheet" href="reset.css" />  -->      
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <script>
        function validate() 
        {
        	
        	var firstname=document.getElementById("fname").value;
        		var lastname=document.getElementById("lname").value;
        		var company=document.getElementById("company").value;
        			var username=document.getElementById("usr").value;
        			var role=document.getElementById("rol").value;
        				var password=document.getElementById("pwd").value;
        				
        				var invalid=/^[a-zA-Z .]+$/;
        				
        		if(firstname.trim()=="")
                   {
        			alert("Please Enter First Name");
        			return false;
        			
                     }
        		
        		if(!invalid.test(firstname))
        			{
        			alert("Please Enter Valid Character Only for First name");
        			document.getElementById("fname").value="";
        			return false;
        			
        			}
        		
        	        var dot=".";
        	        
        	        if(firstname.split(".").length>1)
        	        	{
        	        if(firstname.indexOf(dot)!=2)
        		    {
        	        	alert("Please Enter Valid Character Only for First name");
        	        	document.getElementById("fname").value="";
        	        	return false;
        	        	
        		    }
        		
        	        	}
        		
        		if(lastname.trim()=="")
        	       {
        	        alert("Please Enter Last Name");
        	        return false;
        	        			
        	       }	
        		
        		if(company.trim()=="select")
        			{
        			alert("Please Select Company");
        	        return false;
        			
        			}
        		
        		
        		if(role.trim()=="0")
        			{
        			alert("Please Select Role");
        	        return false;
        			
        			}
        		
        		
        		
        		
        		
        		if(username.trim()=="")
    			{
    			alert("Please Enter User Name ");
    	        return false;
    			
    			}
        	
        		
        		if(password.trim()=="")
    			{
    			alert("Please Enter Password ");
    	        return false;
    			
    			}
        					
        
        	
        }
        
        
        function DuplicateUser()
		{
			
  var user=document.getElementById("usr").value;
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

		// Create a function that will receive data sent from the server
		ajaxRequest.onreadystatechange = function()
		{ 
			if(ajaxRequest.readyState == 4)
			{
				   var reslt=ajaxRequest.responseText;
			
				   
				   if(reslt.trim()!="")
					   {
				  alert("User Name Already Exist!!Please Enter Unique User Name");
				  
				  document.getElementById("usr").value="";
					   }
				   else
					   {
					   
					   }
				
				

			} 
		}
		var queryString = "?user="+user;
		ajaxRequest.open("GET", "AjaxDupUserId.jsp" + queryString, true);
		ajaxRequest.send(null); 
		//document.getElementById("dirid2").style.display





			}
        
        
        
        
        </script>
        
        <br><br><br><br>
        <title>Registration</title>
                
    </head>
    <body>
        <form name=userinfo method="post" action="register1.jsp" enctype="multipart/form-data">
            <center>
            <br>
            <div class="module form-module">
           <div class="toggle"><!-- <i class="fa fa-times fa-pencil"></i> -->
           </div>
           <div class="form">
    <h2>User Information</h2>
    <!-- <form> -->
      <input type="text" name="fname" value="" id="fname" placeholder="*First Name"/>
       <input type="text" name="lname" value="" id=lname placeholder="*Last Name"/> 
       <%
    try{
//Class.forName("com.mysql.jdbc.Driver").newInstance();
Class.forName(MM_dbConn_DRIVER);
	 conn = DriverManager.getConnection(MM_dbConn_STRING1, MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
	 st = conn.createStatement();
	 st1 = conn.createStatement();

	/*  ResultSet resultset =st.executeQuery("select CompanyName from smartgrid.t_companymaster") ; */
	
	ResultSet resultset =st.executeQuery("select typevalue  as  CompanyName from db_gps.t_transporter where ActiveStatus='Yes' and category='SMARTGRID'") ;
	
	
	
%>


        <select type="text" name="company" id="company">
        <option value="select"  selected="selected">*Select Company</option>
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

<%

ResultSet resultset1 =st1.executeQuery("select rolename from smartgrid.t_rolemaster");
%>

      <!-- <select type="text" name="stat" value="" id=stat placeholder="Status"/> -->
      <select type="text" name="rol"  id="rol">
        <option value="0" selected="selected">*Select UserLevel</option>
        
         <%  while(resultset1.next()){ %>
        	
            <option value="<%= resultset1.getString("rolename").trim()%>"><%= resultset1.getString("rolename").trim()%></option>
        <% } %>
        
        </select>
     <!-- <input type="text" name="rol" value="" id=rol placeholder="Role"/> -->
     <input type="text" name="usr" value="" id="usr" placeholder="*User Name" onblur="DuplicateUser();" />
     <input type="password" name="pwd" value="" id="pwd" placeholder="*Password"/>
       <!-- <input type="text" name="entryby" value="" id=entryby placeholder="Entryby"/> -->
      <!-- <input type="file" name="uProperty" value="" /> <br> -->
  <!-- <input type="button" name="goUpload" value="Upload" /> --> 
      <input type="file" name="document" id=document /> <br>
      <button onclick="return validate();">Submit</button>

</div>
</div>
</form>
</body>
</html>
<%@ include file="footer.jsp"%>

           