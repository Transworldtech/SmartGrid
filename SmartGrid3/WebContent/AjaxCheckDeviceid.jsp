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

String deviceid = request.getParameter("deviceid");

//String html = "<option value='Select' selected='selected'>Select</option>";
//String html=null;
String html="            ";

	sql = "SELECT  Deviceid FROM smartgrid.t_polmaster where  Deviceid ='"+deviceid+"' limit 1";
	System.out.println("sql:-"+sql);
	rst =st.executeQuery(sql);
	
	if(rst.next())
	{
		
	out.println("Duplicate Device id!!! Please Enter Distinct Device ID Only");
	
    }
	else
	{
		
	}
 

}

catch(Exception e)
{
	e.printStackTrace();
}

%>
<%-- </jsp:useBean> --%>