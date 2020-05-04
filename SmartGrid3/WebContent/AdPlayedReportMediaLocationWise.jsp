<%@ include file="headernew.jsp"%> 
<%@page import="java.util.Date"%>

<%@ page import="java.sql.*" %>
 <%@
page import=  
    
      "java.io.BufferedReader,
 java.io.File,
 java.io.FileNotFoundException,
 java.io.IOException,
 java.io.InputStreamReader,
 java.io.PrintStream,
 java.io.PrintWriter,
 java.net.URL,
 java.net.URLConnection,
 java.sql.Connection,
 java.sql.DriverManager,
 java.sql.ResultSet,
 java.sql.SQLException,
 java.sql.Statement,
 java.text.DateFormat,
 java.text.Format,
 java.text.SimpleDateFormat,
 java.util.Map,
 java.util.Properties,
 java.util.StringTokenizer,
 java.util.regex.Matcher,
 java.util.regex.Pattern,

 org.json.JSONObject,
  org.json.JSONObject,
   java.sql.PreparedStatement"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>AD Play Media Wise Report</title>


<!-- <link rel="stylesheet" type="text/css" href="css/view.css" media="all">
 -->
 <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
 
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.1/css/responsive.dataTables.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
 --><link rel="stylesheet" href="css/styleMakePlan.css">
<!-- Export Options Links of DataTables -->

<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css">
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script> 
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script> 
<script src=" https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js "></script>
<script type="text/javascript" src="//cdn.datatables.net/plug-ins/1.10.19/sorting/date-dd-MMM-yyyy.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.4/moment.min.js"></script>
<script type="text/javascript" src="//cdn.datatables.net/plug-ins/1.10.19/sorting/datetime-moment.js"></script>

 <script type="text/javascript">
 $(document).ready(function() {
	    $('#example').DataTable( {
	    	/* "pagingType": "full_numbers",
	        dom: 'Bfrtip', */
	        "pagingType": "full_numbers",
            dom: 'Blfrtip',
            responsive: true,
            scrollY:        "400px",
            scrollX:        true,
            scrollCollapse: true,
            fixedColumns: true,

	        
	        buttons: [
	        	
	        	{
	        		extend: 'collection',
	        		
	        		text: 'Export',
	        		buttons: [
	        			{
	                        extend: 'excel',
	                        title: 'AD Played Detail Report-'+$("#location").val(),
	                       // title: 'Ledger Report-'+$("#data3").val()+"From"+$("#data").val()+"To"+$("#data1").val(),

	                        },
	                    {
	                        extend: 'pdf',
	                        title: 'AD Played Detail Report-'+$("#location").val(),
	                    },
	                    {
	                        extend: 'csv',
	                        title: 'AD Played Detail Report-'+$("#location").val(),
	                    },
	                    {
	                        extend: 'print',
	                        title: 'AD Played Detail Report-'+$("#location").val(),
	                    },
	                    {
	                        extend: 'copy',
	                        title: 'AD Played Detail Report-'+$("#location").val(),
	                    },
	                    
	            				/* 'copy', 'csv', 'excel', 'pdf', 'print' */
	            			]
	        	}
	        ],
        	lengthMenu: [[10, 25, 50, 100,-1], [10, 25, 50, 100,"All" ]]
	    	
	    } );
	} );

</script>

 <script type="text/javascript">
 function showFTPImage(imageName)
 {	
 	var url="http://twtech.in/SmartGrid/Media/"+imageName;

 	//var url="https://s3.ap-south-1.amazonaws.com/smartgridinfra/" +imageName;
 	testwindow1 = window.open(url,"Image", "width=500,height=500");
     testwindow1.moveTo(250,100);
 }
 												
 </script>
												

 <link href="http://cdn.syncfusion.com/16.4.0.42/js/web/flat-azure/ej.web.all.min.css" rel="stylesheet" />
<!--        <script src="http://cdn.syncfusion.com/js/assets/external/jquery-1.10.2.min.js"> </script>
 -->      <script src="http://cdn.syncfusion.com/16.4.0.42/js/web/ej.web.all.min.js"></script>
       
<script>
      $(function() {
    	 var date=new Date();
    	    var date1=new Date();
    	   
    	    date.setDate(date.getDate()-3);
    	    date1.setDate(date1.getDate()); 
    	    
    	        	    
         $('#date_ex').ejDateTimePicker({
        	 
        dateTimeFormat: "dd-MMM-yyyy HH:mm:ss ",
          timePopupWidth: "110px",
         timeDisplayFormat: "HH:mm:ss ",
         interval: 30,
         pickDate: false,
         pickSeconds: false,
         pick12HourFormat: false , 
         /* pickDate: false,
         pickSeconds: false,
         pick12HourFormat: false   */
         // pick24HourFormat: false,   // enables the 12-hour format time picker
         
         // minDateTime:date,
         // maxDateTime:date1,
          width: '165px'
       });
    });
  </script>
  <script>
      $(function() {
    	 var date=new Date();
    	    var date1=new Date();
    	   
    	    date.setDate(date.getDate()-3);
    	    date1.setDate(date1.getDate()); 
    	        	        	    
         $('#date_ex1').ejDateTimePicker({
        	 
        dateTimeFormat: "dd-MMM-yyyy HH:mm:ss ",
          timePopupWidth: "110px",
         timeDisplayFormat: "HH:mm:ss ",
         interval: 30,
         pickDate: false,
         pickSeconds: false,
         pick12HourFormat: false , 
         /* pickDate: false,
         pickSeconds: false,
         pick12HourFormat: false   */
         // pick24HourFormat: false,   // enables the 12-hour format time picker
         
         // minDateTime:date,
         // maxDateTime:date1,
          width: '165px'
       });
    });
  </script>
  <script type="text/javascript">
 function chk()
 {
 	
	 var dateStart=document.getElementById("date_ex").value;
 	 var dateEnd=document.getElementById("date_ex1").value;

     if(dateStart > dateEnd)
     {
	 		swal('From Date Should Be Less Than To Date.'); 

         return false; 
     }
         
         return true;
 	
 }
 
</script>
<style>
#example {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

#example td, #example th {
    border: 1px solid #ddd;
    padding: 8px;
}

#example tr:nth-child(even){background-color: #f2f2f2;}

#example tr:hover {background-color: #ddd;}

#example th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: left;
    background-color: #4CAF50;
    color: white;
}
</style>
<style>

.dropdown {
    position: relative;
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f1f1f1;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

.dropdown-content a:hover {background-color: #ddd}

.dropdown:hover .dropdown-content {
    display: block;
}

.dropdown:hover .dropbtn {
    background-color: #3e8e41;
}
</style>

</head>


<body style="background: #FFFFFF;">

 <%!
Connection con1=null,con2=null;
Statement st,st1,stcom,strch,st2,st3,st11,stt1,stt2,st12,st13,st14,st15,st16,st4,sto,st20,st21,st22,strep,stdev;
String fromdate,search="",todate,sql,sql1,sql2,sql3,transporter,pageflag,datenew1,datenew2,fromdatetime,todatetime, vendor1,category1,startp,endp,ven,startp1,endp1,vendername,
categoryname,startplacename,endplacename,statusname,vehino,vehicleno,vehiclecode,Sqlv="",distributorname="";
 String sqlname=null,briefing="",sqlbrif=null,Dbriefing="",etaclose="",reportclose="",tripsrch="",vehsrch="",spsrch="",driv="";
 String	epsrch="",ownsrch="",statuasrch="",statuarsrun="",etaclose1="",sdtime1="",sddate1="",etdate="",repdate="",reportclose1="",drivername="";
 
 int i=0;
 String sum="";
 
%><%
String date1 = "";
String date2 = "";
String date11 = "";
String date22 = "";
String date111 = "";
String date222 = "";
String time1 = "";
String time2 = "";
String  default_date_1="";
String default_date_3="";
String location1="";
String media1="";

String dateStart = "";
String dateEnd = "";
dateStart = request.getParameter("date_ex");
dateEnd = request.getParameter("date_ex1");
location1 = request.getParameter("location");
media1 = request.getParameter("medianame");


System.out.println("dateStart is ==>"+dateStart);
System.out.println("dateEnd  is ==>"+dateEnd);
System.out.println("Location  is ==>"+location1);
System.out.println("Media  is ==>"+media1);
if(location1==null)
{
	location1="select";
}
if(media1==null)
{
	media1="select";
}


if(dateStart==null){
	// To Date
	  default_date_1 = new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new Date());
	String  hh=new SimpleDateFormat("HH").format(new Date());

	int hh1=Integer.parseInt(hh);
	int hh2=hh1-2;
	// From Date
	 default_date_3 = new SimpleDateFormat("dd-MMM-yyyy ").format(new Date());


	String  default_date_5 = new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new Date());
	String  mm=new SimpleDateFormat("mm").format(new Date());

	int mm1=Integer.parseInt(mm);
	int mm2=mm1;
	default_date_3=default_date_3+""+hh2+":"+mm2;


	String defaultDate2 = new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new Date());
	System.out.println("The default date is(from date) ==>"+default_date_3);

	System.out.println("The default_date_1 (to date) is ==>"+default_date_1);





	date11=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(default_date_3)); 

	date22= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(default_date_1));
	// location1="All";
	// media1="All";

}
else
{
	
	date111=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(dateStart)); 

	date222= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(dateEnd));

 date1=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").parse(dateStart)); 

 date2= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").parse(dateEnd));

 System.out.println("The default date1 is ==>"+date1);

 System.out.println("The date2  is ==>"+date2);

}

System.out.println("The default date11 is ==>"+date11);
System.out.println("The date22  is ==>"+date22);
System.out.println("The default date111 is ==>"+date111);
System.out.println("The date222  is ==>"+date222);



System.out.println("MM_dbConn_DRIVER--->"+MM_dbConn_DRIVER);
System.out.println("MM_dbConn_STRING--->"+MM_dbConn_STRING);
System.out.println("MM_dbConn_STRING--->"+MM_dbConn_USERNAME);
System.out.println("MM_dbConn_STRING--->"+MM_dbConn_PASSWORD);
		Class.forName(MM_dbConn_DRIVER);
		con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
		Statement st = null, st1 = null, st3 = null, st4 = null,st2 = null;

		con2 = DriverManager.getConnection("jdbc:mysql://103.241.181.36:3306/smartgrid","fleetview","1@flv");
		//con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/smartgrid","root","root");
		Statement st5 = null;
		st = con1.createStatement();
		st1 = con1.createStatement();
		st2 = con1.createStatement();
		st3 = con1.createStatement();
		st4 = con1.createStatement();
		st5 = con2.createStatement();
		
		PreparedStatement ps = null;
		PreparedStatement ps1 = null;

		ResultSet rs4 = null;
		ResultSet rs3 = null;
		ResultSet rs = null;


		System.out.println("ok");
		
		String vehlist = session.getAttribute("VehicleCode").toString();

		
	 %>
<%

%>
 <body>
 <br>
 <br>
 <div id="head" name="head"  class="form" align="center" style="font-size: 16px;  ">

<form name="custreport" id="custreport" action="" method="post">
 
<font id="head1" name="head1" face="san-serif" color="#333" size="3"><b>AD Played Detail Report-<%=location1 %></b></font>
<br>
<br>
<table align="left"style="width:100%"> 
<tr> 
<td></td>
<td></td>
<td style="padding-left: 30px;"></td>
<td > 
<font color="black" style="font-size: 14px ; face:san-serif;"><b>From </b></font>

</td>
<td>
 <input  type="text" id="date_ex" value="<%if(dateStart==null){ %><%=date11%><%}else{%><%=date111%><%}%>"></input>
</td>
<td>  
<font color="Black" style="font-size: 14px ; face:san-serif;"><b>To </b></font>
</td>

<td>
<input  type="text" id="date_ex1" value="<%if(dateEnd==null){ %><%=date22%><%}else{%><%=date222%><%}%>"></input>
</td>
<td>
<font color="black" style="font-size: 14px ; face:san-serif;"><b>Location </b></font>

<select style="font-size:13px; face:san-serif; height: 28px;width:160px;"  name="location" id="location">
              <option style="font-size:13px; face:san-serif;" value="All"  selected="selected">All</option>
              <option style="font-size:13px; face:san-serif;" value="<%=location1%>"  selected="selected"><%=location1%></option>
        <%
        String DefaulSch = "select distinct(VehicleRegNumber),vehiclecode from db_gps.t_vehicledetails where vehiclecode in "+vehlist+" order by VehicleRegNumber";

        //String DefaulSch = "select distinct(schname) from smartgrid.t_defaultschedulemaster";
        rs = st.executeQuery(DefaulSch);
        while(rs.next()){ %>
        	
            <option style="font-size:13px; face:san-serif;" value="<%= rs.getString("VehicleRegNumber").trim()%>"><%= rs.getString("VehicleRegNumber").trim()%></option>
        <% } %>
        </select>
</td>


<td>
<font color="black" style="font-size: 14px ; face:san-serif;"><b>Media </b></font>
<select style="font-size:13px; face:san-serif; height: 28px; width:160px;"  name="medianame" id="medianame">
        <option style="font-size:13px; face:san-serif;" value="All"  selected="selected">All</option>
        <option style="font-size:13px; face:san-serif;" value="<%=media1%>"  selected="selected"><%=media1%></option>
        
        <%
        String DefaulSchname = "select distinct(filename) from smartgrid.t_AdPlayed where vehicleId in "+vehlist+" order by filename";
        //String DefaulSch = "select distinct(schname) from smartgrid.t_defaultschedulemaster";
        rs3 = st.executeQuery(DefaulSchname);
        while(rs3.next()){ %>
        	
            <option style="font-size:13px; face:san-serif;" value="<%= rs3.getString("filename").trim()%>"><%= rs3.getString("filename").trim()%></option>
        <% } %>
        </select>
<!-- </td>
<td> -->
&nbsp;
&nbsp;

<input type ="submit" name ="submit" id ="submit" style="font-size:13px; face:san-serif; height: 28px;" button onclick="return chk();" value="Submit"></input>		
</td>  
</tr>
 </table>
  </form>
 
 </div>
 <br>
 <br>
 <div class="form" style="margin-left: 2%;margin-top: 2%;">
<table id="example" class="display" style="width:100%" cellspacing="0" >
        <thead>
            <tr>
            	<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #424658; color: white;"><b>SrNo</b></th>
            	<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #424658; color: white;"><b>Location</b></th>
                <th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #424658; color: white;"><b>Media Name</b></th>
                <th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 8px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #424658; color: white;"><b>Media</b></th>
                <th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 8px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #424658; color: white;"><b>Play Time</b></th>
                
                    
            </tr>
        </thead>
        <tbody>
      <%  
/*       String entryby="";
      String Status = "";
      String EntryBy = "";
      String EntryDateTime = "";
      String schname = "";
      String schmedianame = "";
      String mediatype = "";
      String UpdateDateTime1= "";
      String owner= "",count="";
      String snapdatetime= "",poleid="",location=""; */
      String sql1="";
      
      
      
      if(dateStart==null)
      { 
    	  System.out.println("In Date Start Null ++++++++++++++: ");
  
    	  String loc2="";
		  String med2="";

		// sql1 = "select fileName,vehicleRegNum,Count(fileName) as PlayCount from smartgrid.t_AdPlayed where dispStartTime>='"+date1+"' and dispStartTime<='"+date2+"' and vehicleRegNum='"+location1+"' group by vehicleRegNum";
		// sql1 = "select fileName,vehicleRegNum,dispStartTime from smartgrid.t_AdPlayed where dispStartTime>='"+date1+"' and dispStartTime<='"+date2+"' and vehicleRegNum='"+location1+"' and fileName='"+media1+"' ";
System.out.println("Query is location1++++++++++++++: "+location1);
System.out.println("Query is media1++++++++++++++: "+media1);

if(location1.equalsIgnoreCase("All")||media1.equalsIgnoreCase("All"))
{
	if(location1.equalsIgnoreCase("All"))
	{
	loc2="select";
	}
	else
	{
	loc2="noselect";

	}
	if(media1.equalsIgnoreCase("All"))
	{
	med2="select";
	}
	else
	{
	med2="noselect";

	} 
	
	 if(loc2.equalsIgnoreCase("select") && med2.equalsIgnoreCase("select"))
     {
	   	   sql1 = "select fileName,vehicleRegNum,dispStartTime from smartgrid.t_AdPlayed where dispStartTime>='"+date11+"' and dispStartTime<='"+date22+"' and vehicleId in "+vehlist+" ";

     }
	   if(loc2.equalsIgnoreCase("select") && med2.equalsIgnoreCase("noselect"))
	  {
	   	   sql1 = "select fileName,vehicleRegNum,dispStartTime from smartgrid.t_AdPlayed where dispStartTime>='"+date11+"' and dispStartTime<='"+date22+"' and vehicleId in "+vehlist+" and fileName='"+media1+"' ";

	  } 
	   if(loc2.equalsIgnoreCase("noselect") && med2.equalsIgnoreCase("select"))
	  {
		 sql1 = "select fileName,vehicleRegNum,dispStartTime from smartgrid.t_AdPlayed where dispStartTime>='"+date11+"' and dispStartTime<='"+date22+"' and vehicleRegNum='"+location1+"'  ";

	  }
	    if(loc2.equalsIgnoreCase("noselect") && med2.equalsIgnoreCase("noselect"))
	  {
 	   	   sql1 = "select fileName,vehicleRegNum,dispStartTime from smartgrid.t_AdPlayed where dispStartTime>='"+date11+"' and dispStartTime<='"+date22+"' and vehicleRegNum= "+location1+" and fileName='"+media1+"' ";

	  } 

	
}
else
{
if(location1.equalsIgnoreCase("select"))
{
loc2="select";
}
else
{
loc2="noselect";

}
if(media1.equalsIgnoreCase("select"))
{
med2="select";
}
else
{
med2="noselect";

} 

System.out.println("Query is location1++++++++++++++: "+loc2);
System.out.println("Query is media1++++++++++++++: "+med2);


		 if(loc2.equalsIgnoreCase("select") && med2.equalsIgnoreCase("select"))
         {
   	   	   sql1 = "select fileName,vehicleRegNum,dispStartTime from smartgrid.t_AdPlayed where dispStartTime>='"+date11+"' and dispStartTime<='"+date22+"' and vehicleId='-'  ";

         }
   	   if(loc2.equalsIgnoreCase("select") && med2.equalsIgnoreCase("noselect"))
   	  {
  	   	   sql1 = "select fileName,vehicleRegNum,dispStartTime from smartgrid.t_AdPlayed where dispStartTime>='"+date11+"' and dispStartTime<='"+date22+"' and vehicleId in "+vehlist+" and fileName='"+media1+"' ";

   	  } 
   	   if(loc2.equalsIgnoreCase("noselect") && med2.equalsIgnoreCase("select"))
   	  {
    		 sql1 = "select fileName,vehicleRegNum,dispStartTime from smartgrid.t_AdPlayed where dispStartTime>='"+date11+"' and dispStartTime<='"+date22+"' and vehicleRegNum='"+location1+"'  ";

   	  }
   	    if(loc2.equalsIgnoreCase("noselect") && med2.equalsIgnoreCase("noselect"))
   	  {
     	   	   sql1 = "select fileName,vehicleRegNum,dispStartTime from smartgrid.t_AdPlayed where dispStartTime>='"+date11+"' and dispStartTime<='"+date22+"' and vehicleRegNum= "+location1+" and fileName='"+media1+"' ";

   	  } 
   	//   sql1 = "select fileName,vehicleRegNum,Count(fileName) as PlayCount from smartgrid.t_AdPlayed where dispStartTime>='"+date11+"' and dispStartTime<='"+date22+"' and vehicleId in "+vehlist+"  group by vehicleRegNum";
}
    	  
      
      
      }else
    	  {
    		  String loc2="";
    		  String med2="";

    		// sql1 = "select fileName,vehicleRegNum,Count(fileName) as PlayCount from smartgrid.t_AdPlayed where dispStartTime>='"+date1+"' and dispStartTime<='"+date2+"' and vehicleRegNum='"+location1+"' group by vehicleRegNum";
    		// sql1 = "select fileName,vehicleRegNum,dispStartTime from smartgrid.t_AdPlayed where dispStartTime>='"+date1+"' and dispStartTime<='"+date2+"' and vehicleRegNum='"+location1+"' and fileName='"+media1+"' ";
 System.out.println("Query is location1++++++++++++++: "+location1);
 System.out.println("Query is media1++++++++++++++: "+media1);
 if(location1.equalsIgnoreCase("All")||media1.equalsIgnoreCase("All"))
 {
	 
	 if(location1.equalsIgnoreCase("All"))
	 {
	 	loc2="select";
	 }
	 else
	 {
	 	loc2="noselect";

	 }
	 if(media1.equalsIgnoreCase("All"))
	 {
	 	med2="select";
	 }
	 else
	 {
	 	med2="noselect";

	 }   
	 System.out.println("Query is location1++++++++++++++: "+loc2);
	 System.out.println("Query is media1++++++++++++++: "+med2);


	 			 if(loc2.equalsIgnoreCase("select") && med2.equalsIgnoreCase("select"))
	              {
	        	   	   sql1 = "select fileName,vehicleRegNum,dispStartTime from smartgrid.t_AdPlayed where dispStartTime>='"+date1+"' and dispStartTime<='"+date2+"' and vehicleId in "+vehlist+" ";

	              }
	        	   if(loc2.equalsIgnoreCase("select") && med2.equalsIgnoreCase("noselect"))
	        	  {
	       	   	   sql1 = "select fileName,vehicleRegNum,dispStartTime from smartgrid.t_AdPlayed where dispStartTime>='"+date1+"' and dispStartTime<='"+date2+"' and vehicleId in "+vehlist+" and fileName='"+media1+"' ";

	        	  } 
	        	   if(loc2.equalsIgnoreCase("noselect") && med2.equalsIgnoreCase("select"))
	        	  {
	         		 sql1 = "select fileName,vehicleRegNum,dispStartTime from smartgrid.t_AdPlayed where dispStartTime>='"+date1+"' and dispStartTime<='"+date2+"' and vehicleRegNum='"+location1+"'  ";
	     
	        	  }
	        	    if(loc2.equalsIgnoreCase("noselect") && med2.equalsIgnoreCase("noselect"))
	        	  {
	          	   	   sql1 = "select fileName,vehicleRegNum,dispStartTime from smartgrid.t_AdPlayed where dispStartTime>='"+date1+"' and dispStartTime<='"+date2+"' and vehicleRegNum='"+location1+"' and fileName='"+media1+"' ";

	        	  } 

	 
	 
	 
 }
 else
 {
    		
if(location1.equalsIgnoreCase("select"))
{
	loc2="select";
}
else
{
	loc2="noselect";

}
if(media1.equalsIgnoreCase("select"))
{
	med2="select";
}
else
{
	med2="noselect";

}   
System.out.println("Query is location1++++++++++++++: "+loc2);
System.out.println("Query is media1++++++++++++++: "+med2);


			 if(loc2.equalsIgnoreCase("select") && med2.equalsIgnoreCase("select"))
             {
       	   	   sql1 = "select fileName,vehicleRegNum,dispStartTime from smartgrid.t_AdPlayed where dispStartTime>='"+date1+"' and dispStartTime<='"+date2+"' and vehicleId= '-'  ";

             }
       	   if(loc2.equalsIgnoreCase("select") && med2.equalsIgnoreCase("noselect"))
       	  {
      	   	   sql1 = "select fileName,vehicleRegNum,dispStartTime from smartgrid.t_AdPlayed where dispStartTime>='"+date1+"' and dispStartTime<='"+date2+"' and vehicleId in "+vehlist+" and fileName='"+media1+"' ";

       	  } 
       	   if(loc2.equalsIgnoreCase("noselect") && med2.equalsIgnoreCase("select"))
       	  {
        		 sql1 = "select fileName,vehicleRegNum,dispStartTime from smartgrid.t_AdPlayed where dispStartTime>='"+date1+"' and dispStartTime<='"+date2+"' and vehicleRegNum='"+location1+"'  ";
    
       	  }
       	    if(loc2.equalsIgnoreCase("noselect") && med2.equalsIgnoreCase("noselect"))
       	  {
         	   	   sql1 = "select fileName,vehicleRegNum,dispStartTime from smartgrid.t_AdPlayed where dispStartTime>='"+date1+"' and dispStartTime<='"+date2+"' and vehicleRegNum='"+location1+"' and fileName='"+media1+"' ";

       	  } 
 }   		 
 }
      
      
      String location="";
     String fileNamedemo="";
     String mediaTypedemo="";
     String durationdemo="";
     String Datedemo="",snapdatetime="",PlayCount="";
       int i=1;
     


 System.out.println("Query is ++++++++++++++: "+sql1);
 ps = con1.prepareStatement(sql1);
 rs4 = ps.executeQuery();
 while(rs4.next()){	
	 location=rs4.getString("vehicleRegNum");
	 fileNamedemo=rs4.getString("fileName");
	// mediaTypedemo=rs4.getString("mediaType");
	// PlayCount=rs4.getString("PlayCount");
	 Datedemo=rs4.getString("dispStartTime");
	 
	// System.out.println("Datedemo is: =========>" + Datedemo);
	   /* schname= rs4.getString("schname");
	   count= rs4.getString("count");
	   owner=rs4.getString("owner");
	   entryby=rs4.getString("entryby");
	   UpdateDateTime1=rs4.getString("entrydatetime");
	snapdatetime = new SimpleDateFormat("dd-MMM-yyyy HH:mm")
				.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
						.parse(UpdateDateTime1)); */
						
				/* 		snapdatetime = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss")
						.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
								.parse(Datedemo));
						System.out.println("Snapdatetime is :===================>" + snapdatetime); */
%>   	

			<tr>	
							<td style="font-size: 13px ; face:san-serif;" align="right"><%=i%></td>
							<td style="font-size: 13px ; face:san-serif;" align="left"><%=location%></td>
							<td style="font-size: 13px ; face:san-serif;" align="left"><%=fileNamedemo%></td>
							<td style="font-size: 13px ; face:san-serif;" align="left">
			    	<a href="#!" onclick="showFTPImage('<%=fileNamedemo%>');"><img  src="http://twtech.in/SmartGrid/Media/<%=fileNamedemo%>" width="50" height="50" /></a>
			    	</td>
			    	<%--  <td style="font-size: 13px ; face:san-serif;" align="left">
			    	 <a href="defaultaddplayreport.jsp?medianame=<%=fileNamedemo%>"><%=PlayCount%></a></td> --%>
					<td style="font-size: 13px ; face:san-serif;" align="left"><%=Datedemo%></td>
							
            </tr>
               
               
                  <%
                  i++;            
      } 
                 
                 
                  %>     
            
        </tbody>
    </table>
    </div>

</body>
</body>
</html>

