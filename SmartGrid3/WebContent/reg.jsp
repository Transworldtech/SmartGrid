<%@ include file="headernew.jsp"%>

<!DOCTYPE html>
<html>
    <head>
      <link type="text/css" rel="stylesheet" href="style.css" />
    <link type="text/css" rel="stylesheet" href="reset.css" />       
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
      <script LANGUAGE="JavaScript">
        
        function validate()
  {
    /* var id=document.userinfo.rid.value; */
	var fnam=document.userinfo.fname.value;
	var lnam=document.userinfo.lname.value;
	var status=document.userinfo.status.value;
	var role=document.userinfo.role.value;
	var user=document.userinfo.user.value;
	var pwd=document.userinfo.password.value;
	/* var cdate=document.userinfo.createdate.value; */
	var entryby=document.userinfo.entryby.value;
	
	
	/* if(id=="") 
    {
		alert("Please enter ID and it should be Numeric");
	return false;
	}
	  var numericExpression = /^[0-9]+$/;

     if(!(id.match(numericExpression)))
		{
				    alert("ID should be Numeric");
				    return false;
		}	
 */
		 
	 if(fnam=="") 
        {
 		alert("Please enter your First Name");
		return false;
 	}
	
	
	if(lnam=="") 
        {
 		alert("Please enter your Last Name");
		return false;
 	}
	
	if(status=="") 
    {
		alert("Please enter Staus and it should be Numeric");
	return false;
	}
	  var numericExpression = /^[0-9]+$/;

     if(!(status.match(numericExpression)))
		{
				    alert("Status should be Numeric");
				    return false;
		}	
      
     if(role=="") 
     {
 		alert("Please enter role and it should be Numeric");
 	return false;
 	}
 	  var numericExpression = /^[0-9]+$/;

      if(!(role.match(numericExpression)))
 		{
 				    alert("Role should be Numeric");
 				    return false;
 		}	

      
      
      if(user=="") 
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
       
      /*  if(cdate=="") 
       {
		alert("Please enter created date");
		return false;
	} */
       
       if(entryby=="") 
       {
		alert("Please enter Entryby");
		return false;
	}
       
       

	
  
      return true;
  }
     </script>          
    </head>
    <body>
        <form name=userinfo method="post" action="registration.jsp" onSubmit="return validate()";>
            <center>
            <br><br>
            <div class="module form-module">
           <div class="toggle"><i class="fa fa-times fa-pencil"></i>
           </div>
           <div class="form">
    <h2>Enter Your Information</h2>
    <form>
      <input type="text" name="fname" value="" id="fname" placeholder="First Name"/>
      <input type="text" name="lname" value="" id=lname placeholder="Last Name"/>
      <input type="text" name="status" value="" id=status placeholder="Status"/>
       <input type="text" name="role" value="" id=role placeholder="Role"/>
      <input type="text" name="user" value="" id=user placeholder="User Name"/>
     <input type="password" name="password" value="" id=password placeholder="Password"/>
      <input type="text" name="entryby" value="" id=entryby placeholder="Entryby"/>
      <button>Login</button>
     
        </form>
        </div>
        </div>
        </center>
        </form>
        </body>
        </html>
        <br><br><br><br><br><br><br><br><br>
        <%@ include file="footer.jsp"%>   
            
            
            