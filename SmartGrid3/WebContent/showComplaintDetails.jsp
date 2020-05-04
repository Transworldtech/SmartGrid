<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%@ page import="java.sql.*" %>
   <%@page import="java.util.Date" %>
 <%@page import="java.text.SimpleDateFormat"%>

  <%@ include file="header.jsp"%>
 <%@ include file="Conn.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SmartGrid</title>
<link rel="stylesheet" type="text/css" href="css/cpanel_002_popup.css"> 
<link rel="stylesheet" type="text/css" href="css/cpanel_colors.css">
<link rel="stylesheet" type="text/css" href="css/form.css" media="all">
  <link href="css/generic.css" rel="stylesheet" type="text/css" />
    <link type="text/css" rel="stylesheet" href="style.css" />
</head>
<body>
<%!
Connection conn=null;
Statement st;
%>
<%



Class.forName(MM_dbConn_DRIVER);
conn = DriverManager.getConnection(MM_dbConn_STRING1, MM_dbConn_USERNAME, MM_dbConn_PASSWORD);

 st=conn.createStatement();

%>





<table class="sortable">
<tr>
<th>
SrNo
</th>
<th>
Complaint ID
</th><th>
Complaint DateTime
</th>

<th>
Report Name
</th>
<th>
 Description
</th>


<th>
Category 
</th>
<th>
Priority
</th>


<th>Contact Number</th>
 <th>	Status </th>

<th> 	Closed Date/Time</th>
</tr>

<%
String status=request.getParameter("status");
String user=request.getParameter("uname");
String sql="";
if(status.equals("ptotal"))
{	
sql="select * from db_gps.t_ComplaintDetail where EntBy='"+user+"' and status= 'Pending' and website='SmartGrid' order by UpdatedDateTime desc";
}
else if(status.equals("stotal"))
{
	sql="select * from db_gps.t_ComplaintDetail where EntBy='"+user+"' and status= 'Closed' and website='SmartGrid'   order by UpdatedDateTime desc";
	
}
else 
{
	sql="select * from db_gps.t_ComplaintDetail where EntBy='"+user+"'  and website='SmartGrid' order by UpdatedDateTime desc";
	
}

System.out.println("sql===>"+sql);
ResultSet rs=st.executeQuery(sql);
String closeddatetime="", closeddatetime1="";
String complaintid="",ComplaintDateTimers="", compdatetime1="",reportname="",describtion="",category="",priority="",contactno="",status1="";
int i=1;
while(rs.next())
{

 complaintid=rs.getString("ComplaintID");
ComplaintDateTimers=rs.getString("ComplaintDateTime");
 compdatetime1 = new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(ComplaintDateTimers));
 reportname=rs.getString("ReportName");
 describtion=rs.getString("Description");
 category=rs.getString("Category");
priority=rs.getString("Priority");
contactno=rs.getString("ContactNumber");
 status1=rs.getString("Status");
if(status1.equals("Closed"))
{
closeddatetime=rs.getString("Closeddatetime");
 closeddatetime1=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(closeddatetime));

}
else
{
	closeddatetime="-";
}


%>
<tr>
<td>
<%=i%>
</td>
<td>
<%=complaintid %>
</td>
<td>
<%-- <%=ComplaintDateTimers%> --%>
<%=compdatetime1%>
</td>
<td>
<%=reportname %>
</td>
<td>
<%=describtion %>
</td>
<td>
<%=category %>

</td>
<td>
<%=priority %>
</td>
<td>
<%=contactno %>
</td>
<td>
<%=status1 %>
</td>


<td>
<%= closeddatetime1 %>
</td>

<td>


</tr>
<% i++; }%>
</table>



</body>
</html>
  <%@ include file="footer.jsp"%>