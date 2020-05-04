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
    left: 30px;
    width:100%;
    border:0;
}    
</style>
    

<head>


   <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>  
   <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>  
   <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script> 


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Smart Grid Report</title>
</head>
<body>

	 <script type="text/javascript">
       $(function() {
               $("#startdate").datepicker({ dateFormat: "dd-M-yy" }).val()
               $("#enddate").datepicker({ dateFormat: "dd-M-yy" }).val()
       });

   </script>  

<script type="text/javascript">


function chk()
{

	
	
	var chkf="";
	var chkt="";
	var objFromDate = document.getElementById("startdate").value;
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
    var objToDate = document.getElementById("enddate").value;
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
//         else if(date1 > currentDate)
//         {
//             alert("From Date should be less than current date");
//             return false; 
//         }
//         else if(date2 > currentDate) 
//         {
//             alert("To Date should be less than current date");
//             return false; 
//         }

        return true;
	
}


function birt()

   {
	
	var a=chk();
	//alert("GetValid------>"+a);
	if(a==true)
		{
	
 	 var Status=document.getElementById("loc").value;

//alert("Location :- "+Status);
	 
	 var date1= document.getElementById("startdate").value;
	 


	 
	var date2= document.getElementById("enddate").value;
	
	var company=document.getElementById("company").value;
	

//alert("Company :- "+company);

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


	
// 	formattedDate1=formattedDate1+"00:00:00";
	
	//alert("Formated Date 1:- "+formattedDate1);
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
	
	//alert("Formated Date 2:- "+formattedDate2);
	
// 	formattedDate2=formattedDate2+"23:59:59";


	document.getElementById("myIframe").src="http://twtech.in/birt/frameset?__report=Advertiserdetails123.rptdesign&Vehiclecode="+Status+"&Date1="+formattedDate1+"&Date2="+formattedDate2+"&Date3="+date1+"&Date4="+date2+"&company="+company+"&__showtitle=false";
	

	document.getElementById("reportData").style.display="";
	document.getElementById("footer").style.display="none";
	return true;
	}
	else
		{
		return true;
		}
	
  }

<%!
String datex1, datex2, data1, data2;
%>
<%
String ddx = request.getQueryString();
	
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
		
		datex1 = datex2 = new SimpleDateFormat("dd-MMM-yyyy")
		.format(new java.util.Date());
data1 = data2 = new SimpleDateFormat("yyyy-MM-dd")
		.format(new java.util.Date());

Calendar c = Calendar.getInstance();   // this takes current date
c.set(Calendar.DAY_OF_MONTH, 1);
System.out.println(" current date "+new SimpleDateFormat("dd-MMM-yyyy").format(c.getTime())); 
datex1=new SimpleDateFormat("dd-MMM-yyyy").format(c.getTime());
		
		
	}

	
System.out.println(" datex1 "+datex1+" datex2 "+datex2);

data1 =  new SimpleDateFormat("yyyy-MM-dd")
.format(new java.util.Date());

System.out.println("data1:-"+data1);
System.out.println("data2:-"+data2);

%>

</script>
<%
Connection conn=null;
Class.forName("com.mysql.jdbc.Driver").newInstance();
conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
Statement st=conn.createStatement();


%>




<% 





String TypeofUser=session.getAttribute("TypeofUser").toString();



String typevalue=session.getAttribute("typevalue").toString();




String company = session.getAttribute("company").toString();
System.out.println("Comp :- "+company);
String loc=request.getParameter("location");
String dat="",dat1="";
//loc="market main";
System.out.println("Location :- "+loc);

if(loc==null || loc==" " || loc.equals("null") || loc=="null")
{
	loc="All";
}
else
{
	loc=request.getParameter("location");
	dat=request.getParameter("dispdate");
	if(dat==null || dat==" " || dat.equals("null") || dat=="null")
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
		/* String dt = new SimpleDateFormat("dd-MMM-yyyy")
		.format(new SimpleDateFormat("yyyy-MM-dd")
				.parse(dat));
		
		dt=dt+ " 00:00:00"; */
		String dt2=dat;
		SimpleDateFormat dFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat dFormatFinal = new SimpleDateFormat("dd-MMM-yyyy");
		 Date date = dFormat.parse(dat);
		 dt2 = dFormatFinal.format(date);
	dat1=dt2;
	
	datex1=dt2;
	datex2=dat1;
	}
}

%>

<input type="hidden" name="company" id="company" value="<%=company %>"/>
<% 
//String Vehiclecode = session.getAttribute("VehicleCode").toString();



String query="";
String Vehicleregno1="";
String Vehiclecode1="";
String status="";


%>








<!-- <form> -->



<div align="center">
</div>
 <div align="center"   ><font size="3">
				<br>
					<b>Advertise Detail Report</b>
				</font>
			<br><br>
			

			 		
			 <table  style="width: 50%;">
	<tr>
	

	
	
	&nbsp;&nbsp;
	
	<td><font color="red"></font> <font color="black" size="2">From</font>
	 <input type="text" id="startdate" value=<%=datex1%>   style="width: 87px; height:25px; border: 1px solid black; font: normal 13px Arial, Helvetica, sans-serif; color: #000000; border-color: activeborder;"/>
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
      <td> <font color="red"></font> <font color="black" size="2">To</font>
      <input type="text" id="enddate" value=<%=datex2%>   style="width: 87px; height:25px; border: 1px solid black; font: normal 13px Arial, Helvetica, sans-serif; color: #000000; border-color: activeborder;"/>
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
	 <font color="red"></font> <font color="black" size="2">Location</font>
		 <select   class=""   id="loc" name="loc" style="width: 120px; height:25px; border: 1px solid black; font: normal 13px Arial, Helvetica, sans-serif; color: #000000; border-color: activeborder;">
<option value="<%=loc%>"><%=loc%></option>		 
<option value="All">All &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
<%
		 %> 
				  		<% 
				  		//String sqlDropdown11="select  VehicleRegNumber,VehicleCode from db_gps.t_vehicledetails where VehicleCode in "+Vehiclecode+" order by VehicleRegNumber";
				  		
				  		//String sqlDropdown11="select  VehicleRegNumber,VehicleCode from db_gps.t_vehicledetails where OwnerName ='"+typevalue+"' order by VehicleRegNumber";
				  		String sqlDropdown11="select distinct(location) as location ,vehiclecode from smartgrid.mediamaster where company='"+company+"' group by location";
				  		System.out.println("Sql :- "+sqlDropdown11);
				  			ResultSet rsDropdown11=st.executeQuery(sqlDropdown11);
				  			System.out.println();
				  			while(rsDropdown11.next()){
				  				
				  	        	 Vehiclecode1=rsDropdown11.getString("VehicleCode");
				  				Vehicleregno1=rsDropdown11.getString("location");
				  		%>
				  	<option value="<%=rsDropdown11.getString("location")%>"><%=rsDropdown11.getString("location")%></option>
							
						<% 	}%> 
</select>
</td>
	<td><input type="submit" name="button1" id="button1" value="Submit"  style="border-style: outset; border-color: black; font: normal 13px Arial, Helvetica, sans-serif; "    onClick="return birt()"></td>
			
		</tr>
		</table>
			 		</div>
			 		
			
			
			 	
		<%
		System.out.println("Vehiclecode1"+Vehiclecode1);
		System.out.println("Vehicleregno1"+Vehicleregno1);
		
		%>
			 		
		 		
 <font size="2">
 <div align="right"> 
<td align="right" bgcolor="#FFFFFF"  ><%=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new java.util.Date())%></td></div></font>

	<%-- <iframe id="myframe" style="width: 99.5%; height: 500px;" src="http://twtech.in:8080/ERPTestBirt/frameset?__report=AMC_Report.rptdesign&__showtitle=false&__pageFooterFloatFlag=False&<%=queryString%>&tablename=<%=tablenamenew%>"></iframe> --%>


	

	<!-- </form> -->
<% 
String button=request.getParameter("button1");
System.out.println("buutton value--->"+button);
if(button == "null" || button==null || button.equals("null") || button==" ") 
{
	String loc1=request.getParameter("location");
	//loc1="market main";
	System.out.println("Location :- "+loc1);
	
	if(loc1==null || loc1==" " || loc1.equals("null") || loc1=="null")
	{
		loc1="All";
	}
	System.out.println("Inside null");
	data1 =  new SimpleDateFormat("yyyy-MM-dd")
	.format(new java.util.Date());
	
	System.out.println("Location Date :- "+data1);
	
	String dt = new SimpleDateFormat("yyyy-MM-dd")
	.format(new SimpleDateFormat("dd-MMM-yyyy")
			.parse(datex1));
	dt=dt+ " 00:00:00";
	String dt1 = new SimpleDateFormat("yyyy-MM-dd")
	.format(new SimpleDateFormat("dd-MMM-yyyy")
			.parse(datex2));
	dt1=dt1+ " 23:00:00";
	//data1="2018-02-01";
	
		System.out.println("Location Dt :- "+dt);
		
		System.out.println("Location Dt1 :- "+dt1);
	
%>



	<div  class="absolute">
	
	<iframe id="myIframe" style="width: 98%; height: 500px;" src="http://twtech.in/birt/frameset?__report=Advertiserdetails123.rptdesign&Vehiclecode=<%=loc1%>&Date1=<%=dt%>&Date2=<%=dt1%>&Date3=<%=datex1 %>&Date4=<%=datex2 %>&company=<%=company %>&__showtitle=false"></iframe>
	</div>
	
<%
}
else
{
	System.out.println("Inside else");
	
	
%>


<div id="reportData">
	 <iframe id="myIframe" width="100%" height="500px" src=""></iframe>
	 </div>


<%
}
%>
</body>
</html>