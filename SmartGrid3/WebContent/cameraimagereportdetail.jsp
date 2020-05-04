<%-- <jsp:useBean id="fleetview" class="com.fleetview.beans.classes" scope="page"> --%>
<%@page import="com.sun.org.apache.xalan.internal.xsltc.compiler.sym"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@ include file="headernew.jsp"%>
<%-- <%@ include file="Conn.jsp"%>
   <%@ page import="java.sql.*" %>
   <%@ page import="java.text.SimpleDateFormat" %> --%>
<!DOCTYPE html>
<html>
<head>
    </head>
   <!--  <link rel="stylesheet" href="https://formden.com/static/cdn/bootstrap-iso.css"> -->
   <!--  <link href="themes/4/js-image-slider.css" rel="stylesheet" type="text/css" /> -->
 <!--    <script src="themes/4/js-image-slider.js" type="text/javascript"></script> -->
 <!--    <link href="css/generic.css" rel="stylesheet" type="text/css" /> -->

<link rel="stylesheet" type="text/css" href="css/cpanel_002_popup.css"> 
<link rel="stylesheet" type="text/css" href="css/cpanel_colors.css">
<!-- <link rel="stylesheet" type="text/css" href="css/form.css" media="all"> -->
<!--     <link href="themes/4/js-image-slider.css" rel="stylesheet" type="text/css" /> -->
<script type="text/javascript" language="javascript" src="calendar/prototype-1.js"></script>
<script type="text/javascript" language="javascript" src="calendar/prototype-base-extensions.js"></script>
<script type="text/javascript" language="javascript" src="calendar/prototype-date-extensions.js"></script>
<script type="text/javascript" language="javascript" src="calendar/behaviour.js"></script>
<script type="text/javascript" language="javascript" src="calendar/datepicker.js"></script>
<link rel="stylesheet" href="calendar/datepicker.css">
<script type="text/javascript" language="javascript" src="calendar/behaviors.js"></script>
     <link type="text/css" rel="stylesheet" href="style.css" />
    <!-- <script src="themes/4/js-image-slider.js" type="text/javascript"></script> -->


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
div.absolute1 {
    position: absolute;
    left: 30px;
    width:100%;
    border:0;
}    
</style>



    
<script type="text/javascript"> 


function TableToExcel()
{
var strCopy = document.getElementById("table1").innerHTML;
alert(strCopy);
//window.clipboardData.setData("Text",strCopy);
var objExcel = new ActiveXObject ("Excel.Application");
objExcel.visible = true;
 
var objWorkbook = objExcel.Workbooks.Add;
var objWorksheet = objWorkbook.Worksheets(1);
objWorksheet.Paste;
}


function gotoExcel(elemId,frmFldId)  
{  
	      
          var obj = document.getElementById(elemId);
          var oFld = document.getElementById(frmFldId);
          console.log("obj===>"+obj);
          
          oFld.value = obj.innerHTML;
          document.camera_jpg_report1.action ="excel.jsp";
          document.forms["camera_jpg_report1"].submit();
}


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
function showFTPImage(imageName)
{	
	var url="showcameraftpimage.jsp?imageName=" +imageName;
	testwindow1 = window.open(url,"Image", "width=500,height=500");
    testwindow1.moveTo(250,100);
}
												
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
		 unitid= request.getParameter("vehreg");
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
	 System.out.println("vehreg"+unitid);
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
	 
	 
	 st11 = conn.createStatement();
	 st22 = conn.createStatement();
	 st33 = conn.createStatement();
	 st44 = conn.createStatement();
	 st55 = conn.createStatement();
	 st66 = conn.createStatement();
	 

	 System.out.println("  Date1 ==>"+date1+ "Date2 ==>"+date2);

}catch(Exception e){
	System.out.println("Exception "+e);
}
%>
<body>

<br>
<br>
<div class="div1"  align="center" style="margin-bottom: 10px;" ><font color="white" size="3" face="Arial"><b>Camera Detail Report</b></font>
</div>

<div align="center">

<form  style="height: 20px;"   id="camera_jpg_report" name="camera_jpg_report" action="cameraimagereportdetail.jsp" method="get" onsubmit="return datevalidate1(); ">
<table  style="width: 80%;">
	<tr>

	<td>
			 <div align="center"><font color="white" size="2" face="Arial"> <b>From:</b>
			 <% 
			 System.out.println("Date1==>"+date1);
			 System.out.println("Date1==>"+date2);
			 %>
		
			<% 
			String from1="",to1="";
			if(request.getParameter("data")==null || request.getParameter("data1")==null)
			{ 
				
			from1=from;	
			to1=to;
				
			}
			else
			{	
				
				
			try
			{
		from1=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(date1+time1)) ; 
		to1=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(date2+time2)) ; 
			}
			catch(Exception e)
			{
				from1=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(date1+time1)) ; 
				to1=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(date2+time2)) ; 
			}
		
			
			}
			%>
			
			
			<font color="black">	<input type="text" id="MdateF" name="from"  value="<%=from1%>"  class="datetimepicker" style="width: 135px;"    readonly/></font></font></div>
			
			
			
		
		
		</td>  
		
		
 		<td style="width: 20px"></td> 
  			  <td>
			 <div align="left"><font color="white" size="2" face="Arial"> <b>To:</b>
		
		
	 <font color="black">
	 <input type="text" id="MdateT" name="to"  value="<%=to1%>"  class="datetimepicker" style="width: 135px;"    readonly/>   </font> </font></div>
		</td> 

	


	
	
	<td align =left>
	<div align="left"><font color="white" size="2" face="Arial"> <b>Category:</b>

<font color="black">
	<select name="cat" class="element select medium" style="width: 80px" id="cat" >
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
	
	<%-- <% if(category.equals("cam1,cam2,cam3,cam4")){%>
	<option  value="cam1,cam2,cam3,cam4" selected="selected" >cam1,cam2,cam3,cam4</option>
	<% } else{%>
	<option  value="cam1,cam2,cam3,cam4" >cam1,cam2,cam3,cam4</option>
	<%} %> --%>
	</select>
	</font>
	</font>
	</div>
	</td> 
		
		 <td align =left> 
	<div align="left"><font color="white" size="2" face="Arial"> <b>Location:</b>
	<font color="black">
	<select name="vehreg" class="element select medium" style="width: 130px" id="type" > 
	<%
	
	 String type="";
	String typ1="";
	//type= request.getParameter("unitid");
	
	type= request.getParameter("vehreg");
	vehlist = session.getAttribute("vehlist").toString(); 
	
	System.out.println("Type="+type); 
	//smartgrid.t_jpgsnapsmartgrid
	
	
		String company = session.getAttribute("company").toString();
	String typ = "";
	String vehcode="";
	String typnw="";
	//String sqlcat1 = "Select DISTINCT(unitid) from smartgrid.t_jpgsnapsmartgrid order by unitid ASC";
	
	
   String vehregvehcode="";
	
	String loc="";
	
	
	//String sqlcat1 ="select distinct(VehicleRegNumber),VehicleCode  from db_gps.t_vehicledetails where ownername  like '%"+company+"%'  and status='-' order by VehicleRegNumber ";
	String sqlcat1 ="select distinct(VehicleRegNumber),VehicleCode from db_gps.t_vehicledetails where vehiclecode in "+vehlist+"";// ownername  like '%"+company+"%'   and description='SmartGrid' and status='-'"; 
	ResultSet rstcat1 = st5.executeQuery(sqlcat1);
	System.out.println("sql type "+sqlcat1);
	while(rstcat1.next())
	{	
		typ = rstcat1.getString("VehicleCode") ;
		if(typ.equals("-")){
			typnw="Other";
		}else
			typnw = rstcat1.getString("VehicleRegNumber") ;
            vehcode=rstcat1.getString("VehicleCode");
			
		if(null != type)
			{
			%>
			<option value="<%=vehcode%>" <% if(type.equals(typ)){loc=typnw;  %>Selected<% } %>><%=typnw%></option> 
			<%
			}else
			{
				%> <option  value="<%=vehcode%>" ><%=typnw %></option> <%
				type=typnw;
			}
			
	} 
	 %>
	</select>
	</font>
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
		sqlcnt = "Select count(*) as cnt from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(from))+"' AND vehiclecode='"+unitid+"' ";
	}
else{
	// sqlcnt = "Select count(*) as cnt from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+date1+" "+time1+"' AND snapdatetime <= '"+date2+" "+time2+"' AND jpgfilename not like  '%pod%' "+condition+" ";
	 sqlcnt = "Select count(*) as cnt from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+date1+" "+time1+"' AND vehiclecode='"+unitid+"' ";
}
}else{
	if(request.getParameter("data")==null || request.getParameter("data1")==null ){
		
		System.out.println("in Date null category:-"+category);
		System.out.println("in Date null category from:-"+from);
		System.out.println("in Date null category to:-"+to);
		if(category.equals("cam1,cam2,cam3,cam4"))
		{
			sqlcnt = "Select count(*) as cnt from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(from))+"' AND snapdatetime <= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(to))+"' AND camerapos in ('cam1','cam2','cam3','cam4') AND vehiclecode='"+unitid+"'  ";
		System.out.println("sqlcnt==>"+sqlcnt);
		}
		else
		{
		//sqlcnt = "Select count(*) as cnt from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(from))+"' AND snapdatetime <= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(to))+"' AND category in ('"+category+"') and type in ('"+type+"')  AND jpgfilename not like  '%pod%' "+condition+" ";
		sqlcnt = "Select count(*) as cnt from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(from))+"' AND snapdatetime <= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(to))+"' AND camerapos in ('"+category+"')  AND vehiclecode='"+unitid+"' ";
		
		System.out.println("sqlcnt==>"+sqlcnt);
		}
		
		System.out.println("Count of Images "+sqlcnt);
	}else{
		System.out.println("Inelse");
		//sqlcnt = "Select count(*) as cnt from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(from))+"' AND snapdatetime <= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(to))+"' AND category in ('"+category+"') and type in ('"+type+"')  AND jpgfilename not like  '%pod%' "+condition+" ";
		//sqlcnt = "Select count(*) as cnt from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+date1+" "+time1+"' AND snapdatetime <= '"+date2+" "+time2+"' AND category in ('"+category+"') and type in ('"+type+"')  AND jpgfilename not like  '%pod%' "+condition+" ";
	if(category.equals("cam1,cam2,cam3,cam4") || category.equals("cam1") || category.equals("cam2") || category.equals("cam3") || category.equals("cam4"))
		{
			//sqlcnt = "Select count(*) as cnt from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(from))+"' AND snapdatetime <= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(to))+"' AND camerapos in ('cam1','cam2','cam3','cam4')  ";
		System.out.println("in category");
		sqlcnt = "Select count(*) as cnt from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+date1+" "+time1+"' AND snapdatetime <= '"+date2+" "+time2+"' AND camerapos in ('"+category+"')  AND vehiclecode='"+unitid+"' ";
		
		}
		
	else
		
	{	

		System.out.println(from);
		System.out.println(to);
	
	String f1=	new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(from));
	String f2=	new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(to));
	System.out.println("f1==>"+f1);
	System.out.println("f2==>"+f2);
	
	
	
		sqlcnt = "Select count(*) as cnt from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+f2+"' AND snapdatetime <= '"+f2+"' AND camerapos in ('"+category+"')  AND vehiclecode='"+unitid+"' ";

	
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
 <table  style="width: 70%;">
<tr style="background-color: white;">
<td align = "right" colspan="8" style="background-color: white;"><div align="right" style="background-color: white;"><font size="2" face="Arial" ><%-- <a href="CameraImageReport.jsp?data=<%=date1+time1 %>&data1=<%= date2+time2%>&VehNo1=<%= VehNo1%>&category=<%=category %>&type=<%=type %>" target="_blank" >Detailed Report</a> --%></font></div></td>
</tr>
</table>
<table  style="width: 70%;">


<%-- <tr >
<td align="right" ><div align="right" style="background-color: white;"><font size="2" face="Arial" color="black"><a href="CameraImageReport.jsp?data=<%=date1+time1 %>&data1=<%= date2+time2%>&category=<%=category %>&<%=type%>" target="_blank" >Detailed Report</a></font></div></td>
</tr> --%>

<tr>






		<td>
			 <div align="center"><font color="white" size="2" face="Arial"> <b>From:</b>
			 	<% if(request.getParameter("data")==null || request.getParameter("data1")==null){ %>
			 	<%=from%>
			 	<%}else{ %>
			 	<%= new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(date1+time1))  %></font>
			 	<%} %>
			 </div>
		</td>
		<td>
			 <div align="left"><font color="white" size="2" face="Arial"> <b>To:</b>
			 <% if(request.getParameter("data")==null || request.getParameter("data1")==null){ %>
			 <%=to%>
			 <%}else{ %>
			 <%= new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(date2+time2)) %></font>
			 <%} %>
			 </div>
		</td>
		
		<td align =left>
			<div align="left"><font color="white" size="2" face="Arial"> <b>Location:</b>
			<%=loc %><%-- <%=type %> --%></font>
			 </div>
		</td>
		<td align =left>
			<div align="left"><font color="white" size="2" face="Arial"> <b>Category:</b>
		<%=category%></font>
			 </div>
			
			
		<td align =left>
			<div align="left"><font color="white" size="2" face="Arial"> <b>Total:</b>
			<%=count %></font>
			 </div>
		</td>
		

</tr>
</table>
</div>
 <br></br>
 <br></br>
 
 <form    id="camera_jpg_report1" name="camera_jpg_report1" action="" method="post" >
 
 
 

 
 
 
 <div style="width:90%;"  id="table1" class="absolute1" align="center">
 <!--  <a href="#" style="font-weight: bold; color: black; " onclick="gotoExcel('table1','tableHTML');">
                           <img src="images/excel.jpg" width="15px" height="15px" style="border-style: none"></img></a> -->
 

 <table class="sortable" style="width: 70%" >
 
 
			<tr>
			<th width ="2%">Sr No</th>
			<th width ="15%">File Name</th>
			<th width ="10%">File Date and Time</th>
			<th width ="5%">Image</th>
		
			<!-- <th>Cabin Others</th>
			<th>Road Others</th> -->
			
			</tr>
 
 
 <% 
 
 
 String sql="";
	if(category.equals("cam1,cam2,cam3,cam4") ){
		//category="Cabin";
	System.out.println("Hi");
	if(request.getParameter("data")==null || request.getParameter("data1")==null){
		sql = "Select vehicleregnumber,rawfilename,unitid,jpgfilename, snapdatetime from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(from))+"' AND camerapos in ('cam1','cam2','cam3','cam4') AND snapdatetime <= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(to))+"'  AND vehiclecode='"+unitid+"' Order by snapdatetime ASC";
	}
	else{
		
	
		// sql = "Select unitid,jpgfilename,rawfiledatetime, snapdatetime from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+date1+time1+"' AND snapdatetime <= '"+date2+time2+"'  AND jpgfilename not like  '%pod%' "+condition+" Order by snapdatetime ASC";	
	 sql = "Select vehicleregnumber,rawfilename,unitid,jpgfilename, snapdatetime from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+date1+time1+"' AND camerapos in ('cam1') AND snapdatetime <= '"+date2+time2+"'  AND unitid='"+unitid+"' Order by snapdatetime ASC";
	         
	}}else{
		
	if(request.getParameter("data")==null || request.getParameter("data1")==null){
		System.out.println("in Date null");
	//	sql = "Select unitid,jpgfilename,rawfiledatetime, snapdatetime from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(from))+"' AND snapdatetime <= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(to))+"' AND category in ('"+category+"') and type in ('"+type+"')  AND jpgfilename not like  '%pod%' "+condition+" Order by snapdatetime ASC";
		sql = "Select vehicleregnumber,rawfilename,unitid,jpgfilename, snapdatetime from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(from))+"' AND snapdatetime <= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(to))+"' AND camerapos in ('"+category+"')  AND vehiclecode ='"+type+"' Order by snapdatetime ASC";
		
	}else{
		
	System.out.println("Inbellow else");
		//sql = "Select unitid,jpgfilename,rawfiledatetime, snapdatetime from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+date1+time1+"' AND snapdatetime <= '"+date2+time2+"' AND category in ('"+category+"') and type in ('"+type+"')  AND jpgfilename not like  '%pod%' "+condition+" Order by snapdatetime ASC";
	sql = "Select vehicleregnumber,rawfilename,unitid,jpgfilename, snapdatetime from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+date1+time1+"' AND snapdatetime <= '"+date2+time2+"' AND camerapos in ('"+category+"') AND vehiclecode='"+unitid+"' Order by snapdatetime ASC";
		}
	
	}
	System.out.println("The sql in if==>"+sql);
 int i=1;
	ResultSet rs = st.executeQuery(sql);
	ResultSet rs0 = st6.executeQuery(sql);
	if(rs0.next())
	{
		
		while(rs.next())
		{
		
	    %>		
		<tr>
		<td>
		<div align="right">
		<%=i %>
		</div>
		</td>
		
		<td style="text-align: right;font:normal 13px Arial,Helvtica,sans-serif;">
		<div align="left">
		<%=rs.getString("jpgfilename") %>
		</div>
		</td>
		<td>
		<div align="right">
		<%= new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rs.getString("snapdatetime")))%>
		</div>
		</td>
	
		
		
		 <td>
			    	<a href="#!" onclick="showFTPImage('<%=rs.getString("rawfilename") %>');"><img  src="https://s3.ap-south-1.amazonaws.com/smartgridinfra/<%=rs.getString("rawfilename")%>" width="50" height="50" /></a>        			    
			    </td>
	
		</tr>
			
	  <% 		
		
		i++;
		}
		
		
	}
	
	
	
		   
		
	   
	   
	  
	
	
	 
	




}
else {%>

	 <div align="center" style="margin-top: 30 px" >
	 <br><br>       
<font color="white">   <b> No data </b></font>     
</div>


<%}}
catch(Exception e)
{
e.printStackTrace();	
}

%>		
		
		
 
   
 </table>
  <%@ include file="footer.jsp" %> 
 </div>

  </form>
<!--  </form> -->

 
 
 
 
 

 
 
 

<%-- <div id="container"  >
    <div id="left">
    <h2 style= "font:normal 16px Arial,Helvtica,sans-serif; margin-bottom: 10px;"><b>Camera 1</b></h2>
    <div id="sliderFrame"><h2 style= "font:normal 16px Arial,Helvtica,sans-serif;visibility: hidden;"><b>label1</b></h2>
       
    
        <div  id="slider" style="outline:5px solid #000;"> 
       
            <%
            String sql="";
        	if(category.equals("cam1,cam2,cam3,cam4") ){
        		//category="Cabin";
        	System.out.println("Hi");
        	if(request.getParameter("data")==null || request.getParameter("data1")==null){
        		sql = "Select unitid,jpgfilename, snapdatetime from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(from))+"' AND camerapos in ('cam1') AND snapdatetime <= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(to))+"'  AND unitid='"+unitid+"' Order by snapdatetime ASC";
        	}
        	else{
        		
        	
        		// sql = "Select unitid,jpgfilename,rawfiledatetime, snapdatetime from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+date1+time1+"' AND snapdatetime <= '"+date2+time2+"'  AND jpgfilename not like  '%pod%' "+condition+" Order by snapdatetime ASC";	
        	 sql = "Select unitid,jpgfilename, snapdatetime from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+date1+time1+"' AND camerapos in ('cam1') AND snapdatetime <= '"+date2+time2+"'  AND unitid='"+unitid+"' Order by snapdatetime ASC";
        	         
        	}}else{
        		
        	if(request.getParameter("data")==null || request.getParameter("data1")==null){
        		System.out.println("in Date null");
        	//	sql = "Select unitid,jpgfilename,rawfiledatetime, snapdatetime from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(from))+"' AND snapdatetime <= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(to))+"' AND category in ('"+category+"') and type in ('"+type+"')  AND jpgfilename not like  '%pod%' "+condition+" Order by snapdatetime ASC";
        		sql = "Select unitid,jpgfilename, snapdatetime from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(from))+"' AND snapdatetime <= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(to))+"' AND camerapos in ('"+category+"')  AND unitid ='"+type+"' Order by snapdatetime ASC";
        		
        	}else{
        		
        	System.out.println("Inbellow else");
        		//sql = "Select unitid,jpgfilename,rawfiledatetime, snapdatetime from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+date1+time1+"' AND snapdatetime <= '"+date2+time2+"' AND category in ('"+category+"') and type in ('"+type+"')  AND jpgfilename not like  '%pod%' "+condition+" Order by snapdatetime ASC";
        	sql = "Select unitid,jpgfilename, snapdatetime from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+date1+time1+"' AND snapdatetime <= '"+date2+time2+"' AND camerapos in ('"+category+"') AND unitid='"+unitid+"' Order by snapdatetime ASC";
        		}
        	
        	}
    		System.out.println("The sql in if==>"+sql);
    	
    		ResultSet rs = st.executeQuery(sql);
    		ResultSet rs0 = st6.executeQuery(sql);
    		//out.println("The sql is  After==>"+sql);
    		System.out.println("The sql is  After==>"+sql);
    		if(rs0.next()){
    			
    			
    		while(rs.next()){
    		
    			
    			  unitid = rs.getString("unitid");
    			String  jpgfilename = rs.getString("jpgfilename");
    			String  snapdatetime = rs.getString("snapdatetime");
    		
    			if(category.equals("cam1,cam2,cam3,cam4") || category.equals("cam1")){//out.println("http://smartgrid.mobile-eye.in/"+jpgfilename);
       			%>
       			
       			<img  src="http://smartgrid.mobile-eye.in/<%=jpgfilename%>" width="350" height="260" />
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
      
      
       
      
        <div style="text-align:center;padding:20px;z-index:20;">
            <a onclick="imageSlider.previous()" class="group2-Prev"></a>
            <a id='auto' onclick="switchAutoAdvance()"></a>
            <a onclick="imageSlider.next()" class="group2-Next"></a>
        </div>
    </div>
  </div>
 
    <div id="right" >
   
   <h2 style= "font:normal 16px Arial,Helvtica,sans-serif;"><b>Camera 2</b></h2>
    <div id="sliderFrame"><h2 style= "font:normal 16px Arial,Helvtica,sans-serif; visibility: hidden; margin-bottom: 10px;"><b>Camera 2</b></h2>
       
        <div id="slider1" style="outline:5px solid #000;">
       
            <%
            String sql1="";
        	if(category.equals("cam1,cam2,cam3,cam4")){
        		//category="Road";
        	System.out.println("Hi1");
        	if(request.getParameter("data")==null || request.getParameter("data1")==null){
        		sql1 = "Select unitid,jpgfilename, snapdatetime from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(from))+"' AND camerapos in ('cam2') AND snapdatetime <= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(to))+"'  AND unitid='"+unitid+"' Order by snapdatetime ASC";
        	}
        	else{
        		// sql = "Select unitid,jpgfilename,rawfiledatetime, snapdatetime from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+date1+time1+"' AND snapdatetime <= '"+date2+time2+"'  AND jpgfilename not like  '%pod%' "+condition+" Order by snapdatetime ASC";	
        	 sql1 = "Select unitid,jpgfilename, snapdatetime from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+date1+time1+"' AND camerapos in ('cam2') AND snapdatetime <= '"+date2+time2+"'  AND unitid='"+unitid+"' Order by snapdatetime ASC";
        	}}else{
        		
        	if(request.getParameter("data")==null || request.getParameter("data1")==null){
        		System.out.println("in Date null1");
        	//	sql = "Select unitid,jpgfilename,rawfiledatetime, snapdatetime from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(from))+"' AND snapdatetime <= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(to))+"' AND category in ('"+category+"') and type in ('"+type+"')  AND jpgfilename not like  '%pod%' "+condition+" Order by snapdatetime ASC";
        		sql1 = "Select unitid,jpgfilename, snapdatetime from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(from))+"' AND snapdatetime <= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(to))+"' AND camerapos in ('"+category+"') AND unitid ='"+type+"' Order by snapdatetime ASC";
        		
        	}else{
        		
        	System.out.println("Inbellow else1");
        		//sql = "Select unitid,jpgfilename,rawfiledatetime, snapdatetime from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+date1+time1+"' AND snapdatetime <= '"+date2+time2+"' AND category in ('"+category+"') and type in ('"+type+"')  AND jpgfilename not like  '%pod%' "+condition+" Order by snapdatetime ASC";
        	sql1 = "Select unitid,jpgfilename, snapdatetime from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+date1+time1+"' AND snapdatetime <= '"+date2+time2+"' AND camerapos in ('"+category+"')  AND unitid='"+unitid+"' Order by snapdatetime ASC";
        		}
        	
        	}
    		System.out.println("The sql cam2 in if==>"+sql1);
    		ResultSet rs1 = st.executeQuery(sql1);
    		ResultSet rs11 = st6.executeQuery(sql1);
    		//out.println("The sql is  After==>"+sql1);
    		System.out.println("The sql is cam2 After==>"+sql1);
    		if(rs11.next()){
    			
    		while(rs1.next()){
    		
    			String  unitid1 = rs1.getString("unitid");
    			String  jpgfilename1 = rs1.getString("jpgfilename");
    			String  snapdatetime1 = rs1.getString("snapdatetime");
    			if(category.equals("cam1,cam2,cam3,cam4") || category.equals("cam2")){//out.println("http://smartgrid.mobile-eye.in/"+jpgfilename1);
       			%>
       			
       			
       			<img  src="http://smartgrid.mobile-eye.in/<%=jpgfilename1%>" width="350" height="260" />
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
      
      
       
      
        <div style="text-align:center;padding:20px;z-index:20;">
            <a onclick="imageSlider1.previous()" class="group2-Prev"></a>
            <a id='auto1' onclick="switchAutoAdvance1()"></a>
            <a onclick="imageSlider1.next()" class="group2-Next"></a>
        </div>
    </div>
    </div>
    <div id="left" class="">
    <h2 style= "font:normal 16px Arial,Helvtica,sans-serif;"><b>Camera 3</b></h2>
    <div id="sliderFrame"><h2 style= "font:normal 16px Arial,Helvtica,sans-serif;visibility: hidden;"><b>Camera 3</b></h2>
       
        <div id="slider2" style="outline:5px solid #000;"> 
         
            <%
            String sql3="";
        	if(category.equals("cam1,cam2,cam3,cam4")){
        		//category="Cabin";
        	System.out.println("Hi");
        	if(request.getParameter("data")==null || request.getParameter("data1")==null){
        		sql3 = "Select unitid,jpgfilename, snapdatetime from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(from))+"' AND camerapos in ('cam3') AND snapdatetime <= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(to))+"'  AND unitid='"+unitid+"' Order by snapdatetime ASC";
        	}
        	else{
        		// sql = "Select unitid,jpgfilename,rawfiledatetime, snapdatetime from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+date1+time1+"' AND snapdatetime <= '"+date2+time2+"'  AND jpgfilename not like  '%pod%' "+condition+" Order by snapdatetime ASC";	
        	 sql3 = "Select unitid,jpgfilename, snapdatetime from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+date1+time1+"' AND camerapos in ('cam3') AND snapdatetime <= '"+date2+time2+"'  AND unitid='"+unitid+"' Order by snapdatetime ASC";
        	}}else{
        		
        	if(request.getParameter("data")==null || request.getParameter("data1")==null){
        		System.out.println("in Date null");
        	//	sql = "Select unitid,jpgfilename,rawfiledatetime, snapdatetime from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(from))+"' AND snapdatetime <= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(to))+"' AND category in ('"+category+"') and type in ('"+type+"')  AND jpgfilename not like  '%pod%' "+condition+" Order by snapdatetime ASC";
        		sql3 = "Select unitid,jpgfilename, snapdatetime from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(from))+"' AND snapdatetime <= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(to))+"' AND camerapos in ('"+category+"')  AND unitid ='"+type+"' Order by snapdatetime ASC";
        		
        	}else{
        		
        	System.out.println("Inbellow else");
        		//sql = "Select unitid,jpgfilename,rawfiledatetime, snapdatetime from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+date1+time1+"' AND snapdatetime <= '"+date2+time2+"' AND category in ('"+category+"') and type in ('"+type+"')  AND jpgfilename not like  '%pod%' "+condition+" Order by snapdatetime ASC";
        	sql3 = "Select unitid,jpgfilename, snapdatetime from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+date1+time1+"' AND snapdatetime <= '"+date2+time2+"' AND camerapos in ('"+category+"')  AND unitid='"+unitid+"' Order by snapdatetime ASC";
        		}
        	
        	}
    		System.out.println("The sql3 in if==>"+sql3);
    		ResultSet rs4 = st.executeQuery(sql3);
    		ResultSet rs41 = st6.executeQuery(sql3);
    		//out.println("The sql is  After==>"+sql3);
    		System.out.println("The sql is  After==>"+sql3);
    		if(rs41.next()){
  
    		while(rs4.next()){
    		
    			String  unitid1 = rs4.getString("unitid");
    			String  jpgfilename1 = rs4.getString("jpgfilename");
    			String  snapdatetime1 = rs4.getString("snapdatetime");
    			System.out.println("jpgfilename1:-"+jpgfilename1);
    			if(category.equals("cam1,cam2,cam3,cam4") || category.equals("cam3")){
    			
    			//out.println("http://smartgrid.mobile-eye.in/"+jpgfilename1);
       			%>
       			
       			<img  src="http://smartgrid.mobile-eye.in/<%=jpgfilename1%>" width="350" height="260" />
       			<input type="text" name="abc" id="abc" value="http://smartgrid.mobile-eye.in/<%=jpgfilename1%>"></input>
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
            <a onclick="imageSlider2.previous()" class="group1-Prev"></a>
            <a onclick="imageSlider2.next()" class="group1-Next"></a>
        </div> -->
        <!--nav bar-->
        <div style="text-align:center;padding:20px;z-index:20;">
            <a onclick="imageSlider2.previous()" class="group2-Prev"></a>
            <a id='auto2' onclick="switchAutoAdvance2()"></a>
            <a onclick="imageSlider2.next()" class="group2-Next"></a>
        </div>
    </div>
    </div>
    <div id="right">
    <h2 style= "font:normal 16px Arial,Helvtica,sans-serif;"><b>Camera 4</b></h2>
    <div id="sliderFrame"><h2 style= "font:normal 16px Arial,Helvtica,sans-serif; visibility: hidden;"><b>Camera 4</b></h2>
       
        <div id="slider3" style="outline:5px solid #000;">
         
            <%
            String sql4="";
        	if(category.equals("cam1,cam2,cam3,cam4")){
        		//category="Road";
        	System.out.println("Hi1");
        	if(request.getParameter("data")==null || request.getParameter("data1")==null){
        		sql4 = "Select unitid,jpgfilename, snapdatetime from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(from))+"' AND camerapos in ('cam4') AND snapdatetime <= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(to))+"'  AND unitid='"+unitid+"' Order by snapdatetime ASC";
        	}
        	else{
        		// sql = "Select unitid,jpgfilename,rawfiledatetime, snapdatetime from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+date1+time1+"' AND snapdatetime <= '"+date2+time2+"'  AND jpgfilename not like  '%pod%' "+condition+" Order by snapdatetime ASC";	
        	 sql4 = "Select unitid,jpgfilename, snapdatetime from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+date1+time1+"' AND camerapos in ('cam4') AND snapdatetime <= '"+date2+time2+"'  AND unitid='"+unitid+"' Order by snapdatetime ASC";
        	}}else{
        		
        	if(request.getParameter("data")==null || request.getParameter("data1")==null){
        		System.out.println("in Date null1");
        	//	sql = "Select unitid,jpgfilename,rawfiledatetime, snapdatetime from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(from))+"' AND snapdatetime <= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(to))+"' AND category in ('"+category+"') and type in ('"+type+"')  AND jpgfilename not like  '%pod%' "+condition+" Order by snapdatetime ASC";
        		sql4 = "Select unitid,jpgfilename, snapdatetime from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(from))+"' AND snapdatetime <= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(to))+"' AND camerapos in ('"+category+"')  AND unitid ='"+type+"' Order by snapdatetime ASC";
        		
        	}else{
        		
        	System.out.println("Inbellow else1");
        		//sql = "Select unitid,jpgfilename,rawfiledatetime, snapdatetime from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+date1+time1+"' AND snapdatetime <= '"+date2+time2+"' AND category in ('"+category+"') and type in ('"+type+"')  AND jpgfilename not like  '%pod%' "+condition+" Order by snapdatetime ASC";
        	sql4 = "Select unitid,jpgfilename, snapdatetime from smartgrid.t_jpgsnapsmartgrid where snapdatetime >= '"+date1+time1+"' AND snapdatetime <= '"+date2+time2+"' AND camerapos in ('"+category+"') AND unitid='"+unitid+"' Order by snapdatetime ASC";
        		}
        	
        	}
    		System.out.println("The sql in if==>"+sql4);
    		ResultSet rs5 = st.executeQuery(sql4);
    		ResultSet rs6 = st6.executeQuery(sql4);
    		//out.println("The sql is  After==>"+sql4);
    		System.out.println("The sql is  After==>"+sql4);
    		if(rs6.next()){
    		while(rs5.next()){
    			
    			String  unitid3 = rs5.getString("unitid");
    			String  jpgfilename3 = rs5.getString("jpgfilename");
    			String  snapdatetime3 = rs5.getString("snapdatetime");
    			if(category.equals("cam1,cam2,cam3,cam4") || category.equals("cam4")){
    			
    				//out.println("http://smartgrid.mobile-eye.in/"+jpgfilename3);
       			%>
       			
       			<img  src="http://smartgrid.mobile-eye.in/<%=jpgfilename3%>" width="350" height="260"  />
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
       <!--  <div class="group1-Wrapper">
            <a onclick="imageSlider3.previous()" class="group1-Prev"></a>
            <a onclick="imageSlider3.next()" class="group1-Next"></a>
        </div> -->
        <!--nav bar-->
        <div style="text-align:center;padding:20px;z-index:20;">
            <a onclick="imageSlider3.previous()" class="group2-Prev"></a>
            <a id='auto3' onclick="switchAutoAdvance3()"></a>
            <a onclick="imageSlider3.next()" class="group2-Next"></a>
        </div>
    </div>
    </div>
  </div>

    
   <%} else{
   
   
	System.out.println("ELSE OF QUERy=>");
   %> 
   
   <div align="center" style="margin-top: 30 px" >       
        <b> No data </b>      
    </div>
   
   <%}}
catch(Exception e)
{
	System.out.println("Exception==>"+e);
	e.printStackTrace();
}
%> --%>

<%-- <% }}
catch(Exception e)
{
	
}

%> --%>
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

<!--  <br></br>  -->
 
 





</body>

</html>

 

<%-- </jsp:useBean> --%>
 