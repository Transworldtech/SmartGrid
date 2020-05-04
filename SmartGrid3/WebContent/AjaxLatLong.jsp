

<%@page import="java.io.*" import="java.sql.*" %>
<%@page import="java.text.*"%>
<%@page import="java.util.*"%>
<%@ include file="Conn.jsp"%>


<%-- <jsp:useBean id="smart" class="com.smartgrid.beans.Smart" scope="page"> --%>

<% 
Connection conn=null;
Statement st=null;
%>
<% 
try
{
Class.forName("org.gjt.mm.mysql.Driver"); 
//conn=DriverManager.getConnection("jdbc:mysql://103.241.181.36/db_leaveapplication","erp","1@erp");
conn=DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
//conn=DriverManager.getConnection("jdbc:mysql://103.241.181.36/db_leaveapplication","fleetview","1@flv");

ResultSet rst=null;
String sql="";
st=conn.createStatement();
String company = request.getParameter("company");
String route=request.getParameter("route");
System.out.println("company--"+company);

String html="            ";

String originlat="",originlong="",destlat="",destlong="";
String origin="",destination="";
if(company!="select"){
	
	
	 sql = "select Origin,Destination,originlat,originlong,destlat,destlong from smartgrid.t_routemaster where Owner='"+company+"' and Routename='"+route+"' and  originlat!='NULL' and originlong!='NULL' and  destlat!='NULL' and destlong!='NULL'";
	
	System.out.println("sql:-"+sql);
	System.out.println("sql"+sql);
	rst =st.executeQuery(sql);
	
	if(rst.next())
	{
		originlat=rst.getString("originlat");
		originlong=rst.getString("originlong");
		destlat=rst.getString("destlat");
		destlong=rst.getString("destlong");
		origin=rst.getString("Origin");
		destination=rst.getString("Destination");
		out.println(originlat+"#"+originlong+"#"+destlat+"#"+destlong+"#"+origin+"#"+destination);
		
		System.out.println("html:-"+html);
	}
	else
	{
		out.println("");
	}
	
}

}

catch(Exception e)
{
	e.printStackTrace();
}

%>
<%-- </jsp:useBean> --%>
