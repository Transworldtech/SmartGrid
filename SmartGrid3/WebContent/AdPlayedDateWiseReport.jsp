<%@ page language="java" import="java.sql.*" import="java.util.*" import="java.text.*" errorPage=""
    pageEncoding="ISO-8859-1"%>
  <%--   <%@ include file="Conn.jsp"%> --%>
     <%@ include file="headernew.jsp"%>
     
     <%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 --%>
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <style>
    div.absolute {
    position: absolute;
    left: 20px;
    width:100%;
    border:0;
  
    
} 
    </style>
    

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
    left: 130px;
    width:100%;
    border:0;
}

.input {
	padding-left:150px,150px;
	
}    
</style>
    

<head>


   <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>  
   <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>  
   <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script> 
<link rel="stylesheet" href="calendar/datepicker.css">


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Smart Grid Report</title>
</head>
<body>

	 <script type="text/javascript">
       $(function()
    	 {
               $("#startdate").datepicker({ dateFormat: "dd-M-yy" }).val()
               $("#enddate").datepicker({ dateFormat: "dd-M-yy" }).val()
       });

   </script>  

<script type="text/javascript">

function birt()

   {
	
	alert("Birt");
	var advertiser ="AMUL";			//document.getElementById("advertiser").value;
	alert(advertiser);
 	// var Status=document.getElementById("hey").value;


	 
	 var date1= document.getElementById("startdate").value;
	 alert(date1);


	 
	var date2= document.getElementById("enddate").value;
	alert(date2);

	
	

	var date = date1.split("-");
	var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun','Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
	for(var j=0;j<months.length;j++)
	{
	    if(date[1]==months[j])
	    {
	         date[1]=months.indexOf(months[j])+1;
	    }                      
	} 
	if(date[1]<10)
	{
	    date[1]='0'+date[1];
	}                        
	var formattedDate1 = date[2]+'-'+date[1]+'-'+date[0];
	alert(formattedDate1);

	
// 	formattedDate1=formattedDate1+"00:00:00";
	
	var dat = date2.split("-");
	var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun','Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
	for(var j=0;j<months.length;j++){
	    if(dat[1]==months[j]){
	         dat[1]=months.indexOf(months[j])+1;
	     }                      
	} 
	if(dat[1]<10){
	    dat[1]='0'+dat[1];
	}                        
	var formattedDate2 = dat[2]+'-'+dat[1]+'-'+dat[0];
	alert(formattedDate2);

	
// 	formattedDate2=formattedDate2+"23:59:59";

	document.getElementById("myIframe").src="http://twtech.in:8080/birt/frameset?__report=AdvertiserDateWise.rptdesign&Advertiser="+advertiser+"&FromDate="+formattedDate1+"&ToDate="+formattedDate2+"&Date3="+date1+"&Date4="+date2+"&__showtitle=false";
	

	document.getElementById("reportData").style.display="";
	document.getElementById("footer").style.display="none";
	return true;
	
	
  }

<%!
String datex1, datex2, data1, data2;
%>
<%
String ddx = request.getQueryString();

String dt=request.getParameter("startdate");
String  dt1=request.getParameter("enddate");

String dtt="",dtt1="";
	
	if (ddx == null) {
		datex1 = datex2 = new SimpleDateFormat("dd-MMM-yyyy")
				.format(new java.util.Date());
		data1 = data2 = new SimpleDateFormat("yyyy-MM-dd")
				.format(new java.util.Date());
	
		Calendar c = Calendar.getInstance();   // this takes current date
	    c.set(Calendar.DAY_OF_MONTH, 1);
	    System.out.println(" current date "+new SimpleDateFormat("dd-MMM-yyyy").format(c.getTime())); 
	    datex1=new SimpleDateFormat("dd-MMM-yyyy").format(c.getTime());
	
	
	} else {
		
		
		
		 dtt=request.getParameter("startdate");
		 dtt1=request.getParameter("enddate");
		System.out.println(" datex1 "+dtt+" datex2 "+dtt1);

		
		 dt = new SimpleDateFormat("yyyy-MM-dd")
				.format(new SimpleDateFormat("dd-MMM-yyyy")
						.parse(dtt));
		
		
		 dt1 = new SimpleDateFormat("yyyy-MM-dd")
				.format(new SimpleDateFormat("dd-MMM-yyyy")
						.parse(dtt1));
datex1=dt;
datex2=dt1;
dt=dt+" 00:00:00";
dt1=dt1+" 23:59:59";

		System.out.println("dt---"+dt);
		System.out.println("dt1---"+dt1);
		System.out.println("dt11---"+datex1);
		System.out.println("dt2---"+datex2);
		
		 /* datex1 = new SimpleDateFormat("yyyy-MM-dd")
					.format(new SimpleDateFormat("dd-MMM-yyyy")
							.parse(dtt));
			
			
			 datex2 = new SimpleDateFormat("yyyy-MM-dd")
					.format(new SimpleDateFormat("dd-MMM-yyyy")
							.parse(dtt1)); */

			
	}


	

%>

</script>
<%


 String DB_Driver="com.mysql.jdbc.Driver";
String DB_NAME="jdbc:mysql://103.241.181.36:3306/smartgrid";
//String DB_NAME1="jdbc:mysql://103.241.181.36:3306/newblankerp"; 
String DB_USERNAME="erp";
String DB_PASSWORD="1@erp";
 
 
 /* String DB_Driver="com.mysql.jdbc.Driver";
 String DB_NAME="jdbc:mysql://localhost:3306/smartgrid";
 String DB_USERNAME="root";
 String DB_PASSWORD="root";
 */
Connection conn=null;
Class.forName("com.mysql.jdbc.Driver").newInstance();
conn = DriverManager.getConnection(DB_NAME,DB_USERNAME, DB_PASSWORD);
Statement st=conn.createStatement();


%>




<% 
/*
String button=request.getParameter("button1");


System.out.println("buutton value:-"+button);
 
String TypeofUser=session.getAttribute("TypeofUser").toString();



String typevalue=session.getAttribute("typevalue").toString();



String company = session.getAttribute("company").toString();



String query="";

if(button == "null") 
{
	
	

if(TypeofUser.equalsIgnoreCase("Transporter"))
{
	 query="select b.advertiser,b.Date,count(distinct(b.srno)) as Scheduled, count(distinct(a.srno)) as played  from smartgrid.mediamaster b, smartgrid.t_AdPlayed a where b.Date >= '2015-12-01' and b.Date<='2017-12-31'  and  DATE(schDate) >= '2015-12-01' and DATE(schDate) <='2017-12-31' and b.advertiser=a.advertiser and b.advertiser = 'Amul' group by b.Date";
}
else
{
	query="select b.VehRegno as Vehicle, deviceid,Date ,SUM(duration) as Duration,count(*) as count from smartgrid.mediamaster a,db_gps.t_group b,db_gps.t_vehicledetails c where Date BETWEEN  '"+dt+"' AND '"+dt1+"' and a.vehiclecode = b.VehCode and a.vehiclecode = c.VehicleCode and c.status=-'' and b.GPName='"+typevalue+"'  group by  b.VehCode,Date ;";
}


System.out.println("query:-"+query);

}
else
{
	if(TypeofUser.equalsIgnoreCase("Transporter"))
	{
		 query="select b.vehicleregnumber as Vehicle, deviceid,Date ,SUM(duration) as Duration,count(*) as count from smartgrid.mediamaster a, db_gps.t_vehicledetails b where Date BETWEEN  'dt' AND 'dt1' and a.vehiclecode = b.VehicleCode and b.ownername='"+typevalue+"'  and b.status = '-' group by b.vehiclecode,Date ;";
	}
	else
	{
		query="select b.VehRegno as Vehicle, deviceid,Date ,SUM(duration) as Duration,count(*) as count from smartgrid.mediamaster a,db_gps.t_group b,db_gps.t_vehicledetails c where Date BETWEEN  'dt' AND 'dt1' and a.vehiclecode = b.VehCode and a.vehiclecode = c.VehicleCode and c.status=-'' and b.GPName='"+typevalue+"'  group by  b.VehCode,Date ;";
	}
}

System.out.println("query..."+query);
 */
 %>






<%-- <input type="hidden" name="hey" id="hey"  value="<%=query%>"> --%>

<!-- <form> -->



<div align="center">
</div>
 <div align="center"   ><font size="3">
				<br>
					<b> Ad Played DateWise Report</b>
				</font>
			<br><br>
			

			 		
			 <table  style="width: 70%;">

<%-- 	<tr>


		
	<td> From: <input type="text" id="startdate" value=<%=dtt%>  style="paddin: outset; border-color: black; size:13px;"/>
	
	<script type="text/javascript">
					  Calendar.setup(
					    {
					      inputField  : "startdate",         // ID of the input field
					      ifFormat    : "%d-%b-%Y",    // the date format
					      button      : "startdate"       // ID of the button
					    }
					  );
				</script>
	</td>  
	 
	 
      <td> To: <input type="text" id="enddate" value=<%=dtt1%>  size="13px"/>
      <script type="text/javascript">
					  Calendar.setup(
					    {
					      inputField  : "enddate",         // ID of the input field
					      ifFormat    : "%d-%b-%Y",    // the date format
					      button      : "enddate"       // ID of the button
					    }
					  );
				</script>
      
      </td>

	<td>		
			<input type="submit" name="button1" id="button1" value="Submit"  style="border-style: outset; border-color: black; size:13px; "    onClick="return birt()"></td>
		</tr> --%>
		</table>
			 		</div>
			 		
			 		
			 		
		
			 		<%
			 		String advertiser=request.getParameter("advertiser");		
			 		//request.getParameter("advertiser");
			 			System.out.println("advertiser : "+advertiser);


			 		%>
		 		
 <font size="2">
 <div align="right"> 
<td align="right" bgcolor="#FFFFFF"  ><%=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new java.util.Date())%></td></div></font>

	<%-- <iframe id="myframe" style="width: 99.5%; height: 500px;" src="http://twtech.in:8080/ERPTestBirt/frameset?__report=AMC_Report.rptdesign&__showtitle=false&__pageFooterFloatFlag=False&<%=queryString%>&tablename=<%=tablenamenew%>"></iframe> --%>

<div  class="absolute"  align ="right" style="width: 97%; height: 500px;">
	
	<iframe id="myIframe" style="width: 98%; height: 500px;" src="http://twtech.in:8080/birt/frameset?__report=AdvertiserDateWise.rptdesign&Advertiser=<%=advertiser%>&FromDate=<%=dt%>&ToDate=<%=dt1%>&Date3=<%=dtt %>&Date4=<%=dtt1 %>&__showtitle=false"></iframe>
	<%
	System.out.println("dt : "+dt);
	System.out.println("dt 1: "+dt1);
	System.out.println("datex1 : "+datex1);
	System.out.println("datex2 : "+datex2);
	
	%>
	<%-- <iframe id="myIframe" style="width: 98%; height: 500px;" src="http://twtech.in:8080/ERPTestBirt/frameset?__report=Advertiser.rptdesign&advertiser=<%=advertiser%>&date1=<%=dt%>&date2=<%=dt1%>&date3=<%=datex1 %>&date4=<%=datex2 %>&__showtitle=false"></iframe> --%>
	</div>
	

	<!-- </form> -->

</body>
</html>