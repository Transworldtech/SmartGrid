
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="Conn.jsp"%>
      <%@ page import="java.sql.*" %>
       <%@ page import="java.text.SimpleDateFormat" %>
       <%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.DecimalFormat"%>
       
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
       
       <script type="text/javascript">
       
       
function Redirect1()
{
	//alert('Default Schedule Created Successfully');  
	swal('Default Schedule Deleted Successfully  ','','success');
	  // swal("Good job!", "You clicked the button!", "success");
		//	window.location='CreateDefaultSchedule.jsp';

	  location='CreateDefaultScheduleReport.jsp';
	//	 location='EwayInsertForm.jsp';
}
function Redirect2()
{
	//alert('Default Schedule Not Created Successfully Try Again');  

	swal('Default Schedule Not Deleted Successfully Try Again','','error');
	 
	//window.location='CreateDefaultSchedule.jsp';

	location='CreateDefaultScheduleReport.jsp';
	//	 location='EwayInsertForm.jsp';
}

</script>
   </head>
   <body>    
<%! Connection conn = null;
	Statement st = null;
	Statement st1 = null;
%>
<%
String MM_dbConn_DRIVER="org.gjt.mm.mysql.Driver";
String MM_dbConn_USERNAME="fleetview";
String MM_dbConn_PASSWORD="1@flv";
String MM_dbConn_STRING="jdbc:mysql://103.241.181.36/smartgrid";
//String MM_dbConn_STRING="jdbc:mysql://173.234.153.82:3306/smartgrid";
//String MM_dbConn_STRING="jdbc:mysql://localhost:3306/smartgrid";
String MM_dbConn_STRING1="jdbc:mysql://103.241.181.36/db_gpsExceptions";

Class.forName(MM_dbConn_DRIVER);
conn = DriverManager.getConnection(MM_dbConn_STRING, MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
Statement st2=conn.createStatement();
Statement st22=conn.createStatement();

st=conn.createStatement();
st1=conn.createStatement();
	String company;
String schname,medianame,medianame1,addroute,mediatype,Duration,tripendtime,prevschmedianame;
String route1;
String originlat,originlong,destlat,destlong;
schname=request.getParameter("schname");
prevschmedianame=request.getParameter("prevschmedianame");

medianame=request.getParameter("email1");
medianame1=request.getParameter("mediafile1");
route1=request.getParameter("ij");
mediatype=request.getParameter("mediatype");
Duration=request.getParameter("Duration");
String username=session.getAttribute("User").toString();
company = session.getAttribute("company").toString();
String typevalue=session.getAttribute("typevalue").toString();
String schname2= request.getParameter("schname2");
String schmedianame2=request.getParameter("schmedianame2");
String mediatype2=request.getParameter("mediatype2");

String  entryDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());

Duration="30";

int count1=0,count2=0;
String medianame11="mediafile",val="",mname="",Check="";
int i=0;
int j=100;


	 String insertSQL2="delete  from  smartgrid.t_defaultschedulemaster where  schname='"+schname2+"' and schmedianame='"+schmedianame2+"'";
	 count1=st2.executeUpdate(insertSQL2);
	System.out.println("Update Query-----:-"+insertSQL2); 
	
	String insertSQL = "insert into smartgrid.t_defaultschedulemasterHistory(schname,schmedianame,mediatype,owner,entryby,entrydatetime,duration)values('"+schname2+"','"+schmedianame2+"','"+mediatype2+"','"+typevalue+"','"+username+"','"+entryDate+"','"+Duration+"')";

	count2=st22.executeUpdate(insertSQL);
	System.out.println("History-----:-"+insertSQL); 
	


System.out.println("count1----->>>>>"+count1);

if(count1>0)
{
	out.println("<script>  Redirect1();</script>");

}
else
{
	out.println("<script>  Redirect2();</script>");

}
System.out.println("I----->>>>>"+i);
%>

</body>
</html>