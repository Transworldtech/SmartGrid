<%-- <jsp:useBean id="fleetview" class="com.fleetview.beans.classes" scope="page"> --%>
<%-- <%@page import="java.util.Date"%> --%>
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
    <title>Camera Images Summary Report</title>
    <!-- <link href="themes/4/js-image-slider.css" rel="stylesheet" type="text/css" />
    <script src="themes/4/js-image-slider.js" type="text/javascript"></script> -->
  
    
<link rel="stylesheet" type="text/css" href="css/cpanel_002_popup.css"> 
<link rel="stylesheet" type="text/css" href="css/cpanel_colors.css">
<link rel="stylesheet" type="text/css" href="css/form.css" media="all">
  <link href="css/generic.css" rel="stylesheet" type="text/css" />
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

</head>

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
//String statusname="";
	String  default_date_1 = new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new Date());
	String  hh=new SimpleDateFormat("HH").format(new Date());
	
	int hh1=Integer.parseInt(hh);
	int hh2=hh1-2;
	
	String default_date_3 = new SimpleDateFormat("dd-MMM-yyyy ").format(new Date());
	
	
	String  default_date_5 = new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new Date());
	String  mm=new SimpleDateFormat("mm").format(new Date());
	
	int mm1=Integer.parseInt(mm);
	int mm2=mm1;
	
	
	
	
	default_date_3=default_date_3+""+hh2+":"+mm2;
	
	
	String defaultDate2 = new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new Date());
	System.out.println("The default date is ==>"+default_date_3);
	
	System.out.println("The default_date_1  is ==>"+default_date_1);
	
	
	
	
	
	date1=new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(default_date_3)); 
	
	date2= new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(default_date_1));
	
	
	
%>	

<%
String vehlist = "";
try{
	
	String frompage = request.getParameter("frompage");
	vehlist = session.getAttribute("vehlist").toString();
	System.out.println("The vehicle list>>>>"+vehlist);

	if(frompage!=null && frompage.equalsIgnoreCase("OS"))
	{
		String thedate = request.getParameter("data");
		String thedate1 = request.getParameter("data1"	);
	
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
	 
	 //statusname=request.getParameter("status");
	 //System.out.println("statusname "+statusname);
// 	 if(statusname==null)
// 	 {
// 	 	statusname="All";
// 	 }
// 	 System.out.println("statusname "+statusname);
	 System.out.println("  Date1 ==>"+date1+ "Date2 ==>"+date2);

}catch(Exception e){
	System.out.println("Exception "+e);
}
%>
<body>
<%-- <%@ include file="headernew.jsp"%> --%>

<div class="div1" ><h2 style= "font:normal 16px Arial,Helvtica,sans-serif;"><b><font color="white">Smart Grid Summary Report</font></b></h2>
</div>

<div align="center">
<form id="camera_jpg_report" name="camera_jpg_report" action="" method="post" onsubmit="return datevalidate(); ">
<table  style="width: 70%;">

	<tr>
<!-- 		<td style="width: 100px"><b>&nbsp;&nbsp;Range: </b></td> -->
<!-- 		<td> -->
<!-- 			 <div align="left"><font color="black" size="2" face="Arial"> <b>Range:</b>&nbsp;&nbsp; -->
<!-- 			 </font></div> -->
<!-- 			</td> -->
		<td>
			 <div align="center"><font color="black" size="2" face="Arial"><font color="white"><b>From:</b></font>&nbsp;&nbsp;
			 <input type="text" id="MdateF" name="data"  value="<%if(date1==null){ %><%=default_date_3%><%}else{%><%=date1%><%}%>"  class="datetimepicker" style="width: 130px;"    readonly/></font></div>
		</td>
<!-- 		<td style="width: 100px"><b>&nbsp;&nbsp;To: </b></td> -->
			  <td>
			 <div align="left"><font color="black" size="2" face="Arial"><font color="white"><b>To:</b></font>&nbsp;&nbsp;
			 <input type="text" id="MdateT" name="data1"  value="<%if(date2==null){ %><%=defaultDate2%><%}else{%><%=date2%><%}%>"  class="datetimepicker" style="width: 130px;"    readonly/></font></div>
		</td>
		<%String tim=request.getParameter("dattim");
		System.out.println("tim"+tim);
		%>
		<td>
		<div align="left"><font color="black" size="2" face="Arial"><font color="white"> <b>Report By:</b></font>&nbsp;&nbsp;
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
        
        
       
		
		
		</select></font>
		</div>
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

 	
		
 	if(date1!=null || date2!=null)
 	{
		//System.out.println("in else");
		
		date1 = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(date1));
		date2 = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(date2));
		time1=":00";
		time2=":59";
	}
 	else
 	{

 		date1=new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(default_date_3)); 
 		date2= new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(default_date_1)); 
	
 	}
%>	
		
<!-- <div style="width:100%;" align="left" id="table1" class="absolute" >	 -->

<br><br><br>
<div style="width:90%;"  id="table1" class="absolute1" >
<!-- <div style="width:100%;" align="left" id="table1"> -->
<table border="0" class="sortable"  align="centre" >
	
	<%-- <tr>
		<td align="right">	
							<input type="hidden" id="tableHTML" name="tableHTML" value="" /> 
			 				<input type="hidden" id="fileName" name="fileName" value="<%= exportFileName%>" />  
							<div style="text-align: right"><h3 align="center">Smart Grid Summary Report From <%if(from==null){ %><%=default_date_3%><%}else{%><%=from%><%}%> To <%if(to==null){ %><%=default_date_1%><%}else{%><%=to%><%}%>  </h3> 
                          <a href="#"	style="font-weight: bold; color: black;" onclick="gotoPrint('table1');"> 
			<img src="images/print.jpg" width="15px" height="15px" style="border-style: none"></img> </a> 
                          <a href="#" style="font-weight: bold; color: black; " onclick="gotoExcel('table1','tableHTML');">
                           <img src="images/excel.jpg" width="15px" height="15px" style="border-style: none"></img></a>&nbsp;<%= new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new Date()) %></div>
                           
		</td>
	</tr> --%>
	<tr>
		<td>
			<table class="sortable"  >
			<tr>
			<th width ="5%">Sr No</th>
			<th width ="8%">UnitId</th>
			<th width ="25%">Owner</th>
			<th width ="15%">Vehicle</th>
			<th width ="9%">Total Images</th>
			<th width ="6%">Cam1</th>
			<th width ="6%">Cam2</th>
			<th width ="6%">Cam3</th>
			<th width ="6%">Cam4</th>
			<!-- <th>Cabin Others</th>
			<th>Road Others</th> -->
			
			</tr>
			<%
			int count=0;
			String vehno="",vehcode="";
			String unitid="",camerapos="",type2="",type3="",type4="",type5="",type6="";
			String category="",category1="",category2="",category3="",category4="",category5="",category6="",category7="";
			int cnt1=0,cnt2=0,cnt3=0,cnt4=0,cnt5=0,cnt6=0,cnt7=0;
 			String sql="",OwnerName="",vehicleregnumber="";
			
			String time = request.getParameter("dattim"	);
if(time==null)
{
	time="snaptime";
}

            if(time.equalsIgnoreCase("Storetime"))
			{
			sql = "select a.unitid,a.camerapos,b.OwnerName,a.vehicleregnumber,count(*) as Totalimg,sum(if(camerapos='Cam1',1,0)) as Cam1,sum(if(camerapos='Cam2',1,0)) as cam2, sum(if(camerapos='Cam3',1,0)) as cam3, sum(if(camerapos='Cam4',1,0)) as cam4 from smartgrid.t_jpgsnapsmartgrid a left outer join db_gps.t_vehicledetails b on (a.vehiclecode=b.vehiclecode) where jpgfiledatetime between '"+date1+"' and '"+date2+"' group by unitid ORDER BY unitid; ";
			}
			else
			{
				sql = "select a.unitid,a.camerapos,b.OwnerName,a.vehicleregnumber,a.vehiclecode,count(*) as Totalimg,sum(if(camerapos='Cam1',1,0)) as Cam1,sum(if(camerapos='Cam2',1,0)) as cam2, sum(if(camerapos='Cam3',1,0)) as cam3, sum(if(camerapos='Cam4',1,0)) as cam4 from smartgrid.t_jpgsnapsmartgrid a left outer join db_gps.t_vehicledetails b on (a.vehiclecode=b.vehiclecode) where snapdatetime between '"+date1+"' and '"+date2+"' group by unitid ORDER BY unitid; ";
			}
			System.out.println("Sql :- "+sql);
			ResultSet rs=st.executeQuery(sql);
 			while(rs.next())
 			{
 				unitid=rs.getString("unitid");
 				camerapos=rs.getString("camerapos");
 				OwnerName=rs.getString("OwnerName");
			    vehcode=rs.getString("vehiclecode");

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
				
				<td  width ="5%"><div style="text-align:right;font:normal 13px Arial,Helvtica,sans-serif;  "><%= ++count %></div></td>
				<td ><div style="text-align: right;font:normal 13px Arial,Helvtica,sans-serif; "><%= unitid %></div></td>
				<td ><div style="text-align: left;font:normal 13px Arial,Helvtica,sans-serif; "><%= OwnerName %></div></td>
				<td ><div style="text-align: left;font:normal 13px Arial,Helvtica,sans-serif; "><%= vehicleregnumber %></div></td>
<%-- 				<td style="text-align: right;font:normal 13px Arial,Helvtica,sans-serif;"><div align="right"><a href="imagefour.jsp?data=<%=date1+time1 %>&data1=<%= date2+time2%>&unitid=<%= unitid%>&camerapos=<%=camerapos %> " target="_blank"><%= cnt5%></a></div></td>
 --%>				<%-- <td style="text-align: right;font:normal 13px Arial,Helvtica,sans-serif;"><div align="right"><%= cnt5%></a></div></td> --%>
				
				
				<%if(cnt5>0) { %>
				
				<td style="text-align: right;font:normal 13px Arial,Helvtica,sans-serif;"><div align="right"><a href="imagefour.jsp?data=<%=date1+time1 %>&data1=<%= date2+time2%>&vehreg=<%= vehicleregnumber%>&vehcode=<%=vehcode%>&cat=cam1,cam2,cam3,cam4" target="_blank"> <%= cnt5%> </a> </div></td>
				<% } else { %>
				 <td style="text-align: right;font:normal 13px Arial,Helvtica,sans-serif;"><div align="right"> <font color="blue"><%= cnt5%> </font></div></td>
				<% }%>
				
				<td style="text-align: right;font:normal 13px Arial,Helvtica,sans-serif;"><div align="right"><%= cnt1%></a></div></td>
				 
				<td style="text-align: right;font:normal 13px Arial,Helvtica,sans-serif;"><div align="right"><%= cnt2%></a></div></td>
				<%-- <td style="text-align: right;font:normal 13px Arial,Helvtica,sans-serif;"><div align="right"><a href="CameraSlideReport.jsp?data=<%=date1+time1 %>&data1=<%= date2+time2%>&Vehicle1=<%= vehno%>&cat=<%=category1 %>&type=<%=type1 %> " target="_blank"><%= cnt2%></a></div></td> --%>
				<td style="text-align: right;font:normal 13px Arial,Helvtica,sans-serif;"><div align="right"><%= cnt3%></a></div></td>
				<td style="text-align: right;font:normal 13px Arial,Helvtica,sans-serif;"><div align="right"><%= cnt4%></a></div></td>
				
 		<% 	}%> 
			
	

	</table>
	</td>
	</tr>
	</table>
	<%@ include file="footer.jsp" %>   
	
	</div>
	</form>
	</div>
	
			
	<br></br> 	
	 
</body>
</html>
</div>

<%-- </jsp:useBean> --%>	


	

   

