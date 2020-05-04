

     <%@ include file="Conn.jsp"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.*" import="java.sql.*" %>
<%@page import="java.text.*"%>
<%@page import="java.util.*"%>
<%! 
Connection conn=null;


public int daysBetween(Date d1, Date d2){
    return (int)( (d2.getTime() - d1.getTime()) / (1000 * 60 * 60 * 24));
}

%>

<%

Class.forName(MM_dbConn_DRIVER);
conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
Statement st,st1,st3,st4,st2;
st = conn.createStatement();
st1 = conn.createStatement();
st2 = conn.createStatement();
st3 = conn.createStatement();
st4 = conn.createStatement();

Statement st10=conn.createStatement();


ResultSet rst=null;

%>


<% 
try
{
	
String sql="";
// st=conn.createStatement();	






String hh = request.getParameter("hh");
String mm = request.getParameter("mm");
String ss = request.getParameter("ss");



String durtio = request.getParameter("durtio");
String mediatype = request.getParameter("mediatype");
String mdiafile = request.getParameter("mdiafile");
String fromdate = request.getParameter("fromdate");
String todate = request.getParameter("todate");
String poleid = request.getParameter("polid");










String From1 = new SimpleDateFormat("yyyy-MM-dd")
.format(new SimpleDateFormat("dd-MMM-yyyy")
		.parse(fromdate));

String To1 = new SimpleDateFormat("yyyy-MM-dd")
.format(new SimpleDateFormat("dd-MMM-yyyy")
		.parse(todate));



 
 
 
 


	
// 	System.out.println("From-"+From1);
// 	System.out.println("To-"+To1);

     

	String fromdate1=From1;
	String todate1=To1;
	String fromdatrarr[]=fromdate1.split("-");
// 	System.out.println("Fromdate is daywise"+fromdate1);
// 	System.out.println("Todate in daywise"+todate1);
	String secdaywise="00";
	String time=hh+":"+mm+":"+ss;
// 	System.out.println("time====>"+time);
	String datetime1=fromdate1+" "+time;
	String datetime2=todate1+" "+time;


	//al contains all ids
	
	
	Calendar cal1 = new GregorianCalendar();
 Calendar cal2 = new GregorianCalendar();
 
String fromdatearr[]=fromdate1.split("-"); 
 String frommyear=fromdatearr[0];

 String frommonth=fromdatearr[1];
 String frommdate1=fromdatearr[2];
 
//  System.out.println("Fromyear==>"+frommyear+" "+frommonth+" "+frommdate1);

 
 String todatearr[]=todate1.split("-");
  String tomyear=todatearr[0];
  String tommonth=todatearr[1];
  String tomdate=todatearr[2];
 /* cal1.set(2008, 8, 1); 
 cal2.set(2008, 9, 31); */
 int fromm1year=Integer.parseInt(frommyear);
 int fromm1month=Integer.parseInt(frommonth);
 int fromm1date=Integer.parseInt(frommdate1);
 
 int tom1year=Integer.parseInt(tomyear);
 int tom1month=Integer.parseInt(tommonth);
 int tomm1date=Integer.parseInt(tomdate)+1;
 
 cal1.set(fromm1year,fromm1month,fromm1date);
 cal2.set(tom1year,tom1month,tomm1date);
//  System.out.println("Days= "+daysBetween(cal1.getTime(),cal2.getTime()));  
 
 int noofdays=daysBetween(cal1.getTime(),cal2.getTime());

//  System.out.println("noofdays:-"+noofdays);
 String dt=fromdate1;
 
 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
 Calendar c = Calendar.getInstance();
 c.setTime(sdf.parse(dt));
 
 
 
 
 
 
 String Origin = request.getParameter("Origin");

 String Destination = request.getParameter("Destination");

 String TripStartTime = request.getParameter("TripStartTime");


 String TripEndTime = request.getParameter("TripEndTime");

 
 
 String timeee=hh+":"+mm+":"+ss;

 
 
 
 
 
 
 String Country="",State="",City="",Location="",Company="",Vehiclecode="";

//  System.out.println("poleid="+poleid);

	String pol[]=poleid.split(",");
	int i=0;
	

	
	
	
	for(String polid:pol)
	{	
String polmaster="select * from  smartgrid.t_polmaster where  polid='"+polid+"' ";
			ResultSet rs75=st1.executeQuery(polmaster);
			
// 			System.out.println("polmaster:-"+polmaster);
			
	 while(rs75.next())
	 {
	
		  Country=rs75.getString("Country");
		
// 		  System.out.println("Country:-"+Country);
		  
		  State=rs75.getString("State");
		  
// 		  System.out.println("State:-"+State);
		
		  City=rs75.getString("City");
		  
// 		  System.out.println("City:-"+City);
		 
		  Location=rs75.getString("Location");
		  
// 		  System.out.println("Location:-"+Location);
		  
		 Company=rs75.getString("Company");

		Vehiclecode=rs75.getString("VehicleCode");
		
	 }

		
	String Time2="",OnlyTime1="";	 
	
	 String tim4="Select Date_add('"+From1+" "+hh+":"+mm+":"+ss+"',INTERVAL "+durtio+" SECOND) as Time1";
		   ResultSet rstt=st.executeQuery(tim4);
// 		   System.out.println("tim4:-"+tim4);
			
			if(rstt.next())
			{
			    Time2=rstt.getString("Time1");
			}
			
			
			 String tim3="SELECT TIME('"+Time2+"') as OnlyTime1";
			   ResultSet rs122=st1.executeQuery(tim3);
				
				if(rs122.next())
				{
					OnlyTime1=rs122.getString("OnlyTime1");
				}
			
// 		     String media="select * from smartgrid.mediamaster where Date in ('"+From1+"','"+To1+"') and  time>='"+hh+":"+mm+":"+ss+"' and time2<='"+OnlyTime1+"'  and poleid='"+polid+"' ";
          
	
		 
		 String Time="",OnlyTime="";
		 
		 String orignalmedia="",mdiatype="";
		
	
		
		
		 for(int k=0;k<noofdays;k++)
	 	 {
		   String tim="Select Date_add('"+From1+" "+hh+":"+mm+":"+ss+"',INTERVAL "+durtio+" SECOND) as Time";
		   ResultSet rs1111=st.executeQuery(tim);
// 		   System.out.println("tim:-"+tim);
			
			if(rs1111.next())
			{
			    Time=rs1111.getString("Time");
			}
			
			
			 String tim1="SELECT TIME('"+Time+"') as OnlyTime";
			   ResultSet rs12=st1.executeQuery(tim1);
				
				if(rs12.next())
				{
					OnlyTime=rs12.getString("OnlyTime");
				}
			
// 			System.out.println("OnlyTime:-"+OnlyTime);
			
			String orignalmedianame="select originalmedianame,mediatype from  smartgrid.t_globalmediamaster where changemedianame='"+mdiafile+"';";
			  ResultSet rs2=st.executeQuery(orignalmedianame);
				
				if(rs2.next())
				{
				
					 orignalmedia=rs2.getString("originalmedianame");
					mediatype=rs2.getString("mediatype");
					
				}
			
			
			String BookingCompany=session.getAttribute("company").toString();
			
			
			
			
			
			   String media="select * from smartgrid.mediamaster where poleid = '"+polid+"' and  Date = Date_add('"+From1+"',INTERVAL "+k+" Day) and  ((time<='"+hh+":"+mm+":"+ss+"' and time2>='"+hh+":"+mm+":"+ss+"') OR (time<='"+OnlyTime1+"' and time2>='"+OnlyTime1+"'))";
		         ResultSet rs77=st1.executeQuery(media);

		  			System.out.println("media:-"+media);
		  	 if(rs77.next())
		  	 {
		  		String bookeddate= rs77.getString("Date"); 
		  		
		  		
		  		String bookeddate1 = new SimpleDateFormat("dd-MMM-yyyy")
		  		.format(new SimpleDateFormat("yyyy-MM-dd")
		  				.parse(bookeddate));
		  		
		  		
		  		String time5= rs77.getString("time");
		  		out.println("Record Already Booked For Date :-"+bookeddate1+" and Time:-"+time5+"");
		  	 }
	  	 else
	  	     {
			
			
			
			
			
 	    String sql11="insert into smartgrid.mediamaster(time2,DATE,Poleid,country,state,city,location,Startdate,Enddate,time,medianame,Originalmedianame,duration,Company,EntryBy,VehicleCode,BookingCompany,mediatype,RouteFrom,RouteTo) values('"+OnlyTime+"',Date_add('"+From1+"',INTERVAL "+k+" Day),'"+polid+"','"+Country+"','"+State+"','"+City+"','"+Location+"',Date_add('"+From1+" "+hh+":"+mm+":"+ss+"',INTERVAL "+k+" Day),Date_add('"+Time+"',INTERVAL "+k+" Day),'"+hh+":"+mm+":"+ss+"','"+mdiafile+"','"+orignalmedia+"','"+durtio+"','"+Company+"','"+session.getAttribute("userid")+"','"+Vehiclecode+"','"+BookingCompany+"','"+mediatype+"','"+Origin+"','"+Destination+"')";

 	   st10.executeUpdate(sql11);

 	   System.out.println("Sql11:-"+sql11);

 	  String Buffer="";

 	  Buffer="Updated";

 	  
 	  
 	  out.print("Updated~");
	
  	 }
	   
	 	 }  
	 
 
}
 

 
 


 	
}

catch(Exception e)
{
	e.printStackTrace();
}

%>

