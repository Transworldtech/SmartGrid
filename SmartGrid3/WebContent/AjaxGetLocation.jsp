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
String state = request.getParameter("state");
String country = request.getParameter("country");
String city = request.getParameter("city");

//String html = "<option value='Select' selected='selected'>Select</option>";
String html=null;


	sql = "SELECT Distinct(Location) FROM smartgrid.t_polmaster where City='"+city+"'  Order by Location asc ";
	//System.out.println("sql:-"+sql);
	rst =st.executeQuery(sql);
	
	while(rst.next())
	{
		html += "<option value='"+rst.getString("Location")+"'>"+rst.getString("Location")+"</option>";
		System.out.println("html:-"+html);
	
    }
 out.println("<option value='Select'> Select &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>"+html); 

}

catch(Exception e)
{
	e.printStackTrace();
}

%>
<%-- </jsp:useBean> --%>