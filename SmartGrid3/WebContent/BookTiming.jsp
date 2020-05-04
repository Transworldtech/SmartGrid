<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ include file="headernew.jsp"%> 
<%@page import="java.util.*" %>
<%@page import="java.text.SimpleDateFormat"%>

    <%@ page import = "java.util.*"%>
     
    <%@ page import = "java.io.File"%>
 <%@ page import = "java.sql.*"%>
 <%@ page import="java.util.Map.Entry"%>
 <%@page import="java.util.Set" %>
<%!ArrayList <String> al=new ArrayList<String>();
Iterator <String>itr=al.iterator();
%>
<%!
Connection con1;
%>


<%
System.out.println("MM_dbConn_DRIVER--->"+MM_dbConn_DRIVER);
System.out.println("MM_dbConn_STRING--->"+MM_dbConn_STRING);
System.out.println("MM_dbConn_STRING--->"+MM_dbConn_USERNAME);
System.out.println("MM_dbConn_STRING--->"+MM_dbConn_PASSWORD);
		Class.forName(MM_dbConn_DRIVER);
		con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
		Statement st = null, st1 = null, st3 = null, st4 = null,st2 = null;
        st = con1.createStatement();
		st1 = con1.createStatement();
		st2 = con1.createStatement();
		st3 = con1.createStatement();
		st4 = con1.createStatement();
		System.out.println("ok");
		
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<script type="text/javascript" language="javascript" src="calendar/prototype-1.js"></script>
<script type="text/javascript" language="javascript" src="calendar/prototype-base-extensions.js"></script>
<script type="text/javascript" language="javascript" src="calendar/prototype-date-extensions.js"></script>
<script type="text/javascript" language="javascript" src="calendar/behaviour.js"></script>
<script type="text/javascript" language="javascript" src="calendar/datepicker.js"></script>
<link rel="stylesheet" href="calendar/datepicker.css">
<script type="text/javascript" language="javascript" src="calendar/behaviors.js"></script>

<script>


function validate()
{
	if(document.getElementById("data1").value=="")
	{
	
		alert("Please select the from date");
		return false;
	}
if(document.getElementById("data2").value=="")
	{
	
		alert("Please select the to date");
		return false;
	}
	
	return datevalidate();
	return true;
}
function BookTime()
{
	var a=validate();

	if(a==true)
		{
	
	 var data1 = document.getElementById("data1").value;
	// alert("data1"+data1);
     var data2 = document.getElementById("data2").value;
    // alert("data2"+data2);
    
    
    
	
     var hh1 = document.getElementById("hh1").value;
    // alert("hh1"+hh1);
     var mm1 = document.getElementById("mm1").value;
     //alert("mm1"+mm1);
     var hh2 = document.getElementById("hh2").value;
     //alert("hh2"+hh2);
     
  
     
     //var mediafile = document.getElementById("mediafile").value;
     
     var mediafile = document.getElementById("mediafile").value;
	  if(mediafile=="Select")
		  {
		  alert("Please Select Media File");
		  return false;
		  }
     
     //alert("mediafile"+mediafile);
     var mediatype = document.getElementById("mediatype").value;
     
     if(mediatype=="Select")
	  {
	  alert("Please Select Media Type");
	  return false;
	  }
     
     //alert("mediatype"+mediatype);
     var duration= document.getElementById("durtio").value;
     
     var invalid=/^[0-9]+$/;
    
     
     if(!(duration ==0))
		{
			 if(!invalid.test(duration))
				{
				 alert("Please Enter Numeric Value For Duration");		
					return false;
				}	
			
		}
		else
		{
			alert("Please Enter Duration");
		    return false;	
		}
     
     
     
   //  alert("duration"+duration);
     window.location.replace("BookTiming.jsp?data1="+data1+"&data2="+data2+"&hh1="+hh1+"&mm1="+mm1+"&hh2="+hh2+"&mediafile="+mediafile+"&mediatype="+mediatype+"&duration="+duration);
     

		return true;
		}
}
	
	
	
function datevalidate()
{
	
	var date1=document.getElementById("data1").value;
	var date2=document.getElementById("data2").value;
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
		
		
		
		alert("From Date Should Not Be Greater Than To Date");
	
		document.getElementById("data").focus;
		return false;
		
	}
	
	else if(year==dd1 && year==dd2) if(dm11>dm22)
	{
		
		alert("From Date Should Not Be Greater Than To Date");
	
		document.getElementById("data").focus;
		return false;
	}
	 if(dm1==dm2 && dd1==dd2) {
	if(dy1 > dy2)
	{
		alert("From Date Should Not Be Greater Than To Date");
		
		document.getElementById("data").focus;
		return false;
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
		  		  
	
	
	




</script>
<style>
 
    
    
    table.tbh {
    border-collapse: collapse;
}

 table.tbh
 {
  border: 1px solid black;
 }
 th.tbh {
    border: 1px solid black;
   color:  white;
    background-color: #3a3f51;
}
td.tbh {
    border: 1px solid black;
  	/* background-color: #f37a4d; */
	color:  #3a3f51;
}
    
   

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
   margin-left: 30px;
    width:100%;
    border:0;
}    
</style>



<body>


<%
if(request.getParameter("cntr1")!=null)
{

int cntr=Integer.parseInt(request.getParameter("cntr1"));

	System.out.println("cntr:-"+cntr);
	String[] vehno = new String[cntr];
	String poleid="",state="",city="",area="";
	int cnt=0;
	for(int i=0;i<cntr;i++)
	{
		// abc=request.getParameter("location"+i );
		++cnt;
		if(cnt == 1)
		{
			poleid = request.getParameter("poleid"+i );

		}else
		{
			poleid = poleid +","+request.getParameter("poleid"+i );

		}

	}
	
	System.out.println("PoleId->"+poleid);
	session.setAttribute("poleid",poleid);
}
	%>

<br>
<br>

<center>
<tr>
<td>
	<div style="margin-center: 200px">
	<font size="3"><B>Book Time</B></font></div>
	</td>
</tr>

</center>

<br>
<br>

<form method="Get" action="">

 <div align="center">
    <table width="90%">
<tr>
<td>
From:
<input type="text" id="data1" name="data1" class="datepicker" style="width: 110px" value="<%=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date())%>"  size="15" readonly/>
</td>
<td>
To:
<input type="text" id="data2" name="data2"   class="datepicker"  style="width: 110px" value="<%=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date())%>"  size="15" readonly/>
</td>
<td>
Hour:
<select name="hh1" id="hh1">
  <option value="00">00</option>
  <option value="01">01</option>
  <option value="02">02</option>
  <option value="03">03</option>
  <option value="04">04</option>
  <option value="05">05</option>
  <option value="06">06</option>
  <option value="07">07</option>
  <option value="08">08</option>
  <option value="09">09</option>
  <option value="10">10</option>
  <option value="11">11</option>
  <option value="12">12</option>
  <option value="13">13</option>
  <option value="14">14</option>
  <option value="15" >15</option>
  <option value="16">16</option>
  <option value="17">17</option>
  <option value="18">18</option>
  <option value="19">19</option>
   <option value="20">20</option>
  <option value="21">21</option>
  <option value="22">22</option>
  <option value="23">23</option>
 </select>
</td>
<td>
Minute:
<select name="mm1" id="mm1">
<option value="00">00</option>
<option value="01">01</option>
<option value="02">02</option>
<option value="03">03</option>
<option value="04">04</option>
<option value="05">05</option>
<option value="06">06</option>
<option value="07">07</option>
<option value="08">08</option>
<option value="09">09</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
<option value="13">13</option>
<option value="14">14</option>
<option value="15">15</option>
<option value="16">16</option>
<option value="17">17</option>
<option value="18">18</option>
<option value="19">19</option>
<option value="20">20</option>
<option value="21">21</option>
<option value="22">22</option>
<option value="23">23</option>
<option value="24">24</option> 
<option value="25">25</option>                                    
<option value="26">26</option>
<option value="27">27</option>
<option value="28">28</option>
<option value="29">29</option>
<option value="30">30</option>
<option value="31">32</option>
<option value="33">33</option>
<option value="34">34</option>
<option value="35">35</option>
<option value="36">36</option>
<option value="37">37</option>
<option value="38">38</option>
<option value="39">39</option>
<option value="40">40</option>
<option value="41">41</option>
<option value="42">42</option>
<option value="43">43</option>
<option value="44">44</option>
<option value="45">45</option>
<option value="46">46</option>
<option value="47">47</option>
<option value="48">48</option>
<option value="49">49</option>
<option value="50">50</option>
<option value="51">51</option>
<option value="52">52</option>
<option value="53">53</option>
<option value="54">54</option>
<option value="55">55</option>
<option value="56">56</option>
<option value="57">57</option>
<option value="58">58</option>
<option value="59">59</option>
</select>
</td>
<td>
Second:
<select name="hh2" id="hh2">
<option value="00">00</option>
<option value="05">05</option>
<option value="10">10</option>
<option value="15">15</option>
<option value="20">20</option>
<option value="25">25</option>
<option value="30">30</option>
<option value="35">35</option>
<option value="40">40</option>
<option value="45">45</option>
<option value="50">50</option>
<option value="55">55</option>
</select>
</td>
</tr>
</table>
</div>
<br>
<br>
<div align="center">
<table width="90%">
<tr>
<td>
<%
String mediatype="select Distinct(mediatype) from smartgrid.t_globalmediamaster";
ResultSet rst2= st4.executeQuery(mediatype);
%>
<td>
MediaType :  
<select  id="mediatype" name="mediatype"    class="element select medium" style="width: 130px;"  onchange="showmediafile();" >
				  	<option value="Select">Select</option>
<%
  while(rst2.next()){
				  %>
				  <option value="<%=rst2.getString(1)%>"><%=rst2.getString(1)%></option>
							
			<% 	}%> 
</select>
</td>
<td>
<td>
Media File :
<select   class="element select medium" disabled="disabled"  id="mediafile"  name="mediafile" style="width: 200 px;">
			 <option value="Select">Select &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
</select>
</td>
<td>
Duration :
<input type="text" name="durtio" value="" style="width: 80px;" id="durtio">(Second)</input>
</td>
<td>
<input id="saveForm" name="submit" class="button_text" type="button" style="width: 90px;" value="Book" onclick="BookTime()" />
</td>
</tr>


</table>
</div>
</form>


<form method="Post" action="">
<%
try{

	
	String From=request.getParameter("data1");
	String To=request.getParameter("data2");
	String HH=request.getParameter("hh1");
	String mm=request.getParameter("mm1");
	String ss=request.getParameter("hh2");
	String mediatype1=request.getParameter("mediatype");
	String mediafile=request.getParameter("mediafile");
	String duration=request.getParameter("duration");
	System.out.println("duration:-"+duration);

	session.setAttribute("Fromdate", From);
	session.setAttribute("Todate", To);
	session.setAttribute("HH", HH);
	session.setAttribute("mm", mm);
	session.setAttribute("ss", ss);
	session.setAttribute("mediatype", mediatype1);
	session.setAttribute("mediafile", mediafile);
	session.setAttribute("duration", duration);
	
	
	
	String From1 = new SimpleDateFormat("yyyy-MM-dd")
	.format(new SimpleDateFormat("dd-MMM-yyyy")
			.parse(From));
	
	String To1 = new SimpleDateFormat("yyyy-MM-dd")
	.format(new SimpleDateFormat("dd-MMM-yyyy")
			.parse(To));
	
	
	System.out.println("From-"+From1);
	System.out.println("To-"+To1);
	

	
	
	String poleid=session.getAttribute("poleid").toString();
	System.out.println("poleid="+poleid);
	
	String pol[]=poleid.split(",");
	int i=0;
	for(String polid:pol)
	{	
String polmaster="select * from  smartgrid.t_polmaster where  polid='"+polid+"' ";
			ResultSet rs75=st1.executeQuery(polmaster);
			
			System.out.println("polmaster:-"+polmaster);
			
	 while(rs75.next())
	 {
	
		 String Country=rs75.getString("Country");
		 System.out.println("Country:="+Country);
		 String State=rs75.getString("State");
		 System.out.println("State:="+State);
		 String City=rs75.getString("City");
		 System.out.println("City:="+City);
		 String Location=rs75.getString("Location");
		 System.out.println("Location:="+Location);
	  }

//String media="select * from smartgrid.mediamaster where Poleid='"+polid+"' and Date in ('"+From1+"','"+To1+"') and time = '"+HH+":"+mm+":"+ss+"' ";
//String media="select *  from smartgrid.mediamaster  where '"+From1+"'>=startdate and '"+To1+"'<=date_add(enddate, INTERVAL "+duration+" second)  and poleid='"+polid+"' ";

String media="select * from smartgrid.mediamaster where Startdate>='"+From1+"' and Enddate<='"+To1+"' and Poleid='"+polid+"'";

ResultSet rs77=st1.executeQuery(media);
System.out.println("media:-"+media);
	 if(rs77.next())
	 {
		%>
 		<script> 
 		window.location="Popup.jsp";
   	 	</script> 
	 	<%
	 }
	 else
	 {
		 
     }

	
	 
	 List<String> list2 = new ArrayList<String>(al);
al.add(i, polid);


    

	 
	}
	
	for(String s1:al)
	{
		System.out.println("S1:-"+s1);

	}
	
%>
	<script type="text/javascript">
	window.location="InsertBulkBooking.jsp";
  	</script>

<%
}
catch(Exception e)
{
e.printStackTrace();
}

%>

</form>


</body>
</html>
  <%@ include file="footer.jsp"%>