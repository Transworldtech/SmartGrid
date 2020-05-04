
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
String date=request.getParameter("date");
String date1=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(date));
System.out.println("Date1==>"+date1);
String hour=request.getParameter("hour");

String min=request.getParameter("min");
String tohr=request.getParameter("tohr");
String tomin=request.getParameter("tomm");
int min1=Integer.parseInt(min);
int min2=min1+10;
int sec=0;
DecimalFormat formatter = new DecimalFormat("00");

/* String min3=formatter.format(min1);
String min4=formatter.format(min2);
String sec1=formatter.format(sec); */

String fromhr1=formatter.format(Integer.parseInt(hour));
String tohr1=formatter.format(Integer.parseInt(tohr));
String frommin1=formatter.format(Integer.parseInt(min));
String tomin1=formatter.format(Integer.parseInt(tomin)-1);
/* String country=request.getParameter("country");
String state=request.getParameter("state");
String city=request.getParameter("city"); */
String location=request.getParameter("location");
System.out.println("Location===>"+location);
//String query="select * from  test.seatbooking where Timeslot >='"+date1+" "+hour+":"+min3+":"+sec1+" ' and Timeslot<='"+date1+" "+hour+":"+min4+":"+sec1+" '  ";

String query="";

 //query="select * from  test.seatbooking where Timeslot >= '"+date1+" "+hour+":"+"00"+":"+"00"+"' and  Timeslot <= '"+date1+" "+hour+":"+29+":"+"55"+"' ";
query="select Column_id from  smartgrid.mediamaster where Concat(Date,' ',time) >= '"+date1+" "+fromhr1+":"+frommin1+":"+"00"+"' and  Concat(Date,' ',time ) <= '"+date1+" "+tohr1+":"+tomin1+":"+55+"'  and location='"+location+"' and Column_id!='NULL' ";
 

//query="select Column_id from  smartgrid.mediamaster where Concat(Date,' ',time) >= '"+date1+" "+fromhr1+":"+frommin1+":"+"00"+"' and location='"+location+"' and Column_id!='NULL' ";




//String query="select * from  smartgrid.mediamaster where Concat(Date,' ',time) >= '"+date1+" "+hour+":"+min3+":"+sec1+"' and  Concat(Date,' ',time ) <= '"+date1+" "+hour+":"+min4+":"+sec1+"' and country='"+country+"' and  city ='"+city+"' and  State ='"+state+"' and location='"+location+"'";
System.out.println("slot occupied query==>"+query);
List  empdetails = new LinkedList();
 
JSONArray jsarray=new JSONArray();  
ResultSet rs=st.executeQuery(query);
//String colids="";
while(rs.next())
{

String colids=rs.getString("Column_id");
//jsarray.put(colids);
colids=colids.trim();
//jsarray.put(rs.getString("Column_id"));
System.out.println("columnsid===>"+colids);

 if(colids.contains(","))
{
String x[]=colids.split(",");	
     for(String y:x)
       {
	jsarray.put(y);
	
        }
	
	
	
}
 else

{
jsarray.put(colids);

} 
}
 


System.out.print("jsarray"+jsarray);  


out.println(jsarray.toString());




%> 
 
 