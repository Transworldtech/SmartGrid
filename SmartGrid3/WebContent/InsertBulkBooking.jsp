<%@page import="java.util.Date"%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.util.*"%>
     <%@ include file="Conn.jsp"%>
    <%@ page import = "java.io.File"%>
 <%@ page import = "java.sql.*"%>
 <%@ page import="java.util.Map.Entry"%>
 <%@page import="java.util.Set" %>
<%! 
Connection conn=null;

public int daysBetween(Date d1, Date d2){
    return (int)( (d2.getTime() - d1.getTime()) / (1000 * 60 * 60 * 24));
}

ArrayList <String> al=new ArrayList<String>();
Iterator <String>itr=al.iterator();
%>
<% 




	Class.forName("com.mysql.jdbc.Driver").newInstance();
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
    Statement st=conn.createStatement();
  Statement st1=conn.createStatement();
  Statement st2=conn.createStatement();
  
  

String min1="",hour1="",seconds1="",date1="",min="";
String min2="",sec2="";
String date_time="";
  
  
  boolean flag=true;
 
  String poleid=request.getParameter("poleid");
  System.out.println("poleid:-"+poleid);


  String fromdate=request.getParameter("data1");
  System.out.println("fromdate:-"+fromdate);

  String todate=request.getParameter("data2");
  System.out.println("todate:-"+todate);

  String hh=request.getParameter("hh1");
  System.out.println("hh:-"+hh);
  String mm=request.getParameter("mm1");
  String ss=request.getParameter("hh2");

  String mediatype=request.getParameter("mediatype");

  String mediafile=request.getParameter("mediafile");

  String durtio=request.getParameter("durtio");

  
  
  

	String From1 = new SimpleDateFormat("yyyy-MM-dd")
	.format(new SimpleDateFormat("dd-MMM-yyyy")
			.parse(fromdate));
	
	String To1 = new SimpleDateFormat("yyyy-MM-dd")
	.format(new SimpleDateFormat("dd-MMM-yyyy")
			.parse(todate));
	
	
	System.out.println("From-"+From1);
	System.out.println("To-"+To1);
  
        
  
	String fromdate1=From1;
	String todate1=To1;
	String fromdatrarr[]=fromdate1.split("-");
	System.out.println("Fromdate is daywise"+fromdate1);
	System.out.println("Todate in daywise"+todate1);
	String secdaywise="00";
	String time=hh+":"+mm+":"+ss;
	System.out.println("time====>"+time);
	String datetime1=fromdate1+" "+time;
	String datetime2=todate1+" "+time;


	//al contains all ids
	
	
	Calendar cal1 = new GregorianCalendar();
    Calendar cal2 = new GregorianCalendar();
    
 String fromdatearr[]=fromdate1.split("-"); 
    String frommyear=fromdatearr[0];
 
    String frommonth=fromdatearr[1];
    String frommdate1=fromdatearr[2];
    
    System.out.println("Fromyear==>"+frommyear+" "+frommonth+" "+frommdate1);
  
    
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
    System.out.println("Days= "+daysBetween(cal1.getTime(),cal2.getTime()));  
    
    int noofdays=daysBetween(cal1.getTime(),cal2.getTime());

    String dt=fromdate1;
    
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    Calendar c = Calendar.getInstance();
    c.setTime(sdf.parse(dt));
    
    
    
    
    String Country="",State="",City="",Location="",Company="",Vehiclecode="";
  
    System.out.println("poleid="+poleid);

 	String pol[]=poleid.split(",");
 	int i=0;
 	
 
//  	for(String polid:pol)
//  	{	
 String polmaster="select * from  smartgrid.t_polmaster where  polid='"+poleid+"' ";
 			ResultSet rs75=st1.executeQuery(polmaster);
			
 			System.out.println("polmaster:-"+polmaster);
			
 	 while(rs75.next())
 	 {
	
 		  Country=rs75.getString("Country");
 		
 		  State=rs75.getString("State");
 		
 		  City=rs75.getString("City");
 		 
 		  Location=rs75.getString("Location");
 		  
 		 Company=rs75.getString("Company");
 		 
 		Vehiclecode=rs75.getString("VehicleCode");
 		
 	 }
// String media="select Distinct(poleid) as Polid from  smartgrid.mediamaster where (Date,' ',time) >= '"+From1+" "+HH+":"+mm+":"+ss+"' and  Concat(Date,' ',time ) <= '"+To1+" "+HH+":"+mm+":"+ss+"' and  Poleid in ("+poleid+") and   Column_id!='NULL'";
// String media="select * from smartgrid.mediamaster where Poleid='"+polid+"' and Date in ('"+From1+"','"+To1+"') and time = '"+HH+":"+MM+":"+SS+"' ";
   
        String media="select * from smartgrid.mediamaster where Startdate>='"+From1+"' and Enddate<='"+To1+"' and Poleid='"+poleid+"'";
        ResultSet rs77=st1.executeQuery(media);
			
 			System.out.println("media:-"+media);
 	 if(rs77.next())
 	 {

		 
 	 }
 	 else
 	 {
 		 
 		
 		 
 		 
 		 String Time="";
 		 
 		String orignalmedia="";
 		
 	
 		
 		
 		 for(int k=0;k<noofdays;k++)
 	 	 {
 		   String tim="Select Date_add('"+From1+" "+hh+":"+mm+":"+ss+"',INTERVAL "+durtio+" SECOND) as Time";
 		   ResultSet rs1111=st.executeQuery(tim);
 			
 			if(rs1111.next())
 			{
 			    Time=rs1111.getString("Time");
 			}
 			
 			
 			String orignalmedianame="select originalmedianame,mediatype from  smartgrid.t_globalmediamaster where changemedianame='"+mediafile+"';";
 			  ResultSet rs2=st.executeQuery(orignalmedianame);
 				
 				if(rs2.next())
 				{
 				
 					 orignalmedia=rs2.getString("originalmedianame");
 					mediatype=rs2.getString("mediatype");
 					
 				}
 			
 			
 			String BookingCompany=session.getAttribute("company").toString();
 			
 		   String bulkrecord="insert into smartgrid.mediamaster(DATE,Poleid,country,state,city,location,Startdate,Enddate,time,medianame,Originalmedianame,duration,Company,EntryBy,VehicleCode,BookingCompany,mediatype) values('"+From1+"','"+poleid+"','"+Country+"','"+State+"','"+City+"','"+Location+"',Date_add('"+From1+" "+hh+":"+mm+":"+ss+"',INTERVAL "+k+" Day),Date_add('"+Time+"',INTERVAL "+k+" Day),'"+hh+":"+mm+":"+ss+"','"+mediafile+"','"+orignalmedia+"','"+durtio+"','"+Company+"','"+session.getAttribute("userid")+"','"+Vehiclecode+"','"+BookingCompany+"','"+mediatype+"')";
     	   System.out.println("bulkrecord==insertion===>"+bulkrecord);
           st.executeUpdate(bulkrecord);
 	 }  
 	 
 	 }
//  }
	 
	 
%>
	


<script type="text/javascript">
alert("Booked Succesfully");
out.println("history.go(-1);");
</script>




