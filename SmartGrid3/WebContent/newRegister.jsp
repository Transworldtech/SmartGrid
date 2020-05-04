
	

<%-- <%! Connection conn = null;
	Statement st = null;
	
%> --%>
<%-- <%@page contentType="text/html" pageEncoding="UTF-8"%> --%>
<!DOCTYPE html>
<html>
    <head>
      <link type="text/css" rel="stylesheet" href="style.css" />
  <!--   <link type="text/css" rel="stylesheet" href="reset.css" />  -->      
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
        <title>Registration</title>
        <script language = "Javascript">

function emailcheck(str) {

var at="@"
var dot="."
var lat=str.indexOf(at)
var lstr=str.length
var ldot=str.indexOf(dot)
if (str.indexOf(at)==-1){
alert("Invalid E-mail ID")
return false
}

if (str.indexOf(at)==-1 || str.indexOf(at)==0 || str.indexOf(at)==lstr){
alert("Invalid E-mail ID")
return false
}

if (str.indexOf(dot)==-1 || str.indexOf(dot)==0 || str.indexOf(dot)==lstr){
alert("Invalid E-mail ID")
return false
}

if (str.indexOf(at,(lat+1))!=-1){
alert("Invalid E-mail ID")
return false
}

if (str.substring(lat-1,lat)==dot || str.substring(lat+1,lat+2)==dot){
alert("Invalid E-mail ID")
return false
}

if (str.indexOf(dot,(lat+2))==-1){
alert("Invalid E-mail ID")
return false
}

if (str.indexOf(" ")!=-1){
alert("Invalid E-mail ID")
return false
}
//alert("valid E-mail ID")
return true 
}

function ValidateEmail(){

var emailID=document.userinfo.emal

if ((emailID.value==null)||(emailID.value=="")){
alert("Please Enter your Email Address")
emailID.focus()
return false
}
if (emailcheck(emailID.value)==false){
emailID.value=""
emailID.focus()
return false
}
return true
}


function CopyAdd() {
	 
	  var cb1 = document.getElementById('sameadd');
	  var a1 = document.getElementById('emal');
	  var al1 = document.getElementById('usr');
	  

	  if (cb1.checked) {
	    al1.value = a1.value;
	    

	  } else {
	    al1.value = '';
	    

	  }
	}
</script>   
<div style="height:50px;" >
 
<header  >
<table>
<tr>

<td>
<img src="New Logo - SmartGrid.png"  height="60" width="200">
 </td>
 <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  SmartGrid
  <!-- <div style="text-align: right; font-size:0.5 px; font-weight: normal;"> login</div> -->
</td>
</tr>
</table>
</header>
</div>
        <meta charset='utf-8'>
                                <meta name='viewport' content='width=device-width, initial-scale=1'>
                                <title>Smart Grid</title>
                                <link href='//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css' rel='stylesheet'>
                                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
                                <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
                                
                                <style>    body,html{
		height: 100% ;
	}
    <style>
             
    </head>
    <body>
    
div.container {
    width: 100%;
    border: 1px solid gray;
}

header{

  font-size: 2em;
    margin-top: -2;
   /*  margin-bottom: 0.67em; */
   margin-bottom:-21 px;
    margin-left: 0;
    margin-right:0;
    font-weight: normal;
  overflow:auto;
   /*  padding: 0.40em; */
   padding: -0.6em;
      color:#58666e;
      font-family:Arial;
      font-weight:300;
      
    /* background-color: #D8592B; */
    
   /*  background-color:#7D7A78; */
        background-color: #642993;
    clear: left;
    text-align: center;
    -webkit-font-smoothing:antialiased;

  /*  position:fixed;
    left: 20%; */
   }

footer
{

 font-size: 12 px;
    margin-top: 0.3em;
    margin-bottom: 0.3em;
    margin-left: 0;
    margin-right: 0;
    font-weight: bold;

   background-color: #f5f5f5; 
  
    padding: 0em;
   /*  color: white; */
   color:#58666e;
    font-family:'Source Sans Pro', 'Helvetica Neue', Helvetica, Arial, sans-serif;
-webkit-font-smoothing:antialiased;
    clear: left;
    text-align: center;
 overflow:auto;

}


/* div.abs {
    width: 100px;
    height: 100px;
    background: red;
    -webkit-transition-property: width; /* Safari */
    /* -webkit-transition-duration: 2s; /* Safari */
   /* transition-property: width;*/
  /*  transition-duration: 2s; */
    
/*}*/

/* div.abs:hover {
  /*  width: 300px;*/
} */

/* #divfix {
      
       position: fixed;
      
        } */

/* ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #333;
}

li {
    float: left;
}

li a {
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

li a:hover {
    background-color: #111;
}
 */

</style>

        <form name=userinfo method="post" action="newregistration.jsp" enctype="multipart/form-data">
            <center>
            <br>
            <div class="module form-module">
           <div class="toggle"><!-- <i class="fa fa-times fa-pencil"></i> -->
           </div>
           <div class="form">
    <h2>Enter Your Information</h2>
    <!-- <form> -->
      <input type="text" name="fname" value="" id="fname" placeholder="First Name"/>
      
       <input type="text" name="lname" value="" id=lname placeholder="Last Name"/>
       <input type="text" name="emal" value="" id=emal placeholder="Email ID" onblur="return ValidateEmail();"/>
       <input type="text" name="company" value="" id=company placeholder="Company Name"/> 
       <%
    try{
//Class.forName("com.mysql.jdbc.Driver").newInstance();
/* Class.forName(MM_dbConn_DRIVER);
	 conn = DriverManager.getConnection(MM_dbConn_STRING1, MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
	 st = conn.createStatement();

	 ResultSet resultset =st.executeQuery("select CompanyName from smartgrid.t_companymaster") ; */
%>


        <%-- <select type="text" name="company" id=company>
        <option value="" disabled selected>Select Company</option>
        <%  while(resultset.next()){ %>
        	
            <option value="<%= resultset.getString("CompanyName").trim()%>"><%= resultset.getString("CompanyName").trim()%></option>
        <% } %>
        </select> --%>


<%
//**Should I input the codes here?**
        }
        catch(Exception e)
        {
             out.println("wrong entry"+e);
        }
%>
      <!-- <select type="text" name="stat" value="" id=stat placeholder="Status"/> -->
      <!--   <select type="text" name="rol"  id=rol>
        <option value="" disabled selected>Select Role</option>
        
        	
            <option value = "1">Admin</option>
            <option value = "2">User</option>
        
        </select> -->
     <!-- <input type="text" name="rol" value="" id=rol placeholder="Role"/> -->
     
     <input type="text" name="addr" value="" id=addr placeholder="Address"/>
     
     <label><input id="sameadd" name="sameadd" type="checkbox" value="Sameadd" onchange="CopyAdd();" style="float: left; margin-top: 5px;"/><div style="margin-left: 25px;">check if User Name Same as Email.</div></label>
     <!-- <input type="text" name="adh" value="" id=adh placeholder="Aadhar No"/> -->
     <input type="text" name="usr" value="" id=usr placeholder="User Name"/>
     <input type="password" name="pwd" value="" id=pwd placeholder="Password"/>
     
       <!-- <input type="text" name="entryby" value="" id=entryby placeholder="Entryby"/> -->
      <!-- <input type="file" name="uProperty" value="" /> <br> -->
  <!-- <input type="button" name="goUpload" value="Upload" /> --> 
      <!-- <input type="file" name="document" id=document /> <br> -->
      <button>Submit</button>

</div>
</div>
</form>
</body>
</html>
<%@ include file="footer.jsp"%>

           