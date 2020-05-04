
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
System.out.println("company--"+company);
//String html = "<option value='Select' selected='selected'>Select</option>";
String html="            ";

// if(country.equalsIgnoreCase("Select") || country=="Select"){
    
// 	html = "<option value='Select'>Select</option>";
	
// }

if(company!="select"){
	
	
	// sql = "select distinct(VehicleRegNumber)  from db_gps.t_vehicledetails where ownername like '%"+company+"%' and description='SmartGrid' and status='-' ";
	sql= "select distinct(Routename)  from smartgrid.t_routemaster where owner like '%"+company+"%' and originlat!='NULL' and originlong!='NULL' and  destlat!='NULL' and destlong!='NULL' and Origin!='NULL' and Destination!='NULL' ";
	System.out.println("sql:-"+sql);
	System.out.println("sql"+sql);
	rst =st.executeQuery(sql);
	
	while(rst.next())
	{
		html += "<option value='"+rst.getString("Routename")+"'>"+rst.getString("Routename")+"</option>";
		System.out.println("html:-"+html);
	}
	html+="<option value='Other'>Other</option>";
}
 out.println("<option value='select'>*Select Route &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </option>"+html); 
}

catch(Exception e)
{
	e.printStackTrace();
}

%>
<%-- </jsp:useBean> --%>
