<%@ include file="headernew.jsp"%> 

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

<title>My Grid Report</title>


<!-- <link rel="stylesheet" type="text/css" href="css/view.css" media="all">
 -->
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

            "columnDefs": [
                { type: 'date-dd-mmm-yyyy', targets: 5 },
              ], 
	        
	        buttons: [
	        	
	        	{
	        		extend: 'collection',
	        		
	        		text: 'Export',
	        		buttons: [
	        			{
	                        extend: 'excel',
	                        title: 'Default Schedule Master Report',
	                        },
	                    {
	                        extend: 'pdf',
	                        title: 'Default Schedule Master Report',
	                    },
	                    {
	                        extend: 'csv',
	                        title: 'Default Schedule Master Report',
	                    },
	                    {
	                        extend: 'print',
	                        title: 'Default Schedule Master Report',
	                    },
	                    {
	                        extend: 'copy',
	                        title: 'Default Schedule Master Report',
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

(function () {

var customDateDDMMMYYYYToOrd = function (date) {
    "use strict"; //let's avoid tom-foolery in this function
    // Convert to a number YYYYMMDD which we can use to order
    var dateParts = date.split(/-/);
    return (dateParts[2] * 10000) + ($.inArray(dateParts[1].toUpperCase(), ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"]) * 100) + (dateParts[0]*1);
};

// This will help DataTables magic detect the "dd-MMM-yyyy" format; Unshift
// so that it's the first data type (so it takes priority over existing)
jQuery.fn.dataTableExt.aTypes.unshift(
    function (sData) {
        "use strict"; //let's avoid tom-foolery in this function
        if (/^([0-2]?\d|3[0-1])-(jan|feb|mar|apr|may|jun|jul|aug|sep|oct|nov|dec)-\d{4} /i.test(sData)) {
            return 'date-dd-mmm-yyyy';
        }
        return null;
    }
);

// define the sorts
jQuery.fn.dataTableExt.oSort['date-dd-mmm-yyyy-asc'] = function (a, b) {
    "use strict"; //let's avoid tom-foolery in this function
    var ordA = customDateDDMMMYYYYToOrd(a),
        ordB = customDateDDMMMYYYYToOrd(b);
    return (ordA < ordB) ? -1 : ((ordA > ordB) ? 1 : 0);
};

jQuery.fn.dataTableExt.oSort['date-dd-mmm-yyyy-desc'] = function (a, b) {
    "use strict"; //let's avoid tom-foolery in this function
    var ordA = customDateDDMMMYYYYToOrd(a),
        ordB = customDateDDMMMYYYYToOrd(b);
    return (ordA < ordB) ? 1 : ((ordA > ordB) ? -1 : 0);
};

})();

</script> 
 
 <script type="text/javascript">
 function chk()
 {

 	
 	
 	var chkf="";
 	var chkt="";
 	var objFromDate = document.getElementById("data").value;
 	var fdate=objFromDate.split("-");
 	if(fdate[1]=="Jan")
 	{
 		chkf="01";
 	}
 	if(fdate[1]=="Feb")
 	{
 		chkf="02";
 	}
 	if(fdate[1]=="Mar")
 	{
 		chkf="03";
 	}
 	if(fdate[1]=="Apr")
 	{
 		chkf="04";
 	}
 	if(fdate[1]=="May")
 	{
 		chkf="05";
 	}
 	if(fdate[1]=="Jun")
 	{
 		chkf="06";
 	}
 	if(fdate[1]=="Jul")
 	{
 		chkf="07";
 	}
 	if(fdate[1]=="Aug")
 	{
 		chkf="08";
 	}
 	if(fdate[1]=="Sep")
 	{
 		chkf="09";
 	}
 	if(fdate[1]=="Oct")
 	{
 		chkf="10";
 	}
 	if(fdate[1]=="Nov")
 	{
 		chkf="11";
 	}
 	if(fdate[1]=="Dec")
 	{
 		chkf="12";
 	}
 	var objFromDate1=""+fdate[2]+"-"+chkf+"-"+fdate[0]+"";
     var objToDate = document.getElementById("data1").value;
     var tdate=objToDate.split("-");
     if(tdate[1]=="Jan")
 	{
     	chkt="01";
 	}
 	if(tdate[1]=="Feb")
 	{
 		chkt="02";
 	}
 	if(tdate[1]=="Mar")
 	{
 		chkt="03";
 	}
 	if(tdate[1]=="Apr")
 	{
 		chkt="04";
 	}
 	if(tdate[1]=="May")
 	{
 		chkt="05";
 	}
 	if(tdate[1]=="Jun")
 	{
 		chkt="06";
 	}
 	if(tdate[1]=="Jul")
 	{
 		chkt="07";
 	}
 	if(tdate[1]=="Aug")
 	{
 		chkt="08";
 	}
 	if(tdate[1]=="Sep")
 	{
 		chkt="09";
 	}
 	if(tdate[1]=="Oct")
 	{
 		chkt="10";
 	}
 	if(tdate[1]=="Nov")
 	{
 		chkt="11";
 	}
 	if(tdate[1]=="Dec")
 	{
 		chkt="12";
 	}
     var objToDate1=""+tdate[2]+"-"+chkt+"-"+tdate[0]+"";
    // alert("Entry from date > "+objFromDate1+" Todate > "+objToDate1);
      
     var date1 = new Date(objFromDate1);
     var date2 = new Date(objToDate1);
     
     //alert("from > "+date1+" Todate > "+date2);
     
     var date3 = new Date();
     var date4 = date3.getMonth() + "-" + date3.getDay() + "-" + date3.getYear();
     var currentDate = new Date(date4);
      
         if(date1 > date2)
         {
             alert("From Date Should be Less Than To Date");
             return false; 
         }
//          else if(date1 > currentDate)
//          {
//              alert("From Date should be less than current date");
//              return false; 
//          }
//          else if(date2 > currentDate) 
//          {
//              alert("To Date should be less than current date");
//              return false; 
//          }

         return true;
 	
 }
 
</script>
<script type="text/javascript">
function showFTPImage(imageName)
{	
	var url="showcameraftpimage.jsp?imageName="+imageName;

	//var url="https://s3.ap-south-1.amazonaws.com/smartgridinfra/" +imageName;
	testwindow1 = window.open(url,"Image", "width=500,height=500");
    testwindow1.moveTo(250,100);
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

		System.out.println("ok");
		java.util.Date d = new java.util.Date();
		int hours = (d.getHours());
		int minutes = (d.getMinutes());
		int seconds = (d.getSeconds());
		String nwfrmtdte ="16-NOV-2016";
		String sysdate22 ="16-NOV-2016";
String datex1, datex2, data1, data2;
String vehiclecode="";
String VehRegNo="";
String vehiclecode1="";
String VehRegNo1="";
String type="",status="";
%>
<%
String ddx = request.getQueryString();
	if (ddx == null) {
		System.out.println(" In First If  " );
		datex1 = datex2 = new SimpleDateFormat("dd-MMM-yyyy")
				.format(new java.util.Date());
		data1 = data2 = new SimpleDateFormat("yyyy-MM-dd")
				.format(new java.util.Date());
		Calendar c = Calendar.getInstance();   // this takes current date
	    c.set(Calendar.DAY_OF_MONTH, 1);
	    System.out.println(" current date "+new SimpleDateFormat("dd-MMM-yyyy").format(c.getTime())); 
	    datex1=new SimpleDateFormat("dd-MMM-yyyy").format(c.getTime());
	} else {
		
		System.out.println(" In First Else  " );
		data1 = new SimpleDateFormat("yyyy-MM-dd")
				.format(new SimpleDateFormat("dd-MMM-yyyy")
						.parse(request.getParameter("data")));
		data2 = new SimpleDateFormat("yyyy-MM-dd")
				.format(new SimpleDateFormat("dd-MMM-yyyy")
						.parse(request.getParameter("data1")));
		
		datex1 = request.getParameter("data");
		datex2 = request.getParameter("data1");
		
	}
	
	String Bt=request.getParameter("button");
	System.out.println(" Button :- " +Bt);
	
	if(Bt==null || Bt==" " || Bt=="")
	{
		datex1 = datex2 = new SimpleDateFormat("dd-MMM-yyyy")
		.format(new java.util.Date());
data1 = data2 = new SimpleDateFormat("yyyy-MM-dd")
		.format(new java.util.Date());

Calendar c = Calendar.getInstance();   // this takes current date
c.set(Calendar.DAY_OF_MONTH, 1);
System.out.println(" current date "+new SimpleDateFormat("dd-MMM-yyyy").format(c.getTime())); 
datex1=new SimpleDateFormat("dd-MMM-yyyy").format(c.getTime());
		
	}
	else
	{
		data1 = new SimpleDateFormat("yyyy-MM-dd")
		.format(new SimpleDateFormat("dd-MMM-yyyy")
				.parse(request.getParameter("data")));
data2 = new SimpleDateFormat("yyyy-MM-dd")
		.format(new SimpleDateFormat("dd-MMM-yyyy")
				.parse(request.getParameter("data1")));




datex1 = request.getParameter("data");
datex2 = request.getParameter("data1");
	}
	
System.out.println(" datex1 "+datex1+" datex2 "+datex2);


String dt = new SimpleDateFormat("yyyy-MM-dd")
.format(new SimpleDateFormat("dd-MMM-yyyy")
	.parse(datex1));

String dt1 = new SimpleDateFormat("yyyy-MM-dd")
.format(new SimpleDateFormat("dd-MMM-yyyy")
	.parse(datex2));
dt=dt+"%20"+"00:00:00";
dt1=dt1+"%20"+"23:59:59";

System.out.println(" dt :-"+dt+" dt1 :-"+dt1);
String vehlist = session.getAttribute("VehicleCode").toString();

System.out.println("Session Veh List :- "+vehlist);

%>
 <body>
 <br>
 <br>
<form name="custreport" id="custreport" method="post">
<!-- <div id="head" name="head" class="form" align="center" style="font-size: 16px;">
<font id="head1" name="head1" face="san-serif" color="#333" size="4"><b>Default Schedule Report</b></font>
</div>
 -->
 
 <div id="head" name="head" class="form" align="center" style="font-size: 16px;">
<font id="head1" name="head1" face="san-serif" color="#333" size="3"><b>Default Schedule Master Report</b></font>
</div>
 
 
<br>
<!-- <div style="margin-left: 2%;margin-top: 2%;" align="left">
<a href="CreateDefaultSchedule.jsp"><b>Create Default Schedule</b></a>
</div>
 -->
 <div class="form" style="margin-left: 2%;margin-top: 2%;">

<table id="example" class="display" style="width:100%" cellspacing="0" >
        <thead>
            <tr>
            	<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #424658; color: white;"><b>SrNo</b></th>
            	<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #424658; color: white;"><b>Schedule Name</b></th>
                <th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 8px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #424658; color: white;"><b>Media Count</b></th>
                <th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 8px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #424658; color: white;"><b>Owner</b></th>
                <th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 8px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #424658; color: white;"><b>Entry By</b></th>
                <th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 8px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #424658; color: white;"><b>Update Date Time</b></th>
                
                    
            </tr>
        </thead>
        <tbody>
      <%  
      String entryby="";
      String Status = "";
      String EntryBy = "";
      String EntryDateTime = "";
      String schname = "";
      String schmedianame = "";
      String mediatype = "";
      String UpdateDateTime1= "";
      String owner= "",count="";
      String snapdatetime= "",poleid="",location="";
    
       int i=1;
     
 String sql1 = "select schname,owner,entryby,entrydatetime,count(*) as count from  smartgrid.t_defaultschedulemaster group by schname";

 System.out.println("Query is ++++++++++++++: "+sql1);
 ps = con1.prepareStatement(sql1);
 rs4 = ps.executeQuery();
 while(rs4.next()){	
	   schname= rs4.getString("schname");
	   count= rs4.getString("count");
	   owner=rs4.getString("owner");
	   entryby=rs4.getString("entryby");
	   UpdateDateTime1=rs4.getString("entrydatetime");
	snapdatetime = new SimpleDateFormat("dd-MMM-yyyy HH:mm")
				.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
						.parse(UpdateDateTime1));
%>   	

			<tr>	
							<td style="font-size: 13px ; face:san-serif;" align="right"><%=i%></td>
							<td style="font-size: 13px ; face:san-serif;" align="left"><a href="CreateDefaultScheduleReport.jsp?schname1=<%=schname%>"><%=schname%></a></td>
							<td style="font-size: 13px ; face:san-serif;" align="right"><%=count%></td>
							<td style="font-size: 13px ; face:san-serif;" align="left"><%=owner%></td>
							<td style="font-size: 13px ; face:san-serif;" align="left"><%=entryby%></td>
							<td style="font-size: 13px ; face:san-serif;" align="right"><%=snapdatetime%></td>
            </tr>
               
               
                  <%
                  i++;            
      } 
                 
                  %>     
            
        </tbody>
    </table>
    </div>
</form>
</body>
</body>
</html>

  <%@ include file="footer.jsp"%>

