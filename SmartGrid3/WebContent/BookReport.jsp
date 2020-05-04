<%@ include file="headernew.jsp"%>
<%@ page language="java" import="java.sql.*" import="java.util.*" import="java.text.*" errorPage=""
    %>
    <%@ page import="java.util.Calendar"%>
<%@ page import="java.util.Date"%>
<link rel="stylesheet" type="text/css" href="css/form.css" media="all">


<script type="text/javascript" language="javascript" src="calendar/prototype-1.js"></script>
<script type="text/javascript" language="javascript" src="calendar/prototype-base-extensions.js"></script>
<script type="text/javascript" language="javascript" src="calendar/prototype-date-extensions.js"></script>
<script type="text/javascript" language="javascript" src="calendar/behaviour.js"></script>
<script type="text/javascript" language="javascript" src="calendar/datepicker.js"></script>
<link rel="stylesheet" href="calendar/datepicker.css">
<script type="text/javascript" language="javascript" src="calendar/behaviors.js"></script>
<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 --%>
 <!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

  <style>
    div.absolute {
    position: absolute;
    left: 30px;
    width:100%;
    border:0;
  
    
} 
    </style>
<title></title>
</head>
<body>
<script type="text/javascript">


 
 function validate()
 {
 	if(document.getElementById("data").value=="")
 	{
 	
 		alert("Please select the from date");
 		return false;
 	}
 if(document.getElementById("data1").value=="")
 	{
 	
 		alert("Please select the to date");
 		return false;
 	}
 	
 	return datevalidate();
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
		  		  

	function datevalidate()
	{
		
		var date1=document.getElementById("data").value;
		var date2=document.getElementById("data1").value;
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

 
 function birt(){
	
	 
	
	 
		var a=validate();
	
		if(a==true)
			{
			
			
		
	
		var date1= document.getElementById("data").value;
		var date2= document.getElementById("data1").value;
	
		
			
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
		formattedDate1=formattedDate1;
		//alert(date[1]);
		//alert(date[0]);
		
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
		formattedDate2=formattedDate2;
		
		
		
		
		var user=document.getElementById("user").value;
		user=user.replace(/\../g,' ');
		

		
		
		document.getElementById("myIframe").src="http://myfleetview.com/birttest/frameset?__report=BookReport.rptdesign&BookCompany="+user+"&From="+formattedDate1+"&To="+formattedDate2+"&dt="+date1+"&dt1="+date2+"&__showtitle=false";
//		document.getElementById('myIframe').src="http://103.8.126.138:8080/birt/frameset?__report=driverreport1.rptdesign&_title='My Viewer'&date1=2015-03-01&date2=2015-08-28&drivername="+driver+"";
		document.getElementById("reportData").style.display="";
		
		return true;
			}
		else
			{
				return false;
			}
	}  
</script>

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
				data1 = new SimpleDateFormat("yyyy-MM-dd")
						.format(new SimpleDateFormat("dd-MMM-yyyy")
								.parse(request.getParameter("data")));
				data2 = new SimpleDateFormat("yyyy-MM-dd")
						.format(new SimpleDateFormat("dd-MMM-yyyy")
								.parse(request.getParameter("data1")));

				datex1 = request.getParameter("data");
				datex2 = request.getParameter("data1");
			}

	System.out.println(" datex1 "+datex1+" datex2 "+datex2);
	String dt = new SimpleDateFormat("yyyy-MM-dd")
	.format(new SimpleDateFormat("dd-MMM-yyyy")
			.parse(datex1));
	
	String dt1 = new SimpleDateFormat("yyyy-MM-dd")
	.format(new SimpleDateFormat("dd-MMM-yyyy")
			.parse(datex2));
	 	
	%>

<%
Connection conn=null;
Class.forName("com.mysql.jdbc.Driver").newInstance();
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
Statement st=conn.createStatement();

String Company=session.getAttribute("company").toString();


System.out.println("Company:-"+Company);
%>
<input type="hidden" id="user" name="user" value="<%=Company%>" />

<br><br><br>
<table border="0" width="750px"  align="center">


		<tr>
			<td  align="center">
				<font size="3">
					<b>Booking Report</b>
				</font>
			</td>
		</tr>
		<tr>
	
	</tr>	
	</table>
 
 <br>
 <br>
 
 <table border="0" width="700" align="center" class="">
			<tr>
				<td><b>From :</b>&nbsp;&nbsp; <input type="text" id="data"
					name="data" value="<%=datex1%>" size="10"  class="datepicker" /></td>
				<td align="left">
			</td>

				<td><b>To :</b> &nbsp;&nbsp; <input type="text" id="data1"
					name="data1" value="<%=datex2%>" size="10"  class="datepicker" /></td>
				<td align="left">
				</td>

				<td>&nbsp;<input type="submit" name="button" value="Submit" onclick="birt()"></td>
				</tr>
		</table>
 
 
 
 
 <div class="absolute" align="left">
		
		</div>
 
 <div align="right"> 
 <font size="2">
<td align="right" bgcolor="#FFFFFF"   ><%=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new java.util.Date())%></td></div>

	
</font>
<div class="absolute" align="center" >
	
	
	
	<!-- <iframe id="myIframe" style="width: 100%; height: 500px;" src=  http://192.168.2.97:8080/birttest/frameset?__report=ZoneMaster.rptdesign&status=All&__showtitle=false"></iframe> -->
	<iframe id="myIframe" style="width: 100%; height: 500px;" src="http://myfleetview.com:8181/birttest/frameset?__report=BookReport.rptdesign&BookCompany=<%=Company%>&From=<%=dt%>&To=<%=dt1%>&dt=<%=datex1%>&dt1=<%=datex2%>&__showtitle=false"></iframe>
	
	</div>
	</center>
<% 
String button=request.getParameter("button1");
System.out.println("buutton value--->"+button);
if(button == "null") 
{
	System.out.println("Inside null");
%>



	
	
<%
}
else
{
	System.out.println("Inside else");
	
	
%>





<%
}
%>
	<!-- </form> -->

</body>
</html>
