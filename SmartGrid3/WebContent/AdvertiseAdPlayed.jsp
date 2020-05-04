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






<div  class="absolute"  align ="right" style="width: 97%; height: 500px;">
	
	<%-- <iframe id="myIframe" style="width: 98%; height: 500px;" src="http://twtech.in:8080/ERPTestBirt/frameset?__report=AdvertiserDateWise.rptdesign&Advertiser=<%=advertiser%>&FromDate=<%=dt%>&ToDate=<%=dt1%>&Date3=<%=datex1 %>&Date4=<%=datex2 %>&__showtitle=false"></iframe> --%>
	<%
	String advertiser =request.getParameter("advertiser");
	String date =request.getParameter("date");
	System.out.println("Advertiser : "+advertiser);
	System.out.println("Date : "+date);
	
	
	
	String dt = new SimpleDateFormat("yyyy-MM-dd")
	.format(new SimpleDateFormat("dd-MMM-yyyy")
			.parse(date));
	dt=dt+ " 00:00:00";
	String dt1 = new SimpleDateFormat("yyyy-MM-dd")
	.format(new SimpleDateFormat("dd-MMM-yyyy")
			.parse(date));
	dt1=dt1+ " 23:59:59";
	System.out.println("Dt 1: "+dt);
	System.out.println("Dt 1: "+dt1);
	
	/* System.out.println("dt : "+dt); */
	/* System.out.println("dt 1: "+dt1); */
	
	%>
	<div align="center">
</div>
 <div align="center"   ><font size="3">
				<br>
					<b> Ad Played Details Report</b>
				</font>
			<br><br>
			

			 		
			 <table  style="width: 70%;">
			 </table>
			 		</div>
			 		
			 <font size="2">
 <div align="right"> 
<td align="right" bgcolor="#FFFFFF"  ><%=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new java.util.Date())%>
</td></div></font>
			 
	<div  class="absolute"  align ="right" style="width: 97%; height: 500px;">
	
	 <iframe id="myIframe" style="width: 98%; height: 500px;" src="http://twtech.in:8080/birt/frameset?__report=AdPlayedDetails.rptdesign&Advertiser=<%=advertiser%>&Date1=<%=dt%>&Date2=<%=dt1%>&Date3=<%=date%>&__showtitle=false"></iframe> 
	</div>
	
</div>
	<!-- </form> -->

</body>
</html>
