<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
     <link type="text/css" rel="stylesheet" href="style.css" />
    <link type="text/css" rel="stylesheet" href="reset.css" />  
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Smart Grid</title>
</head>
  <%@ include file="index.jsp"%>
<body marginwidth="250 px">

  <form name=userinfo method="post" action="register1.jsp" enctype="multipart/form-data">
            <center>
            <br>
            <div class="module form-module">
           <div class="toggle"><i class="fa fa-times fa-pencil"></i>
           </div>
           <div class="form">
    <h2>Enter Your Information</h2>
    <!-- <form> -->
      <input type="text" name="fname" value="" id="fname" placeholder="First Name"/>
       <input type="text" name="lname" value="" id=lname placeholder="Last Name"/> 
      <select type="text" name="stat" value="" id=stat placeholder="Status"/>
     <input type="text" name="rol" value="" id=rol placeholder="Role"/>
     <input type="text" name="usr" value="" id=usr placeholder="User Name"/>
     <input type="password" name="pwd" value="" id=pwd placeholder="Password"/>
       <!-- <input type="text" name="entryby" value="" id=entryby placeholder="Entryby"/> -->
      <!-- <input type="file" name="uProperty" value="" /> <br> -->
  <!-- <input type="button" name="goUpload" value="Upload" /> --> 
      <input type="file" name="document" id=document /> <br>
      <button>Login</button>

</div>
</div>
</form>

</body>
</html>