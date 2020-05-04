<%-- <%@page contentType="text/html" pageEncoding="UTF-8"%> --%>
<%@ include file="headernew.jsp"%>
<!DOCTYPE html>
<html>
    <head>
       <link type="text/css" rel="stylesheet" href="style.css" />
  <!--   <link type="text/css" rel="stylesheet" href="reset.css" />    -->
    
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Zone Registration</title>
      <script LANGUAGE="JavaScript">
        
     function validate()
  {
    var zon=document.zoneinfo.zone.value;
	var zcode=document.zoneinfo.zcode.value;
	var pols=document.zoneinfo.poles.value;
	var pre=document.zoneinfo.premium.value;
	var slot=document.zoneinfo.slots.value;
	/* var EntBy=document.zoneinfo.entryby.value; */
	
	/* var role=document.userinfo.role.value;
	var user=document.userinfo.user.value;
	var pwd=document.userinfo.password.value;
	var cdate=document.userinfo.createdate.value;
	 */
	
	
	
		 
	 if(zon=="") 
        {
 		alert("Please Enter Zone Name");
		return false;
 	}
	
	
	if(zcode=="") 
        {
 		alert("Please Enter Zone Code");
		return false;
 	}
	
	
	     
     if(pre=="") 
     {
 		alert("Please Enter Premium and it should be Numeric");
 	return false;
 	}
 	 /*  var numericExpression =  (/^-?\d*(\.\d+)?$/);
 	

      if(!(pre.match(numericExpression)))
 		{
 				    alert("Premium should be Numeric");
 				    return false;
 		}	

 */
	
	if(slot=="") 
    {
		alert("Please Enter Slots and it should be Numeric");
	return false;
	}
	  var numericExpression = /^[0-9]+$/;

     if(!(status.match(numericExpression)))
		{
				    alert("Slots should be Numeric");
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
 				    alert("Pols should be Numeric");
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
       <form name=zoneinfo method="post" action="ZoneEntry1.jsp" onSubmit="return validate()";>
            <center>
            <br><br><br><br><br>
            <div class="module form-module">
           <div class="toggle"><!-- <i class="fa fa-times fa-pencil"></i> -->
           </div>
           <div class="form">
    <h2>Enter Zone Information</h2>
    <form>
      <input type="text" name="zone" value="" id="zone" placeholder="Zone"/>
      <input type="text" name="zcode" value="" id=zcode placeholder="Zone Code"/>
       <input type="text" name="premium" value="" id=premium placeholder="Premium"/>
        <input type="text" name="slots" value="" id=slots placeholder="Slots"/>
         <input type="text" name="pols" value="" id=pols placeholder="Poles"/>
         <button>submit</button>
            
            
            
            
            
           <!--  <table border="1" width="30%" cellpadding="5">
                <thead>
                    <tr>
                    <br><br>
                        <th colspan="2">Enter Zone Information </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Zone</td>
                        <td><input type="text" name="zone" id="zone" value="" /></td>
                    </tr>
                    <tr>
                        <td>Zone Code</td>
                        <td><input type="text" name="zcode" id="zonecode"  value="" /></td>
                    </tr>
                                         <tr>
                        <td>Premium</td>
                        <td><input type="text" name="premium"  value="" /></td>
                    </tr>
                    <tr>    
                    <td>Slots</td>
                        <td><input type="text" name="premium" value="" /></td>
                    </tr>
                    <tr>
                        <td>Poles</td>
                        <td><input type="text" name="pols"  value="" /></td>
                    </tr>  
                    <tr>
                       
                        <td><input type="reset" value="Reset" /></td>
                         <td><input type="submit" value="Submit" /></td>
                    </tr>
            -->        <!--  <tr>
                        <td colspan="2">Already registered!! <a href="index.jsp">Login Here</a></td>
                    </tr> -->
                </tbody>
            </table>
            </center>
            
            <%@ include file="footer.jsp"%>