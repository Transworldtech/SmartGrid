
<%@ include file="header.jsp"%>

    <head>
    
         
    <link type="text/css" rel="stylesheet" href="style.css" />
<!--     <link type="text/css" rel="stylesheet" href="reset.css" />
     -->
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome To SmartGrid</title>
        
        <script LANGUAGE="JavaScript">
        /* function validate()
  {
   var user=document.userinfo.user.value;
	var pwd=document.userinfo.password.value;
	
	if(user=="") 
      {
  		alert("Please Enter UserName");
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
		alert("Please Enter Password");
		return false;
	}
	return true;
  }
 */       
 function validate()
	{
		if(document.getElementById("user").value=="")
		{
				alert("Please Enter User Name");
				return false;
		}
		if(document.getElementById("oldpassword").value=="")
		{
				alert("Please Enter Old password");
				return false;
		}
		if(document.getElementById("newpassword").value=="")
		{
				alert("Please Enter New password");
				return false;
		}
		return true;
	}
 
 </script>
	
               
                    </head>
    <body>
          <form name=userinfo method="post" action="updatepasswordaction.jsp" onSubmit="return validate()";>
            <center><br><br><br><br>
           <div class="module form-module">
           <div class="toggle"><i class="fa fa-times fa-pencil"></i>
           </div>
            <div class="form">
    <h2>Change your Account Password</h2>
    <form>
      <input type="text" name="user" value="" id="user" placeholder="Username"/>
      <input type="password" name="oldpassword" value="" id="oldpassword" placeholder="Old Password"/>
            <input type="password" name="newpassword" value="" id="newpassword" placeholder="New Password"/>
      
      <button>Change</button>
    </form> 
  </div>
   </div>
            
            </center>
            
        </form>
          </body>
</html>
<br><br><br><br><br><br><br><br><br>
<%@ include file="footer.jsp"%>