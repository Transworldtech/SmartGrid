  <%@ include file="Conn.jsp"%>
      <%@ page import="java.sql.*" %>
       <%@ page import="java.text.SimpleDateFormat" %>
<%! Connection conn = null;
	Statement st = null;
	Statement st1 = null;
%>

<% 
Class.forName(MM_dbConn_DRIVER);
	 conn = DriverManager.getConnection(MM_dbConn_STRING, MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
	 
	 st=conn.createStatement();
	 st1=conn.createStatement();
		String company;
String vehno,route,addroute,origin,destination,tripstarttime,tripendtime;
String route1;
String originlat,originlong,destlat,destlong;
company=request.getParameter("company");
 vehno=request.getParameter("vehno");
 route=request.getParameter("Route");
addroute=request.getParameter("AddRoute");
origin=request.getParameter("origin");
destination=request.getParameter("destination");
tripstarttime=request.getParameter("tripstart");
tripendtime=request.getParameter("tripend");
originlat=request.getParameter("originlat");
originlong=request.getParameter("originlong");
destlat=request.getParameter("destlat");
destlong=request.getParameter("destlong");

System.out.println("");
if(route.equals("Other"))
{
	route1=addroute;
	
}
else
{
	route1=route;
}
String InsertDateTime=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());
String selectvehcode="select distinct(Vehiclecode),OwnerName  from db_gps.t_vehicledetails where ownername like '%"+company+"%' and description='SmartGrid' and status='-' and VehicleRegNumber='"+vehno+"'";
String vehcode="";
String owner="";
ResultSet rs1=st.executeQuery(selectvehcode);
while(rs1.next())
{
	vehcode=rs1.getString("Vehiclecode");
	owner=rs1.getString("OwnerName");
	
}

String insertquery="insert into smartgrid.t_routemaster (Vehiclecode,Owner,Routename,Origin,Destination,TripStartTime,TripEndTime,Entryby,InsertDateTime,originlat,originlong,destlat,destlong) values ('"+vehcode+"','"+company+"','"+route1+"','"+origin+"','"+destination+"','"+tripstarttime+"','"+tripendtime+"','"+session.getAttribute("userid")+"','"+InsertDateTime+"','"+originlat+"','"+originlong+"','"+destlat+"','"+destlong+"')";

st1.executeUpdate(insertquery);

out.println("<script>");

out.println("alert('Route Inserted Sucessfully!');");
out.println("location='RouteMasterReport.jsp';");
out.println("</script>");



%>