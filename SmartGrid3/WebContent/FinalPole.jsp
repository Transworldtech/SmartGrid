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


function validate(i)
{
console.log("i====>"+i);
	


	
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
	

 var ss=document.getElementById("hh2"+i).value;

 if(mm=="" || mm==null)
 	{
 		alert("Please Select To Second");
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
 
 var durtio=document.getElementById("durtio"+i).value;

 if(durtio=="" || durtio==null)
 	{
 		alert("Please enter duration");
 		return false;	
 	}
 



	
}





function Displayer(n)
{var check = document.getElementById('Section'+n);
if(check.style.display == 'none')
{check.style.display='inline';}
else{check.style.display='none';}
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
         	document.getElementById("mediafile"+i).disabled = false;
			document.getElementById("mediafile"+i).innerHTML=reslt;
		
		} 
	};
	
	var queryString = "?mediatype="+mediatype;
	
	ajaxRequest.open("GET", "AjaxMediaFile.jsp" + queryString, true);
	ajaxRequest.send(null); 
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
System.out.println("ok");


%>
<%


String cntr=request.getParameter("cntpole");
System.out.println("Cntr:_"+cntr);

int count=Integer.parseInt(cntr);
System.out.println("count:-"+count);
String deviceid="";
String routename="";
String device[]=new String[count]; 
String city[]=new String[count]; 
String polid[]=new String[count]; 

String area[]=new String[count]; 
 


int k=0;

for(int i=0;i<count;i++)
{
device[i]=request.getParameter("pole"+i);	
System.out.println("array"+device[i]);	

deviceid+="'"+device[i]+"'"+",";  
//routename+="'"+route[i]+"'"+","; 
//String query1="Select Origin,Destination,Routename,TripEndTime,TripStartTime from smartgrid.t_routemaster where Vehiclecode='"+device[i]+"'";
String query1="select a.Origin,a.Destination,b.polid,b.Deviceid,b.End_customer,b.area,b.city,a.TripStartTime,a.TripEndTime  from  smartgrid.t_routemaster a inner join smartgrid.t_polmaster b on a.Vehiclecode=b.Vehiclecode where b.polid='"+device[i]+"'  and b.AssetType='Pole'";
System.out.println("Query==>"+query1);
ResultSet rs=st.executeQuery(query1);
if(rs.next())
{
	
	
	
	polid[k]=rs.getString("polid");
   		
	area[k]=rs.getString("area");
		
	city[k]=rs.getString("city");
   
   
}
else
{
	
	polid[k]="-";
		
	area[k]="-";
		
	city[k]="-";
	
	
	
	
	
}

k++;



}
%>


<div    align="center" class="absolute1" style="width: 70%">


<%for(int i=0;i<count;i++)
{ %>
<div >
<h2   style="background: #485682; color: #ffffff; cursor: pointer; align:left;"
				onClick="Displayer(<%=i%>)">&nbsp;+ <%=i+1%>. Pole Details&nbsp;</h2>
<table class="sortable" id="Section<%=i%>" style="width=70%; display: none;">
<tr>
<th width ="5%">Sr No</th>
		  <th width ="15%">Pole/Location</th>
		   <th width ="15%">City</th>
			 <th width ="15%">Poleid</th>
		
	<tr>
			<td><%=i+1%></td>
			<td><%=area[i] %></td>
			<td><%=city[i]%></td>
			<td><%=polid[i] %></td>
	</tr>
</table>


<div>

<form id="<%=i%>" method="post" action="InsertBulkBooking.jsp"  onSubmit="return validate(<%=i%>)">
<input id="poleid"<%=i%>  name="poleid" type="hidden" value="<%=polid[i]%>"  >
<!-- 	<td><b>From :</b>&nbsp;&nbsp; <input type="text" id="data" -->
<!-- 					name="data" value="" size="10" required="required"  class="datetimepicker" /></td> -->
<!-- 				<td align="left"> -->
<!-- 			</td> -->

<!-- 				<td><b>To :</b> &nbsp;&nbsp; <input type="text" id="data1" -->
<!-- 					name="data1" value="" size="10" required="required"  class="datetimepicker" /></td> -->
<!-- 				<td align="left"> -->
<!-- 				</td> -->

<tr>

   <td>
From:
<input type="text" id="data1<%=i%>" name="data1" class="datepicker" style="width: 110px" value="<%=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date())%>"  size="15" readonly/>
</td>
<td>
To:
<input type="text" id="data2<%=i%>" name="data2"   class="datepicker"  style="width: 110px" value="<%=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date())%>"  size="15" readonly/>
</td>
<td>
Hour:
<select name="hh1" id="hh1<%=i%>">
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
<select name="mm1" id="mm1<%=i%>">
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
<select name="hh2" id="hh2<%=i%>">
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

<td>
<%
String mediatype="select Distinct(mediatype) from smartgrid.t_globalmediamaster";
ResultSet rst2= st4.executeQuery(mediatype);
%>
<td>
MediaType :  
<select  id="mediatype<%=i%>" name="mediatype"    class="element select medium" style="width: 130px;"  onchange="showmediafile(<%=i%>);" >
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
<select   class="element select medium" disabled="disabled"  id="mediafile<%=i%>"  name="mediafile" style="width: 200 px;">
			 <option value="Select">Select &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
</select>
</td>
<td>
Duration :
<input type="text" name="durtio" value="" style="width: 80px;" id="durtio<%=i%>">(Second)</input>
</td>
   
   <td>
   <input  type="submit" >
   </td>
</tr>

</form>
</div>





<br><br><br>
</div>





<% }%>


</div>


</body>
</html>