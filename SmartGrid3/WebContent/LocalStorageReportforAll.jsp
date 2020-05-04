<%-- <jsp:useBean id="fleetview" class="com.fleetview.beans.classes" scope="page"> --%>
<%-- <%@page import="java.util.Date"%> --%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
 "http://www.w3.org/TR/html4/strict.dtd">
 <%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%-- <%@ include file="Conn.jsp"%>
   <%@page import="java.util.*,java.sql.*" %> --%>
<%@ include file="headernew.jsp"%> 
<!-- <!DOCTYPE html> -->

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Local Storage Report for All</title>
    <style>
	http://meyerweb.com/eric/thoughts/2007/05/01/reset-reloaded/
http://meyerweb.com/eric/tools/css/reset/index.html
    </style>
   
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
	                        title: 'Local Storage Report for All-' + " "+ "From"+ " "+ $("#date_ex").val()+ " " + "To"+ " " +$("#date_ex1").val(),
	                        },
	                    {
	                        extend: 'pdf',
	                        title: 'Local Storage Report for All-' + " "+ "From"+ " "+ $("#date_ex").val()+ " " + "To"+ " " +$("#date_ex1").val(),
	                    },
	                    {
	                        extend: 'csv',
	                        title: 'Local Storage Report for All-' + " "+ "From"+ " "+ $("#date_ex").val()+ " " + "To"+ " " +$("#date_ex1").val(),
	                    },
	                    {
	                        extend: 'print',
	                        title: 'Local Storage Report for All-' + " "+ "From"+ " "+ $("#date_ex").val()+ " " + "To"+ " " +$("#date_ex1").val(),
	                    },
	                    {
	                        extend: 'copy',
	                        title: 'Local Storage Report for All-' + " "+ "From"+ " "+ $("#date_ex").val()+ " " + "To"+ " " +$("#date_ex1").val(),
	                    },
	                    
	            				/* 'copy', 'csv', 'excel', 'pdf', 'print' */
	            			]
	        	}
	        ],
        	lengthMenu: [[10, 25, 50, 100,-1], [10, 25, 50, 100,"All" ]]
	    	
	    } );
	} );

</script>

 
 <style>

.popup {
background-color: #98AFC7;
position: absolute;
visibility: hidden;
}
.popupnew {
background-color: #98AFC7;
position: absolute;
visibility: visible;
}

/* div.absolute1 {
    position: absolute;
    left: 30px;
    width:100%;
    border:0;
}  */   
</style> 
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
          timePopupWidth: "150px",
         timeDisplayFormat: "HH:mm:ss ",
         interval: 01,
         pickDate: false,
         pickSeconds: false,
         pick12HourFormat: false , 
         /* pickDate: false,
         pickSeconds: false,
         pick12HourFormat: false   */
         // pick24HourFormat: false,   // enables the 12-hour format time picker
         
         // minDateTime:date,
         // maxDateTime:date1,
          width: '200px'
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
          timePopupWidth: "150px",
         timeDisplayFormat: "HH:mm:ss ",
         interval: 01,
         pickDate: false,
         pickSeconds: false,
         pick12HourFormat: false , 
         /* pickDate: false,
         pickSeconds: false,
         pick12HourFormat: false   */
         // pick24HourFormat: false,   // enables the 12-hour format time picker
         
         // minDateTime:date,
         // maxDateTime:date1,
          width: '200px'
       });
    });
  </script>
  
<script type="text/javascript">
 function chk()
 {
 	
	 var dateStart=new Date(document.getElementById("date_ex").value).getTime();
 	 var dateEnd=new Date(document.getElementById("date_ex1").value).getTime();
 	 
 	   if(dateStart > dateEnd)
     {
	 		swal('From Date Should Be Less Than To Date.'); 

         return false; 
     }
         
         return true;
    

 }
 </script>
  
  
    
<script type="text/javascript"> 
function dateformat(days)
{
	if(days=='Jan')
		return(1);
	else if(days=='Feb')
		return(2);
	else if(days=='Mar')
		return(3);
	else if(days=='Apr')
		return(4);
	else if(days=='May')
		return(5);
	else if(days=='Jun')
		return(6);
	else if(days=='Jul')
		return(7);
	else if(days=='Aug')
		return(8);
	else if(days=='Sep')
		return(9);
	else if(days=='Oct')
		return(10);
	else if(days=='Nov')
		return(11);
	else if(days=='Dec')
		return(12);
 }

function datevalidate()
{
	
	
	var date1 = document.getElementById("date1").value;
	var hr1="";
	var min1="";
	var dm1,dd1,dy1,dm2,dd2,dy2;
	var dd11,yy11,mm1,mm2,mm11,dd22,yy22,mm22;
	dd11=date1.substring(0,2);
	mm1=date1.substring(3,6);
	mm11=dateformat(mm1);
	yy11=date1.substring(7,11);
	hr1 = date1.substring(12,14)
	min1 = date1.substring(15,17)
	var date=new Date();
	var month=date.getMonth()+1;
	var day=date.getDate();
	var hr=date.getHours();
	var min=date.getMinutes();
	//alert(hr);
	//alert(min);
	var year=date.getFullYear();
	//alert("year1   "+yy11+"   year  "+year);
	if(yy11<year) 
	{
		
		alert("selected date should not be Less than todays date");
		document.getElementById("date1").value="";
		document.getElementById("date1").focus;
		return false;
	}
	else if(year==yy11)
	{
		//alert("month1   "+mm11+"   month  "+month);
			if(mm11<month)
		{
			alert("selected date should not be Less than todays date");
			document.getElementById("date1").value="";
			document.getElementById("date1").focus;
			return false;
		}
			else
				if(mm11==month)
				{
					//alert("day1   "+dd11+"   day  "+day);
					if(dd11<day)
					{
						alert("selected date should not be Less than todays date");
						document.getElementById("date1").value="";
						document.getElementById("date1").focus;
						return false;
					}
					else
						if(dd11==day)
						{
							//alert("hr1   "+hr1+"   hr  "+hr);
							if(hr1<hr)
							{
								alert("selected date should not be Less than todays date");
								document.getElementById("date1").value="";
								document.getElementById("date1").focus;
								return false;
							}
							else
								if(hr1==hr)
								{
									//alert("min1   "+min1+"   min  "+min);
									if(min1<min)
									{
										alert("selected date should not be Less than todays date");
										document.getElementById("date1").value="";
										document.getElementById("date1").focus;
										return false;
									}
								}
					    }
		        }
	}
	return true;
}

function dateformat(days)
{
	 if(days=='Jan')
		return(1);
	 else
		if(days=='Feb')
			return(2);
		else
			if(days=='Mar')
				return(3);
			else
				if(days=='Apr')
					return(4);
				else
					if(days=='May') //timeformat: "%M:%S"
						
						return(5);
					else
						if(days=='Jun')
							return(6);
						else
							if(days=='Jul')
								return(7);
							else
								if(days=='Aug')
									return(8);
								else
									if(days=='Sep')
										return(9);
									else
										if(days=='Oct')
											return(10);
										else
											if(days=='Nov')
												return(11);
											else
												if(days=='Dec')
													return(12);
 }

function gotoExcel(elemId, frmFldId)  
{  
	      
          var obj = document.getElementById(elemId);
          var oFld = document.getElementById(frmFldId);
          oFld.value = obj.innerHTML;
          document.camera_jpg_report.action ="excel.jsp";
          document.forms["camera_jpg_report"].submit();
}

function gotoPrint(divName)  
{  
	  
    var printContents = document.getElementById(divName).innerHTML; 
    var originalContents = document.body.innerHTML;       
    document.body.innerHTML = printContents;  
    window.print();
    document.body.innerHTML = originalContents;  
}

</script>

</head>
<body style="background: #FFFFFF;">
<%! Connection conn = null;
	Statement st = null;
	Statement st1 = null;
	Statement st2 = null;
	Statement st3 = null;
	Statement st4 = null;
	Statement st5= null;
	Statement st6= null;
	Statement st7= null;
	
	String date1 = "";
	String date2 = "";
	String time1 = "";
	String time2 = "";
	
	String vehno="";
%>
<%!
String from="",to="";%>
<%

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

String dateStart = "";
String dateEnd = "";
dateStart = request.getParameter("date_ex");
dateEnd = request.getParameter("date_ex1");
System.out.println("dateStart is ==>"+dateStart);

System.out.println("dateEnd  is ==>"+dateEnd);


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




	
%>	

<%
String vehlist = "";
try{
	
	String frompage = request.getParameter("frompage");
	vehlist = session.getAttribute("vehlist").toString();
	System.out.println("The vehicle list>>>>"+vehlist);

	if(frompage!=null && frompage.equalsIgnoreCase("OS"))
	{
		String thedate = request.getParameter("date_ex");
		String thedate1 = request.getParameter("date_ex1");
		dateStart = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(thedate));
		from=dateStart;
		time1 = new SimpleDateFormat("HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(thedate));
		dateEnd = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(thedate1));
		to=dateEnd;
		time2 = new SimpleDateFormat("HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(thedate1));

		
	}
	else
	{
		
		dateStart = request.getParameter("date_ex");
		 from=dateStart;
		 System.out.println("date1 "+dateStart);
		 time1 =":00";
		 dateEnd = request.getParameter("date_ex1");
		 to=dateEnd;
		 System.out.println("date2 "+dateEnd);
		 time2 = ":59";
	
	}
	
	 Class.forName(MM_dbConn_DRIVER);
	 conn = DriverManager.getConnection(MM_dbConn_STRING1, MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
	 st = conn.createStatement();
	 st1 = conn.createStatement();
	 st2 = conn.createStatement();
	 st3 = conn.createStatement();
	 st4 = conn.createStatement();
	 st5 = conn.createStatement();
	 st6 = conn.createStatement();
	 st7 = conn.createStatement();
	 
	
	 System.out.println("  Date1 ==>"+date1+ "Date2 ==>"+date2);

}catch(Exception e){
	System.out.println("Exception "+e);
}
%>

<div id="head" name="head"  class="form" align="center" style="font-size: 16px;" >
<form id="camera_jpg_report" name="camera_jpg_report"  method="post" >
<br></br>
<font id="head1" name="head1" face="san-serif" color="#333" size="3"><b>Local Storage Report for All</b></font>
<br></br>
<table  style="width: 78%;">
<tr>
	<td align="center"> <font color="black" style="font-size: 14px ; face:san-serif;"><b>From : </b></font>
</td>
<td>
 <input  type="text" id="date_ex" value="<%if(dateStart==null){ %><%=date11%><%}else{%><%=date111%><%}%>"></input>
</td>
<td>  
<font color="Black" style="font-size: 14px ; face:san-serif;"><b>To :</b></font>
</td>

<td>
<input  type="text" id="date_ex1" value="<%if(dateEnd==null){ %><%=date22%><%}else{%><%=date222%><%}%>"></input>
</td>

	
<td>
		
		<%String tim=request.getParameter("dattim");
		System.out.println("tim"+tim);
		%>
		<div align="left"><font color="black" size="2" face="Arial"><font color="black"><b>Report By:</b>
		<select  name="dattim" id="dattim">
		<%if(tim==null)
		{
			tim="snaptime";
		}
		%>

      
             <% if(tim.equalsIgnoreCase("Snaptime")){%>
   
            <option value = "Snaptime" selected="selected">Snaptime</option>
            <option value="Storetime">Storetime</option> 
      
            <%}
             else if(tim.equalsIgnoreCase("Storetime"))
              {   %>
              
            <option value = "Storetime" selected="selected">Storetime</option>
            <option value="Snaptime">Snaptime</option> 
       
            
        <% }%>         	 
        </select>
        </font>
        </font>
		</div>
</td>

	    <td>
	    <input type="submit" name="Submit" button onclick="return chk();" value="Submit" style="height: 30px; text-align: center; font-size: 14px; color: black">
	    </td>
</tr>
</table>
</form>
</div>		

 <div class="form" style="margin-left: 2%;margin-top: 2%;">
 <table id="example" class="display" style="width:100%" cellspacing="0" >
 	<thead>
	<tr>
			<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #424658; color: white;">Sr No</th>
			<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #424658; color: white;">UnitId</th>
			<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #424658; color: white;">Owner</th>
			<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #424658; color: white;">Vehicle</th>
			<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #424658; color: white;">Total Images</th>
			<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #424658; color: white;">Cam1</th>
			<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #424658; color: white;">Cam2</th>
			<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #424658; color: white;">Cam3</th>
			<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #424658; color: white;">Cam4</th>
	</tr>
	</thead>
	<tbody>
	
			<%
			int count=0;
			String vehno="",vehcode="";
			String unitid="",camerapos="",type2="",type3="",type4="",type5="",type6="";
			String category="",category1="",category2="",category3="",category4="",category5="",category6="",category7="";
			int cnt1=0,cnt2=0,cnt3=0,cnt4=0,cnt5=0,cnt6=0,cnt7=0;
 			String sql="",OwnerName="",vehicleregnumber="";
			
			String time = request.getParameter("dattim");
if(time==null)
{
	time="snaptime";
}
			
			if(dateStart==null)
		      { 
		if(time.equalsIgnoreCase("Storetime"))
					{
					sql = "select a.unitid,a.camerapos,b.OwnerName,a.vehicleregnumber,a.vehiclecode,count(*) as Totalimg,sum(if(camerapos='Cam1',1,0)) as Cam1,sum(if(camerapos='Cam2',1,0)) as cam2, sum(if(camerapos='Cam3',1,0)) as cam3, sum(if(camerapos='Cam4',1,0)) as cam4 from smartgrid.t_LocalStorage a left outer join db_gps.t_vehicledetails b on (a.vehiclecode=b.vehiclecode) where jpgfiledatetime between '"+date11+"' and '"+date22+"' and b.Status='-' and b.vehiclecode in "+vehlist+" group by unitid ORDER BY unitid; ";
					}
					else
					{
						sql = "select a.unitid,a.camerapos,b.OwnerName,a.vehicleregnumber,a.vehiclecode,count(*) as Totalimg,sum(if(camerapos='Cam1',1,0)) as Cam1,sum(if(camerapos='Cam2',1,0)) as cam2, sum(if(camerapos='Cam3',1,0)) as cam3, sum(if(camerapos='Cam4',1,0)) as cam4 from smartgrid.t_LocalStorage a left outer join db_gps.t_vehicledetails b on (a.vehiclecode=b.vehiclecode) where snapdatetime between '"+date11+"' and '"+date22+"'and b.Status='-' and b.vehiclecode in "+vehlist+" group by unitid ORDER BY unitid; ";
					}
		    	   
		    	  }

		else
		    	  {
		       	   
		 if(time.equalsIgnoreCase("Storetime"))
					{
					sql = "select a.unitid,a.camerapos,b.OwnerName,a.vehicleregnumber,a.vehiclecode,count(*) as Totalimg,sum(if(camerapos='Cam1',1,0)) as Cam1,sum(if(camerapos='Cam2',1,0)) as cam2, sum(if(camerapos='Cam3',1,0)) as cam3, sum(if(camerapos='Cam4',1,0)) as cam4 from smartgrid.t_LocalStorage a left outer join db_gps.t_vehicledetails b on (a.vehiclecode=b.vehiclecode) where jpgfiledatetime between '"+date1+"' and '"+date2+"'and b.Status='-' and b.vehiclecode in "+vehlist+" group by unitid ORDER BY unitid; ";
					}
					else
					{
						sql = "select a.unitid,a.camerapos,b.OwnerName,a.vehicleregnumber,a.vehiclecode,count(*) as Totalimg,sum(if(camerapos='Cam1',1,0)) as Cam1,sum(if(camerapos='Cam2',1,0)) as cam2, sum(if(camerapos='Cam3',1,0)) as cam3, sum(if(camerapos='Cam4',1,0)) as cam4 from smartgrid.t_LocalStorage a left outer join db_gps.t_vehicledetails b on (a.vehiclecode=b.vehiclecode) where snapdatetime between '"+date1+"' and '"+date2+"' and b.Status='-' and b.vehiclecode in "+vehlist+" group by unitid ORDER BY unitid; ";
					}


		    		  }
			System.out.println("Sql :- "+sql);
			ResultSet rs=st.executeQuery(sql);
 			while(rs.next())
 			{
 				unitid=rs.getString("unitid");
 				camerapos=rs.getString("camerapos");
 				OwnerName=rs.getString("OwnerName");
			    vehcode=rs.getString("vehiclecode");
			    System.out.println("vehcode is------>> :- "+ vehcode);
				
 				if(OwnerName==null)
 				{
 					OwnerName="-";
 				}
 				vehicleregnumber=rs.getString("vehicleregnumber");
 				if(vehicleregnumber==null)
 				{
 					vehicleregnumber="-";
 				}

                     	cnt1=rs.getInt("Cam1");
						cnt2=rs.getInt("Cam2");
						cnt3=rs.getInt("Cam3");
						cnt4=rs.getInt("Cam4");
						cnt5=rs.getInt("Totalimg");
				
 				%> 
 				
               <tr>
				
				<td style="font-size: 14px; face: san-serif; color: black"
							align="right"><%= ++count %></td>
				<td  style="font-size: 14px; face: san-serif; color: black"
							align="right"><%= unitid %></td>
				<td  style="font-size: 14px; face: san-serif; color: black"
							align="right"><%= OwnerName %></td>
				<td  style="font-size: 14px; face: san-serif; color: black"
							align="right"><%= vehicleregnumber %></td>
				
				<%if(cnt5>0) { %>
				   <%if(dateStart==null)
			         				{%>
			          
			     
			    	 <td style="font-size: 14px; face: san-serif; color: black"
							align="right"><a href="cameraimagereportdetail1.jsp?data=<%=date11+time1%>&data1=<%=date22+time2%>&cat='cam1'&vehreg=<%=vehcode%>&time8=<%=time%>" target="_blank"><%= cnt5%></a></td>
			          		   
			    	  <%}else{ 	%>
			    	   
			    	 
			    	   <td style="font-size: 14px; face: san-serif; color: black"
							align="right"><a href="cameraimagereportdetail1.jsp?data=<%=date1+time1%>&data1=<%=date2+time2%>&cat='cam1'&vehreg=<%=vehcode%>&time8=<%=time%>" target="_blank"><%= cnt5%></a></td>
			    	     
			       	   
			    		  <%} %>
				
				
				<% }else{ %>
				 <td style="font-size: 14px; face: san-serif; color: black"
							align="right"><font color="blue"><%= cnt5%> </font></td>
				
				
				<% }%>
				
				<td style="font-size: 14px; face: san-serif; color: black"
							align="right"><%= cnt1%></a></td>
				 
				<td style="font-size: 14px; face: san-serif; color: black"
							align="right"><%= cnt2%></a></td>
				<td style="font-size: 14px; face: san-serif; color: black"
							align="right"><%= cnt3%></a></td>
				<td style="font-size: 14px; face: san-serif; color: black"
							align="right"><%= cnt4%></a></td>
				
 		<% 	}%> 
			</tr>
	
</tbody>
	
	</table>
	<%@ include file="footer.jsp" %> 
	 </div>
	
	

	 
</body>
</html>


	


	

   

