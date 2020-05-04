<%@ include file="headernew.jsp"%>
<%@ page language="java" import="java.sql.*" import="java.util.*" import="java.text.*" errorPage=""
    %>
    
<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 --%>
 <!DOCTYPE html>
<html>
<head>
<!-- <link type="text/css" rel="stylesheet" href="style.css" /> -->
    <!-- <link type="text/css" rel="stylesheet" href="reset.css" />   -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

  <style>
    div.absolute {
    position: absolute;
    left: 30px;
    width:100%;
    border:0;
  
    
} 
    </style>
<title></title>
</head>
<body>
<script type="text/javascript">

function birt()
{
	
	var company=document.getElementById("Company").value;
	
document.getElementById("myIframe").src="http://myfleetview.com:8181/birttest/frameset?__report=RouteMaster.rptdesign&company="+company+"&__showtitle=false";
	
//	document.getElementById('myIframe').src="http://103.8.126.138:8080/birt/frameset?__report=driverreport1.rptdesign&_title='My Viewer'&date1=2015-03-01&date2=2015-08-28&drivername="+driver+"";
	document.getElementById("reportData").style.display="";
	document.getElementById("footer").style.display="none";
	return true;
	
}



</script>
<%
Connection conn=null;
Class.forName("com.mysql.jdbc.Driver").newInstance();
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
Statement st=conn.createStatement();
ResultSet resultset =st.executeQuery("select typevalue  as  CompanyName from db_gps.t_transporter where ActiveStatus='Yes' and category='SMARTGRID'") ;
String userid=session.getAttribute("userid").toString();
String company= session.getAttribute("company").toString();

%>
<!-- <form> -->
<center>
<br>
<table border="0" width="750px"  align="center">


		<tr>
			<td  align="center">
				<font size="3">
					<b> Route Master Report</b>
				</font>
				
				<br><br>
	<div align="center">		<tr align="center">
			
				<td ><b>Company:&nbsp;&nbsp;</b>
				<select name="Company" id="Company" 
				style="width: 280px; height:25px; border: 1px solid black; font: normal 13px Arial, Helvetica, sans-serif; color: #000000; border-color: activeborder;">
				   
				   <option value="All"  selected="selected">All</option>
        <%  while(resultset.next()){ %>
        	
            <option value="<%= resultset.getString("CompanyName").trim()%>"><%= resultset.getString("CompanyName").trim()%></option>
        <% } %>
				   
				   
				   <!--  <option value="All">All</option>
				     <option value="Active">Active</option>
				      <option value="No">DeActive</option> -->
				    </select>

			 		 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="button1" id="button1" value="Submit"  style="border-style: outset; border-color: black; "    onClick="return birt()">
			 		<!-- <td style="padding-left: 0px;"><input type="submit" name="button1" id="button1" value="Submit"  style="border-style: outset; border-color: black; "    onClick="return birt()"></td> -->
			 		</tr>
			 		
			 		
			 		</div>
			 		</div>
			</td>
		</tr>
		<tr>
	
	</tr>	
	</table>
 <%-- <table align="center" border="0" style="text-align: center; margin-top: 0.5em; margin-bottom: 0.4em;margin-left: 0.6em">
			<tr>
				<td align="center"><b>Active Status&nbsp;&nbsp;</b>
				<select name="Status" id="Status" 
				style="width: 87px; height:20px; border: 1px solid black; font: normal 11px Arial, Helvetica, sans-serif; color: #000000; border-color: activeborder;">
				    <option value="All">All</option>
				    <%
				    String status="";
				    String sql="select distinct(status) as status from smartgrid.t_security";
				    ResultSet rs=st.executeQuery(sql);
				    while(rs.next())
				    	{
				    	status=rs.getString("status");
				    	
				    
				    %>
				    
				     <option value="<%=status%>"><%=status %></option>
				    <%
				   
				    	}
				    %>
			 		<!-- <option value="Active">Active</option>
			 		<option value="DeActive">DeActive</option>
			 		 --></select>
			 		</td>
			 	<!-- 	<td>
				All <input type="checkbox" name="extAll" id="extAll" value="yes"  onclick="allSelected(this.value);"></input>
				</td> -->
			 		
			 		<td><input type="submit" name="button1" id="button1" value="Submit"  onClick="return birt()"></td>
			 		</tr>
			 		
			 		
			 		
			 		</table>
		 		
 --%>
 <div class="absolute" align="left">
		<font face="Arial" size="2"><a href="RouteEntry.jsp" style="font-weight: bold; color: black; " >Add </a></font>
		</div>
 
 <div align="right"> 
 <font size="2">
<td align="right" bgcolor="#FFFFFF"   ><%=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new java.util.Date())%></td></div>

	<%-- <iframe id="myframe" style="width: 99.5%; height: 500px;" src="http://twtech.in:8080/ERPTestBirt/frameset?__report=AMC_Report.rptdesign&__showtitle=false&__pageFooterFloatFlag=False&<%=queryString%>&tablename=<%=tablenamenew%>"></iframe> --%>
</font>
<div class="absolute" align="center" >
	
	<!-- <iframe id="myIframe" style="width: 100%; height: 500px;" src=  http://192.168.2.97:8080/birttest/frameset?__report=ZoneMaster.rptdesign&status=All&__showtitle=false"></iframe> -->
	<iframe id="myIframe" style="width: 100%; height: 500px;" src="http://myfleetview.com:8181/birttest/frameset?__report=RouteMaster.rptdesign&company=All&__showtitle=false"></iframe>
	
	</div>
	</center>
<% 
String button=request.getParameter("button1");
System.out.println("buutton value--->"+button);
if(button == "null") 
{
	System.out.println("Inside null");
%>



	
	
<%
}
else
{
	System.out.println("Inside else");
	
	
%>


<!-- <div id="reportData">
	 <iframe id="myIframe" width="100%" height="500px" src=""></iframe>
	 </div> -->


<%
}
%>
	<!-- </form> -->

</body>
</html>
