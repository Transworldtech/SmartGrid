<%-- <%@page contentType="text/html" pageEncoding="UTF-8"%> --%>
<%@ include file="headernew.jsp"%>
<!DOCTYPE html>
<html>
    <head>
    <link type="text/css" rel="stylesheet" href="style.css" />
    <!-- <link type="text/css" rel="stylesheet" href="reset.css" />    -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Location Registration</title>
      <script LANGUAGE="JavaScript">
        
     function validate()
  {
    var code=document.locinfo.code.value;
	var loc=document.locinfo.location.value;
	var pols=document.locinfo.pols.value;
	var pre=document.locinfo.premium.value;
	var status=document.locinfo.status.value;
	var EntBy=document.locinfo.entryby.value;
	
	/* var role=document.userinfo.role.value;
	var user=document.userinfo.user.value;
	var pwd=document.userinfo.password.value;
	var cdate=document.userinfo.createdate.value;
	 */		 
	 if(code=="") 
        {
 		alert("Please Enter Code");
		return false;
 	}
	
	
	if(loc=="") 
        {
 		alert("Please Enter Location");
		return false;
 	}
	
	
	if(pols=="") 
    {
		alert("Please Enter Poles and it should be Numeric");
	return false;
	}
	  var numericExpression = /^[0-9]+$/;

     if(!(pols.match(numericExpression)))
		{
				    alert("Poles should be Numeric");
				    return false;
		}	
     
     
     if(pre=="") 
     {
 		alert("Please Enter Premium and it should be Numeric");
 	return false;
 	}
 	  var numericExpression =  (/^-?\d*(\.\d+)?$/);
 	

      if(!(pre.match(numericExpression)))
 		{
 				    alert("Premium should be Numeric");
 				    return false;
 		}	


	
	if(status=="") 
    {
		alert("Please Enter Staus and it should be Numeric");
	return false;
	}
	  var numericExpression = /^[0-9]+$/;

     if(!(status.match(numericExpression)))
		{
				    alert("Status should be Numeric");
				    return false;
		}	
      
     if(EntBy=="") 
     {
		alert("Please Enter Entry By");
		return false;
	}

    
      
      
      /* if(user=="") 
      {
  		alert("Please enter UserName");
  	return false;
  	}
  	  var numericExpression =   /^[0-9a-zA-Z\s\r\n@!#\$\^%&*()+=\-\[\]\\\';,\.\/\{\}\|\":<>\?]+$/;





       if(!(user.match(numericExpression)))
  		{
  				    alert("UserName should be combination of aplha numbers and special symbol");
  				    return false;
  		}	


       if(pwd=="") 
       {
		alert("Please enter your Password");
		return false;
	}
       
       if(cdate=="") 
       {
		alert("Please enter created date");
		return false;
	}
 */       
	
      return true;
  }
      </script>          
    </head>
    <body>
     <br><br><br> <br><br>
        <form name=locinfo method="post" action="LocationEntry1.jsp" onSubmit="return validate()";>
      
            <center>
            <br><br><br>
            <div class="module form-module">
           <div class="toggle"><!-- <i class="fa fa-times fa-pencil"></i> -->
           </div>
           <div class="form">
    <h2>Enter Location Information</h2>
    <form>
      <input type="text" name="code" value="" id="code" placeholder="Code"/>
      <input type="text" name="location" value="" id=location placeholder="Location"/>
      <input type="text" name="pols" value="" id=pols placeholder="Poles"/>
      <input type="text" name="premium" value="" id=premium placeholder="Premium"/>
      <input type="text" name="status" value="" id=Status placeholder="Status"/>
      <!-- <input type="text" name="entryby" value="" id=entryby placeholder="Entryby"/> -->
      <!-- <input type="button"  value="Submit" placeholder="submit" /> -->
     <!--  <input type="submit"  value="Submit" placeholder="submit" /> -->
      
       <button>Submit</button>
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