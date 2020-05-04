<%@ include file="headernew.jsp"%>
<%@ page language="java" import="java.sql.*" import="java.util.*" import="java.text.*" errorPage=""
    %>
    <%@ page import="java.util.Calendar"%>
<%@ page import="java.util.Date"%>
<%@ page  import="java.text.SimpleDateFormat" %>

<link rel="stylesheet" type="text/css" href="css/form.css" media="all">
    
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="css/cpanel_002_popup.css"> 
<link rel="stylesheet" type="text/css" href="css/cpanel_colors.css">

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
    left: 80px;
    width:100%;
    border:0;
}    


button.accordion {
    background-color: #eee;
    color: #444;
    cursor: pointer;
    padding: 18px;
    width: 100%;
    border: none;
    text-align: left;
    outline: none;
    font-size: 15px;
    transition: 0.4s;
}

button.accordion.active, button.accordion:hover {
    background-color: #ddd; 
}

div.panel {
    padding: 0 18px;
    display: none;
    background-color: white;
}



</style>






<body>





<script>

function Displayer(n)
{
	
	var check = document.getElementById('Section'+n);
if(check.style.display == 'none')
{check.style.display='inline';}
else{check.style.display='none';}

var check1 = document.getElementById('Section1'+n);
if(check1.style.display == 'none')
{check1.style.display='inline';}
else{check1.style.display='none';}

var check2 = document.getElementById('Section2'+n);
if(check2.style.display == 'none')
{check2.style.display='inline';}
else{check2.style.display='none';}

var check3 = document.getElementById('Section3'+n);
if(check3.style.display == 'none')
{check3.style.display='inline';}
else{check3.style.display='none';}

}


function validate1(i)
{
	if(document.getElementById("data3"+i).value=="")
	{
	
		alert("Please select the from date");
		return false;
	}
if(document.getElementById("data4"+i).value=="")
	{
	
		alert("Please select the to date");
		return false;
	}
	
	return datevalidate1(i);
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
						if(days=='May')
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
		  		  

	function datevalidate1(i)
	{
		
		var date1=document.getElementById("data3"+i).value;
		var date2=document.getElementById("data4"+i).value;
		var dm1,dd1,dy1,dm2,dd2,dy2,dm11,dm22;
		dy1=date1.substring(0,2);
		dy2=date2.substring(0,2);
		dm1=date1.substring(3,6);
		dm2=date2.substring(3,6);

		dm11=dateformat(dm1);
		dm22=dateformat(dm2);	
		dd1=date1.substring(7,11);
		dd2=date2.substring(7,11);
		var date=new Date();
		var month=date.getMonth()+1;
		//var month1=date2.getMonth();
		var day=date.getDate();
		var year=date.getFullYear();
		
		
		
		
		if(dd1>dd2)
		{  
			
			
			
			alert("From date should not be greater than to date");
		
			document.getElementById("data").focus;
			return false;
			
		}
		
		else if(year==dd1 && year==dd2) if(dm11>dm22)
		{
			
			alert("From date should not be greater than to date");
		
			document.getElementById("data").focus;
			return false;
		}
		 if(dm1==dm2 && dd1==dd2) {
		if(dy1 > dy2)
		{
			alert("From date should not be greater than to date");
			
			document.getElementById("data").focus;
			return false;
		}
		}
		return true;
	}


function showexpence1(i){

	
	
	var a=validate1(i);
	
	if(a==true)
	{
	

	var hh=	document.getElementById("hh1"+i).value;
	// alert("HH:-"+hh);

	if(hh=="" || hh==null)
		{
			alert("Please Select To Hour");
			return false;	
		}
		
	 var mm=	document.getElementById("mm1"+i).value;

	 if(mm=="" || mm==null)
	 	{
	 		alert("Please Select To Minute");
	 		return false;	
	 	}
		

	 var ss=document.getElementById('hh2'+i).value;

	 if(mm=="" || mm==null)
	 	{
	 		alert("Please Select To Second");
	 		return false;	
	 	}

	  var mediatype=document.getElementById('mediatype'+i).value;

	 if(mediatype=="Select")
	 	{
	 		alert("Please Select To mediatype");
	 		return false;	
	 	}

	 
	 var mediafile=document.getElementById('mediafile'+i).value;

	 if(mediafile=="Select")
	 	{
	 		alert("Please Select To mediafile");
	 		return false;	
	 	}
	 
	 var durtio=document.getElementById('durtio'+i).value;
	 var invalid=/^[0-9]+$/;
	 if(durtio=="" || durtio==null)
	 	{
	 		alert("Please Enter Duration");
	 		return false;	
	 	}
	 
	 if(!invalid.test(durtio))
	 {
		 alert("Please Enter Only Numeric Value For Duration In Second");
	 return false;
	 }
	 
	var fromdate=document.getElementById('data3'+i).value;
	
    var todate=document.getElementById('data4'+i).value;
    
    var polid=document.getElementById('polid'+i).value;
	
	var hh=document.getElementById('hh1'+i).value;
	
	var mm=document.getElementById('mm1'+i).value;
	
	var ss=document.getElementById('hh2'+i).value;
	
	var mediafile=document.getElementById('mediafile'+i).value;
	
	var mediatype=document.getElementById('mediatype'+i).value;
	
	var durtio=document.getElementById('durtio'+i).value;
	
	var Origin=document.getElementById('Origin'+i).value;
	
	var Destination=document.getElementById('Destination'+i).value;

    var TripStartTime=document.getElementById('TripStartTime'+i).value;

    var TripEndTime=document.getElementById('TripEndTime'+i).value;
	
	var time=hh+':'+mm+':'+ss;


	
	var startTime=TripStartTime; // or 12:34
	 var endTime =TripEndTime;  // or 1:34 
	var dt = time ;
	
	var now = new Date('00','00','00',dt.split(':')[0],dt.split(':')[1],dt.split(':')[2]);

	var st = new Date('00','00','00',startTime.split(':')[0],startTime.split(':')[1],startTime.split(':')[2]);

	var et = new Date('00','00','00',endTime.split(':')[0],endTime.split(':')[1],endTime.split(':')[2]);

	if (! (now > st) )
	{
		alert("Please Select Time Between TripStartTime:-  " +startTime+ " And TripEndTime:- " +endTime+ " " );
		return false;
	}
	
	if(! (now < et))
	{
		alert("Please Select Time Between TripStartTime:-  " +startTime+ " And TripEndTime:- " +endTime+ " " );
		return false;
	}

	var ajaxRequest;  // The variable that makes Ajax possible!
	try{
		// Opera 8.0+, Firefox, Safari
		ajaxRequest = new XMLHttpRequest();
	}  
	catch (e)
	{
		// Internet Explorer Browsers
		try
		{
			ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
		} 
		catch (e)
		{
			try
			{
				ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
			} 
			catch (e)
			{
				// Something went wrong
				alert("Your browser broke!");
				return false;
			}
		}
	}
	ajaxRequest.onreadystatechange = function()
	{
		if(ajaxRequest.readyState == 4)
		{
			try
			{
			var reslt=ajaxRequest.responseText;
			
//   			alert("reslt"+reslt);

 			var result1;
 			result1=reslt;
 			result1=result1.replace(/^\s+|\s+$/g,'');
          var r=result1.split("~");
          var p=reslt;
          
 			if(r[0]=="Updated")
 			{
 				alert("Booked Successfully");
			}
 			else{
 				
 				alert(p.trim());
 				
 			}
 			
			
		    }
			catch(e)
			{
				alert(e);
			}
		}
	};
	
	var queryString ="?fromdate="+fromdate+"&todate="+todate+"&polid="+polid+"&hh="+hh+"&mm="+mm+"&ss="+ss+"&mediatype="+mediatype+"&mdiafile="+mediafile+"&durtio="+durtio+"&Origin="+Origin+"&Destination="+Destination+"&TripStartTime="+TripStartTime+"&TripEndTime="+TripEndTime;
//  	alert("queryString:-"+queryString);
	ajaxRequest.open("POST", "Bookingajaxinsert.jsp" + queryString, true);
	ajaxRequest.send(null); 
	
	
	
	return true;
}
else
{
	return false;
}
}

    

function showmediafile(i)
{
  	//alert("hi");
	var mediatype = document.getElementById("mediatype"+i).value;


	
	var ajaxRequest;  // The variable that makes Ajax possible!
	try{
		// Opera 8.0+, Firefox, Safari
		ajaxRequest = new XMLHttpRequest();
	}  
	catch (e)
	{
		// Internet Explorer Browsers
		try
		{
			ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
		} 
		catch (e)
		{
			try
			{
				ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
			} 
			catch (e)
			{
				// Something went wrong
				alert("Your browser broke!");
				return false;
			}
		}
	}
	ajaxRequest.onreadystatechange = function()
	{
		if(ajaxRequest.readyState == 4)
		{
			var reslt=ajaxRequest.responseText;
// 			alert("Result First:-"+reslt);
         	document.getElementById("mediafile"+i).disabled = false;
			document.getElementById("mediafile"+i).innerHTML=reslt;
		
		} 
	};
	
	var queryString = "?mediatype="+mediatype;
	
	ajaxRequest.open("GET", "AjaxMediaFile.jsp" + queryString, true);
	ajaxRequest.send(null); 
}



function showmediafileduration(i)
{
//      alert("hi");
	var mediafile = document.getElementById("mediafile"+i).value;

	
	
	var ajaxRequest;  // The variable that makes Ajax possible!
	try{
		// Opera 8.0+, Firefox, Safari
		ajaxRequest = new XMLHttpRequest();
	}  
	catch (e)
	{
		// Internet Explorer Browsers
		try
		{
			ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
		} 
		catch (e)
		{
			try
			{
				ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
			} 
			catch (e)
			{
				// Something went wrong
				alert("Your browser broke!");
				return false;
			}
		}
	}
	ajaxRequest.onreadystatechange = function()
	{
		if(ajaxRequest.readyState == 4)
		{
			var reslt=ajaxRequest.responseText;
          	document.getElementById("durtio"+i).disabled = false;
			document.getElementById("durtio"+i).value=reslt;
		
		} 
	};
	
	var queryString = "?mediafile="+mediafile;
	
	ajaxRequest.open("GET", "AjaxMediaFileDuration.jsp" + queryString, true);
	ajaxRequest.send(null); 
}
</script>


<script type="text/javascript">
//the function that takes care of the updating
function updateValue()
{
    $('#textboxid').val($('#selectLoco').val());
}

//update once the page has loaded too
$(document).ready(function () {
    updateValue();
});
</script>


<script>
function screenbooking1(i)
{

	
 
	var routeid=document.getElementById('routeid'+i).value;
//     alert(routeid);
	
	var TripStartTime=document.getElementById('TripStartTime'+i).value;
	
    var TripEndTime=document.getElementById('TripEndTime'+i).value;

	 var durtio=document.getElementById('durtio'+i).value;
	 
	 var loc=document.getElementById("loc"+i).value;
    
	 
	 
	    if(loc=="Select")
	 	{
	 		alert("Please Select To Location");
	 		return false;	
	 	}
	 
	 
	var mediatype=document.getElementById("mediatype"+i).value;
	
	   if(mediatype=="Select")
	  	{
	 		alert("Please Select To mediatype");
	 		return false;	
	 	}

	
	var mediafile=document.getElementById("mediafile"+i).value;
	

	 if(mediafile=="Select")
	 	{
	 		alert("Please Select To mediafile");
	 		return false;	
	 	}
	
	var date1=document.getElementById("data3"+i).value;
	
	var durtio=document.getElementById("durtio"+i).value;
  
	if(durtio=="" || durtio==null)
		{
		alert("Please Enter Duration");
		return false;
		}
	 
// 	var duration=durtio / 5;
// 	alert("duration:-"+duration);
	if(durtio%5)
	{
		alert("Please Enter Duration It Should Be Multiply By 5");
		return false;
		
	}

	
	try{
	
	window.open('screenbooking1.jsp?TripStarTime='+TripStartTime+'&TripEndTime='+TripEndTime+'&datetime='+date1+'&loc='+loc+'&mediatype='+mediatype+'&mediafile='+mediafile+'&duration='+durtio+'&routeid='+routeid,'Win','width=710,height=600,top=200,left=200,scrollbars=yes');	 
	 }catch(e)
	 {
		 alert(e);
	 }
}

</script>





<br>
<br>
<%!
Connection con1;

%>



<%

Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
// Statement st=con1.createStatement();

Statement st = null, st1 = null, st3 = null, st4 = null,st2 = null;
st = con1.createStatement();
st1 = con1.createStatement();
st2 = con1.createStatement();
st3 = con1.createStatement();
st4 = con1.createStatement();



%>
<%

String cntr="";

if(request.getParameter("cntbus")!=null)
{
System.out.println("bus:-"+request.getParameter("cntbus"));
 cntr=request.getParameter("cntbus");
}
else if (request.getParameter("cntpole")!=null)
{
	System.out.println("pole:-"+request.getParameter("cntpole"));
	 cntr=request.getParameter("cntpole");
}
else
{
	System.out.println("both:-"+request.getParameter("cnt"));
	 cntr=request.getParameter("cnt");
}

int count=Integer.parseInt(cntr);

String deviceid="";
String routename="";
String device[]=new String[count]; 
String polid[]=new String[count]; 
String AssetType[]=new String[count]; 
String BusType[]=new String[count];
String Origin[]=new String[count]; 
String Destination[]=new String[count];
String duration[]=new String[count];
String TripStartTime[]=new String[count];
String TripEndTime[]=new String[count];
String End_Customer[]=new String[count]; 

String seating_capacity[]=new String[count]; 
String area[]=new String[count];
String city[]=new String[count];


int k=0;

String category="";


for(int i=0;i<count;i++)
{
device[i]=request.getParameter("bus"+i);	


	

deviceid+="'"+device[i]+"'"+",";  
 


String query1="";

//  query1="select b.seating_capacity,b.AssetType,b.BusType,a.Origin,a.Destination,b.Duration,b.polid,b.Deviceid,b.End_customer,b.area,b.city,a.TripStartTime,a.TripEndTime  from  smartgrid.t_routemaster a inner join smartgrid.t_polmaster b on a.Vehiclecode=b.Vehiclecode where b.polid='"+device[i]+"' ";
query1="select  c.Routeid,a.seat_capacity,b.AssetType,b.BusType,a.Origin,a.Destination,a.Duration,b.polid,b.Deviceid,b.End_customer,b.area,b.city,a.TripStartTime,a.TripEndTime  from  smartgrid.t_routemaster a inner join smartgrid.t_polmaster b on a.Vehiclecode=b.Vehiclecode inner join smartgrid.t_routepoints c on a.Routeid=c.Routeid   where a.Routeid='"+device[i]+"'";
System.out.println("query1"+query1);
ResultSet rs=st.executeQuery(query1);
if(rs.next())
{
	polid[k]=rs.getString("Routeid");
	
	System.out.println("polid++++++++"+Arrays.toString(polid));
	
	AssetType[k]=rs.getString("AssetType");
   		
	BusType[k]=rs.getString("BusType");
		
	Origin[k]=rs.getString("Origin");
	
	End_Customer[k]=rs.getString("End_Customer");
   
	Destination[k]=rs.getString("Destination");
   
	duration[k]=rs.getString("duration");
	
	seating_capacity[k]=rs.getString("seat_capacity");
	
	TripStartTime[k]=rs.getString("TripStartTime");
	
	TripEndTime[k]=rs.getString("TripEndTime");
	
	area[k]=rs.getString("area");
	
	city[k]=rs.getString("city");
	
// 	System.out.println("city++++++++"+Arrays.toString(city));
}
else
{
	
	polid[k]="-";
	
	AssetType[k]="-";
	
	BusType[k]="-";
	
	End_Customer[k]="-";
	
	Origin[k]="-";
	
	Destination[k]="-";
	
	seating_capacity[k]="-";
	
	duration[k]="-";
	
	TripStartTime[k]="-";
	
	TripEndTime[k]="-";
	
}
k++;
}
%>
<div    align="center" class="absolute1" style="width: 90%">
<%for(int i=0;i<count;i++)
{ %>


<div align="left">

<% 
String AssetType1="select b.AssetType  from  smartgrid.t_routemaster a inner join smartgrid.t_polmaster b on a.Vehiclecode=b.Vehiclecode inner join smartgrid.t_routepoints c on a.Routeid=c.Routeid   where a.Routeid='"+device[i]+"'";
ResultSet rst=st.executeQuery(AssetType1);
if(rst.next())
{
category=rst.getString("AssetType");
if(category.equals("Bus"))
{	
%>
<h2 style="background: #485682; color: #ffffff; cursor: pointer; "
	onClick="Displayer(<%=i%>)">&nbsp;<font size="2">&nbsp; <%=i+1%>.&nbsp;&nbsp;&nbsp;<%=End_Customer[i]%>&nbsp;&nbsp;&nbsp;From-<%=Origin[i]%>&nbsp;&nbsp;To-<%=Destination[i] %>&nbsp;&nbsp;&nbsp;TripStartTime-<%=TripStartTime[i] %>&nbsp;&nbsp;&nbsp;TripEndTime-<%=TripEndTime[i] %>&nbsp;&nbsp;&nbsp;Occupancy-<%=seating_capacity[i] %></font> &nbsp;</h2>
<%
}
else 
{
%>
<h2   style="background: #485682; color: #ffffff; cursor: pointer; "
				onClick="Displayer(<%=i%>)">&nbsp;<font size="2">&nbsp; <%=i+1%>.<%=AssetType[i]%>&nbsp;&nbsp;<%=area[i] %>&nbsp;&nbsp; <%=city[i] %></font> &nbsp;</h2>	
<%	
}

	


%>
	
<table class=""  id="Section2<%=i%>" style="width=100%; display: none;">	
				
	<tr>
	<td>			
				
				
				
<table class="sortable"  id="Section<%=i%>" style="width=30%; display: none;">

<%-- <% 
if(category.equals("Bus"))
{	

%>


  <tr>
    <th bgcolor="#485682" align="left" ><font color="white">TripStart</font></th>
    <td bgcolor="" align="right" ><%=TripStartTime[i] %></td>
  </tr>
   
  <tr>
    <th bgcolor="#485682" align="left" ><font color="white">TripEnd</font></th>
    <td bgcolor="" align="right"><%=TripEndTime[i] %></td> 
  </tr>
  
   <tr>
    <th bgcolor="#485682" align="left"><font color="white">Duration</font></th>
    <td bgcolor="" align="right"><%=duration[i] %></td> 
  </tr>
<tr>
<th bgcolor="#485682" align="left"><font color="white">Occupancy</font></th>
 <td bgcolor="" align="right"><%=seating_capacity[i]%></td>
 </tr>
 
 
  <tr>
<%
}
else 
{
%>
<th width ="5%">Sr No</th> 
	  <th width ="15%">Pole/Location </th> 
	   <th width ="15%">Area</th> 
	   <th width ="15%">FromTime</th> 
	   <th width ="15%">ToTime</th> 
</tr>
<tr>
<td><%=i+1%></td> 
 			<td><%=area[i] %></td>
			<td><%=city[i]%></td> 
			<td><%=TripStartTime[i] %></td> 
 			<td><%=TripEndTime[i] %></td> 
</tr>
<tr> --%>
<%
}
%>
<tr>
<td></td><td></td><td></td>
</table>

</td>
<td>
</td>
<td>
</td>
<td>
</td>

<td>
<div align="center" class="" style="width: 100%">
<table class="" id="Section1<%=i%>"  style="width:100%; display: none;">
<!-- <tr><td></td><td></td><td></td><td align="center"> <div align="center" ><font size="3" style="Arial"><b>New Booking</b></font></div></td></tr> -->
<tr>
<!-- <label style="cursor:pointer">Book</label></a> -->
</tr>

<tr>

<td>

      <font>Date:</font>         <input type="text" id="data3<%=i%>" name="data3" class="datepicker" style="width: 110px" value="<%=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date())%>"  size="15" readonly/>

</td>
<%-- <td>

To:<input type="text" id="data4<%=i%>" name="data4"   class="datepicker"  style="width: 110px" value="<%=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date())%>"  size="15" readonly/>
</td> --%>
<input type="hidden" id="Origin<%=i%>" name="Origin" value=<%=Origin[i]%>></input>
<input type="hidden" id="Destination<%=i%>" name="Destination" value=<%=Destination[i]%>></input>
<input type="hidden" id="TripStartTime<%=i%>" name="starttime" value=<%=TripStartTime[i]%>></input>
<input type="hidden" id="TripEndTime<%=i%>" name="endtime" value=<%=TripEndTime[i]%>></input>
<input type="hidden" id="routeid<%=i%>" name="polid" value=<%=polid[i]%>></input>

<td>

Location:<select class="element select medium"   id="loc<%=i%>" name="loc" style="width: 400 px;">
			 <option value="Select">Select &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
				  		<%String sqlDropdown11="SELECT Distinct(Location) FROM smartgrid.t_polmaster";
				  			ResultSet rsDropdown11=st2.executeQuery(sqlDropdown11);
				  			while(rsDropdown11.next()){%>
				  	<option value="<%=rsDropdown11.getString(1)%>"><%=rsDropdown11.getString(1)%></option>
					    <%}%> 
</select>
</td>
<%
String mediatype="select Distinct(mediatype) from smartgrid.t_globalmediamaster";
ResultSet rst2= st4.executeQuery(mediatype);
%>
<td>

MediaType:<select  id="mediatype<%=i%>" name="mediatype"    class="element select medium" style="width: 130px;"  onchange="showmediafile(<%=i%>);" >
				  	<option value="Select">Select</option>
<%
  while(rst2.next()){
				  %>
				  <option value="<%=rst2.getString(1)%>"><%=rst2.getString(1)%></option>
							
			<% 	}%> 
</select>
</td>

<td>

MediaFile:<select   class="element select medium"  disabled="disabled" id="mediafile<%=i%>"  name="mediafile" onchange="showmediafileduration(<%=i%>);" style="width: 200 px;">
			 <option value="Select">Select &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
</select>
</td>
<td>

Duration(Sec):<input type="text" class="element select medium"    id="durtio<%=i%>"  name="durtio"  style="width: 200 px;">
			 
</select>
</td> 
   
   <td>
   <input  type="submit" id="button" name="button" value="BookNow"  onclick="screenbooking1(<%=i%>);">
   </td>
   
</tr>

</table>
</div>
</td>
</tr>

<!-- </div> -->

</table>
</div>
<div>
<form id="<%=i%>" method="post" action="" >
<input id="poleid"<%=i%>  name="poleid" type="hidden" value="<%=polid[i]%>">
<br>
</form>
</div>
<% }%>
  <br><br><br><br><br><br><br>

<%@ include file="footer.jsp"%> 
</div>


</body>
</html>

