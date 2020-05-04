<%-- <jsp:useBean id="fleetview" class="com.fleetview.beans.classes" scope="page"> --%>
<%-- <%@page contentType="text/html" %> --%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>

<%@ include file="headernew.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title>Camera Report</title>
    <link href="themes/4/js-image-slider.css" rel="stylesheet" type="text/css" />
    <script src="themes/4/js-image-slider.js" type="text/javascript"></script>
    <link href="css/generic.css" rel="stylesheet" type="text/css" />
    
<link rel="stylesheet" type="text/css" href="css/cpanel_002_popup.css"> 
<link rel="stylesheet" type="text/css" href="css/cpanel_colors.css">
<link rel="stylesheet" type="text/css" href="css/form.css" media="all">
    
<script type="text/javascript" language="javascript" src="calendar/prototype-1.js"></script>
<script type="text/javascript" language="javascript" src="calendar/prototype-base-extensions.js"></script>
<script type="text/javascript" language="javascript" src="calendar/prototype-date-extensions.js"></script>
<script type="text/javascript" language="javascript" src="calendar/behaviour.js"></script>
<script type="text/javascript" language="javascript" src="calendar/datepicker.js"></script>
<link rel="stylesheet" href="calendar/datepicker.css">
<script type="text/javascript" language="javascript" src="calendar/behaviors.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>



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
</script>




<script type="text/javascript">

function AutoRefresh( t ) {
    setTimeout("location.reload(true);", t);
 }
<%-- <%
// Set refresh, autoload time as 5 seconds
response.setIntHeader("Refresh", 5);


// Get current time
Calendar calendar = new GregorianCalendar();
String am_pm;
int hour = calendar.get(Calendar.HOUR);
int minute = calendar.get(Calendar.MINUTE);
int second = calendar.get(Calendar.SECOND);
if(calendar.get(Calendar.AM_PM) == 0)
   am_pm = "AM";
else
   am_pm = "PM";
String CT = hour+":"+ minute +":"+ second +" "+ am_pm;
out.println("Crrent Time: " + CT + "\n");
 %>--%>
/* var auto = setInterval(    function ()
{
     $('#score').load('DisplayPanel.jsp').fadeIn("slow");
}, 60000); // refresh every 5000 milliseconds */
</script>											


</head>

<%! Connection conn = null;
	Statement st = null;
	Statement st1 = null;
	Statement st2 = null;
	Statement st3 = null;
	Statement st4 = null;
	Statement st5 = null;
	Statement st6 = null;
	
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
	
	String vehno="";
%>

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
String unitid="",camerapos="";
try{
	
	String frompage = request.getParameter("frompage");
	//vehlist = session.getAttribute("VehList").toString();
	//System.out.println("The vehicle list>>>>"+vehlist);

	if(frompage!=null && frompage.equalsIgnoreCase("OS"))
	{
		String thedate = request.getParameter("data");
		String thedate1 = request.getParameter("data1");
		date1 = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(thedate));
		time1 = new SimpleDateFormat("HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(thedate));
		date2 = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(thedate1));
		time2 = new SimpleDateFormat("HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(thedate1));
	}
	else
	{
	 System.out.println("In else date");
		 date1 = request.getParameter("data");
		 date2 = request.getParameter("data1");
		 unitid= request.getParameter("unitid");
		 from= request.getParameter("from");
		 to= request.getParameter("to");
		 try{
		 fromdate= new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(from));
		 time3= new SimpleDateFormat("HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(from));
	
		camerapos= request.getParameter("camerapos");
		 todate= new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(to));
		 time4= new SimpleDateFormat("HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(to));
		 }catch(Exception e){
			 e.printStackTrace();
		 }
	 System.out.println("date1 "+date1);
	 System.out.println("date2 "+date2);
	 System.out.println("unitid "+unitid);
	 System.out.println("camerapos "+camerapos);
	 System.out.println("from "+from);
	 System.out.println("to "+to);
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

<body onload="JavaScript:AutoRefresh(30000);">
      <!-- <p>This page will refresh every 30 seconds.</p> -->
   

<div class="div1" ><font color="black" size="3" face="Arial"><b>Display Panel</b></h2>
</div>

<div align="center" >
<form id="camera_jpg_report" name="camera_jpg_report" action="imagefour.jsp" method="post" onsubmit="return datevalidate(); ">
<br>
<br>
<% 
String Unitid="All";
 %>
   <img src="images/java4s.png"><br><br>
   
</form>
</div>
<!-- <div id="score"> -->
   
   
   <%-- <font face="verdana" size="2">
Current Time :<%= new java.util.Date() %>
</font> --%>
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

 		date1= new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(default_date_3)); 
 		date2= new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(default_date_1)); 
	
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
	
    
    //Get the count of images
int count = 0;
/* String sqlcnt="";
		sqlcnt = "Select * from smartgrid.t_jpgsnapsmartgrid where unitid='10839' order by snapdatetime desc limit 1";
	
		//sqlcnt = "Select count(*) as cnt from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(from))+"' AND snapdatetime <= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(to))+"' AND camerapos in ('"+category+"')  ";
		System.out.println("Count of Images "+sqlcnt);
		//sqlcnt = "Select count(*) as cnt from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+date1+" "+time1+"' AND snapdatetime <= '"+date2+" "+time2+"' AND camerapos in ('"+category+"')  AND unitid='"+unitid+"' ";

System.out.println("Count of Images "+sqlcnt);
ResultSet rscount = st3.executeQuery(sqlcnt);
//out.println("Count of Images "+sqlcnt);
if(rscount.next())
{
	count = rscount.getInt("cnt"); //mining job 
}  */

//System.out.println("count==>"+count);	

%> 

<%//if(count > 0) {

%>
<br>
<br>
 
    
<div id="container" >
    <div id="left">
    <div id="sliderFrame"><h2 style= "font:normal 16px Arial,Helvtica,sans-serif;"><b>Location 10839</b>
       
        <div id="slider" style="border:10px solid #000;"> 
         
            <%
            String sql="";
        	
       		sql = "Select * from smartgrid.t_jpgsnapsmartgrid where unitid='10839' order by snapdatetime desc limit 1";
        		
        	System.out.println("Inbellow else");
        		//sql = "Select unitid,jpgfilename,rawfiledatetime, snapdatetime from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+date1+time1+"' AND snapdatetime <= '"+date2+time2+"' AND category in ('"+category+"') and type in ('"+type+"')  AND jpgfilename not like  '%pod%' "+condition+" Order by snapdatetime ASC";
        	//sql = "Select unitid,jpgfilename, snapdatetime from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+date1+time1+"' AND snapdatetime <= '"+date2+time2+"' AND camerapos in ('"+category+"') AND unitid='"+unitid+"' Order by snapdatetime ASC";
        	
    		System.out.println("The sql in if==>"+sql);
    		ResultSet rs = st.executeQuery(sql);
    		//ResultSet rs0 = st6.executeQuery(sql);
    		//out.println("The sql is  After==>"+sql);
    		System.out.println("The sql is  After==>"+sql);
    		//if(rs0.next()){
    		while(rs.next()){
    			
    			  unitid = rs.getString("unitid");
    			String  jpgfilename = rs.getString("jpgfilename");
    			String  snapdatetime = rs.getString("snapdatetime");
    		%>	       			
       			<img  src="http://smartgrid.mobile-eye.in/<%=jpgfilename%>" width="320" height="260" />
         
           			
           			
             
    		<% }
    		
    		
        	%>

        </div>
      
      
       
        <!--Custom navigation buttons on both sides-->
        <div class="group1-Wrapper">
            <!-- <a onclick="imageSlider.previous()" class="group1-Prev"></a>
            <a onclick="imageSlider.next()" class="group1-Next"></a> -->
        </div>
        <!--nav bar-->
        <div style="text-align:center;padding:20px;z-index:20;">
            <!-- <a onclick="imageSlider.previous()" class="group2-Prev"></a>
            <a id='auto' onclick="switchAutoAdvance()"></a>
            <a onclick="imageSlider.next()" class="group2-Next"></a> -->
        </div>
    </div>
    </div>
    <div id="right" >
    <div id="sliderFrame"><h2 style= "font:normal 16px Arial,Helvtica,sans-serif;"><b>Location 10840</b>
       
        <div id="slider1" style="border:10px solid #000;">
         
        <%    String sql1="";
        	
       		sql1 = "Select * from smartgrid.t_jpgsnapsmartgrid where unitid='10840' order by snapdatetime desc limit 1";
        		
        	System.out.println("Inbellow else");
        		//sql = "Select unitid,jpgfilename,rawfiledatetime, snapdatetime from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+date1+time1+"' AND snapdatetime <= '"+date2+time2+"' AND category in ('"+category+"') and type in ('"+type+"')  AND jpgfilename not like  '%pod%' "+condition+" Order by snapdatetime ASC";
        	//sql = "Select unitid,jpgfilename, snapdatetime from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+date1+time1+"' AND snapdatetime <= '"+date2+time2+"' AND camerapos in ('"+category+"') AND unitid='"+unitid+"' Order by snapdatetime ASC";
        	
    		System.out.println("The sql1 in if==>"+sql1);
    		ResultSet rs1 = st1.executeQuery(sql1);
    		//ResultSet rs0 = st6.executeQuery(sql);
    		//out.println("The sql is  After==>"+sql);
    		System.out.println("The sql is  After==>"+sql);
    		//if(rs0.next()){
    		while(rs1.next()){
    			
    			  unitid = rs1.getString("unitid");
    			String  jpgfilename = rs1.getString("jpgfilename");
    			String  snapdatetime = rs1.getString("snapdatetime");
    		%>	       			
       			<img  src="http://smartgrid.mobile-eye.in/<%=jpgfilename%>" width="320" height="260" />
         
           			
           			
             
    		<% } %>
           
        	

        
      
       
        <!--Custom navigation buttons on both sides-->
        <div class="group1-Wrapper">
            <!-- <a onclick="imageSlider1.previous()" class="group1-Prev"></a>
            <a onclick="imageSlider1.next()" class="group1-Next"></a> -->
        </div>
        <!--nav bar-->
        <div style="text-align:center;padding:20px;z-index:20;">
            <!-- <a onclick="imageSlider1.previous()" class="group2-Prev"></a>
            <a id='auto1' onclick="switchAutoAdvance1()"></a>
            <a onclick="imageSlider1.next()" class="group2-Next"></a> -->
        </div>
    </div>
    </div>
 
    
  </div>




 <div id="left" >
    <div id="sliderFrame"><h2 style= "font:normal 16px Arial,Helvtica,sans-serif;"><b>Location 10837</b>
       
        <div id="slider2" style="border:10px solid #000;">
         
        <%    String sql2="";
        	
       		sql2 = "Select * from smartgrid.t_jpgsnapsmartgrid where unitid='10837' order by snapdatetime desc limit 1";
        		
        	System.out.println("Inbellow else");
        		//sql = "Select unitid,jpgfilename,rawfiledatetime, snapdatetime from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+date1+time1+"' AND snapdatetime <= '"+date2+time2+"' AND category in ('"+category+"') and type in ('"+type+"')  AND jpgfilename not like  '%pod%' "+condition+" Order by snapdatetime ASC";
        	//sql = "Select unitid,jpgfilename, snapdatetime from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+date1+time1+"' AND snapdatetime <= '"+date2+time2+"' AND camerapos in ('"+category+"') AND unitid='"+unitid+"' Order by snapdatetime ASC";
        	
    		System.out.println("The sql1 in if==>"+sql2);
    		ResultSet rs2 = st2.executeQuery(sql2);
    		//ResultSet rs0 = st6.executeQuery(sql);
    		//out.println("The sql is  After==>"+sql);
    		System.out.println("The sql is  After==>"+sql2);
    		//if(rs0.next()){
    		while(rs2.next()){
    			
    			  unitid = rs2.getString("unitid");
    			String  jpgfilename = rs2.getString("jpgfilename");
    			String  snapdatetime = rs2.getString("snapdatetime");
    		%>	       			
       			<img  src="http://smartgrid.mobile-eye.in/<%=jpgfilename%>" width="320" height="260" />
         
           			
           			
             
    		<% } %>
           
        	

        
      
       
        <!--Custom navigation buttons on both sides-->
        <div class="group1-Wrapper">
            <!-- <a onclick="imageSlider1.previous()" class="group1-Prev"></a>
            <a onclick="imageSlider1.next()" class="group1-Next"></a> -->
        </div>
        <!--nav bar-->
        <div style="text-align:center;padding:20px;z-index:20;">
            <!-- <a onclick="imageSlider1.previous()" class="group2-Prev"></a>
            <a id='auto1' onclick="switchAutoAdvance1()"></a>
            <a onclick="imageSlider1.next()" class="group2-Next"></a> -->
        </div>
    </div>
    </div>
 
    
  </div>
 
 <div id="right" >
    <div id="sliderFrame"><h2 style= "font:normal 16px Arial,Helvtica,sans-serif;"><b>Location 10838</b>
       
        <div id="slider3" style="border:10px solid #000;">
         
        <%    String sql3="";
        	
       		sql3 = "Select * from smartgrid.t_jpgsnapsmartgrid where unitid='10838' order by snapdatetime desc limit 1";
        		
        	System.out.println("Inbellow else");
        		//sql = "Select unitid,jpgfilename,rawfiledatetime, snapdatetime from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+date1+time1+"' AND snapdatetime <= '"+date2+time2+"' AND category in ('"+category+"') and type in ('"+type+"')  AND jpgfilename not like  '%pod%' "+condition+" Order by snapdatetime ASC";
        	//sql = "Select unitid,jpgfilename, snapdatetime from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+date1+time1+"' AND snapdatetime <= '"+date2+time2+"' AND camerapos in ('"+category+"') AND unitid='"+unitid+"' Order by snapdatetime ASC";
        	
    		System.out.println("The sql1 in if==>"+sql3);
    		ResultSet rs3 = st3.executeQuery(sql3);
    		//ResultSet rs0 = st6.executeQuery(sql);
    		//out.println("The sql is  After==>"+sql);
    		System.out.println("The sql is  After==>"+sql3);
    		//if(rs0.next()){
    		while(rs3.next()){
    			
    			  unitid = rs3.getString("unitid");
    			String  jpgfilename = rs3.getString("jpgfilename");
    			String  snapdatetime = rs3.getString("snapdatetime");
    		%>	       			
       			<img  src="http://smartgrid.mobile-eye.in/<%=jpgfilename%>" width="320" height="260" />
         
           			
           			
             
    		<% } %>
           
        	

        
      
       
        <!--Custom navigation buttons on both sides-->
        <div class="group1-Wrapper">
            <!-- <a onclick="imageSlider1.previous()" class="group1-Prev"></a>
            <a onclick="imageSlider1.next()" class="group1-Next"></a> -->
        </div>
        <!--nav bar-->
        <div style="text-align:center;padding:20px;z-index:20;">
            <!-- <a onclick="imageSlider1.previous()" class="group2-Prev"></a>
            <a id='auto1' onclick="switchAutoAdvance1()"></a>
            <a onclick="imageSlider1.next()" class="group2-Next"></a> -->
        </div>
    </div>
    </div>
 
    
  </div>
    </div>
   
   <!-- </div> -->
   <%//} else{
   
   
	System.out.println("ELSE OF QUERy=>");
   %> 
   
   
   
   <%//} %>


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
        function switchAutoAdvance1() {
            imageSlider1.switchAuto();
            switchPlayPauseClass1();
        }
        function switchPlayPauseClass1() {
            var auto = document.getElementById('auto1');
            var isAutoPlay = imageSlider1.getAuto();
            auto.className = isAutoPlay ? "group2-Pause" : "group2-Play";
            auto.title = isAutoPlay ? "Pause" : "Play";
        }
        switchPlayPauseClass1();
        function switchAutoAdvance2() {
            imageSlider2.switchAuto();
            switchPlayPauseClass2();
        }
        function switchPlayPauseClass2() {
            var auto = document.getElementById('auto2');
            var isAutoPlay = imageSlider2.getAuto();
            auto.className = isAutoPlay ? "group2-Pause" : "group2-Play";
            auto.title = isAutoPlay ? "Pause" : "Play";
        }
        switchPlayPauseClass2();
        function switchAutoAdvance3() {
            imageSlider3.switchAuto();
            switchPlayPauseClass3();
        }
        function switchPlayPauseClass3() {
            var auto = document.getElementById('auto3');
            var isAutoPlay = imageSlider3.getAuto();
            auto.className = isAutoPlay ? "group2-Pause" : "group2-Play";
            auto.title = isAutoPlay ? "Pause" : "Play";
        }
        switchPlayPauseClass3();
    </script>

 <br></br> 
 
 
 
 
  
<%@ include file="footer.jsp" %>    
</body>
</html>
<%-- </jsp:useBean> --%>
 
