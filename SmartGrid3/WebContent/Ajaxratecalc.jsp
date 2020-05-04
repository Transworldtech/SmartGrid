
<%@page import="org.json.JSONArray"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.util.*"%>
       <%@page import="org.json.JSONObject" %>
          <%@page import="org.json.JSONArray" %>
 <%@ page import = "java.sql.*"%>
  <%@ include file="Conn.jsp"%>
<% 

Class.forName("com.mysql.jdbc.Driver");  
	//Connection conn1 = DriverManager.getConnection("jdbc:mysql://103.241.181.36/test","root","transworld"); 
	Connection conn1= DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
	Statement st=conn1.createStatement();
	Statement st1=conn1.createStatement();
	Statement st2=conn1.createStatement();
	Statement st3=conn1.createStatement();
	Statement st4=conn1.createStatement();
String date=request.getParameter("date");
String date1=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(date));
System.out.println("Date1==>"+date1);
String hour=request.getParameter("hour");

int hour1=Integer.parseInt(hour);

String min=request.getParameter("min");
int min1=Integer.parseInt(min)+Integer.parseInt("1");
int min2=min1+10;
int sec=0;
DecimalFormat formatter = new DecimalFormat("00");

String min3=formatter.format(min1);
String min4=formatter.format(min2);
String sec1=formatter.format(sec);

String country=request.getParameter("country");
String state=request.getParameter("state");
String city=request.getParameter("city");
String location=request.getParameter("location");
String mediatype=request.getParameter("mediatype");
int polid=0;
String code ="";
String codefinal="";
//String query="select * from  test.seatbooking where Timeslot >='"+date1+" "+hour+":"+min3+":"+sec1+" ' and Timeslot<='"+date1+" "+hour+":"+min4+":"+sec1+" '  ";
String polcode="select * from t_polmaster where Country ='"+country+"' and State ='"+state+"'  and City = '"+city+"' and Location = '"+location+"'";
System.out.println("polecodequery==>"+polcode);
ResultSet rs=st.executeQuery(polcode);
if(rs.next())
{
	
	polid=rs.getInt("polid");
	
}

System.out.println("polecode==>"+polid);
int locationpremium=0;
String locationcode="select * from smartgrid.t_locationmaster where pols='"+polid+"'"; 
System.out.println("locatiocode query"+locationcode);
ResultSet rs1=st.executeQuery(locationcode);
if(rs1.next())
{
	
code=rs1.getString("code");	
	locationpremium=rs1.getInt("premium");
}


/* ******************* */
String timecode="";
double timepremium=0.00;
String query5="select * from t_timecalculation where '"+hour+":"+min3+":"+sec1+"' between fromtime and totime";
System.out.println("query5"+query5);
ResultSet rs5=st2.executeQuery(query5);
if(rs5.next())
{
	timecode=rs5.getString("code");
	timepremium=rs5.getDouble("premium");
}

else
	
{
	String query6="select * from t_timecalculation where '"+hour1+":"+min3+":"+sec1+"' between  totime and fromtime";
	System.out.println("query6"+query6);
	ResultSet rs6=st3.executeQuery(query6);
	if(rs6.next())
	{
		timecode=rs6.getString("code");
		timepremium=rs6.getDouble("premium");
	}
	else
		
	{
		String query7="select * from t_timecalculation where fromtime='"+hour+":"+sec1+":"+sec1+"'";
	System.out.println("query7"+query7);	
		
	ResultSet rs7=st4.executeQuery(query7);
	while(rs7.next())
	{
		timecode=rs7.getString("code");
		timepremium=rs7.getDouble("premium");
	}
	
		
	}
}
	
	
	
/* ******************** */

System.out.println("code==>"+code);

System.out.println("Locationpremium==>"+locationpremium);

String codeloctime=code+""+timecode;

double loctimepremium=locationpremium*timepremium;

System.out.println("codeloctime===>"+codeloctime);
System.out.println("premiumloctime===>"+loctimepremium);


String query3="select * from smartgrid.t_zonemaster where zonecode='"+codefinal+"'";
System.out.println("query3"+query3);
String premium="";
ResultSet rs3=st1.executeQuery(query3);
while(rs3.next())
	
{
	premium=rs3.getString("premium");
}


System.out.println("Premium==>"+premium);

if(mediatype.equals("image"))
	
{
	loctimepremium=loctimepremium*1;
	System.out.println("Image==>"+mediatype);
}
if(mediatype.equals("video"))
	
{
	loctimepremium=loctimepremium*1.8;
	System.out.println("video==>"+mediatype);
}
System.out.println("video==>"+mediatype);

out.println(loctimepremium);

%> 
 
 