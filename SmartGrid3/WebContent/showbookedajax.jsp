

<%@ include file="Conn.jsp"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.*" import="java.sql.*" %>
<%@page import="java.text.*"%>
<%@page import="java.util.*"%>
<%! 
Connection conn=null;
Statement st=null;
%>






<% 
try
{
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	Statement st = null, st1 = null, st3 = null, st4 = null,st2 = null;
    st = conn.createStatement();
	st1 = conn.createStatement();
	st2 = conn.createStatement();
	st3 = conn.createStatement();
	st4 = conn.createStatement();
	
	
	

ResultSet rst=null;
String sql="";
st=conn.createStatement();


String starttime = request.getParameter("starttime");
String endtime = request.getParameter("endtime");
String fromdate = request.getParameter("fromdate");
String todate = request.getParameter("todate");
String polid = request.getParameter("polid");




 

String From1 = new SimpleDateFormat("yyyy-MM-dd")
.format(new SimpleDateFormat("dd-MMM-yyyy")
		.parse(fromdate));

String To1 = new SimpleDateFormat("yyyy-MM-dd")
.format(new SimpleDateFormat("dd-MMM-yyyy")
		.parse(todate));

 
 System.out.println("dt:-"+From1);
 System.out.println("dt1:-"+To1);
 


 String Rname="";
 
 StringBuffer str=new StringBuffer("");
 
 str.append("<h>Already Booked</h>");
 str.append("<table class='sortable' border='1' style='width:120%;'>");
 
 str.append("<tr style='background: #485682; color: #ffffff;' > <th width ='1%'><b>SrNo</b></th><th width ='6%'><b>Date</b></th><th width ='4%'><b>Time</b></th><th width ='10%'><b>Vehicle/Location</<b></th><th width ='8%'><b>MediaType</<b></th><th width ='12%'><b>MediaFile</<b></th><th width ='12%'><b>OriginalMediaFile</<b></th><th width ='10%'><b>RouteFrom</<b></th><th width ='10%'><b>RouteTo</<b></th><th width ='3%'><b>Duration</<b></th><th width ='5%'><b>City</<b></th><th width ='5%'><b>EntryBy</<b></th></tr>");
       int j=1,Balance=0;
   
	String Sqlday="select * from smartgrid.mediamaster where  Date>='"+From1+"' and Date<='"+To1+"' and poleid='"+polid+"'";
	ResultSet rst1 = st.executeQuery(Sqlday);
	System.out.println("sqlday:-"+Sqlday);
	while(rst1.next())
	{ 
		 
		String Date= rst1.getString("Date"); 
  		
  		
  		String bookeddate1 = new SimpleDateFormat("dd-MMM-yyyy")
  		.format(new SimpleDateFormat("yyyy-MM-dd")
  				.parse(Date));
  		
  		System.out.println("DATESVVSDVSDV:-"+bookeddate1);
		 
		 String time=rst1.getString("time");
		 String location=rst1.getString("location");
	     String mediatype=rst1.getString("mediatype");
		 String medianame=rst1.getString("medianame");
		 String OriginalMediaFile=rst1.getString("Originalmedianame");
		 String RouteFrom=rst1.getString("RouteFrom");
		 String RouteTo=rst1.getString("RouteTo");
		 String duration=rst1.getString("duration");
		 String city=rst1.getString("city");
		 String EntryBy=rst1.getString("EntryBy");
		 
		 
		str.append("<tr><td align='right'><div align='right'>"+j+"</div></td>" );
	    str.append("<td align='right'><div align='right'>"+bookeddate1+"</div></td>" );
		str.append("<td align='right'><div align='right'>"+time+"</div></td>" );
	    str.append("<td align='right'><div align='right'>"+location+"</div></td>" );
	    str.append("<td align='right'><div align='right'>"+mediatype+"</div></td>" );
		str.append("<td align='right'><div align='right'>"+medianame+"</div></td>" );
		str.append("<td align='right'><div align='right'>"+OriginalMediaFile+"</div></td>" );
		str.append("<td align='right'><div align='right'>"+RouteFrom+"</div></td>" );
		str.append("<td align='right'><div align='right'>"+RouteTo+"</div></td>" );
	    str.append("<td align='right'><div align='right'>"+duration+"</div></td>" );
		str.append("<td align='right'><div align='right'>"+city+"</div></td>" );
		str.append("<td align='right'><div align='right'>"+EntryBy+"</div></td></tr>" );
		//str.append("</tr>");
	    j++;
	}
	str.append("</table>");
	Rname=Rname+str.toString();
	System.out.print(Rname);
	
	out.print(Rname);
 
 
 
 

}

catch(Exception e)
{
	e.printStackTrace();
}

%>

