<%@page import="org.apache.commons.collections4.ListUtils"%>
<%@page import="javax.swing.plaf.ListUI"%>
<%@page import="org.apache.commons.io.FilenameUtils"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.util.*"%>
        <%@ page import = "java.util.Date"%>
    
     <%@ include file="Conn.jsp"%>
    <%@ page import = "java.io.File"%>
 <%@ page import = "java.sql.*"%>
<%!ArrayList <String> al=new ArrayList<String>();
Iterator <String>itr=al.iterator();
/******Arraylist to generate ids*******/
ArrayList <String> al1=new ArrayList<String>();
Iterator <String>itr1=al.iterator();

/*****Arraylist for finding intersection with database *****/
ArrayList <String> al2=new ArrayList<String>();
Iterator <String>itr2=al.iterator();
/*********************/


		
/****************************/		
File f = null;
File f1 = null;
 %>

<% 

int i=0;
try{
 Class.forName("com.mysql.jdbc.Driver");  
	//Connection conn1 = DriverManager.getConnection("jdbc:mysql://localhost/test","root","transworld"); 
	Connection conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
	Connection conn1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME, MM_dbConn_PASSWORD);

	Statement st1=conn.createStatement();
	

	Statement st2=conn.createStatement();

	
	///Statement st=conn1.createStatement();
	PreparedStatement psImageInsertDatabase=null;	
	PreparedStatement psSelectDatabase=null;
	PreparedStatement psSelectDatabase1=null;

	
		String username=session.getAttribute("username").toString();
		String company = session.getAttribute("company").toString();
String  EntryBy1=username;
	
	
String rowcol=request.getParameter("rowcolmn");
String action=request.getParameter("action");
String date=request.getParameter("date");
String hour=request.getParameter("hour");
String deviceid="",poleid="";
String min=request.getParameter("min");


String city=request.getParameter("city");
String country=request.getParameter("country");
String state=request.getParameter("state");
String location=request.getParameter("location");

String filename1=request.getParameter("fname");

String noslot=request.getParameter("noslot");

String dura1=request.getParameter("noslot");
String mediatype1=request.getParameter("mediatype");

Date curDate = new Date();
SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
String DateToStr = format.format(curDate);
format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

DateToStr = format.format(curDate);
System.out.println(DateToStr);
	 

String insertdate=DateToStr;

System.out.println("insertdate"+insertdate);

 

String fname = FilenameUtils.getName(filename1);
String ext=FilenameUtils.getExtension(filename1);

/* if(ext.equalsIgnoreCase("mpeg") || ext.equalsIgnoreCase("mpg"))
{
	
	
	
} */



System.out.println("Filenname==>"+fname);
System.out.println("date==>"+date);
System.out.println("hour==>"+hour);
System.out.println("min==>"+min);
System.out.println("rowcol"+rowcol);

System.out.println("mediatype1"+mediatype1);



String brandname1="";



 String sql123="select brandname  from smartgrid.t_globalmediamaster  where  changemedianame='"+filename1+"'";
	System.out.println("sql:-"+sql123);
	System.out.println("sql"+sql123);
	Statement stNew=conn.createStatement();
	ResultSet rs99=stNew.executeQuery(sql123);
	
	if(rs99.next())
	{
		brandname1=rs99.getString("brandname");
		
		System.out.println("brandname"+brandname1);

	}
	System.out.println("brandname"+brandname1);


	/* String qrySelect="select brandname from smartgrid.t_globalmediamaster  where  changemedianame='"+filename1+"'";
System.out.println("sql : "+qrySelect);
	PreparedStatement ps = conn.prepareStatement("select brandname from smartgrid.t_globalmediamaster where changemedianame='"+filename1+"'");
	System.out.println("sql--- : "+ps);

	ResultSet rs1 = ps.executeQuery();
	while(rs1.next())
	{
		String brandname2=rs1.getString("brandname");
		
		System.out.println("brandname : "+brandname2);
	} */
	
	
//String xyz;

if(rowcol!="total" && action.equals("seatselected"))
{	
	//System.out.println("rowcol"+rowcol);

al.add(i,rowcol);
System.out.println(al.get(i));

i++;
}
if(rowcol!="total" && action.equals("seatremoved"))
{	
	//System.out.println("rowcol"+rowcol);

al.remove(rowcol);

}





if(rowcol.equals("total"))
{
	System.out.println("rowcol inside total"+rowcol);
  for(String obj:al)  
    System.out.println(obj);
  if(al.isEmpty())
	  
  {
	  System.out.println("listis empty");
	  al.clear();
	  out.println("empty");
  }
  
  
  
  
  else
	  
  {
	  
	
	  DecimalFormat formatter = new DecimalFormat("00");
	 
	  //variables for time
	   String min1="",hour1="",seconds1="",date1="";
	   String min2="",sec2="";
      String date_time="";
      /***********variables for  seatsreserve**********/
      String row5="";
      String row7="";	
    		  
    /*****************************************/		  
    		  
      int col=0;
	   date1=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(date));
	   System.out.println("Date1===>"+date1);
	  System.out.println("rowcol inside total"+rowcol);
	 int slot=0; 
	  for (String obj1:al)
		  
	  {
		  slot++;
		  
	  }
		  
	  
	  System.out.println("No of slot count"+slot);
	  if(ext.equalsIgnoreCase("mp4")  || ext.equalsIgnoreCase("mpeg")  || ext.equalsIgnoreCase("mpg")  )
	  {
		  
		  if(slot>1)
		  { 
			  out.println("oneslotonly");
			  
			 al.clear();
			  
		  }
		  
		  
		  else
		  {
		  
		  
	/*************Logic to convert no of slot to slots*************/	
	String  min70="";
	String sec70="";
		  for (String obj3:al)
		  {
			  System.out.println("first"+obj3);
		  }
		  String noslot1=noslot;
		  
		  String firstslotid=al.get(0);
		 /*  int noslot12=Integer.parseInt(noslot); */
		  
		  int duraslot=Integer.parseInt(noslot); 
		  
		  int noslot12=duraslot/5;
		  int x1=duraslot%5;
		  if(x1 != 0)
		  {
			 noslot12=noslot12+1;
		  }
				  
		  
		
		  if(firstslotid.equalsIgnoreCase("29_55") && noslot12 >1)
		  {
			  out.println("Only1slot");
			  al.clear();
		  }
		  else
		  {  
		  String minsec70[]=firstslotid.split("_");
		 min70=minsec70[0];
		  sec70=minsec70[1];
		  int min71=Integer.parseInt(min70);
		  int sec71=Integer.parseInt(sec70)/5+1;
		
		  int min72=min71+1;
		  String lastslotconflict=min72+"_"+sec71;
		 //for(int j=min71 - 1;j<=noslot12;j++)
			 /* if(min71+"_"+sec71 == "29_11")
			 {
				 
				 System.out.println("Last slot not allowed");
				 out.println("notallowed");
			 } */
			 String genslot="";
			 int m=0;
			 do
		  {
			  
			 if(sec71 <= 13)
			 {
			genslot=min72+"_"+sec71;
				 
		
			
			
				 al1.add(m,genslot);
				 
				 noslot12--;
				 sec71 ++;
				 m++;
				 
			 }
				  
			 if(sec71==13)  
			 {
				 sec71=1;
				 min72++;
				 if(min72==30)
				 {
					 
					
					 break;
				 }
				 
			 }
				  
			  
			  
		  }while(noslot12!=0 && min72!=31);
		  
			 for (String obj7:al1)
			  {
				  System.out.println("first after while"+obj7);
			  }
			 
			 
			 
			  if(noslot12>0)
			 {
				 out.println("invalidnoslots");
				 al.clear();
			 }
			  
			  else
				  
			  { 
			 DecimalFormat formatter1 = new DecimalFormat("00");
			 String query="";
			 //String min80=formatter1.format(min);
			 System.out.println("Minutes===>"+min);
				 if(min.equals("00"))
			 {
					// query="select * from  test.seatbooking where Timeslot >= '"+date1+" "+hour+":"+"00"+":"+"00"+"' and  Timeslot <= '"+date1+" "+hour+":"+30+":"+"00"+"' ";
			 query="select * from  smartgrid.mediamaster where Concat(Date,' ',time) >= '"+date1+" "+hour+":"+"00"+":"+"00"+"' and  Concat(Date,' ',time ) <= '"+date1+" "+hour+":"+29+":"+"55"+"' and country='"+country+"' and  city ='"+city+"' and  State ='"+state+"' and location='"+location+"' and   Column_id!='NULL'";
			 }	 
			 
			 if(min.equals("30"))
				 
			 {
				 //query="select * from  test.seatbooking where Timeslot >= '"+date1+" "+hour+":"+"30"+":"+"00"+"' and  Timeslot <= '"+date1+" "+hour+":"+59+":"+"55"+"' "; 
				 query="select * from  smartgrid.mediamaster where Concat(Date,' ',time) >= '"+date1+" "+hour+":"+"30"+":"+"00"+"' and  Concat(Date,' ',time ) <= '"+date1+" "+hour+":"+59+":"+"55"+"' and country='"+country+"' and  city ='"+city+"' and  State ='"+state+"' and location='"+location+"'  and   Column_id!='NULL'"; 
			 }
			 
			 System.out.println("Query===>"+query);
			 String Column_id="";
			// ResultSet rs77=st1.executeQuery(query);
			
			ResultSet rs77=st1.executeQuery(query);
			 while(rs77.next())
			 {
		     Column_id= rs77.getString("Column_id");
		     if(Column_id.contains(","))
		     {
		    	 System.out.println("Column ids with comma"+Column_id);
		    	 String x[]=Column_id.split(",");	
		         for(String y:x)
		           {
		        	 al2.add(y);
		    	
		            } 
		    	 
		    	 
		     }
		     else 
		    	 
		     {
		     
		     
		     
				 al2.add(Column_id);
				 
				 
				 
		     }
			 }
			 
			 
			 for (String obj8:al2)
			  {
				  System.out.println("first after while"+obj8);
			  }
			 
			 
			 
			 List<String> list1 = new ArrayList<String>(al1);
			 
			 
			 
			 
			 
	         List<String> list2 = new ArrayList<String>(al2);
			 
	         list2.retainAll(list1) ;
	         List<String> list3=ListUtils.intersection(list1, list2);
	          System.out.println("Intersection of two arraylist"+list3);
	      int listsize= list3.size();
	      System.out.println("Listsize=="+listsize);
			 
	      
	     if(listsize>0)
	     {
	    	 
	    	 out.println("listconfilct");
	    	 list1.clear();
	    	 list2.clear();
	    	 list3.clear();
	    	 al.clear();
	    	 al1.clear();
	    	 al2.clear();
	    	
	     }
	    	
	     else
	     {
	     
	     int min4=Integer.parseInt(min);
		 int min5=Integer.parseInt(min70);
		 int min6=min4+min5;
	     String min9=formatter1.format(min6);
	     int sec9=Integer.parseInt(sec70);
	 	sec2=formatter1.format(sec9);
	     String datetimevideo=date1+" "+hour+":"+min9+":"+sec2;
	     
	     System.out.println("datetimevideo===>"+datetimevideo);
	     
	     
	     String listids="";
	    for (String obj9:al1)
		  {
			 
	    	 listids+=obj9+",";
	    	 
	    	 
		  } 
	     int lastindex=listids.lastIndexOf(listids);

        StringBuilder b= new StringBuilder(listids);
        
        b.replace(listids.lastIndexOf(","), listids.lastIndexOf(",") + 1, " " );
        System.out.println("Listids===>"+b);
        
        
        String x=b.toString();
	     System.out.println("Listids===>"+listids);
	    	  
	     
		   String sql="insert into test.seatbooking(Timeslot,Column_id) values ('"+datetimevideo+"','"+b+"'); ";
		System.out.println("sql===>"+sql);  
		///st.executeUpdate(sql);
		
		
		
		/*************************************************/
		
		String sqlSelectDatabase="select * from t_polmaster where Country = ? and State = ? and City = ? and Location =?";
	/* System.out.println(sqlImageInsertDatabase); */
      psSelectDatabase=conn.prepareStatement(sqlSelectDatabase);
      String sqlImageInsertDatabase="insert into mediamaster (country,state,city,location,Poleid,deviceid,Date,time,medianame,duration,Column_id,mediatype,EntryBy,insertdate,advertiser,company) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		/* System.out.println(sqlImageInsertDatabase); */
	      psImageInsertDatabase=conn.prepareStatement(sqlImageInsertDatabase);
		
		
	      psSelectDatabase.setString(1, country);
	       psSelectDatabase.setString(2, state);
	       psSelectDatabase.setString(3, city);
	       psSelectDatabase.setString(4, location);
	       
	       ResultSet rs = psSelectDatabase.executeQuery();
	       while ( rs.next() )
	       {
	        deviceid=rs.getString("Deviceid");
	        poleid=rs.getString("polid");
	       }
	     int duration=Integer.parseInt(noslot);
	     System.out.println("Duration====>"+duration);
	     System.out.println("Slotsid====>"+x);
	     System.out.println(sqlImageInsertDatabase);
	       psImageInsertDatabase.setString(1,country);
	       psImageInsertDatabase.setString(2,state);
	       psImageInsertDatabase.setString(3,city);
	       psImageInsertDatabase.setString(4,location);
	       psImageInsertDatabase.setString(5,poleid);
	       psImageInsertDatabase.setString(6,deviceid);
	       psImageInsertDatabase.setString(7,date1);
	       psImageInsertDatabase.setString(8,hour+":"+min9+":"+sec2);
	       psImageInsertDatabase.setString(9,fname);
	       psImageInsertDatabase.setInt(10,duration);
	      
	       psImageInsertDatabase.setString(11,x);
	       psImageInsertDatabase.setString(12,mediatype1);
	       psImageInsertDatabase.setString(13,EntryBy1);
	       psImageInsertDatabase.setString(14,insertdate);
	       psImageInsertDatabase.setString(15,brandname1);
	       psImageInsertDatabase.setString(16,company);





	       
	       psImageInsertDatabase.executeUpdate();
		
		
		
		
		
	       list1.clear();
	    	 list2.clear();
	    	 list3.clear();
		
		/******************************************************/
		    al.clear();
			 al1.clear();
		 al2.clear();
			 out.println("total");
	     }
	  }
			  
	  }  
	  }
	  
	  }
	  
	  else
	  {
	  
	  
		  slot=5;
	  //slot=slot*5;
	  for(String obj:al)  
	  {
	    System.out.println(obj);
	  String minsec[]=obj.split("_");
	   min1=minsec[0];
	   seconds1=minsec[1];
	   //min2=min + min1;
	 /**************************/
	 
	 int min4=Integer.parseInt(min);
	 int min5=Integer.parseInt(min1);
	 int min6=min4+min5;
	 min2=Integer.toString(min6);
	 /***************************/
	 
	String min9=formatter.format(min6);
	// int sec9=Integer.parseInt(seconds1);
	   //sec2=seconds1;
	   System.out.println("seconds==>"+sec2);
    int sec9=Integer.parseInt(seconds1);
	sec2=formatter.format(sec9);
	   date_time=date1+" "+hour+":"+min9+":"+sec2;
	   
	   System.out.println("Date_time"+date_time);
	   /*****code for seat id conversion*****/
	   
	 int row6=Integer.parseInt(min1);
	  int row8=row6+1;		   
	  int col6=(Integer.parseInt(seconds1)+5)/5; 
	String rowcolid=Integer.toString(row8)+"_"+Integer.toString(col6);	
   System.out.println("rowid==>"+rowcolid);
	   /************************************/
	   
	   String sql="insert into test.seatbooking(Timeslot,Column_id) values ('"+date_time+"','"+rowcolid+"'); ";
	System.out.println("sql===>"+sql);
	 
	///st.executeUpdate(sql);
	   
	
	
	
	String sqlSelectDatabase="select * from t_polmaster where Country = ? and State = ? and City = ? and Location =?";
	/* System.out.println(sqlImageInsertDatabase); */
      psSelectDatabase=conn.prepareStatement(sqlSelectDatabase);
      String sqlImageInsertDatabase="insert into mediamaster (country,state,city,location,Poleid,deviceid,Date,time,medianame,duration,Column_id,mediatype,EntryBy,insertdate,advertiser,company) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		/* System.out.println(sqlImageInsertDatabase); */
	      psImageInsertDatabase=conn.prepareStatement(sqlImageInsertDatabase);
		
		
	      psSelectDatabase.setString(1, country);
	       psSelectDatabase.setString(2, state);
	       psSelectDatabase.setString(3, city);
	       psSelectDatabase.setString(4, location);
	       
	       ResultSet rs = psSelectDatabase.executeQuery();
	       while ( rs.next() )
	       {
	        deviceid=rs.getString("Deviceid");
	        poleid=rs.getString("polid");
	       }
	     
	       psImageInsertDatabase.setString(1,country);
	       psImageInsertDatabase.setString(2,state);
	       psImageInsertDatabase.setString(3,city);
	       psImageInsertDatabase.setString(4,location);
	       psImageInsertDatabase.setString(5,poleid);
	       psImageInsertDatabase.setString(6,deviceid);
	       psImageInsertDatabase.setString(7,date1);
	       psImageInsertDatabase.setString(8,hour+":"+min9+":"+sec2);
	       psImageInsertDatabase.setString(9,fname);
	       psImageInsertDatabase.setInt(10,slot);
	       psImageInsertDatabase.setString(11,rowcolid);
	       psImageInsertDatabase.setString(12,mediatype1);
	       psImageInsertDatabase.setString(13,EntryBy1);
	       psImageInsertDatabase.setString(14,insertdate);
	       psImageInsertDatabase.setString(15,brandname1);
	       psImageInsertDatabase.setString(16,company);




	       psImageInsertDatabase.executeUpdate();
		
		
	
	   
	  }
  al.clear();
  out.println("total");
   
  }// out.println("total");
    
	/* for (String number : al) {
		   System.out.println("Number = " + number);
		   }    */
		   
		   
			   
			   
	 
}

}




}
catch(Exception e)
{
	
e.printStackTrace();	
}

%>