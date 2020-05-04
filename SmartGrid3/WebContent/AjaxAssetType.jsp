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

//String html = "<option value='Select' selected='selected'>Select</option>";
//String html=null;
String html="            ";

	sql = "SELECT Distinct(AssetType) FROM smartgrid.AssetTypeMaster where  CustomerName='"+company+"'  Order by AssetType asc ";
	System.out.println("sql:-"+sql);
	rst =st.executeQuery(sql);
	
	while(rst.next())
	{
		html += "<option value='"+rst.getString("AssetType")+"'>"+rst.getString("AssetType")+"</option>";
		System.out.println("html:-"+html);
	
    }
 out.println("<option value='Select'> Select Asset Type&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>"+html); 

}

catch(Exception e)
{
	e.printStackTrace();
}

%>
<%-- </jsp:useBean> --%>