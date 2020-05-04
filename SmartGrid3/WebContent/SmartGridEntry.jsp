<%@ page language="java" import="java.sql.*" import="java.util.*" import="java.text.*" errorPage=""
    pageEncoding="ISO-8859-1"%>
  <%--   <%@ include file="Conn.jsp"%> --%>
     <%@ include file="headernew.jsp"%>
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

<head>
<!-- <link type="text/css" rel="stylesheet" href="style.css" />
    <link type="text/css" rel="stylesheet" href="reset.css" />   -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Smart Grid Report</title>
</head>
<body>
<script type="text/javascript">

function birt(){
	
	//alert("Hi");
	//var vehicle1=document.getElementById("vehlist").value;
	//var a=chk();
	//alert("GetValidate------->"+a);
	//if(a==true)
		//{
	/* var TypeValue=document.getElementById("TypeValue").value;
	alert(TypeValue);
	 */ 
	 var Status=document.getElementById("Status").value;
	// alert(Status);
	 
	 
	/* var date1= document.getElementById("data").value;
	var date2= document.getElementById("data1").value;
	
	var chk= document.getElementById("extAll").checked;
	
	alert(chk);
	
	if(chk==true)
	{
		chk="All";
		
	}
else
	{
		chk="no";			
	}
	// var date2= document.getElementById("data1").value;
	
		
	//vehicle="2811,3300,6251";
	
	//date1=date1+" 00:00:00";
	//date2=date2+" 23:59:59";
	
//	alert(vehicle);
	alert(date1);
	alert(date2);
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
	formattedDate1=formattedDate1+" 00:00:00";
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
	formattedDate2=formattedDate2+" 23:59:59";
	
	//alert(userid);
	alert(formattedDate1);
	alert(formattedDate2); */
	document.getElementById("myIframe").src="http://myfleetview.com:8181/birttest/frameset?__report=newsmartgrid.rptdesign&status="+Status+"&__showtitle=false";
	
//	document.getElementById('myIframe').src="http://103.8.126.138:8080/birt/frameset?__report=driverreport1.rptdesign&_title='My Viewer'&date1=2015-03-01&date2=2015-08-28&drivername="+driver+"";
	document.getElementById("reportData").style.display="";
	document.getElementById("footer").style.display="none";
	return true;
	
		//}
	//else
		//{
			//return false;
		//}
}



</script>
<%
Connection conn=null;
Class.forName("com.mysql.jdbc.Driver").newInstance();
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
Statement st=conn.createStatement();

%>
<!-- <form> -->
<div align="center">


		
				
		
	</div>
 <div align="center"   ><font size="3">
				<br>
					<b>User Master Report</b>
				</font>
			<br><br>
	<div align="center">		<tr>
			
				<td align="center"><b>Active Status&nbsp;&nbsp;</b>
				<select name="Status" id="Status" 
				style="width: 87px; height:25px; border: 1px solid black; font: normal 13px Arial, Helvetica, sans-serif; color: #000000; border-color: activeborder;">
				    <option value="All">All</option>
				     <option value="Active">Active</option>
				      <option value="No">DeActive</option>
				    
<%-- 				    <%
				    String status="";
				    String sql="select distinct(status) as status from smartgrid.t_security";
				    ResultSet rs=st.executeQuery(sql);
				    while(rs.next())
				    	{
				    	status=rs.getString("status");
				    	
				    
				    %>
				    
				    
				     <option value="<%=status%>"><%=status %></option>
				    <%
				   
				    	}
				    %> --%>
			 		<!-- <option value="Active">Active</option>
			 		<option value="DeActive">DeActive</option>
			 		 --></select>
			 		</td>
			 	<!-- 	<td>
				All <input type="checkbox" name="extAll" id="extAll" value="yes"  onclick="allSelected(this.value);"></input>
				</td> -->
			 		
			 		<td>&nbsp;&nbsp;&nbsp;<input type="submit" name="button1" id="button1" value="Submit"  style="border-style: outset; border-color: black; "    onClick="return birt()"></td>
			 		</tr>
			 		
			 		
			 		</div>
			 		</div>
			 		
			 		
			 		
			 		 <div class="absolute" align="left">
		<font face="Arial" size="2"><a href="register.jsp" style="font-weight: bold; color: black; " >Add </a></font>
		</div>
			 		
		 		
 <font size="2">
 <div align="right"> 
<td align="right" bgcolor="#FFFFFF"  ><%=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new java.util.Date())%></td></div></font>

	<%-- <iframe id="myframe" style="width: 99.5%; height: 500px;" src="http://twtech.in:8080/ERPTestBirt/frameset?__report=AMC_Report.rptdesign&__showtitle=false&__pageFooterFloatFlag=False&<%=queryString%>&tablename=<%=tablenamenew%>"></iframe> --%>

<div  class="absolute">
	
	<iframe id="myIframe" style="width: 100%; height: 500px;" src="http://myfleetview.com:8181/birttest/frameset?__report=newsmartgrid.rptdesign&status=All&__showtitle=false"></iframe>
	</div>
	
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


<div id="reportData">
	 <iframe id="myIframe" width="100%" height="500px" src=""></iframe>
	 </div>


<%
}
%>
	<!-- </form> -->

</body>
</html>
