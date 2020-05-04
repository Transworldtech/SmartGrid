<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<%@ page import ="java.sql.*" %>

<%@ page import ="java.text.SimpleDateFormat" %>

<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="Conn.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<%
Class.forName("com.mysql.jdbc.Driver");

/*  String MM_dbConn_DRIVER="org.gjt.mm.mysql.Driver";
 String MM_dbConn_USERNAME="fleetview";
 String MM_dbConn_PASSWORD="1@flv";
 String MM_dbConn_STRING="jdbc:mysql://192.168.2.26/smartgrid"; */
 
 Connection con = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
 Statement st = con.createStatement();
 Statement st1 = con.createStatement();
 System.out.println("kkkkkkkkkkkkkkkkkkkkkkk");
	Statement stquery=con.createStatement();
	Statement s=con.createStatement();
	


	try
	{
	String logindate=session.getAttribute("logindate").toString();
	String logintime=session.getAttribute("logintime").toString();
	 System.out.println("logindate"+logindate);
	 System.out.println("logintime"+logintime);
String RecordDate="",RecordTime="";
	 
	 String username=session.getAttribute("username").toString().toUpperCase();
	 System.out.println("username"+username);
	 
	 
	 String ss="select * from smartgrid.t_loguseractivity where Comments='"+username+"'";
	 System.out.println("ss: " + ss);
	 ResultSet res51 =stquery.executeQuery(ss); 
	 while (res51.next()) 
	 {
		 RecordDate = res51.getString("RecordDate");
		 System.out.println("RecordDate"+RecordDate); 
		 
		 RecordTime = res51.getString("RecordTime");
		System.out.println("RecordTime"+RecordTime); 
	 }
	 

	 java.util.Date now = new java.util.Date();
	    String logoutdate=""+(now.getYear()+1900)+"-"+(1+now.getMonth())+"-"+now.getDate();
	    String logouttime=""+now.getHours()+":"+now.getMinutes()+":"+now.getSeconds();
		String sql="update smartgrid.t_loguseractivity set LogOutTime='"+logouttime+"', LogOutDate='"+logoutdate+"' where RecordDate='"+RecordDate+"' and RecordTime='"+RecordTime+"' and Comments='"+username+"'";
	    	System.out.println("*******   "+sql);

		
		/*Query to insert query in db_gps.t_sqlquery table*/
		String abcd=sql.replace("'","#");
		abcd=abcd.replace(",","$");
		stquery.executeUpdate("insert into db_gps.t_sqlquery(dbname,query)values('db_gps','"+abcd+"')");
		/*****************************/
		int i=s.executeUpdate(sql);
	 

	}catch(Exception e)
	{
		
	}


session.setAttribute("userid", null);
session.invalidate();
response.sendRedirect("index.jsp");
%>
</body>
</html>