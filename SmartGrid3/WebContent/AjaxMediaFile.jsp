
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

String userid=session.getAttribute("userid").toString(); 
	String username=session.getAttribute("username").toString();
	System.out.println("userid==>"+userid);
	System.out.println("username==>"+username);
String mediatype = request.getParameter("mediatype");
System.out.println("mediatype--"+mediatype);
//String html = "<option value='Select' selected='selected'>Select</option>";
String html="            ";

// if(country.equalsIgnoreCase("Select") || country=="Select"){
    
// 	html = "<option value='Select'>Select</option>";
	
// }

if(mediatype!="Select"){
	/* sql = "SELECT Distinct(State) FROM smartgrid.t_polmaster where Country='"+country+"' Order by State asc "; */
	 sql="select *  from smartgrid.t_globalmediamaster  where UserName='"+username+"' and UserId='"+userid+"' and  mediatype='"+mediatype+"'";
	System.out.println("sql:-"+sql);
	System.out.println("sql"+sql);
	rst =st.executeQuery(sql);
	
	while(rst.next())
	{
		html += "<option value='"+rst.getString("changemedianame")+"'>"+rst.getString("originalmedianame")+"</option>";
		System.out.println("html:-"+html);
	}
}
 out.println("<option value='Select'>Select &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </option>"+html); 
}

catch(Exception e)
{
	e.printStackTrace();
}

%>
<%-- </jsp:useBean> --%>
