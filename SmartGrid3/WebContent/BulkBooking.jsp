<%-- <%@page contentType="text/html" pageEncoding="UTF-8"%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
    <body >
<%@ include file="headernew.jsp"%>
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
		
%>




    <head>
    
    
<!--     <link type="text/css" rel="stylesheet" href="style.css" /> -->
    
   <style>
 
    
    
    table.tbh {
    border-collapse: collapse;
}

 table.tbh
 {
  border: 1px solid black;
 }
 th.tbh {
    border: 1px solid black;
   color:  white;
    background-color: #3a3f51;
}
td.tbh {
    border: 1px solid black;
  	/* background-color: #f37a4d; */
	color:  #3a3f51;
}
    
   

.popup {
background-color: #98AFC7;
position: absolute;
visibility: hidden;
}
.popupnew {
background-color: #98AFC7;
position: absolute;
visibility: visible;
}



div.absolute1 {
    position: absolute;
   margin-left: 30px;
    width:100%;
    border:0;
}    
</style>

         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bulk Booking Registration</title>
      <script>

    function ShowHideDiv()
      {
window.location='BusBooking.jsp';
      		}
    
    
    function ShowHideDiv1()
    {
    	alert("Work On Progress For Pole");
    		//window.location='PoleBooking.jsp';
    }
    
    function ShowHideDiv2()
    {
    	alert("Work On Progress For Both");
   // window.location='BothBooking.jsp';
    }
    
    
						</script>          
   

    <br>
    <br>
    <br>
<center>
<tr>
<td>
	<div style="margin-center: 200px">
	<font size="3"><B>Advertise On</B></font></div>
	</td>
</tr>

</center>

<br>
<br>
<br>
<br>




    <table width="100%">


<tr><td align="center"><img src="img/Pole.png" width="4%" height="4%" />Pole: <input type="radio" value="Pole" id="chkpole" name="chkPassPort" onchange="ShowHideDiv1()" /></td></tr>
<tr><td align="center"><img src="img/Bus.jpeg" width="4%" height="4%" />Bus :  <input  type="radio" value="Bus" id="chkbus" name="chkPassPort" onchange="ShowHideDiv()" /></td></tr>
<tr><td align="center"><img src="img/Pole.png" width="2%" height="2%" /><img src="img/Bus.jpeg" width="2%" height="2%" />Both: <input  type="radio" value="Bus" id="chkbus" name="chkPassPort" onchange="ShowHideDiv2()" />
</td>
</tr>



	</table>


	

 
 </br>
 </br>
 </center>
 </br>
 </br>
 </meta>
 </head>
 
 
 


      
         
            
            </body>
             
            </html>
            
           <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
 <br><br>
            
             <%@ include file="footer.jsp"%>
                 
            