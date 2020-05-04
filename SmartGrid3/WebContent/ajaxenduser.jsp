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
String lat = request.getParameter("lat");
String lon = request.getParameter("lon");
String enduser = request.getParameter("enduser");


String Rname="";

StringBuffer str=new StringBuffer("");
str.append("<table class='sortable' border='1' style='width:50%;'><tr><th style='width:5%;' ><b>SrNo</b></th><th style='width:25%;'><b>Routename</b></th></tr>");

int i=1,Balance=0;




     if(enduser.equalsIgnoreCase("Mercedes"))
     {
 sql = "SELECT Distinct(b.Routename) FROM smartgrid.t_routepoints a inner join smartgrid.t_routemaster b on a.Routeid=b.Routeid inner join smartgrid.t_polmaster c on  c.vehiclecode=b.vehiclecode where  ((2.0 * 3958.75 * ATAN(SQRT(SIN(RADIANS(a.Lattiude - "+ lat +" )*0.5) * SIN(RADIANS(a.Lattiude - "+ lat +")*0.5) + COS(RADIANS(18.471)) * COS(RADIANS(a.Lattiude)) *SIN(RADIANS(a.Longitude - "+ lon +")*0.5) *SIN(RADIANS(a.Longitude - "+ lon +")*0.5)), SQRT(1.0-(SIN(RADIANS(a.Lattiude - 18.471)*0.5) *SIN(RADIANS(a.Lattiude - "+ lat +")*0.5) +COS(RADIANS(19.4672)) * COS(RADIANS(a.Lattiude)) *SIN(RADIANS(a.Longitude - "+ lon +")*0.5) *SIN(RADIANS(a.Longitude - "+ lon +")*0.5)) )) * 1609.344)/1000) <=2.5  and c.AssetType='Bus' and c.End_Customer='Mercedes'";
     }
     else
     {
    	 sql = "SELECT Distinct(b.Routename) FROM smartgrid.t_routepoints a inner join smartgrid.t_routemaster b on a.Routeid=b.Routeid inner join smartgrid.t_polmaster c on  c.vehiclecode=b.vehiclecode where  ((2.0 * 3958.75 * ATAN(SQRT(SIN(RADIANS(a.Lattiude - "+ lat +" )*0.5) * SIN(RADIANS(a.Lattiude - "+ lat +")*0.5) + COS(RADIANS(18.471)) * COS(RADIANS(a.Lattiude)) *SIN(RADIANS(a.Longitude - "+ lon +")*0.5) *SIN(RADIANS(a.Longitude - "+ lon +")*0.5)), SQRT(1.0-(SIN(RADIANS(a.Lattiude - 18.471)*0.5) *SIN(RADIANS(a.Lattiude - "+ lat +")*0.5) +COS(RADIANS(19.4672)) * COS(RADIANS(a.Lattiude)) *SIN(RADIANS(a.Longitude - "+ lon +")*0.5) *SIN(RADIANS(a.Longitude - "+ lon +")*0.5)) )) * 1609.344)/1000) <=2.5  and c.AssetType='Bus' and c.End_Customer='Volkswagen' ";
     }
 
     rst =st.executeQuery(sql);
     System.out.println("sqlon end customer page :-"+sql);
	 	while(rst.next())
	 	{
         
	 	String End_Customer=rst.getString("Routename");	
	     
	 	 
		str.append("<tr>");
		str.append("<td align='right'><div align='left'>"+i+"</div></td>" );
		str.append("<td align='right'><a onclick='show()'><div align='right'>"+End_Customer+"</div></a></td>" );
		str.append("</tr>");
		
		i++;
	 	
	 	}
 
	 	str.append("</table>");
		Rname=Rname+str.toString();
		System.out.print(Rname);
		
		out.print(Rname);
		
			 
}
catch(Exception e)
{
	e.printStackTrace();
}

%>
<%-- </jsp:useBean> --%>