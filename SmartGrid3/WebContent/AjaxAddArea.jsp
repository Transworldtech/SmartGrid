<%@page import="java.io.*" import="java.sql.*" %>
<%@page import="java.text.*"%>
<%@page import="java.util.*"%>
<%@ include file="Conn.jsp"%>
<%-- <jsp:useBean id="smart" class="com.smartgrid.beans.Smart" scope="page"> --%> 

<% 
Connection conn=null;
Statement st=null,st1=null;
%>
<% 
try
{
Class.forName("org.gjt.mm.mysql.Driver");

conn=DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME, MM_dbConn_PASSWORD);


ResultSet rst=null;
String sql="";
st=conn.createStatement();
st1=conn.createStatement();
String area = request.getParameter("area");
String state = request.getParameter("state1");
String city = request.getParameter("city1");



 	sql = "Select Area from smartgrid.t_areamaster where Area='"+area+"' ";
     rst =st.executeQuery(sql);
     System.out.println("sql:-"+sql);
	 	if(rst.next())
 	{
	 		
	 		out.println("Area Already Exit");
	 		
 	}
	 	else
	 	{
         
	 	 String Area="insert into smartgrid.t_areamaster (state,city,area) values ('"+state+"','"+city+"','"+area+"')";
		 st1.executeUpdate(Area);
		 System.out.println("Area:-"+Area);
 		 out.println("Area Inserted Successfully");
	     
	 	}
 

		
			 
}
catch(Exception e)
{
	e.printStackTrace();
}

%>
<%-- </jsp:useBean> --%>