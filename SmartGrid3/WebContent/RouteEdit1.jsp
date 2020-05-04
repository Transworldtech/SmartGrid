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
		String company="";
String vehno="",route="",addroute="",origin="",destination="",tripstarttime="",tripendtime="";
String route1="";
company=request.getParameter("company");
 vehno=request.getParameter("vehno");
 route=request.getParameter("Route");
addroute=request.getParameter("AddRoute");
origin=request.getParameter("origin");
destination=request.getParameter("destination");
tripstarttime=request.getParameter("tripstart");
tripendtime=request.getParameter("tripend");
String srno=request.getParameter("srno");
String originlat=request.getParameter("originlat");
String originlong=request.getParameter("originlong");
String destlat=request.getParameter("destlat");
String destlong=request.getParameter("destlong");


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

/* String insertquery="insert into smartgrid.t_routemaster (Vehiclecode,Owner,Routename,Origin,Destination,TripStartTime,TripEndTime,Entryby,InsertDateTime) values ('"+vehcode+"','"+company+"','"+route1+"','"+origin+"','"+destination+"','"+tripstarttime+"','"+tripendtime+"','"+session.getAttribute("userid")+"','"+InsertDateTime+"')"; */
String updatequery="Update smartgrid.t_routemaster set Routename='"+route1+"',Origin='"+origin+"',Destination='"+destination+"',TripStartTime='"+tripstarttime+"',TripEndTime='"+tripendtime+"',originlat='"+originlat+"',originlong='"+originlong+"',destlat='"+destlat+"',destlong='"+destlong+"',Entryby='"+session.getAttribute("userid")+"' where SrNo='"+srno+"' ";
st1.executeUpdate(updatequery);

out.println("<script>");

out.println("alert('Route Updated Sucessfully!');");
out.println("location='RouteMasterReport.jsp';");
out.println("</script>");



%>