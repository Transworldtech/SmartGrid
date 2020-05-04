
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
String country = request.getParameter("country");
System.out.println("country--"+country);
//String html = "<option value='Select' selected='selected'>Select</option>";
String html=" ";

// if(country.equalsIgnoreCase("Select") || country=="Select"){
    
// 	html = "<option value='Select'>Select</option>";
	
// }

if(country!="Select"){
	sql = "SELECT Distinct(country) FROM smartgrid.t_countrycitystateinfo where country='"+country+"' Order by country asc ";
	System.out.println("sql:-"+sql);
	System.out.println("sql"+sql);
	rst =st.executeQuery(sql);
	
	while(rst.next())
	{
		html += "<option value='"+rst.getString("country")+"'>"+rst.getString("country")+"</option>";
		System.out.println("html:-"+html);
	}
}
 out.println("<option value='Select'>*Select Country&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </option>"+html); 
}

catch(Exception e)
{
	e.printStackTrace();
}

%>
<%-- </jsp:useBean> --%>
