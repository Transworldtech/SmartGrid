<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ include file="Conn.jsp" %>
    <%@ page language="java" import="java.sql.*"  %>
    <%@ page language="java" import="java.util.*" %>
    <%@page import="java.util.Date"%>
    <%@page import="java.text.SimpleDateFormat"%>
    <%!

Connection con1 = null;
	Statement st = null;
	Statement st1 = null;
	Statement st2 = null;
	Statement st3 = null;
	Statement st4 = null;
	Statement st5 = null;
	

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>



<%
try
{

Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
st=con1.createStatement();
st1=con1.createStatement();
st2=con1.createStatement();
st3=con1.createStatement();
st4=con1.createStatement();
st5=con1.createStatement();

}
catch(Exception e)
{
	e.printStackTrace();
}
%>
<%
String s1=request.getParameter("imageName");
/*
System.out.println(s1);
System.out.println(s1+"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"+s1.replace("%"," ")); 
s1=s1.replace("%"," ");
*/
System.out.println("srno:-"+s1);

String rawfilename="";
String vehicleregnumber="",snaptime="",camerapos="",unitid="";

    //String sqlwesite="Select * from smartgrid.t_jpgsnapsmartgrid where srno="+s1+" ";
    
    		String sqlwesite="Select * from smartgrid.t_jpgsnapsOnline where srno="+s1+" ";
    		
	
System.out.println("sqlwebsite:-"+sqlwesite);
	
 ResultSet rs5=st1.executeQuery(sqlwesite);


 
 while(rs5.next())
    {
	      
	    
	     rawfilename=rs5.getString("rawfilename");
	     vehicleregnumber=rs5.getString("vehicleregnumber");
	     snaptime=rs5.getString("snapdatetime");
	     camerapos=rs5.getString("camerapos");
	     rawfilename=rs5.getString("rawfilename");
	     
	//     unitid=rs5.getString("unitid");
	     
	     
	     
	    /*  String sql4="Select * from smartgrid.t_jpgsnapsmartgrid where unitid='"+unitid+"'  and rawfilename='"+rawfilename+"' order by srno desc limit 1";
	     ResultSet rs6=st2.executeQuery(sql4);
	     
	     if(rs6.next())
	     {
	    	 vehicleregnumber=rs6.getString("vehicleregnumber");
		     snaptime=rs6.getString("snapdatetime");
		     camerapos=rs6.getString("camerapos");
		     rawfilename=rs6.getString("rawfilename");
	     }
	  */    
    }

 String    dt = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(snaptime.substring(0,19)));

 
String imgname=vehicleregnumber+" "+camerapos+" "+dt;

System.out.println("Image Name :- "+imgname);
%>

 <%-- <img  src="https://s3.ap-south-1.amazonaws.com/smartgridinfra/<%=rawfilename%>"/> --%> 
 <h>
  <font size="2" style="font-family:san-serif;"> <%=imgname  %> </font> 
 </h>
 <img  src="https://s3.ap-south-1.amazonaws.com/smartgridinfra/<%=rawfilename%>"  width=100% height=100%/>

</body>
</html>

