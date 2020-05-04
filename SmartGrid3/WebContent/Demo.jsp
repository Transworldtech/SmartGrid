
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="com.sun.org.apache.xalan.internal.xsltc.compiler.sym"%>
<%@page import="org.apache.el.lang.ELSupport"%>
  <%@ page import="java.text.SimpleDateFormat" %>
   <%@ include file="Conn.jsp"%>
      <%@ page import="java.sql.*" %>
<% 

/* String country="",state="",city="",area="",company="",location_veh="",route="",poleid="",deviceid="";
String end_customer="",assettype="",seatingcapacity="";
String country1="",state1="",city1="",area1="";
*/
 
 Connection conn=null;
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
    Statement st=conn.createStatement();
  Statement st1=conn.createStatement();
 
%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>




<link rel="stylesheet" type="text/css" src="css/jquery-ui-1.8.13.custom.css">
<link rel="stylesheet" type="text/css" src="css/ui.dropdownchecklist.themeroller.css">
 <script type="text/javascript" src="Jquery/jquery-1.6.1.min.js"></script>
    <script type="text/javascript" src="Jquery/jquery-ui-1.8.13.custom.min.js"></script>
    
    <!-- Include the DropDownCheckList supoprt -->
     <script type="text/javascript" src="Jquery/ui.dropdownchecklist.js"></script> 

</head>


<body>

 <script type="text/javascript">
    $(document).ready(function() {
        
     $("#multiselect").dropdownchecklist( {
onItemClick: function(checkbox, selector){
 var justChecked = checkbox.prop("checked");

 var checkCount = (justChecked) ? 1 : -1;

 for( i = 0; i < selector.options.length; i++ ){
  if ( selector.options[i].selected ) checkCount += 1;
  

  
 }
    if ( checkCount > 20 ) {
  alert( "Limit is 20 fruits to choose" );
  throw "too many";
 }
    
    
},width: 250 
            });    
    });
            </script>





<table>

<tr>


<td>
Area:<select  colur="red" id="multiselect" class="multiselect" multiple>
             <option value='a'>Apple</option>
             <option value='b'>Mango</option>
             <option value='c'>Orange</option>
             <option value='d'>Strawberry</option>
             <option value='e'>Banana</option>
         </select>
         
         
    </td>
    </tr>
</table>






</body>
</html>