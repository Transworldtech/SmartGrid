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

StringBuilder buffer=new StringBuilder();

buffer.append("<table style='overflow-y:scroll; margin-left: 50px; margin-top:50px;' class='tbh'  id='myTable'   >" );
buffer.append("<tr class='tbh'><th class='tbh' ><b>Sr.No</b></th> <th class='tbh' ><b>Locations</b></th> <th class='tbh' ><b>Remove</b></th> </tr> "); 

int i=1;

	sql = "SELECT Distinct(Location) FROM smartgrid.t_polmaster where City='"+city+"'  Order by Location asc ";
	//System.out.println("sql:-"+sql);
	rst =st.executeQuery(sql);
	
	while(rst.next())
	{
		    buffer.append("<tr class='tbh' ><td class='tbh' >");
    	    buffer.append("<div align='right'>"+i+" </div> </label></td>");
		    buffer.append("<td class='tbh' >"+rst.getString("Location")+"</td>");
		    buffer.append("<td class='tbh' ><input type='button' value='Delete' onclick='deleteRow(this)'></td>");
		    
		     //buffer.append("<td class='tbh' > <a href="+rst.getString("Location")+" >Remove</a></td>"); 
		/* html += "<option value='"+rst.getString("Location")+"'>"+rst.getString("Location")+"</option>";
		System.out.println("html:-"+html); */
	i++;
    }
	 buffer.append("</table>"); 
	 System.out.println("Ajaxloc1");
	 out.println(buffer);
 //out.println("<option value='Select'> Select &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>"+html); 

}

catch(Exception e)
{
	e.printStackTrace();
}

%>
<%-- </jsp:useBean> --%>