<%-- <jsp:useBean id="fleetview" class="com.fleetview.beans.classes" scope="page"> --%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.DecimalFormat"%>
<%-- <%@ include file="headernew.jsp"%>
 --%>
  <%@ include file="Conn.jsp"%>
   <%@ page import="java.sql.*" %>
   <%@ page import="java.text.SimpleDateFormat" %> 
<!DOCTYPE html>
<html>
<head>
    <title>SmartGrid</title>
    </head>
   <!--  <link rel="stylesheet" href="https://formden.com/static/cdn/bootstrap-iso.css"> -->
   <!--  <link href="themes/4/js-image-slider.css" rel="stylesheet" type="text/css" /> -->
 <!--    <script src="themes/4/js-image-slider.js" type="text/javascript"></script> -->
 <!--    <link href="css/generic.css" rel="stylesheet" type="text/css" /> -->
    
<link rel="stylesheet" type="text/css" href="css/cpanel_002_popup.css"> 
<link rel="stylesheet" type="text/css" href="css/cpanel_colors.css">
<!-- <link rel="stylesheet" type="text/css" href="css/form.css" media="all"> -->
    <link href="themes/4/js-image-slider.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" language="javascript" src="calendar/prototype-1.js"></script>
<script type="text/javascript" language="javascript" src="calendar/prototype-base-extensions.js"></script>
<script type="text/javascript" language="javascript" src="calendar/prototype-date-extensions.js"></script>
<script type="text/javascript" language="javascript" src="calendar/behaviour.js"></script>
<script type="text/javascript" language="javascript" src="calendar/datepicker.js"></script>
<link rel="stylesheet" href="calendar/datepicker.css">
<script type="text/javascript" language="javascript" src="calendar/behaviors.js"></script>
    <script src="themes/4/js-image-slider.js" type="text/javascript"></script>


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

div.absolute {
    position: absolute;
    left: 190px;
    width:100%;
    border:0;
}    


 /* #slider, #slider div.sliderInner {
    width:600px;height:400px;/* Must be the same size as the slider images */
}  */
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



.mainDIV{
    position:relative;
    background:;
    width:%;
    min-width:;
}
.leftDIV{
    position:absolute;
    top:0px;
    left:0px;
    height:20px;
    width:50px;
    background:;
}
.middleDIV{
    height:50px;
    width:300px;
    align:center;
    background:;
    margin:0px auto;
}
.rightDIV{
    position:absolute;
    top:50px;
    right:25px;
    height:30px;
    width:100px;
    background:;
}



.Row
{
    display: table;
    width: 100%; /*Optional*/
    table-layout: fixed; /*Optional*/
    border-spacing: 10px; /*Optional*/
}
.Column
{
    display: table-cell;
    background-color: ; /*Optional*/
}

/* div.absolute {
    position: absolute;
    left: 0px;
    width:20%;
    border:2;
}   */  

html, body { height: 100%; padding: 0; margin: 0; } 


#topdisppanel {
    position: fixed  ;
    left: 0;
    right: 0;
    height: 18%;
}

#bottomdisppanel {
    position: fixed ;
    left: 0;
    right: 0;
    height: 88%;
}

#footerdisppanel {
    position: fixed ;
    left: 0;
    right: 0;
    height: 3%;
}

#topdisppanel {
    top: 0%;

   /*  background-color: orange; */
   background-color: #f5f5f5;
   
}

h1
{
  font-size:2em;
   color:#58666e;
}

#bottomdisppanel {
    bottom: 0%;
    background-color: DarkGray;
}

#footerdisppanel {
    bottom: 0%;
    background-color: #f5f5f5;
}

/* div.mainabc { width: 100%; height: 5%; float: left; } */
div.abc { width: 50%; height: 50%; float: left; }
#div0 { background: #AAA; }
#div1 { background: #AAA; }
#div2 { background: #AAA; }
#div3 { background: #AAA; }

div.pqr { width: 25%; height: 50%; float: left; }
#div0 { background: #AAA; }
#div1 { background: #AAA; }
#div2 { background: #AAA; }
#div3 { background: #AAA; }
#div4 { background: #AAA; }
#div5 { background: #AAA; }
#div6 { background: #AAA; }
#div7 { background: #AAA; }

img.pqr1 {width:100%; height:100%}


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
{ 	alert("date1==>");
	var date1 = document.getElementById("MdateF").value;
	alert("date1==>"+date1);
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
	/* 	document.getElementById("date1").value="";
		document.getElementById("date1").focus; */
		return false;
	}
	else if(year==yy11)
	{
		//alert("month1   "+mm11+"   month  "+month);
			if(mm11<month)
		{
			alert("selected date should not be Less than todays date");
			/* document.getElementById("date1").value="";
			document.getElementById("date1").focus; */
			return false;
		}
			else
				if(mm11==month)
				{
					//alert("day1   "+dd11+"   day  "+day);
					if(dd11<day)
					{
						alert("selected date should not be Less than todays date");
						/* document.getElementById("date1").value="";
						document.getElementById("date1").focus; */
						return false;
					}
					else
						if(dd11==day)
						{
							//alert("hr1   "+hr1+"   hr  "+hr);
							if(hr1<hr)
							{
								alert("selected date should not be Less than todays date");
								/* document.getElementById("date1").value="";
								document.getElementById("date1").focus; */
								return false;
							}
							else
								if(hr1==hr)
								{
									//alert("min1   "+min1+"   min  "+min);
									if(min1<min)
									{
										alert("selected date should not be Less than todays date");
										/* document.getElementById("date1").value="";
										document.getElementById("date1").focus; */
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
</script>


<script type="text/javascript">
												
</script>

<!-- </head> -->

<%! Connection conn = null;
	Statement st = null;
	Statement st1 = null;
	Statement st2 = null;
	Statement st3 = null;
	Statement st4 = null;
	Statement st5 = null;
	Statement st6 = null;
	
	Statement st11 = null;
	Statement st22 = null;
	Statement st33 = null;
	Statement st44 = null;
	Statement st55 = null;
	Statement st66 = null;
	
	
	
	String date1 = "";
	String date2 = "";
	String from ="";
	String to ="";
	String fromdate="";
	String todate="";
	
	String time1 = "";
	String time2 = "";
	String time3="";
	String time4="";
String 	Mfrom="";
	String vehno="";
	String datefrom="";
	String datefrom1="";
	String dateto="";
	String dateto1="";
	String datefromconvert="";
	String reportno="";
%>

<%
//String statusname="";
String vehlist = session.getAttribute("vehlist").toString();

System.out.println("Session Veh List :- "+vehlist);
int interval;
date2 = request.getParameter("inerval");
Mfrom = request.getParameter("from");
System.out.println("inerval-------------------- :- "+date2);
System.out.println("Mfrom-------------------- :- "+Mfrom);

if(date2==null)
{
	interval=15;
}
else
{
	interval=Integer.parseInt(date2);
}


/* if(Mfrom==null)
{ */
	



   if(Mfrom==null)
   {
	   
	   Calendar cal12 = Calendar.getInstance();
	   cal12.add(Calendar.MINUTE, -interval);
	   SimpleDateFormat sdf12 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	   SimpleDateFormat sdf122 = new SimpleDateFormat("dd-MMM-yyyy HH:mm");

	       datefrom = sdf12.format(cal12.getTime());
	       datefrom1 = sdf122.format(cal12.getTime());

	      System.out.println("The datefrom  is ==>"+datefrom);
	      System.out.println("The datefrom1  is ==>"+datefrom1);
	   Date date2to = sdf12.parse(datefrom);
	   
		Calendar cal13 = Calendar.getInstance();
		   cal13.setTime(date2to);
  cal13.add(Calendar.MINUTE, interval);
  SimpleDateFormat sdf13 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
  SimpleDateFormat sdf133 = new SimpleDateFormat("dd-MMM-yyyy HH:mm");

      dateto = sdf13.format(cal13.getTime());
      dateto1 = sdf133.format(cal13.getTime());


  System.out.println("The dateto  is ==>"+dateto);
  System.out.println("The dateto1  is ==>"+dateto1);

   }
   else
   {
	   
	   Calendar cal12 = Calendar.getInstance();
	   cal12.add(Calendar.MINUTE, interval);
	   SimpleDateFormat sdf12 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	   SimpleDateFormat sdf122 = new SimpleDateFormat("dd-MMM-yyyy HH:mm");

	       datefrom = sdf12.format(cal12.getTime());
	       datefrom1 = sdf122.format(cal12.getTime());

	      System.out.println("The datefrom  is ==>"+datefrom);
	      System.out.println("The datefrom1  is ==>"+datefrom1);
	    SimpleDateFormat formatter6=new SimpleDateFormat("dd-MMM-yyyy HH:mm");  
	    Date date6=formatter6.parse(Mfrom);  
		   System.out.println("The datefrom datefrom is ==>"+date6);
		   SimpleDateFormat sdf1333 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		   SimpleDateFormat sdf13334 = new SimpleDateFormat("dd-MMM-yyyy HH:mm");

	   datefrom= sdf1333.format(date6);
	   datefrom1= sdf13334.format(date6);

	   System.out.println("The datefrom datefrom is ==>"+datefrom);

	  // datefrom=
			  
	   Date date2to = sdf12.parse(datefrom);
	   
		Calendar cal13 = Calendar.getInstance();
		   cal13.setTime(date2to);
  cal13.add(Calendar.MINUTE, interval);
  SimpleDateFormat sdf13 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
  SimpleDateFormat sdf133 = new SimpleDateFormat("dd-MMM-yyyy HH:mm");

      dateto = sdf13.format(cal13.getTime());
      dateto1 = sdf133.format(cal13.getTime());


  System.out.println("The dateto  is ==>"+dateto);
  System.out.println("The dateto1  is ==>"+dateto1);

   }
   
		
/* }
else
{
	
	datefromconvert=Mfrom;
	
	String myfromdate=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new SimpleDateFormat("dd-MMM-yyyy HH:MM").parse(Mfrom)); 
	   System.out.println("The myfromdate  is ==>"+myfromdate);
	   datefromconvert=myfromdate;
	
	
	SimpleDateFormat sdf1237 = new SimpleDateFormat("yyyy-MM-dd HH:mm");

	Date date2cal = sdf1237.parse(Mfrom);
	Calendar cal12 = Calendar.getInstance();
	   cal12.setTime(date2cal);

	//cal12.add(Calendar.MINUTE, interval);
	SimpleDateFormat sdf12 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	SimpleDateFormat sdf122 = new SimpleDateFormat("dd-MMM-yyyy HH:mm");

	    datefrom = sdf12.format(cal12.getTime());
	    datefrom1 = sdf122.format(cal12.getTime());

	  
	   
	   
			Date date2to = sdf12.parse(datefrom);
	 
			Calendar cal13 = Calendar.getInstance();
			   cal13.setTime(date2to);
	   cal13.add(Calendar.MINUTE, interval);
	   SimpleDateFormat sdf13 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	   SimpleDateFormat sdf133 = new SimpleDateFormat("dd-MMM-yyyy HH:mm");

	       dateto = sdf13.format(cal13.getTime());
	       dateto1 = sdf133.format(cal13.getTime());
	       
	       
	       System.out.println("The datefrom  is1 ==>"+datefrom);
		   System.out.println("The datefrom1  is1 ==>"+datefrom1);

	   System.out.println("The dateto  is1 ==>"+dateto);
	   System.out.println("The dateto1  is1 ==>"+dateto1);

}
 */




	String  default_date_1 = new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new Date());
	String  hh=new SimpleDateFormat("HH").format(new Date());
	
	int hh1=Integer.parseInt(hh);
	int hh2=hh1-2;
	
	String default_date_3 = new SimpleDateFormat("dd-MMM-yyyy ").format(new Date());
	
	
	String  default_date_5 = new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new Date());
	String  mm=new SimpleDateFormat("mm").format(new Date());
	
	int mm1=Integer.parseInt(mm);
	int mm2=mm1;
	
	  DecimalFormat formatter = new DecimalFormat("00");
	
	String mm5=formatter.format(mm2);
	default_date_3=default_date_3+""+hh2+":"+mm5;
	
	
	String defaultDate2 = new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new Date());
	System.out.println("The default date is ==>"+default_date_3);
	
	System.out.println("The default_date_1  is ==>"+default_date_1);
	
	
	
	
	
	
	
	try
	{
	date1=new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:MM").parse(default_date_3)); 
	date2= new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:MM").parse(default_date_1)); 
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
%>	

<%
String username=session.getAttribute("User").toString();

String unitid="",camerapos="";
String vehcode="";
try{
	
	String frompage = request.getParameter("frompage");
	//vehlist = session.getAttribute("VehList").toString();
	//System.out.println("The vehicle list>>>>"+vehlist);

	if(frompage!=null && frompage.equalsIgnoreCase("OS"))
	{
		System.out.println("In Iff Frompage>>>>");
		
		String thedate = datefrom;
		String thedate1 = dateto;
		/* date1 = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(from));
		time1 = new SimpleDateFormat("HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(from));
		date2 = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(to));
		time2 = new SimpleDateFormat("HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(to)); */
	}
	else
	{
		System.out.println("In else date");
		 date1 = request.getParameter("data");
		 date2 = request.getParameter("data1");
		 unitid= request.getParameter("vehcode");
		 //vehcode=request.getParameter("vehcode");
		 from=datefrom;
		 to=dateto;
		 try{
		/*  fromdate= new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(from));
		 time3= new SimpleDateFormat("HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(from)); */
	
		 camerapos= request.getParameter("camerapos");
		 /* todate= new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(to));
		 time4= new SimpleDateFormat("HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(to)); */
		 }catch(Exception e){
			 e.printStackTrace();
		 }
	 System.out.println("date1 "+date1);
	 System.out.println("date2 "+date2);
	 System.out.println("vehcode "+unitid);
	 System.out.println("camerapos "+camerapos);
	 System.out.println("from "+from);
	 System.out.println("to "+to);
	 System.out.println("Vehcode"+vehcode);
	// time1 =":00";
	 
	 
	 
	// time2 = ":59";
	}
	
	 Class.forName(MM_dbConn_DRIVER);
	 conn = DriverManager.getConnection(MM_dbConn_STRING, MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
	 st = conn.createStatement();
	 st1 = conn.createStatement();
	 st2 = conn.createStatement();
	 st3 = conn.createStatement();
	 st4 = conn.createStatement();
	 st5 = conn.createStatement();
	 st6 = conn.createStatement();
	 
	 
	 st11 = conn.createStatement();
	 st22 = conn.createStatement();
	 st33 = conn.createStatement();
	 st44 = conn.createStatement();
	 st55 = conn.createStatement();
	 st66 = conn.createStatement();
	 Statement stRepNo=conn.createStatement();

	 //statusname=request.getParameter("status");
	 //System.out.println("statusname "+statusname);
// 	 if(statusname==null)
// 	 {
// 	 	statusname="All";
// 	 }
// 	 System.out.println("statusname "+statusname);
	 System.out.println("  Date1 ==>"+date1+ "Date2 ==>"+date2);
	 String Reportnosql="Select * from smartgrid.t_reportnumber  where PageName='imagefour2.jsp'";
	 System.out.println("Report No===>"+Reportnosql);
	 ResultSet ResRepNo=stRepNo.executeQuery(Reportnosql);
	 if(ResRepNo.next())
	 {
	 	 reportno= ResRepNo.getString("ReportNo");
	 }

}catch(Exception e){
	System.out.println("Exception "+e);
}
%>
<body>

<br>
<br>
 <div id="topdisppanel"> 
    
    <div class="mainDIV">
    <div class="leftDIV"><img src="smartgrid.png"  height="50" width="200"></div>
    <div class="middleDIV"><font size="+3">SmartGrid Infra LLP</font></div>
    <div class="rightDIV">Welcome:<%=username%></div>
 </div>
<table width="20%">
<tr>
<td><a  style="color:black; text-decoration:none" href="Home.jsp" onclick="Home.jsp">Home </a></td>
<td><a  style="color:black; text-decoration:none" href="javascript:void(0)" onclick="regcomplaint('DisplayPanel3.jsp');">Register complaint </a></td>
<td> Report No:<%=reportno%></td>

</tr>
</table>

<td>
<div class="div1"  align="center" style="margin-bottom: 10px;" ><font color="black" size="3" face="Arial"><b>Image View Report</b></font>
</div>

<div align="center">
<form  style="height: 20px;"   id="camera_jpg_report" name="camera_jpg_report" action="imagefour2.jsp" method="get">
<table  style="width: 70%;">
	<tr>
<!-- 		<td style="width: 100px"><b>&nbsp;&nbsp;Range: </b></td> -->
<!-- 		<td> -->
<!-- 			 <div align="left"><font color="black" size="2" face="Arial"> <b>Range:</b>&nbsp;&nbsp; -->
<!-- 			 </font></div> -->
<!-- 			</td> -->
	<td>
			 <div align="center"><font color="black" size="2" face="Arial"> <b>From:</b>
			 <% 
			 System.out.println("Date1==>"+datefrom);
			 System.out.println("Date1==>"+date2);
			 %>
			<%--  <input type="text" id="MdateF" name="from"  value="<%if(date1==null){%><%=default_date_3%><%}else{%><%=new SimpleDateFormat("dd-MMM-yyyy hh:MM").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(date1))%><%}%>"  class="datetimepicker" style="width: 130px;"    readonly/></font></div> --%>
		
		<%-- <input type="text" id="MdateF" name="from"  value="<%=default_date_3%>"  class="datetimepicker" style="width: 130px;"    readonly/></font></div> --%>
			<% 
			String from1="",to1="";
			if(request.getParameter("data")==null || request.getParameter("data1")==null)
			{ 
				
				if(request.getParameter("from")==null || request.getParameter("to")==null)
				{
					/* Calendar cal = Calendar.getInstance();
					 cal.add(Calendar.MINUTE, -15);
					 SimpleDateFormat sdf1 = new SimpleDateFormat("dd-MMM-yyyy HH:mm");
					    String date123 = sdf1.format(cal.getTime()); */
					
				to= dateto; 
		 		from= datefrom;
				}
				
			from1=datefrom;	
			to1=dateto;
			
			
				
			}
			else
			{	
		from1=datefrom ; 
		to1=dateto ;
		
		//from1=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(date1+time1)) ; 
		//to1=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(date2+time2)) ; 
			 
			}
			%>
			
			
				<input type="text" id="MdateF" name="from"  value="<%=datefrom1%>"  class="datetimepicker" style="width: 135px;"    readonly/></font></div>
			
			
			
		
		
		</td>  
		
		
 		<%-- <td style="width: 20px"></td> 
  			  <td>
			 <div align="left"><font color="black" size="2" face="Arial"> <b>To:</b>
		
			 <input type="text" id="MdateT" name="to"  value="<%if(date2==null){ %><%=default_date_1%><%}else{%><%=new SimpleDateFormat("dd-MMM-yyyy hh:MM").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(date2))%><%}%>"  class="datetimepicker" style="width: 130px;"    readonly/></font></div>
	 
	 
	 <input type="text" id="MdateT" name="to"  value="<%=default_date_1%>"  class="datetimepicker" style="width: 130px;"    readonly/></font></div>
	 
	 <input type="text" id="MdateT" name="to"  value="<%=to1%>"  class="datetimepicker" style="width: 135px;"    readonly/></font></div>
		</td>  --%>
		<td style="width: 20px"></td>
		<td>
		<font color="black">
			 <div align="left"><font color="black" size="2" face="Arial"> <b>To:</b>
		
		
	 
	 	<select type="text" id="MdateT" name="inerval" class="element select medium" style="width: 80px" id="cat" >
	 	<%if(request.getParameter("data")==null){ %>
	 		<option  value="15" selected="selected" ><%=interval%></option>
	 	<%}else{
	 		
	 		
	 		%>
	 			 		<option  value="15" selected="selected" ><%=interval%></option>
	 		
	 		<% 
	 	}%>
	 		 	<option value="30" >15</option>
	 	
	 	<option value="30" >30</option>
	 	<option value="45" >45</option>
	    <option value="60" >60</option>
	 	</select>
	 	
	 </font>
	 </div>
		</td> 

	


	<!-- <td align =left>
	<div align="left"><font color="black" size="2" face="Arial"> <b>Vehicle:</b>&nbsp;&nbsp;
	<select name="Vehicle1" class="element select medium" style="width: 120px" id="Unit1" > -->
<%
	//String VehNo1="";
	//VehNo1 = request.getParameter("Vehicle1");
	//out.println("Vehicle1 "+VehNo1);

	//  Change here
	///String unit = "Select a.VehicleRegNumber as vehno from db_gps.t_vehicledetails a,smartgrid.t_jpgsnapsmartgrid b  where a.unitid = b.unitid and  a.VehicleCode in "+vehlist+" and a.status='-' group by a.VehicleRegNumber order by VehicleRegNumber ";
	//String unit = "Select a.VehicleRegNumber as vehno from db_gps.t_vehicledetails a,smartgrid.t_jpgsnapsmartgrid b  where a.vehiclecode = b.vehid and  a.VehicleCode in "+vehlist+" and a.status='-' group by a.VehicleRegNumber order by VehicleRegNumber ";
	//String unit = "Select unitid from smartgrid.t_jpgsnapsmartgrid unitid='"+unitid+"' ";
	 
	/* System.out.println("taking vehicel list   "+unit);
	ResultSet rstunit=st1.executeQuery(unit);
	System.out.println("unit is "+unit);
	//out.println("unit is "+unit);
	while(rstunit.next())
	{	
		vehno = rstunit.getString("unitid") ;
		System.out.println("Query veh no  "+vehno); */

		//if(null != VehNo1)
			//{  //System.out.println("in IF veh no  "+vehno);
			%>
			<%-- <option value="<%=vehno%>" <% if(VehNo1.equals(vehno)){ %>Selected<% } %>><%=vehno%></option> --%>
			<%
			/* }else
			{ */
				%><%-- <option  value="<%=vehno%>" ><%=vehno %></option> --%> <%
				/* VehNo1=vehno; */
				//System.out.println("in else veh no  "+vehno);
			//}
		
	//} %>
	<!-- <option  value="MH 12 CT 8308" >MH 12 CT 8308</option> -->
	<!-- </select>
	</font>
	</div>
	</td> --> 
	
	<td align =left>
	<div align="left"><font color="black" size="2" face="Arial"> <b>Category:</b>
	<select name="cat" class="element select medium" style="width: 170px" id="cat" >
<%
	String category = "";
	String cat11 = "";
	System.out.println("before category");
	try{
	category = request.getParameter("cat");
	System.out.println("category "+category);
	System.out.println("after category");
	/* if(category.equals("cam1,cam2,cam3,cam4")){
		System.out.println("In if category");
		category="('cam1','cam2','cam3','cam4')";
	} */
	
	}catch(Exception e){
		e.printStackTrace();
	}
	
	
	if(category==null)
	{
		category = "cam1";
	}
	
	String cat = "";
	String sqlcat = "Select DISTINCT(camerapos) from smartgrid.t_jpgsnapsmartgrid where camerapos <> '-'  order by camerapos ASC";
	ResultSet rstcat = st4.executeQuery(sqlcat);
	System.out.println("sql camerapos "+sqlcat);
	%>
	
 <% 	while(rstcat.next())
	{	
		cat = rstcat.getString("camerapos") ;
		if(null != category)
			{
			%>
			 <%System.out.println("Categort===========>"+category); 
		
			 %>
			 
			
			
			<option value="<%=cat%>" <% if(category.equals(cat)){ %>Selected<% } %>><%=cat%></option>
		
			
			<%
			}else
			{
				%><option  value="<%=cat%>" ><%=cat %></option> <%
				category=cat;
			}
			
	} %>
	
	
	</select>
	</font>
	</div>
	</td> 
		
		 <td align =left> 
	<div align="left"><font color="black" size="2" face="Arial"> <b>Location:</b>
	<select name="vehcode" class="element select medium" style="width: 130px" id="type" > 
	<%
	
	 String type="";
	String typ1="";
	//type= request.getParameter("unitid");
	
	type= request.getParameter("vehcode");
	
	System.out.println("Type="+type); 
	//smartgrid.t_jpgsnapsmartgrid
	
	String uniquevehcode="";
	
	
	
	String typ = "";
	String typnw="";
	int vehcode1=0;
	String loc="";
	//String sqlcat1 = "Select DISTINCT(unitid) from smartgrid.t_jpgsnapsmartgrid order by unitid ASC";
	String company = session.getAttribute("company").toString();
	
	String typevalue=session.getAttribute("typevalue").toString();
	System.out.println("typevalue on image four page:-"+typevalue);
	String TypeofUser=session.getAttribute("TypeofUser").toString();
	System.out.println("TypeofUser on image four page:-"+TypeofUser);
	System.out.println("VehList:-"+vehlist);

	if(TypeofUser.equalsIgnoreCase("Transporter"))
	{
	String sqlcat1 = "select distinct(VehicleRegNumber),VehicleCode  from db_gps.t_vehicledetails where VehicleCode in "+vehlist+"  and status='-' ";
	System.out.println("sql type+++++++++++++ "+sqlcat1);
	ResultSet rstcat1 = st5.executeQuery(sqlcat1);
	System.out.println("sql type "+sqlcat1);
	while(rstcat1.next())
	{	
		typ = rstcat1.getString("VehicleRegNumber") ;
		if(typ.equals("-")){
			typnw="Other";
			vehcode1=0;
		}else
			typnw = rstcat1.getString("VehicleRegNumber") ;
             vehcode=rstcat1.getString("VehicleCode");
			
		if(null != type)
			{
			%>
			<option value="<%=vehcode%>" <% if(type.equals(vehcode)){loc=typnw;uniquevehcode=vehcode; %>Selected<% } %>><%=typnw%></option> 
			<%
			}else
			{
				%> <option  value="<%=vehcode%>" ><%=typnw %></option> <%
				//type=unitid;
				unitid=type;
			}
			
	} 
	}
	else
	{
		
		String sqlcat1 = "select distinct(transporter),VehCode  from db_gps.t_group where gpname like '%"+typevalue+"%' ";
		System.out.println("sql type else"+sqlcat1);
		ResultSet rstcat1 = st5.executeQuery(sqlcat1);
		System.out.println("sql type "+sqlcat1);
		while(rstcat1.next())
		{	
			typ = rstcat1.getString("transporter") ;
			if(typ.equals("-")){
				typnw="Other";
				vehcode1=0;
			}else
				typnw = rstcat1.getString("transporter") ;
	             vehcode=rstcat1.getString("VehCode");
				
			if(null != type)
				{
				%>
				<option value="<%=vehcode%>" <% if(type.equals(vehcode)){loc=typnw;uniquevehcode=vehcode; %>Selected<% } %>><%=typnw%></option> 
				<%
				}else
				{
					%> <option  value="<%=vehcode%>" ><%=typnw %></option> <%
					//type=unitid;
					unitid=type;
				}
				
		} 
		
		
	}
	 %>
	</select>
	</font>
	</div>
	</td>  
		
		<td>		
			<input type="submit" name="Submit" value="Submit" style="border-style: outset; border-color: black; vertical-align: "  class="formElement">
		</td>
		</tr>
		</table>	
<br>
<br>
<% 
String Unitid="All";
 %>
 
 <%
 //out.println("The category is11 ==>"+category);
 if(null != category)
 {
	 if(category.equals("cam1") || category == "cam1")
	 {
	 	category = "('"+category+"')";
	 	cat11 = "cam1";
	 }else if(category.equals("cam2") || category == "cam2" ){
		 category = "('"+category+"')";
		 	cat11 = "cam2";
	 }else if(category.equals("cam3") || category == "cam3" ){
		 category = "('"+category+"')";
		 	cat11 = "cam3";
	 }
	 else  if(category.equals("cam4") || category == "cam4" ){
		 category = "('"+category+"')";
		 cat11 = "cam4";
	 }
	 
	 else
	 {
		 category = "('"+category+"')";
		 cat11 = "cam1,cam2,cam3,cam4";	 
	 }
		 
 }
 
 /* if(null != type)
 {
	 if(type.equals("Incident") || type == "Incident")
	 {
	 	type = "('"+type+"')";
	 	typ1 = "Incident";
	 }
	 if(type.equals("-") || type == "-"){
		 type = "('"+type+"')";
		 type= "-";
	 }
	 else{
		 type = "('"+type+"')";
		 typ1 = "Exception";
	 }
 } */
 
 
 if(category.contains(")")  || category.contains("("))
	{
		
		category=category.replace(")","");
		category=category.replace("(","");
		category=category.replace("'","");
		
		
	}
 /* if(type.contains(")")  || type.contains("("))
	{
		
		type=type.replace(")","");
		type=type.replace("(","");
		type=type.replace("'","");
		
		
	} */
	
	//out.println("@@@@@@@@==AFTER>"+type);
	
 
 
 //System.out.println("The category is22 ==>"+category);
 %>
</form>
</div>

<%

 	//if(date1==null || date2==null){
			
 	//	date1 = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(default_date_1));
 	//	date2 = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(defaultDate2));
 	//}
 	if(date1!=null || date2!=null){
		//System.out.println("in else");
		
	//	date1 = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(date1));
	//	date2 = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(date2));
	}
 	else
 	{

 		date1= datefrom; 
 		date2= dateto; 
	
 	}
 	
 	if(to!=null || from!=null){
		//System.out.println("in else");
		
	//	date1 = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(date1));
	//	date2 = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(date2));
	}
 	else
 	{

 		to= dateto; 
 		from= datefrom; 
	
 	}

%>	

<%
	
			 //String condition = "And unitid = (select unitid from db_gps.t_vehicledetails where VehicleRegNumber = '"+VehNo1+"' and status='-' ) ";	

%>		 

<%


	//System.out.println("in if part -----------------------------------"+VehNo1);	
	String unitt = "";
	String vehid="";
	//category="cabin";
	/* String sqlunit = "select unitid,vehiclecode from db_gps.t_vehicledetails where VehicleRegNumber = '"+VehNo1+"' and status='-' ";
	System.out.println(" sqlunit "+ sqlunit);
	
	ResultSet rsunit = st2.executeQuery(sqlunit);
	//out.println(" sqlunit "+ sqlunit);
    if(rsunit.next())
    {
    	 unitt = rsunit.getString("unitid");		
    	 vehid = rsunit.getString("vehiclecode");
    } */
    
    //Get the count of images
int count = 0;
String sqlcnt="";
if(category.equals("cam1,cam2,cam3,cam4")){
	if(request.getParameter("data")==null || request.getParameter("data1")==null ){
		//sqlcnt = "Select count(*) as cnt from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(from))+"' AND vehicleregnumber='"+unitid+"' ";
		
		sqlcnt = "Select count(*) as cnt from smartgrid.t_jpgsnapsmartgrid where snapdatetime between '"+datefrom+"' AND  '"+dateto+"'  AND   vehiclecode='"+type+"' ";
		System.out.println("sqlcnt1==>"+sqlcnt);
	
	}
else{
	// sqlcnt = "Select count(*) as cnt from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+date1+" "+time1+"' AND snapdatetime <= '"+date2+" "+time2+"' AND jpgfilename not like  '%pod%' "+condition+" ";
	
	//sqlcnt = "Select count(*) as cnt from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+date1+" "+time1+"'  AND snapdatetime <= '"+date2+" "+time2+"'   AND vehicleregnumber='"+unitid+"' ";
	sqlcnt = "Select count(*) as cnt from smartgrid.t_jpgsnapsmartgrid where snapdatetime between '"+datefrom+"'  AND '"+dateto+"'   AND vehiclecode='"+unitid+"' ";
	System.out.println("sqlcnt2==>"+sqlcnt);

}
}else{
	if(request.getParameter("data")==null || request.getParameter("data1")==null ){
		
		System.out.println("in Date null category:-"+category);
		System.out.println("in Date null category from:-"+from);
		System.out.println("in Date null category to:-"+to);
		if(category.equals("cam1,cam2,cam3,cam4"))
		{
			/* sqlcnt = "Select count(*) as cnt from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(from))+"' AND snapdatetime <= '"+dateto+"' AND camerapos in ('cam1','cam2','cam3','cam4') AND unitid='"+unitid+"'  "; */
		
			sqlcnt="Select count(*) as cnt from smartgrid.t_jpgsnapsmartgrid where snapdatetime between '"+datefrom+"' AND  '"+dateto+"' AND camerapos in ('cam1','cam2','cam3','cam4') AND vehiclecode='"+unitid+"'  ";
			System.out.println("sqlcnt3==>"+sqlcnt);
		}
		else
		{
		//sqlcnt = "Select count(*) as cnt from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(from))+"' AND snapdatetime <= '"+dateto+"' AND category in ('"+category+"') and type in ('"+type+"')  AND jpgfilename not like  '%pod%' "+condition+" ";
		//sqlcnt = "Select count(*) as cnt from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(from))+"' AND snapdatetime <= '"+dateto+"' AND camerapos in ('"+category+"')  AND unitid='"+unitid+"' ";
		sqlcnt = "Select count(*) as cnt from smartgrid.t_jpgsnapsmartgrid where snapdatetime between '"+datefrom+"' AND  '"+dateto+"' AND camerapos in ('"+category+"')  AND vehiclecode='"+type+"' ";
		System.out.println("sqlcnt4==>"+sqlcnt);
		}
		
		System.out.println("Count of Images "+sqlcnt);
	}else{
		System.out.println("Inelse");
		//sqlcnt = "Select count(*) as cnt from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(from))+"' AND snapdatetime <= '"+dateto+"' AND category in ('"+category+"') and type in ('"+type+"')  AND jpgfilename not like  '%pod%' "+condition+" ";
		//sqlcnt = "Select count(*) as cnt from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+date1+" "+time1+"' AND snapdatetime <= '"+date2+" "+time2+"' AND category in ('"+category+"') and type in ('"+type+"')  AND jpgfilename not like  '%pod%' "+condition+" ";
	if(category.equals("cam1,cam2,cam3,cam4") || category.equals("cam1") || category.equals("cam2") || category.equals("cam3") || category.equals("cam4"))
		{
			//sqlcnt = "Select count(*) as cnt from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(from))+"' AND snapdatetime <= '"+dateto+"' AND camerapos in ('cam1','cam2','cam3','cam4')  ";
		System.out.println("in category");
		//sqlcnt = "Select count(*) as cnt from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+date1+" "+time1+"' AND snapdatetime <= '"+date2+" "+time2+"' AND camerapos in ('"+category+"')  AND unitid='"+unitid+"' ";
		sqlcnt = "Select count(*) as cnt from smartgrid.t_jpgsnapsmartgrid where snapdatetime between '"+datefrom+"' AND  '"+dateto+"' AND camerapos in ('"+category+"')  AND vehiclecode='"+unitid+"' ";
		
		}
		
	else
		
	{	

		System.out.println(from);
		System.out.println(to);
	
	
	
	
	
		//sqlcnt = "Select count(*) as cnt from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+f2+"' AND snapdatetime <= '"+f2+"' AND camerapos in ('"+category+"')  AND unitid='"+unitid+"' ";
	sqlcnt = "Select count(*) as cnt from smartgrid.t_jpgsnapsmartgrid where snapdatetime  between '"+datefrom+"' AND '"+dateto+"' AND camerapos in ('"+category+"')  AND vehiclecode='"+unitid+"' ";
	
	}	
	
	}
	}

System.out.println("Count of Images "+sqlcnt);
ResultSet rscount = st3.executeQuery(sqlcnt);
//out.println("Count of Images "+sqlcnt);
if(rscount.next())
{
	count = rscount.getInt("cnt"); //mining job 
} 

System.out.println("count==>"+count);	

%> 



<%

try{
if(count > 0) {

%>
<br>
<br>
 <div align="center" >
 <%-- <table  style="width: 70%;">
<tr style="background-color: white;">
<td align="right" style="background-color: white;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="2" face="Arial" ><a href="cameraimagereportdetail.jsp?data=<%=date1+time1 %>&data1=<%= date2+time2%>&cat='cam1'&unitid=<%=type%>" target="_blank" ><font color="black">Detail Report</font></a></font><!-- </div> --></td>

</tr>
</table> --%>
<table  style="width: 70%;">


<tr >
<%-- <td align="right" style="background-color: white;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="2" face="Arial" ><a href="cameraimagereportdetail.jsp?data=<%=date1+time1 %>&data1=<%= date2+time2%>&cat=<%=category %>&unitid=<%=type%>" target="_blank" >Detail Report</a></font><!-- </div> --></td> --%>
</tr>

<tr>






		<td>
			 <div align="center"><font color="black" size="2" face="Arial"> <b>From:</b>
			 	<% if(request.getParameter("data")==null || request.getParameter("data1")==null){ %>
			 	<%=datefrom1%>
			 	<%}else{ %>
			 	<%=datefrom1%></font>
			 	<%} %>
			 </div>
		</td>
		<td>
			 <div align="left"><font color="black" size="2" face="Arial"> <b>To:</b>
			 <% if(request.getParameter("data")==null || request.getParameter("data1")==null){ %>
			 <%=dateto1%>
			 <%}else{ %>
			 <%=dateto1 %></font>
			 <%} %>
			 </div>
		</td>
		<!-- <td align =left>
			<div align="left"><font color="black" size="2" face="Arial"> <b>Vehicle:</b>&nbsp;&nbsp; -->
			<%-- <%= VehNo1 %> --%><!-- </font>
			 </div>
		</td> -->
		<td align =left>
			<div align="left"><font color="black" size="2" face="Arial"> <b>Location:</b>
			<%=loc %></font>
			 </div>
		</td>
		<td align =left>
			<div align="left"><font color="black" size="2" face="Arial"> <b>Category:</b>
			<%=category %></font>
			 </div>
			
			<!-- <td align =left>
			<div align="left"><font color="black" size="2" face="Arial"> <b>Type:</b>&nbsp;&nbsp; -->
			<%-- <%=type %> --%>
			
			
			
			<!-- </font>
			 </div>
		</td> -->
		<td align =left>
			<div align="left"><font color="black" size="2" face="Arial"> <b>Total:</b>
			<%=count %></font>
			 </div>
		</td>
		

</tr>
</table>
 <table  style="width: 70%;">
<tr style="background-color: white;">


<%

String s1,s2;

if(request.getParameter("data")==null || request.getParameter("data1")==null)
{
s1=datefrom;
s2=dateto;

if(request.getParameter("from")==null || request.getParameter("to")==null)
{
	
	to= dateto; 
		from= datefrom;
		
s1=from;
s2=to;
}

}
else
{
	if(request.getParameter("from")==null || request.getParameter("to")==null)
	{
		
		to= dateto; 
 		from= datefrom;
 		
	s1=from;
	s2=to;
	}
	s1=datefrom;
	s2=dateto;
}

String s3=datefrom;
String s4=dateto;
%>
<%

%>
<%-- <td align="right" style="background-color: white;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="2" face="Arial" ><a href="cameraimagereportdetail.jsp?data=<%=s3%>&data1=<%=s4%>&cat='cam1'&vehreg=<%=uniquevehcode%>" target="_blank" >Detail Report</a></font><!-- </div> --></td> --%>

</tr>
</table>
</div>
</div>

 <br>
 <br>
 <br>
 <br>
 <br>
 <br>
 <br>
  <br>
 <br>
 <br>
 <br>
 <br>
 <br>
  <br>
 <br>
 <br>
<div id="container">
    <div id="center">
    <h2 style= "font:normal 16px Arial,Helvtica,sans-serif; margin-bottom: 10px;"><b><%=category %></b></h2>
    <div id="sliderFrame"><h2 style= "font:normal 16px Arial,Helvtica,sans-serif;visibility: hidden;"><b><%=category %></b></h2> 
       
    
        <div  id="slider" style="outline:2px solid #000; width:1020px ; height:550px ;"> 
       
            <%
            String sql="";
        	if(category.equals("cam1,cam2,cam3,cam4") ){
        		//category="Cabin";
        	System.out.println("Hi");
        	if(request.getParameter("data")==null || request.getParameter("data1")==null){
        		sql = "Select vehiclecode,vehicleregnumber,unitid,jpgfilename, snapdatetime,rawfilename from smartgrid.t_jpgsnapsmartgrid where snapdatetime between '"+datefrom+"'  AND  '"+dateto+"'  AND camerapos in ('cam1') AND vehiclecode='"+type+"' Order by snapdatetime ASC";
        	
        		System.out.println("SQL1==>"+sql);
        	
        	}
        	else{
        		
        	
        		// sql = "Select unitid,jpgfilename,rawfiledatetime, snapdatetime from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+date1+time1+"' AND snapdatetime <= '"+dateto+"'  AND jpgfilename not like  '%pod%' "+condition+" Order by snapdatetime ASC";	
        	// sql = "Select vehicleregnumber,unitid,jpgfilename, snapdatetime from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+date1+time1+"' AND camerapos in ('cam1') AND snapdatetime <= '"+dateto+"'  AND vehicleregnumber='"+unitid+"' Order by snapdatetime ASC";
        	 
        	 sql = "Select vehiclecode,vehicleregnumber,unitid,jpgfilename, snapdatetime,rawfilename from smartgrid.t_jpgsnapsmartgrid where snapdatetime  between '"+datefrom+"'  AND '"+dateto+"' AND camerapos in ('cam1')    AND    vehiclecode='"+unitid+"' Order by snapdatetime ASC";
        	 System.out.println("SQL2==>"+sql);
        	         
        	}}else{
        		
        	if(request.getParameter("data")==null || request.getParameter("data1")==null){
        		System.out.println("in Date null");
        		
        	//	sql = "Select unitid,jpgfilename,rawfiledatetime, snapdatetime from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(from))+"' AND snapdatetime <= '"+dateto+"' AND category in ('"+category+"') and type in ('"+type+"')  AND jpgfilename not like  '%pod%' "+condition+" Order by snapdatetime ASC";
        		sql = "Select vehiclecode,vehicleregnumber,unitid,jpgfilename, snapdatetime,rawfilename from smartgrid.t_jpgsnapsmartgrid where snapdatetime between '"+datefrom+"' AND '"+dateto+"' AND camerapos in ('"+category+"')  AND vehiclecode ='"+type+"' Order by snapdatetime ASC ";
        		
        	}else{
        		
        	System.out.println("Inbellow else");
        		//sql = "Select unitid,jpgfilename,rawfiledatetime, snapdatetime from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+date1+time1+"' AND snapdatetime <= '"+dateto+"' AND category in ('"+category+"') and type in ('"+type+"')  AND jpgfilename not like  '%pod%' "+condition+" Order by snapdatetime ASC";
        	//sql = "Select vehicleregnumber,unitid,jpgfilename, snapdatetime from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+date1+time1+"' AND snapdatetime <= '"+dateto+"' AND camerapos in ('"+category+"') AND unitid='"+unitid+"' Order by snapdatetime ASC";
        		
        	sql = "Select vehiclecode,vehicleregnumber,unitid,jpgfilename, snapdatetime,rawfilename from smartgrid.t_jpgsnapsmartgrid where snapdatetime between '"+datefrom+"' AND '"+dateto+"' AND camerapos in ('"+category+"') AND  vehiclecode='"+unitid+"' Order by snapdatetime ASC ";
        	
        	}
        	
        	}
    		System.out.println("The sql in if==>"+sql);
    	
    		ResultSet rs = st.executeQuery(sql);
    		ResultSet rs0 = st6.executeQuery(sql);
    		//out.println("The sql is  After==>"+sql);
    		System.out.println("The sql is  After==>"+sql);
    		
    		
    		if(rs0.next()){
    			String  jpgfilename ="";
    			String  snapdatetime = "";	
    			String  rawfilename= "";
    			
    		while(rs.next()){
    		
    			
    			 // unitid = rs.getString("unitid");
    			 //unitid=rs.getString("vehicleregnumber");
    			
    			 unitid=rs.getString("vehiclecode");
    			   jpgfilename = rs.getString("jpgfilename");
    			  snapdatetime = rs.getString("snapdatetime");
    			rawfilename= rs.getString("rawfilename");
    			
    			System.out.println("Cat :- "+category);
    		
    			if(category.equalsIgnoreCase("cam1,cam2,cam3,cam4") || category.equalsIgnoreCase("cam1")|| category.equalsIgnoreCase("cam2")|| category.equalsIgnoreCase("cam3")){//out.println("http://smartgrid.mobile-eye.in/"+jpgfilename);
    				System.out.println("Cat In  :- "+category);
       			%>
       			
       			 <%-- <img  src="http://smartgrid.mobile-eye.in/<%=jpgfilename%>" width="350" height="260" /> --%>
       			 <img  src="https://s3.ap-south-1.amazonaws.com/smartgridinfra/<%=rawfilename%>" width="500" height="300" />
       			  
         		<%
    			}else{
    				%>            
           			
           			<img  src="NoImage.png"  />
             		<%
    			}
    		}
    		}else{
    			%>
       			
       			<img  src="NoImage.png"  />
         <%
    		}
    		
        	%>

        </div>
      
      
       
        <!--Custom navigation buttons on both sides-->
        <!-- <div class="group1-Wrapper">
            <a onclick="imageSlider.previous()" class="group1-Prev"></a>
            <a onclick="imageSlider.next()" class="group1-Next"></a>
        </div> -->
        <!--nav bar-->
        <div style="text-align:center;padding:20px;z-index:20;">
            <a onclick="imageSlider.previous()" class="group2-Prev"></a>
            <a id='auto' onclick="switchAutoAdvance()"></a>
            <a onclick="imageSlider.next()" class="group2-Next"></a>
        </div> 
    </div>
  </div>
 
    
    
    

    
   <%} else{
   
   
	System.out.println("ELSE OF QUERy=>");
   %> 
   
   <div align="center" style="margin-top: 50px;" >       
        <b> No Data </b>      
    </div>
   
   <%}}
catch(Exception e)
{
	System.out.println("Exception==>"+e);
	e.printStackTrace();
}
%>


    <script type="text/javascript">
        //The following script is for the group 2 navigation buttons.
        function switchAutoAdvance() {
            imageSlider.switchAuto();
            switchPlayPauseClass();
        }
        function switchPlayPauseClass() {
            var auto = document.getElementById('auto');
            var isAutoPlay = imageSlider.getAuto();
            auto.className = isAutoPlay ? "group2-Pause" : "group2-Play";
            auto.title = isAutoPlay ? "Pause" : "Play";
        }
        switchPlayPauseClass();
        
        
    </script>

 <br></br> 
 
 


  
<div align="center" id="footerdisppanel" >
      
<%@ include file="footer.jsp" %>   


 </div>   

</body>
</html>
<%-- </jsp:useBean> --%>
 
