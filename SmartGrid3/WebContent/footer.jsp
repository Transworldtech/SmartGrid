<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>


</head>
<body>
<style type="text/css">
  

 div.absolute {
    position: fixed;
    left: 20px;
   
    width: calc(100%);
    border:none;
  bottom:0;
    
} 
  </style>

 <br><br><br><br><br>
<div class="absolute" >


<%
Date dft=new Date();
int year=dft.getYear()+1900;
%>
 
<footer style="100%-200px;"> Terms  &nbsp;&nbsp; &nbsp;&nbsp;    Privacy Policy  &nbsp;&nbsp; &nbsp;&nbsp;    Send feedback  &nbsp;&nbsp; &nbsp;&nbsp;    © <%=year%> SmartGridInfra LLP</footer>

</div>

</body>
</html>