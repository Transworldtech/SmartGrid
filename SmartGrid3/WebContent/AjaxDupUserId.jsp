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

String user = request.getParameter("user");

//String html = "<option value='Select' selected='selected'>Select</option>";
//String html=null;
String html="";

sql="select * from smartgrid.t_security where user='"+user+"'";

rst=st.executeQuery(sql);
if(rst.next())
{
	out.println("dup");
	
}
else
{
	out.println("");
	
}



}

catch(Exception e)
{
	e.printStackTrace();
}

%>
<%-- </jsp:useBean> --%>