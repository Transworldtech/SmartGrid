<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ page import="java.sql.*" %>
       <%@ page import="java.text.SimpleDateFormat" %>
       <%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@ include file="Conn.jsp"%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
       
       
function Redirect1()
{
	//alert('Default Schedule Created Successfully');  
	swal('Default Schedule Uploaded Successfully  ','','success');
	  // swal("Good job!", "You clicked the button!", "success");
		//	window.location='CreateDefaultSchedule.jsp';

	  location='UploadDefaultSchedule.jsp';
	//	 location='EwayInsertForm.jsp';
}
function Redirect2()
{
	//alert('Default Schedule Not Created Successfully Try Again');  

	swal('Default Schedule Not Uploaded Successfully Try Again','','error');
	 
	//window.location='CreateDefaultSchedule.jsp';

	location='UploadDefaultSchedule.jsp';
	//	 location='EwayInsertForm.jsp';
}

</script>

</head>
<body>
<%
java.sql.Connection con;
java.sql.Connection con1;
java.sql.Connection con2;
java.sql.Statement st ;
Statement st1,st2;
ResultSet rs,rs1,rs2;
String MM_dbConn_DRIVER="org.gjt.mm.mysql.Driver";
String MM_dbConn_USERNAME="fleetview";
String MM_dbConn_PASSWORD="1@flv";
String MM_dbConn_STRING="jdbc:mysql://103.241.181.36/smartgrid";
//String MM_dbConn_STRING="jdbc:mysql://localhost:3306/smartgrid";
//String MM_dbConn_STRING="jdbc:mysql://localhost:3306/smartgrid";
String MM_dbConn_STRING1="jdbc:mysql://103.241.181.36/db_gpsExceptions";
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

st1 = con1.createStatement(); 	 
st2 = con1.createStatement(); 
st = con1.createStatement();
Class.forName(MM_dbConn_DRIVER);
String[] ids=request.getParameterValues("PoleID");
String schname=request.getParameter("schname");
System.out.println("Poles ID's : "+ids);
System.out.println("schname : "+schname);
int count1=0;
String username=session.getAttribute("User").toString();
String company = session.getAttribute("company").toString();
String typevalue=session.getAttribute("typevalue").toString();

String  entryDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());


String Location="",medianame="",duration="",mediatype="";
for(String PoleID:ids){
System.out.println("Poles  : "+PoleID);


String GetLoc="select Location from smartgrid.t_polmaster where Deviceid='"+PoleID+"'";
System.out.println("Query is : "+GetLoc);
//int SlotDuration=0;
 rs = st.executeQuery(GetLoc);
 if(rs.next()){
	 
		
	 Location=rs.getString("Location");
	 //Company=rs.getString("Company");
 }
 String GetDefaultSchedule="select schmedianame,mediatype,duration from smartgrid.t_defaultschedulemaster where schname='"+schname+"'";
 System.out.println("Query is : "+GetDefaultSchedule);
 //int SlotDuration=0;
  rs1 = st1.executeQuery(GetDefaultSchedule);
  while(rs1.next()){
 	 
 		
	  medianame=rs1.getString("schmedianame");
	  mediatype=rs1.getString("mediatype");
	  duration=rs1.getString("duration");

 
 
 String insertSQL = "insert into smartgrid.t_defaultschedule1(schname,medianame,duration,mediatype,poleid,location,owner,entryby,entrydatetime)values('"+schname+"','"+medianame+"','"+duration+"','"+mediatype+"','"+PoleID+"','"+Location+"','"+typevalue+"','"+username+"','"+entryDate+"')";
 count1=st2.executeUpdate(insertSQL);
 System.out.println("insertSQL:-"+insertSQL); 
  }
}
if(count1>0)
{
	out.println("<script>  Redirect1();</script>");

}
else
{
	out.println("<script>  Redirect2();</script>");

}

%>
</body>
</html>