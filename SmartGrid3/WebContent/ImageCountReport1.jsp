<%-- <jsp:useBean id="fleetview" class="com.fleetview.beans.classes" scope="page"> --%>
<%-- <%@page import="java.util.Date"%> --%>
<%@ include file="headernew.jsp"%> 
 <%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@page import="java.text.DecimalFormat"%>
<%-- <%@ include file="Conn.jsp"%>
   <%@page import="java.util.*,java.sql.*" %> --%>
<%-- <%@ include file="headernew.jsp"%>  --%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>SmartGrid</title>
    </head>
    <!-- <link href="themes/4/js-image-slider.css" rel="stylesheet" type="text/css" />
    <script src="themes/4/js-image-slider.js" type="text/javascript"></script> -->
  
    
<link rel="stylesheet" type="text/css" href="css/cpanel_002_popup.css"> 
<link rel="stylesheet" type="text/css" href="css/cpanel_colors.css">
<!-- <link rel="stylesheet" type="text/css" href="css/form.css" media="all"> -->
  <!-- <link href="css/generic.css" rel="stylesheet" type="text/css" /> -->
    <link type="text/css" rel="stylesheet" href="style.css" />
<script type="text/javascript" language="javascript" src="calendar/prototype-1.js"></script>
<script type="text/javascript" language="javascript" src="calendar/prototype-base-extensions.js"></script>
<script type="text/javascript" language="javascript" src="calendar/prototype-date-extensions.js"></script>
<script type="text/javascript" language="javascript" src="calendar/behaviour.js"></script>
<script type="text/javascript" language="javascript" src="calendar/datepicker.js"></script>
<link rel="stylesheet" href="calendar/datepicker.css">
<script type="text/javascript" language="javascript" src="calendar/behaviors.js"></script>

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



div.absolute1 {
    position: absolute;
    left: 30px;
    width:100%;
    border:0;
}    
</style>
    
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


function datevalidate1()
{
	
	var date1 = document.getElementById("MdateF").value;	
	var date2=document.getElementById("MdateT").value;
	
	var dd11=date1.substring(0,2);
	var mm1=date1.substring(3,6);
    var	mm11=dateformat(mm1);
    var	yy11=date1.substring(7,11);
    var	hr1 = date1.substring(12,14);
    var	min1 = date1.substring(15,17);
	var time1=date1.substring(12,17);
	
 var d21=yy11+"-"+mm11+"-"+dd11+" "+time1;
    
    var dd22=date2.substring(0,2);
	var mm2=date2.substring(3,6);
    var	mm22=dateformat(mm2);
    var	yy22=date2.substring(7,11);
    var	hr2 = date2.substring(12,14)
    var	min2 = date2.substring(15,17)
    
   	var time2=date2.substring(12,17);
    var d22=yy22+"-"+mm22+"-"+dd22+" "+time2;
    
	
	var date44=new Date(d21);
	var date55=new Date(d22);
	
	if(date44>date55)
		{
		alert("From DateTime should be less than To DateTime");
		return false;
		}


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

<script type="text/javascript">
												
</script>



<%! Connection conn = null;
	Statement st = null;
	Statement st1 = null;
	Statement st2 = null;
	Statement st3 = null;
	Statement st4 = null;
	Statement st5= null;
	Statement st6= null;
	Statement st7= null;
	Statement st8=null;
	String date1 = "";
	String date2 = "";
	String time1 = "";
	String time2 = "";
	
	String vehno="";
%>
<%!
String from="",to="";%>
<%
//String statusname="";
	String  default_date_1 = new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new Date());
	String  hh=new SimpleDateFormat("HH").format(new Date());
	String vehlist = session.getAttribute("vehlist").toString();
	
	System.out.println("Session Veh List :- "+vehlist);
	
	int hh1=Integer.parseInt(hh);
	int hh2= Integer.parseInt(hh)-2;
	  DecimalFormat formatter = new DecimalFormat("00");
	
	String default_date_3 = new SimpleDateFormat("dd-MMM-yyyy").format(new Date());
	
	
	String  default_date_5 = new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new Date());
	String  mm=new SimpleDateFormat("mm").format(new Date());
	
	int mm1=Integer.parseInt(mm);
	int mm2=Integer.parseInt(mm);
	
	
	
	
	default_date_3=default_date_3+" "+formatter.format(hh2)+":"+formatter.format(mm2);
	
	
	String defaultDate2 = new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new Date());
	System.out.println("The default date is ==>"+default_date_3);
	
	System.out.println("The default_date_1  is ==>"+default_date_1);
	
	
	
	
	
	date1=new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(default_date_3)); 
	
	date2= new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(default_date_1));
	
	
	
%>	

<%
String company = "";
try{
	
	String frompage = request.getParameter("frompage");
	company = session.getAttribute("company").toString();
	//System.out.println("The vehicle list>>>>"+vehlist);
	
	/* String Vehiclecode = session.getAttribute("VehicleCode").toString();
				System.out.println("Session Veh Code :- "+Vehiclecode); */

	if(frompage!=null && frompage.equalsIgnoreCase("OS"))
	{
		String thedate = request.getParameter("data");
		String thedate1 = request.getParameter("data1");
		date1 = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(thedate));
		from=date1;
		time1 = new SimpleDateFormat("HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(thedate));
		date2 = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(thedate1));
		to=date2;
		time2 = new SimpleDateFormat("HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(thedate1));
	}
	else
	{
	 date1 = request.getParameter("data");
	 from=date1;
	 System.out.println("date1 "+date1);
	 time1 =":00";
	 date2 = request.getParameter("data1");
	 to=date2;
	 System.out.println("date2 "+date2);
	 time2 = ":00";
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
	 st8=conn.createStatement();

	 System.out.println("  Date1 ==>"+date1+ "Date2 ==>"+date2);

}catch(Exception e){
	System.out.println("Exception "+e);
}
%>
<body >
<%-- <%@ include file="headernew.jsp"%> --%>
<br>
<div class="div1" align="center" ><h2 style= "font:normal 16px Arial,Helvtica,sans-serif;color: white"><b>ViewerShip Report</b></h2>
</div>
<br>
<div align="center">
<form id="camera_jpg_report" name="camera_jpg_report" action="" method="post" onsubmit="return datevalidate1(); ">
<table  style="width: 70%;">
<!-- <div class="div1" ><h2 style= "font:normal 16px Arial,Helvtica,sans-serif;color: black"><b>ViewerShip Report</b></h2>
</div> -->
	<tr>

		<td>
			 <div align="center"><font color="black" size="2" face="Arial"> <font color="white"><b>From:</b></font>&nbsp;&nbsp;
			 <input type="text" id="MdateF" name="data"  value="<%if(date1==null){ %><%=default_date_3%><%}else{%><%=date1%><%}%>"  class="datetimepicker" style="width: 135px;"    readonly/></font></div>
		</td>
<!-- 		<td style="width: 100px"><b>&nbsp;&nbsp;To: </b></td> -->
			  <td>
			 <div align="left"><font color="black" size="2" face="Arial"><font color="white"> <b>To:</b></font>&nbsp;&nbsp;
			 <input type="text" id="MdateT" name="data1"  value="<%if(date2==null){ %><%=defaultDate2%><%}else{%><%=date2%><%}%>"  class="datetimepicker" style="width: 135px;"    readonly/></font></div>
		</td>

	<td>		
			<input type="submit" name="Submit" value="Submit" style="border-style: outset; border-color: black; vertical-align: "  class="formElement">
		</td>
		</tr>
		</table>
		
	<%
		 String  exportFileName="camera_summary_report.xls";
		%>
		<%

 	
		
 	if(date1!=null || date2!=null){
		//System.out.println("in else");
		
		date1 = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(date1));
		date2 = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(date2));
		time1=":00";
		time2=":00";
	}
 	else
 	{

 		date1=new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(default_date_3)); 
 		date2= new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(default_date_1)); 
	
 	}
%>	
		</form>
		</div>
		
		


<br><br>
<div style="width:90%;"  id="table1" class="absolute1" >
<!-- <div style="width:100%;" align="left" id="table1"> -->
<table border="0" class="sortable"  align="centre" >
	

	
	<tr>
		<td>
			<table class="sortable" style='overflow-y:scroll;' >
			<tr>
			<th width ="5%">Sr No</th>
		    <th width ="30%">Customer</th>
			<th width ="15%">Location</th>
			<th width ="10%">Total Images</th>
			<th width ="10%">Cam1</th>
			<th width ="10%">Cam2</th>
            <th width ="10%">Cam3</th>
             <th width ="10%">Cam4</th> 
			
			</tr>
			<%
			int count=0;
			String vehno="",vehcode="";
			String ownername="";
			String unitid="",camerapos="",type2="",type3="",type4="",type5="",type6="",location="";
			String category="",category1="",category2="",category3="",category4="",category5="",category6="",category7="";
			int cnt1=0,cnt2=0,cnt3=0,cnt4=0,cnt5=0,cnt6=0,cnt7=0;
		
		 
				
				String slotdate="select Concat(date,' ',time) as Datetime,duration from smartgrid.mediamaster where Concat(date,' ',time) between '"+date1+"'  and  '"+date2 +"'  and company='"+company+"' order by  Concat(date,' ',time);";
				String datetime="";
				String datetime1="";
				int duration=0;
				ResultSet slotdate1=st8.executeQuery(slotdate);

				
				String sql="";
				String sql1="";
				String typevalue=session.getAttribute("typevalue").toString();
			
				String TypeofUser=session.getAttribute("TypeofUser").toString();
			
				if(TypeofUser.equalsIgnoreCase("Transporter"))
				{
				 //sql="select a.vehiclecode,a.vehicleregnumber,(select count(*) from smartgrid.t_jpgsnapsmartgrid b where a.vehiclecode=b.vehiclecode and camerapos='Cam1' and snapdatetime between '"+date1+"' and '"+date2+"') as Cam1,(select count(*) from smartgrid.t_jpgsnapsmartgrid b where a.vehiclecode=b.vehiclecode and camerapos='Cam2' and snapdatetime between '"+date1+"' and '"+date2+"') as Cam2,(select count(*) from smartgrid.t_jpgsnapsmartgrid b where a.vehiclecode=b.vehiclecode and camerapos='Cam3' and snapdatetime between '"+date1+"' and '"+date2+"') as Cam3,(select count(*) from smartgrid.t_jpgsnapsmartgrid b where a.vehiclecode=b.vehiclecode and camerapos='Cam4' and snapdatetime between '"+date1+"' and '"+date2+"') as Cam4,(select count(*) from smartgrid.t_jpgsnapsmartgrid b where a.vehiclecode=b.vehiclecode and camerapos in ('Cam1','Cam2','Cam3','Cam4') and snapdatetime between '"+date1+"' and '"+date2+"') as Cam5 from db_gps.t_vehicledetails a where a.ownername like '%"+company+"%' and Status='-'  group by vehiclecode order by vehicleregnumber";
				 
				 sql="select a.unitid,a.camerapos,b.OwnerName,b.vehiclecode,a.vehicleregnumber,count(*) as Totalimg,sum(if(camerapos='Cam1',1,0)) as Cam1,sum(if(camerapos='Cam2',1,0)) as cam2, sum(if(camerapos='Cam3',1,0)) as cam3, sum(if(camerapos='Cam4',1,0)) as cam4,sum(if(camerapos in ('Cam1','Cam2','Cam3','Cam4'),1,0)) as cam5 from smartgrid.t_jpgsnapsmartgrid a left outer join db_gps.t_vehicledetails b on (a.vehiclecode=b.vehiclecode) where snapdatetime between '"+date1+"' and '"+date2+"'  and b.Status='-' and b.vehiclecode in "+vehlist+" group by VehicleCode ORDER BY VehicleCode";
				}
				
				else
				{
				sql="select a.unitid,a.camerapos,b.OwnerName as OwnerName ,b.vehiclecode as vehiclecode,a.vehicleregnumber,count(*) as Totalimg,sum(if(camerapos='Cam1',1,0)) as Cam1,sum(if(camerapos='Cam2',1,0)) as cam2, sum(if(camerapos='Cam3',1,0)) as cam3, sum(if(camerapos='Cam4',1,0)) as cam4,sum(if(camerapos in ('Cam1','Cam2','Cam3','Cam4'),1,0)) as cam5 from smartgrid.t_jpgsnapsmartgrid a left outer join db_gps.t_vehicledetails b on (a.vehiclecode=b.vehiclecode) where snapdatetime between '"+date1+"' and '"+date2+"'   and b.vehiclecode in "+vehlist+" group by VehicleCode ORDER BY VehicleCode";
				}
				
				//String sql="select a.vehiclecode,a.vehicleregnumber,(select count(*) from smartgrid.t_jpgsnapsmartgrid b where a.vehiclecode=b.vehiclecode and camerapos='Cam1' and snapdatetime in ('"+datetime1+"') ) as Cam1,(select count(*) from smartgrid.t_jpgsnapsmartgrid b where a.vehiclecode=b.vehiclecode and camerapos='Cam2' and snapdatetime in ('"+datetime1+"')) as Cam2,(select count(*) from smartgrid.t_jpgsnapsmartgrid b where a.vehiclecode=b.vehiclecode and camerapos='Cam3' and snapdatetime in ('"+datetime1+"')) as Cam3,(select count(*) from smartgrid.t_jpgsnapsmartgrid b where a.vehiclecode=b.vehiclecode and camerapos='Cam4' and snapdatetime in ('"+datetime1+"')) as Cam4,(select count(*) from smartgrid.t_jpgsnapsmartgrid b where a.vehiclecode=b.vehiclecode and camerapos in ('Cam1','Cam2','Cam3','Cam4') and snapdatetime in ('"+datetime1+"')) as Cam5 from db_gps.t_vehicledetails a where a.ownername like '%"+company+"%' and Status='-' group by vehiclecode ";
				System.out.println("SQL+++"+sql);
				ResultSet rs=st1.executeQuery(sql);
				while(rs.next())
				{
					
				 System.out.println("Viewership Report 1");	
					    vehcode=rs.getString("vehiclecode");
					    unitid=rs.getString("vehicleregnumber");
						location=rs.getString("vehicleregnumber");
						ownername=rs.getString("OwnerName");
						cnt1=rs.getInt("cam1");
						cnt2=rs.getInt("cam2");
						cnt3=rs.getInt("cam3");
						cnt4=rs.getInt("cam4");
						cnt5=rs.getInt("cam5");
				

				
				
				
				
				
				
				%>
               <tr>
				
				<td  width ="5%"><div style="text-align:right;font:normal 13px Arial,Helvtica,sans-serif;  "><%= ++count %></div></td>
				<td style="text-align: right;font:normal 13px Arial,Helvtica,sans-serif;"><div align="left"><%=ownername%>  </div></td>
				<td ><div style="text-align: left;font:normal 13px Arial,Helvtica,sans-serif; "><%= location %></div></td>
				<%if(cnt5>0) { %>
				
				<td style="text-align: right;font:normal 13px Arial,Helvtica,sans-serif;"><div align="right"><a href="imagefour1.jsp?data=<%=date1+time1 %>&data1=<%= date2+time2%>&vehreg=<%= unitid%>&vehcode=<%=vehcode%>&cat=cam1,cam2,cam3,cam4" target="_blank"> <%= cnt5%> </a> </div></td>
				<% } else { %>
				 <td style="text-align: right;font:normal 13px Arial,Helvtica,sans-serif;"><div align="right"> <font color="blue"><%= cnt5%> </font></div></td>
				<% }%>
				
				
				
				
		
				<%-- <td style="text-align: right;font:normal 13px Arial,Helvtica,sans-serif;"><div align="right"><%= cnt5%></a></div></td> --%>
				<td style="text-align: right;font:normal 13px Arial,Helvtica,sans-serif;"><div align="right"><%= cnt1%></a></div></td>
				 
				<td style="text-align: right;font:normal 13px Arial,Helvtica,sans-serif;"><div align="right"><%= cnt2%></a></div></td>
				<%-- <td style="text-align: right;font:normal 13px Arial,Helvtica,sans-serif;"><div align="right"><a href="CameraSlideReport.jsp?data=<%=date1+time1 %>&data1=<%= date2+time2%>&Vehicle1=<%= vehno%>&cat=<%=category1 %>&type=<%=type1 %> " target="_blank"><%= cnt2%></a></div></td> --%>
				<td style="text-align: right;font:normal 13px Arial,Helvtica,sans-serif;"><div align="right"><%= cnt3%></a></div></td>
				<td style="text-align: right;font:normal 13px Arial,Helvtica,sans-serif;"><div align="right"><%= cnt4%></a></div></td>			
				
				<%-- <td style="text-align: right;font:normal 13px Arial,Helvtica,sans-serif;"><div align="right"><%= cnt5%></a></div></td> --%>
				
				
				<%
								
				
		 	}
			
                                 System.out.println("Viewership Report 2");    

				
                                 String TypeofUser1 = session.getAttribute("TypeofUser").toString();
                      	 		String TypeofValue=session.getAttribute("typevalue").toString();
                      	 		String sessionveh="";
                      	 		  if(TypeofUser1.equals("Transporter"))
                      	 		  {
                      	 			sessionveh="select distinct(vehiclecode) as vehiclecode from db_gps.t_vehicledetails where status='-' and ownername='"+TypeofValue+"'";        
                      	 		  }
                      	 		  else
                      	 		  {
                      	 			  sessionveh="select distinct(VehCode) as vehiclecode  from db_gps.t_group where GPName='"+TypeofValue+"' and Active='Yes' ";
                      	 		  }
                      	 		  
                      	 		  ResultSet rs_active = st1.executeQuery(sessionveh);
                      	 		  
                //      	 		  System.out.println("Veh List Query :- "+sessionveh);
                      	 		  String nonvehid="",nonvehid1="",nonvehid2="";
                      	 		  String vehid123="";
                      	 		  
                      	 		  while(rs_active.next())
                      	 		  {
                      	 			nonvehid1="";
                      	 			 vehid123=rs_active.getString("vehiclecode");
                      	 			 nonvehid="select vehiclecode from smartgrid.t_jpgsnapsmartgrid where vehiclecode='"+vehid123+"' and snapdatetime between '"+date1+"' and '"+date2+"'";
                      	 			 ResultSet rsnonvehid=st7.executeQuery(nonvehid);
                  //    	 			System.out.println("Non Veh Id Query :- "+nonvehid);
                      	 			 
                      	 			 if(!rsnonvehid.next()){
                      	 				nonvehid1=vehid123;
                      	 				nonvehid2=nonvehid2+","+nonvehid1;
                      	 			 }
                      	 				 
                      	 		  }
                      	 		
                      			// System.out.println("Non Veh Id :- "+nonvehid2);
                      			 String nonvehid3=nonvehid2.substring(1);
                      			 
                      			//System.out.println("Non Veh Id :- "+nonvehid3);
                      			
                      			String vehmaster="select * from db_gps.t_vehicledetails where vehiclecode in ("+nonvehid3+")";
                      			ResultSet rsvehmaster=st8.executeQuery(vehmaster);
                      			String unitid1="";
                      			String Owner="";
                      			String  vehicleregnumber1="";
                      			int cnt11=0,cnt21=0,cnt31=0,cnt41=0,cnt51=0;
                      			while(rsvehmaster.next())
                      			{
                      				unitid1=rsvehmaster.getString("UnitID");
                      				Owner=rsvehmaster.getString("OwnerName");
                      				vehicleregnumber1=rsvehmaster.getString("VehicleRegNumber");
                      			%> 
                                 
                     				<tr>
                     				<td  width ="5%"><div style="text-align:right;font:normal 13px Arial,Helvtica,sans-serif;  "><%= ++count %></div></td>
                     				<%-- <td ><div style="text-align: right;font:normal 13px Arial,Helvtica,sans-serif; "><%= unitid1 %></div></td> --%>
                     				<td ><div style="text-align: left;font:normal 13px Arial,Helvtica,sans-serif; "><%= Owner %></div></td>
                     				<td ><div style="text-align: left;font:normal 13px Arial,Helvtica,sans-serif; "><%= vehicleregnumber1 %></div></td>
                     				<%-- <td style="text-align: right;font:normal 13px Arial,Helvtica,sans-serif;"><div align="right"><a href="imagefour.jsp?data=<%=date1+time1 %>&data1=<%= date2+time2%>&unitid=<%= unitid%>&camerapos=<%=camerapos %> " target="_blank"><%= cnt5%></a></div></td> --%>
                     				<td style="text-align: right;font:normal 13px Arial,Helvtica,sans-serif;"><div align="right"><%= cnt51%></a></div></td>
                     				<%-- <td style="text-align: right;font:normal 13px Arial,Helvtica,sans-serif;"><div align="right"><%= cnt5%></a></div></td> --%>
                     				<td style="text-align: right;font:normal 13px Arial,Helvtica,sans-serif;"><div align="right"><%= cnt11%></a></div></td>
                     				 
                     				<td style="text-align: right;font:normal 13px Arial,Helvtica,sans-serif;"><div align="right"><%= cnt21%></a></div></td>
                     				<%-- <td style="text-align: right;font:normal 13px Arial,Helvtica,sans-serif;"><div align="right"><a href="CameraSlideReport.jsp?data=<%=date1+time1 %>&data1=<%= date2+time2%>&Vehicle1=<%= vehno%>&cat=<%=category1 %>&type=<%=type1 %> " target="_blank"><%= cnt2%></a></div></td> --%>
                     				<td style="text-align: right;font:normal 13px Arial,Helvtica,sans-serif;"><div align="right"><%= cnt31%></a></div></td>
                     				<td style="text-align: right;font:normal 13px Arial,Helvtica,sans-serif;"><div align="right"><%= cnt41%></a></div></td>
                     				
                     		<% 	
                      			}
                      		%> 
	</table>
	</table>

</div>
</html>

 <%@ include file="footer.jsp"%>
 



	

   
