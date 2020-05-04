<%@page import="java.util.Date"%>
<%@ page import="java.sql.*" %>
<%@ include file="Conn.jsp" %>
<% 
try{
	Class.forName(MM_dbConn_DRIVER);
	}
catch(ClassNotFoundException e)
	{
	out.println(e.toString());
	} 
Connection con = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
Statement stmt=con.createStatement();
Statement stmt1=con.createStatement();
Statement st=con.createStatement();
Statement st123=con.createStatement();
%>
<%
try
{
	
	String Status=request.getParameter("status");
	System.out.println("getting status..."  +Status);
	//String vehicleList=session.getAttribute("VehList").toString();
	//String typeValue=session.getAttribute("usertypevalue").toString();
	
	int i=1;
	double speed=0;
	//final int disConnected = Integer.parseInt(session.getAttribute("desconnected").toString());
	String Currdate="No Trip Data";
	//System.out.println("Date is"+Currdate);
	double lastDayKm=0,distanceTraveledTillNow=0,distanceTraveledToday=0; 
	String vehicleUpdate="<table width='100%' class='sortable'>";
	String markerlist="@",ignition="",devstatus="";
	String lat="-",lon="-",vehregno="-",thedate="-",thetime="-",TimeDiff="",drivemob="",senserpm="",datetime="-",sql1="",location="",stamp="",bgcolor="",vehcode = "",tripid = "-";
	String col1="-",col2="-",col3="-",col4="-",col5="-",col6="-",col7="-",col8="-",col9="-",col10="-",col11="-",col12="-",col13="-",col14="-",col15="-",col16="-",col17="-",col18="-";
	String bcol1="-",bcol2="-",bcol3="-",bcol4="-",bcol5="-",bcol6="-",bcol7="-",bcol8="-",bcol9="-",bcol10="-",bcol11="-",bcol12="-",bcol13="-",bcol14="-",bcol15="-",bcol16="-",bcol17="-",bcol18="-",bcol19="-",bcol20="-";
	int valrpm=0;
	String origin = "-",dest = "-",drivid = "-",drivname = "-";
	vehicleUpdate+="<tr><th>No</th><th>Location</th></tr>";
	
	String sqlonline = "select a.lat,a.longi,a.col1 ,a.col2,a.col3,a.col4,a.col5,a.col6,a.col7,a.col8,a.col9,a.col10,a.col11,a.col12,a.col13,a.col14,a.col15,a.col16,a.col17,a.col18,b.col1 ,b.col2,b.col3,b.col4,b.col5,b.col6,b.col7,b.col8,b.col9,b.col10,b.col11,b.col12,b.col13,b.col14,b.col15,b.col16,b.col17,b.col18,b.col19,b.col20 from Geomaster a, GeomasterColumn b where a.mapname=b.mapname and a.mapname='"+Status+"' ";
	ResultSet rsonline = stmt.executeQuery(sqlonline);
	System.out.println("online querry "+sqlonline);
	int co=1;
	while(rsonline.next())
	{System.out.println("Hi "+co);
		lat = rsonline.getString(1);
		lon = rsonline.getString(2);
		col1=rsonline.getString(3);
		col2=rsonline.getString(4);
		col3=rsonline.getString(5);
		col4=rsonline.getString(6);
		col5=rsonline.getString(7);
		col6=rsonline.getString(8);
		col7=rsonline.getString(9);
		col8=rsonline.getString(10);
		col9=rsonline.getString(11);
		col10=rsonline.getString(12);
		col11=rsonline.getString(13);
		col12=rsonline.getString(14);
		col13=rsonline.getString(15);
		col14=rsonline.getString(16);
		col15=rsonline.getString(17);
		col16=rsonline.getString(18);
		col17=rsonline.getString(19);
		col18=rsonline.getString(20);
		bcol1=rsonline.getString(21);
		bcol2=rsonline.getString(22);
		bcol3=rsonline.getString(23);
		bcol4=rsonline.getString(24);
		bcol5=rsonline.getString(25);
		bcol6=rsonline.getString(26);
		bcol7=rsonline.getString(27);
		bcol8=rsonline.getString(28);
		bcol9=rsonline.getString(29);
		bcol10=rsonline.getString(30);
		bcol11=rsonline.getString(31);
		bcol12=rsonline.getString(32);
		bcol13=rsonline.getString(33);
		bcol14=rsonline.getString(34);
		bcol15=rsonline.getString(35);
		bcol16=rsonline.getString(36);
		bcol17=rsonline.getString(37);
		bcol18=rsonline.getString(38);
		bcol19=rsonline.getString(39);
		bcol20=rsonline.getString(40);
			
		
		
		
		

		

		
	
		
		
		
			
			
				vehicleUpdate+="<tr><td style='"+bgcolor+"'>"+i+"</td><td style='"+bgcolor+"'><a href='javascript:myclick("+i+","+lat+","+lon+")'>"+col1+"</td></tr>";
				markerlist+=lat+"~"+lon+"~"+i+++"~"+col1+"~"+col2+"~"+col3+"~"+col4+"~"+col5+"~"+col6+"~"+col7+"~"+col8+"~"+col9+"~"+col10+"~"+col11+"~"+col12+"~"+col13+"~"+col14+"~"+col15+"~"+col16+"~"+col17+"~"+col18+"~"+bcol1+"~"+bcol2+"~"+bcol3+"~"+bcol4+"~"+bcol5+"~"+bcol6+"~"+bcol7+"~"+bcol8+"~"+bcol9+"~"+bcol10+"~"+bcol11+"~"+bcol12+"~"+bcol13+"~"+bcol14+"~"+bcol15+"~"+bcol16+"~"+bcol17+"~"+bcol18+"~"+bcol19+"~"+bcol20+"$";
				
			
		
		
		co++;}
	out.print(vehicleUpdate+"</table>"+markerlist+"@"+i);
	System.out.print(vehicleUpdate+"</table>"+markerlist+"@"+i);
}
catch(Exception e)
{
	out.print("Exception -->"+e);
	e.printStackTrace();
}
 %>
