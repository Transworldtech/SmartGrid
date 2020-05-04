<%@ include file="headernew.jsp"%>

<%! Connection conn = null;
	Statement st = null;
	
%>
<%-- <%@page contentType="text/html" pageEncoding="UTF-8"%> --%>
<!DOCTYPE html>
<html>
    <head>
      <link type="text/css" rel="stylesheet" href="style.css" />
  <!--   <link type="text/css" rel="stylesheet" href="reset.css" />  -->      
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <br><br><br><br>
        <title>Registration</title>
                
    </head>
    <script>
    function validate() 
        {
        	
        	var firstname=document.getElementById("fname").value;
        		var lastname=document.getElementById("lname").value;
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
        		
        		
        		
        		
        		
        		
        		
        		
        		
        		
        		
        					
        
        	
        }
        
        </script>
    
    
    <body>
        <form name=userinfo method="post" action="EditUser1.jsp" >
            <center>
            <br>
            <div class="module form-module">
           <div class="toggle"><!-- <i class="fa fa-times fa-pencil"></i> -->
           </div>
           <div class="form">
           <%
           String user="",firstname="",lastname="",status="",role1="";
           String rid=request.getParameter("rid"); 
    try{
//Class.forName("com.mysql.jdbc.Driver").newInstance();
/* String rid=request.getParameter("rid"); */
Class.forName(MM_dbConn_DRIVER);
	 conn = DriverManager.getConnection(MM_dbConn_STRING1, MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
	 st = conn.createStatement();

	 ResultSet resultset =st.executeQuery("select user,firstname,lastname,status,Userlevel from smartgrid.t_security where rid ='"+rid+"'   ") ;
          
	 while(resultset.next())
	 {
		 
		 user=resultset.getString("user");
		 firstname=resultset.getString("firstname");
		 lastname=resultset.getString("lastname");
		 status=resultset.getString("status");
		 role1=resultset.getString("Userlevel");
		 
	 }
	 
	 
System.out.println("user===>"+user);
System.out.println("firstname===>"+firstname);
System.out.println("lastname===>"+lastname);
System.out.println("status===>"+status);
System.out.println("role===>"+role1); 
        }
        catch(Exception e)
        {
            /*  out.println("wrong entry"+e); */
        }
%>
           
    <h2>Edit User Information</h2>
    <!-- <form> -->
      <div align="left">
      <font color="red" size="2"> <b>*</b> </font>
   <font color="black" size="2"> <b>First Name:</b> </font></div>
      <input type="text" name="fname" id="fname"  value="<%=firstname %>"/>
      
       <div align="left">
       <font color="red" size="2"> <b>*</b> </font>
   <font color="black" size="2"> <b>Last Name:</b> </font></div>
      <input type="text" name="lname"  id="lname"  value="<%=lastname%>"   /> 
   
    <input type="hidden" name="rid"  id="rid"  value="<%=rid%>"   /> 


    <div align="left">
   <font color="black" size="2"> <b>Role:</b> </font></div> 
      <select name="rol"  id="rol">
      
             <% if(role1.equals("Admin")){%>
   
            <option value = "Admin" selected="selected">Admin</option>
            <option value = "Infrapartner">Infrapartner</option>
            <option value = "Mediapartner">Mediapartner</option>
      
            <%}
             else if(role1.equals("Infrapartner"))
              {   %>
              
            <option value = "Infrapartner" selected="selected">Infrapartner</option>	
              <option value = "Admin" >Admin</option>
              <option value = "Mediapartner" >Mediapartner</option>
             
            
<% }

            

             else 
              {   %>
              
            <option value = "Mediapartner" selected="selected">Mediapartner</option>	
              <option value = "Admin" >Admin</option>
              <option value = "Infrapartner" >Infrapartner</option>
             
            
<% }%>    
        
       </select>
       
          <div align="left">
   <font color="black" size="2"> <b>Status:</b> </font></div> 
        <select name="status"  id="status">
      
             <% if(status.equals("Active")){%>
   
            <option value = "Active" selected="selected">Active</option>
            <option value = "No">Deactive</option>
      
            <%}
             else if(status.equals("No"))
              {   %>
              
            <option value = "No" selected="selected">Deactive</option>	
              <option value = "Active" >Active</option>
       
            
<% }%>            	 
        
        
       </select>
       
       
       
       
       



   <!--    <input type="file" name="document" id=document /> <br>
 -->      <button onclick="return validate();" >Update</button>

</div>
</div>
</form>
</body>
</html>
<%@ include file="footer.jsp"%>

           