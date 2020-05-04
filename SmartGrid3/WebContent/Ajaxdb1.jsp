<%@page import="org.apache.commons.collections4.ListUtils"%>
<%@page import="javax.swing.plaf.ListUI"%>
<%@page import="org.apache.commons.io.FilenameUtils"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.util.*"%>
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
	//Connection conn1 = DriverManager.getConnection("jdbc:mysql://103.241.181.36/test","root","transworld"); 
	Connection conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
	
	Statement st1=conn.createStatement();
	
	///Statement st=conn1.createStatement();
	PreparedStatement psImageInsertDatabase=null;	
	PreparedStatement psSelectDatabase=null;	
String rowcol=request.getParameter("rowcolmn");
String action=request.getParameter("action");
String date=request.getParameter("date");
String hour=request.getParameter("hour");
String deviceid="",poleid="";
String min=request.getParameter("min");

String location=request.getParameter("location");

String filename1=request.getParameter("fname");

String noslot=request.getParameter("noslot");

System.out.println("No of Slot===>"+noslot);
String interval=request.getParameter("interval");


String tohr=request.getParameter("tohr");
String tomin=request.getParameter("tomm");





String fname = FilenameUtils.getName(filename1);
String ext=FilenameUtils.getExtension(filename1);

/* if(ext.equalsIgnoreCase("mpeg") || ext.equalsIgnoreCase("mpg"))
{
	
	
	
} */



System.out.println("Interval==>"+interval);
System.out.println("Filenname==>"+fname);
System.out.println("date==>"+date);
System.out.println("hour==>"+hour);
System.out.println("min==>"+min);
System.out.println("rowcol"+rowcol);

int inter=Integer.parseInt(interval)-1;


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
	  if(ext.equalsIgnoreCase("mp4")  || ext.equalsIgnoreCase("mpeg")  || ext.equalsIgnoreCase("mpg") || ext.equalsIgnoreCase("jpg") || ext.equalsIgnoreCase("jpeg") || ext.equalsIgnoreCase("png") || ext.equalsIgnoreCase("gif") )
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
		  int noslot12=Integer.parseInt(noslot);
		
		  if(firstslotid.equalsIgnoreCase(Integer.toString(inter)+"_55") && noslot12 >1)
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
		
			 String genslot="";
			 int m=0;
			 /* do while for generating row column id for videos*/
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
				 System.out.println("MIN72===>"+min72);
				 if(min72==inter+1)
				 {
					 
					
					break;
				 }
				 
			 }
				  
			  
			  
		  }while(noslot12!=0 && min72!=inter+2);
		  
			 for (String obj7:al1)
			  {
				  System.out.println("first after while"+obj7);
			  }
			 
			 
			  System.out.println("Noof Slot==>"+noslot12);
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
			/* 	 if(min.equals("00"))
			 {
					// query="select * from  test.seatbooking where Timeslot >= '"+date1+" "+hour+":"+"00"+":"+"00"+"' and  Timeslot <= '"+date1+" "+hour+":"+30+":"+"00"+"' ";
			 query="select * from  smartgrid.mediamaster where Concat(Date,' ',time) >= '"+date1+" "+hour+":"+"00"+":"+"00"+"' and  Concat(Date,' ',time ) <= '"+date1+" "+hour+":"+29+":"+"55"+"'  and location='"+location+"' and   Column_id!='NULL'";
			 }	 
			 
			 if(min.equals("30"))
				 
			 {
				 //query="select * from  test.seatbooking where Timeslot >= '"+date1+" "+hour+":"+"30"+":"+"00"+"' and  Timeslot <= '"+date1+" "+hour+":"+59+":"+"55"+"' "; 
				 query="select * from  smartgrid.mediamaster where Concat(Date,' ',time) >= '"+date1+" "+hour+":"+"30"+":"+"00"+"' and  Concat(Date,' ',time ) <= '"+date1+" "+hour+":"+59+":"+"55"+"'  and location='"+location+"'  and   Column_id!='NULL'"; 
			 } */
			 
			 query="select Column_id from  smartgrid.mediamaster where Concat(Date,' ',time) >= '"+date1+" "+hour+":"+min+":"+"00"+"' and  Concat(Date,' ',time ) <= '"+date1+" "+tohr+":"+tomin+":"+55+"'  and location='"+location+"' and Column_id!='NULL' ";
			 
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
	    	 int hh=Integer.parseInt(hour);
			   int hh2=Integer.parseInt(hour);
	     int min4=Integer.parseInt(min);
		 int min5=Integer.parseInt(min70);
		 int min6=min4+min5;
		 
		 
		 int min10=min5+min4;
		 System.out.println("MIN10=======>"+min10);
		 if(min10>55)
		 {
			 
			 hh2+=min10/60;
			 min6=((min6-60)/(60-1))-1;
			
			 System.out.println("MIN6=======>"+min6);
			 System.out.println("HH2=======>"+hh2);
		 }
		 else
		 {
			 hh2=hh;
		 }
		 
		 if(min6<0)
		 {
			 min6=0;
		 }
	     String min9=formatter1.format(min6);
	     
	     int sec9=Integer.parseInt(sec70);
	 	sec2=formatter1.format(sec9);
	 	
	 	String h5=formatter.format(hh2);
	 	
	 	
	 	
	 	
	     //String datetimevideo=date1+" "+hh2+":"+min9+":"+sec2;
	     String datetimevideo=date1+" "+h5+":"+min9+":"+sec2;
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
		
		String sqlSelectDatabase="select * from t_polmaster where Location =?";
	///System.out.println(sqlImageInsertDatabase); 
      psSelectDatabase=conn.prepareStatement(sqlSelectDatabase);
      String sqlImageInsertDatabase="insert into mediamaster (location,Poleid,deviceid,Date,time,medianame,duration,Column_id) values(?,?,?,?,?,?,?,?)";
		 System.out.println(sqlImageInsertDatabase); 
	      psImageInsertDatabase=conn.prepareStatement(sqlImageInsertDatabase);
		
		
	    
	       psSelectDatabase.setString(1, location);
	       
	       ResultSet rs = psSelectDatabase.executeQuery();
	       while ( rs.next() )
	       {
	        deviceid=rs.getString("Deviceid");
	        poleid=rs.getString("polid");
	       }
	     int duration=Integer.parseInt(noslot)*5;
	     System.out.println("Duration====>"+duration);
	     System.out.println("Slotsid====>"+x);
	     System.out.println(sqlImageInsertDatabase);
	    
	       psImageInsertDatabase.setString(1,location);
	       psImageInsertDatabase.setString(2,poleid);
	       psImageInsertDatabase.setString(3,deviceid);
	       psImageInsertDatabase.setString(4,date1);
	       psImageInsertDatabase.setString(5,h5+":"+min9+":"+sec2);
	       psImageInsertDatabase.setString(6,fname);
	       psImageInsertDatabase.setInt(7,duration);
	       psImageInsertDatabase.setString(8,x);
	       psImageInsertDatabase.executeUpdate();
		
			System.out.println("Executed1");
		
		
		
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
	  /*Saving images*/
	  else
	  {
	  
		   int hh=Integer.parseInt(hour);
		   int hh2=Integer.parseInt(hour);
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
	 
	int min10=min5+min4;
	 System.out.println("MIN10=======>"+min10);
	 if(min10>55)
	 {
		 
		 hh2+=min10/60;
		 min6=min6-60;
		 System.out.println("MIN6=======>"+min6);
		 System.out.println("HH2=======>"+hh2);
	 }
	 else
	 {
		 hh2=hh;
	 }
	 /*if(min6>55)
	 {
	 hh++;
	min6=min6-60;
	 } */
	
	 String hh1=formatter.format(hh2);
	 
		 String min9=formatter.format(min6);
	// int sec9=Integer.parseInt(seconds1);
	   //sec2=seconds1;
	   System.out.println("seconds==>"+sec2);
    int sec9=Integer.parseInt(seconds1);
	sec2=formatter.format(sec9);
	
	   date_time=date1+" "+hh1+":"+min9+":"+sec2;
	   
	   System.out.println("Date_time"+date_time);
	   /*****code for seat id conversion*****/
	   
	 int row6=Integer.parseInt(min1);
	  int row8=row6+1;		   
	  int col6=(Integer.parseInt(seconds1)+5)/5; 
	String rowcolid=Integer.toString(row8)+"_"+Integer.toString(col6);	
   System.out.println("rowid==>"+rowcolid);
	   /************************************/
	   
	   String sql="insert into test.seatbooking(Timeslot,Column_id) values ('"+date_time+"','"+rowcolid+"'); ";
	System.out.println("sql1===>"+sql);
	 
	///st.executeUpdate(sql);
	   
	
	
	
	String sqlSelectDatabase="select * from t_polmaster where  Location =?";
	/* System.out.println(sqlImageInsertDatabase); */
      psSelectDatabase=conn.prepareStatement(sqlSelectDatabase);
      String sqlImageInsertDatabase="insert into mediamaster (location,Poleid,deviceid,Date,time,medianame,duration,Column_id) values(?,?,?,?,?,?,?,?)";
		/* System.out.println(sqlImageInsertDatabase); */
	      psImageInsertDatabase=conn.prepareStatement(sqlImageInsertDatabase);
		
		
	    /*   psSelectDatabase.setString(1, "");
	       psSelectDatabase.setString(2,"");
	       psSelectDatabase.setString(3,""); */
	       psSelectDatabase.setString(1, location);
	       
	       ResultSet rs = psSelectDatabase.executeQuery();
	       while ( rs.next() )
	       {
	        deviceid=rs.getString("Deviceid");
	        poleid=rs.getString("polid");
	       }
	     
	  /*      psImageInsertDatabase.setString(1,"");
	       psImageInsertDatabase.setString(2,"");
	       psImageInsertDatabase.setString(3,""); */
	       System.out.println("Date_time"+hh1+":"+min9+":"+sec2);
	       System.out.println("rowcolid"+rowcolid);
	       psImageInsertDatabase.setString(1,location);
	       psImageInsertDatabase.setString(2,poleid);
	       psImageInsertDatabase.setString(3,deviceid);
	       psImageInsertDatabase.setString(4,date1);
	       psImageInsertDatabase.setString(5,hh1+":"+min9+":"+sec2);
	       psImageInsertDatabase.setString(6,fname);
	       psImageInsertDatabase.setInt(7,slot);
	       psImageInsertDatabase.setString(8,rowcolid);
	      
	psImageInsertDatabase.executeUpdate();
	    
	     
		System.out.println("Executed");
	
		 hh2=hh;
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
