<%@page import="com.sun.org.apache.xalan.internal.xsltc.compiler.sym"%>
<%@page import="org.apache.el.lang.ELSupport"%>
  <%@ page import="java.text.SimpleDateFormat" %>
   <%@ include file="Conn.jsp"%>
      <%@ page import="java.sql.*" %>
<% 

/* String country="",state="",city="",area="",company="",location_veh="",route="",poleid="",deviceid="";
String end_customer="",assettype="",seatingcapacity="";
String country1="",state1="",city1="",area1="";
*/
 
 Connection conn=null;
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
    Statement st=conn.createStatement();
  Statement st1=conn.createStatement();
 
String country=request.getParameter("country");
String state=request.getParameter("State");
String city=request.getParameter("City");
String area=request.getParameter("Area");

String country1=request.getParameter("Country1");
String  state1=request.getParameter("State1");
String city1=request.getParameter("City1");
String area1=request.getParameter("Area1");

String company=request.getParameter("company");
String location_veh=request.getParameter("Location");

String route=request.getParameter("Route");
String poleid=request.getParameter("polid");

String end_customer=request.getParameter("EndCustomer");

String deviceid=request.getParameter("Deviceid");

String assettype=request.getParameter("AssetType");

String seatingcapacity=request.getParameter("seatcapacity");
if(seatingcapacity.trim()=="")
{
	seatingcapacity="0";
}

String InsertDateTime=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());
String country2="",state2="",city2="",area2="";
System.out.println("Country==>"+country);
System.out.println("State==>"+state);
System.out.println("City==>"+city);
System.out.println("Area==>"+area);




if(country.equals("Other") || state.equals("Other")  || city.equals("Other")     || area.equals("Other") )
{
	


if(country.equals("Other"))
{
	
country2=country1;
state2=state1;
city2=city1;
area2=area1;
}
else if(state.equals("Other"))
{
country2=country;	

state2=state1;
city2=city1;
area2=area1;

}
	

else if(city.equals("Other"))
{
country2=country;	

state2=state;
city2=city1;
area2=area1;

}

else if(area.equals("Other"))
{
	
	country2=country;	

	state2=state;
	city2=city;
	area2=area1;		
}
	









String sql="insert into smartgrid.t_countrycitystateinfo(country,state,city,area) values('"+country2+"','"+state2+"','"+city2+"','"+area2+"')";

System.out.println("SQL=====>"+sql);
//st.executeUpdate(sql);

	
}

else
{
	country2=country;	

	state2=state;
	city2=city;
	area2=area;
	
}


System.out.println("Country2==>"+country2);
System.out.println("State2==>"+state2);
System.out.println("City2==>"+city2);
System.out.println("Area2==>"+area2);

String sql1="insert into smartgrid.t_polmaster(Country,State,City,Area,Location,Company,polid,Deviceid,Route,End_Customer,seating_capacity,AssetType,EnterBy,EntryTime)  values('"+country2+"','"+state2+"','"+city2+"','"+area2+"','"+location_veh+"','"+company+"','"+poleid+"','"+deviceid+"','"+route+"','"+end_customer+"','"+seatingcapacity+"','"+assettype+"','"+session.getAttribute("userid")+"','"+InsertDateTime+"')";
System.out.println("sql1====>"+sql1);
st.executeUpdate(sql1);

out.println("<script>");

out.println("alert('Saved Sucessfully!');");
out.println("location='PolMasterReport.jsp';");
out.println("</script>");



%>