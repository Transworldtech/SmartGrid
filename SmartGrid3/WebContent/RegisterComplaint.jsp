<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="java.sql.*" %>
   <%@page import="java.util.Date" %>
 <%@ include file="header.jsp"%>
 <%@ include file="Conn.jsp"%>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<html>
<head>
  <link type="text/css" rel="stylesheet" href="style.css" />
  <style>
  
  label {
    cursor: default;
    font-size: 14px;
}

label1 {
    cursor: default;
    font-size: 12px;
}


  </style>
  
  <script>
  
  function validateEmail(email)
  {
       var splitted = email.match("^(.+)@(.+)$");
      if(splitted == null) return false;
      if(splitted[1] != null )
      {
        var regexp_user=/^\"?[\w-_\.]*\"?$/;
        if(splitted[1].match(regexp_user) == null) return false;
      }
      if(splitted[2] != null)
      {
        var regexp_domain=/^[\w-\.]*\.[A-Za-z]{2,4}$/;
        if(splitted[2].match(regexp_domain) == null) 
        {
  	    var regexp_ip =/^\[\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\]$/;
  	    if(splitted[2].match(regexp_ip) == null) return false;
        }// if
        return true;
      }
  return false;
  }
function validateform1()
{
	
	var number=document.getElementById("Number").value;
	var describtion=document.getElementById("describtion").value;
   var emailid=document.getElementById("EmailID").value;
	
	if(describtion.trim()=="")
		{
		alert("Please Enter Describtion");
		return false;
		}
	
	
	 if(emailid.trim()=="")
	    {
	     alert("Please enter valid Email ID");
	      return false;
	     }
	    else
		{
		        //emai=document.getElementById("email").value;
	        var temp=new Array();
	        temp=emailid.split(",");
	        for(var i=0;i<temp.length;i++)
	        {
			var sss=validateEmail(temp[i]);
			//alert(temp[i]);
			if(!sss)
				{
				    //alert(sss);
					alert("Please enter valid Email Id");
					return false;
				} 
	        }
		}

	
	
	
	
	
	if(document.getElementById("tr3").style.visibility=="visible")  
	{
	 if(number=="")	
		 {
		 
		 alert("Please Enter Mobile No");
		 return false;
		 
		 }
		
	 else if(isNaN(number))
		{
			alert("Please enter Numeric Value");
			return false;
		}
	else if ((number.length < 8)  || (number.length >12)){
     alert("Please enter valid Mobile Number"); return false;
 }
		
	}
	
	
	
	
}
  
  
  
  
  function upload()
  
  {
	  

		var file1=document.getElementById("document").value;
	

		 if(file1 != '')
		 { 
			 var valid_extensions = /(.jpg|.jpeg|.doc~|.doc|.txt|.png|.pdf|.ods|.xls|.txt~)$/i;
			
		  if(!valid_extensions.test(file1))
		  { 
			
			 alert("Please upload jpg,jpeg,png,doc,txt,pdf,xls format only");
			 document.getElementById("document").value="";
	
		  }
		  if(valid_extensions.test(file1))
		  { 
			
			  document.getElementById("remove2").style.display="";
	
		  }
		
		 
	  
	  
	  
	  
  }
  }
  
  
  
  function removess()
  {
	  document.getElementById("document").value="";  
	  document.getElementById("remove2").style.display="none";
	  
  }
  
  
  
  
  
  function getradio()
  {

  	var elems = document.getElementsByName("browser");
  	for(var i=0;i<elems.length;i++)
  	{
  		if(elems[i].checked==true)
  		{
  			
  		       document.getElementById("tr3").style.visibility="visible" ;  
  		}
  		else
  			if(elems[i].checked==false)
  		{
  				
  			       document.getElementById("tr3").style.visibility="hidden";
  		}
  	}
  	
  }
  
  
  function getComplaintReport(fname)
  {
  	var total='total';
  	window.open('showComplaintDetails.jsp?uname='+fname+'&status='+total+'','mywindow','width=1000, height=850, toolbar=false, location=false, status=no, menubar=no, resizable=no, scrollbars=yes');
  	
  }
  
  function getComplaintReportp(fname)
  {
  	var total='ptotal';
	window.open('showComplaintDetails.jsp?uname='+fname+'&status='+total+'','mywindow','width=1000, height=850, toolbar=false, location=false, status=no, menubar=no, resizable=no, scrollbars=yes');
  
  	
  }
  function getComplaintReports(fname)
  {
  	var total='stotal'; 	
	window.open('showComplaintDetails.jsp?uname='+fname+'&status='+total+'','mywindow','width=1000, height=850, toolbar=false, location=false, status=no, menubar=no, resizable=no, scrollbars=yes');
  }
</script>  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SmartGrid</title>
</head>
<body style="font-size: 14 px;">

<%!
Connection conn,conn1 ;
String ReportName="",Description="",Entby="",Name="",EmailID="",Email1="",FileName="",Category="";
String Priority="",ClosingComments="",ClosedBy="",Status="";
Date ComplaintDateTime,UpadteDateTime;
String ContactNumber="";

%>
<% String username2=session.getAttribute("userid").toString();


   String reportno="";
   String reportname="";
   int tot=0,ptot=0,stot=0;

String PageName2=request.getParameter("PageName");
System.out.println("Pagename==>"+PageName2);
try{
	Class.forName(MM_dbConn_DRIVER);
conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
conn1=DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	Statement st = conn.createStatement();
	
	Statement detcomp=conn1.createStatement();
/* 	 Pagename2=request.getParameter("PageName"); */
	String sql = "select ReportNo,ReportName from smartgrid.t_reportnumber where PageName = '"+PageName2+"'";
	System.out.println("sql report regcomp===>"+sql);
	ResultSet rs = st.executeQuery(sql);
	while(rs.next())
	{
		reportno = rs.getString("ReportNo");
		reportname=rs.getString("ReportName");
	}
	System.out.println(reportno);
	System.out.println(reportname);
	
	String sqltot="select count(*) as tot from db_gps.t_ComplaintDetail where EntBy='"+username2+"'  and   Website='SmartGrid' order by UpdatedDateTime ";
	System.out.println("Total Query is " +sqltot);
	ResultSet rscom=detcomp.executeQuery(sqltot);
	if(rscom.next())
	{
		tot=rscom.getInt("tot");
	}
	System.out.println("Total Complaint Count is " +tot);


	String sqlptot="select count(*) as tot1 from db_gps.t_ComplaintDetail where EntBy='"+username2+"' and Status='Pending'  and   Website='SmartGrid' order by UpdatedDateTime ";
	System.out.println("Pending Query is " +sqlptot);
	ResultSet rscom1=detcomp.executeQuery(sqlptot);
	if(rscom1.next())
	{
		ptot=rscom1.getInt("tot1");
	}
	System.out.println("Pending Complaint Count is " +ptot);


	String sqlstot="select count(*) as tot2 from db_gps.t_ComplaintDetail where  EntBy='"+username2+"' and Status='Closed' and   Website='SmartGrid'      order by UpdatedDateTime ";
	System.out.println("Solved Query is " +sqlstot);
	ResultSet rscom2=detcomp.executeQuery(sqlstot);
	if(rscom2.next())
	{
		stot=rscom2.getInt("tot2");
	}
	System.out.println("Solved Complaint Count is " +stot);

	
	
	
	
	
}catch(Exception e)
{
	System.out.println("******* Exception "+e);
}
finally
{

 conn.close();
}


String fname="";
String lname="";
String email="";
/* String tot="0";
String ptot="0";
String stot="0"; */

/*int tot=0,ptot=0,stot=0;
String sqltot="select count(*) as tot from db_gps.t_ComplaintDetail where EntBy='"+fname+" "+lname+"' or Name='"+fname+" "+lname+"' or Email1='"+email+"' order by UpdatedDateTime ";
System.out.println("Total Query is " +sqltot);
ResultSet rscom=detcomp.executeQuery(sqltot);
if(rscom.next())
{
	tot=rscom.getInt("tot");
}
System.out.println("Total Complaint Count is " +tot);


String sqlptot="select count(*) as tot1 from db_gps.t_ComplaintDetail where (EntBy='"+fname+" "+lname+"' or Name='"+fname+" "+lname+"' or Email1='"+email+"') and Status='Pending' order by UpdatedDateTime ";
System.out.println("Pending Query is " +sqlptot);
ResultSet rscom1=s1.executeQuery(sqlptot);
if(rscom1.next())
{
	ptot=rscom1.getInt("tot1");
}
System.out.println("Pending Complaint Count is " +ptot);


String sqlstot="select count(*) as tot2 from db_gps.t_ComplaintDetail where (EntBy='"+fname+" "+lname+"' or Name='"+fname+" "+lname+"' or Email1='"+email+"') and Status='Closed' order by UpdatedDateTime ";
System.out.println("Solved Query is " +sqlstot);
ResultSet rscom2=s1.executeQuery(sqlstot);
if(rscom2.next())
{
	stot=rscom2.getInt("tot2");
}
System.out.println("Solved Complaint Count is " +stot);
 */









%>
 <form name=userinfo method="post" action="complaint.jsp" enctype="multipart/form-data"   onsubmit="return validateform1();" >
            <center>
            <br>
            <div class="module form-module">
           <div class="toggle"><!-- <i class="fa fa-times fa-pencil"> --></i>
           </div>
           <div class="form">
    <h2>
Complaint Registration Form</h2>
  <!--   <form> -->
  <!--   <table> -->
    
    <table>
    <tr>
    <td>
    <label1 > Total Complaint:</label1>
    <a href="#" onclick="getComplaintReport('<%=username2 %>')"><font size="2" color="black"><b><%=tot %></b></font></a>
    
    
    </td>
    
     <td style="margin-left: 10 px;">
    <label1 > Pending:</label1>
     <a href="#" onclick="getComplaintReportp('<%=username2%>')"><font size="2" color="black"><b><%=ptot %></b></font></a>
    
    </td>
    
    <td style="margin-left: 20 px;">
    <label1 > Closed:</label1>
    
     <a href="#" onclick="getComplaintReports('<%=username2%>')"><font size="2" color="black"><b><%=stot%></b></font></a>
    
    </td>
    
    
    
    
    
    </tr>
    
    </table>
    
   <table> 
    <tr>
    <td>
    
  <label > <b>User Name:</b></label> </td><td>
    <div class="styled-select slate">
				
				<%=username2 %>
				
				
				</div>
				
		</td>
		</tr>
		<tr>	
		<td>	
	<label ><font size='2' color='red'>*</font><b>Describtion:</b></label></td><td>
	<div class="styled-select slate">
			
		<textarea id="describtion" name="describtion">  </textarea>
			
			<input type="hidden"  name="PageName" id="PageName"  value=<%=PageName2 %> >
				</div>
			</td>
			</tr>
			<tr>
			<td>	
	<label ><b>Report Name:</b> </label></td><td>
	<div class="styled-select slate">
			
				
				<%=reportname %>
				
				<input type="hidden"  name="ReportName" id="ReportName"  value=<%=reportname %> >
				
				
				</div>
			</td>
			</tr>
			<tr>
			<td>	
	<label ><b>Category :</b> </label></td><td>
	<div class="styled-select slate">
				<select   id="Category" name="Category" style='width: px; height: auto;'>
					
					<option value="Website">Website</option>
					<option value="Device">Device</option>
					<option value="Change Request">Change Request</option>
					<option value="Slow query log">Slow Query Log</option>
					
					
				  
				</select></div>
			</td>
			</tr>
			
			
			<tr>
			<td>	
	<label ><font ><b>Priority :</b> </label></td><td>
	<div class="styled-select slate">
				<select   id="priority" name="Priority" style='width: px; height: auto;'>
					
					<option value="Low">Low</option>
					<option value="High">High</option>
				
					
					
				  
				</select></div>
			</td>
			</tr>
			
	<!-- <tr>
			<td>	
	<label ><b>Priority :</b> </label></td><td>
	<div class="styled-select slate">
				<select   id="priority" name="" style='width: px; height: auto;'>
					
					<option value="Low">Low</option>
					<option value="High">High</option>
				
					
					
				  
				</select></div>
			</td>
			</tr> -->
	
	
	<tr>
			<td>	
	<label ><font size='2' color='red'>*</font><b>Email-id:</b> </label></td><td>
	<div class="styled-select slate">
				<input type="text"  name="EmailID" id="EmailID" >
				
			
					
				  
				</div>
					 <label1> Please Enter Comma seperated Email id's	</label1>	
			</td>
			</tr>

	<tr>
			<td>	
	<label ><b>Call Me Back:</b> </label></td><td style="padding: 0;" width="5%">
	<input type="checkbox" name="browser" id="browser"  value="1"  onclick="getradio()" style="width: 20px;"> 
	
				</td >
				
		
					
				  
			
			</tr>
	
	
	
			
			
			
						 
			</table>	
			
			

 <div id="tr3" style="visibility:hidden;">
<input type="text"  name="Number" id="Number" placeholder="Please Enter Your Mobile No">
</div>
      <input type="file" name="document" id="document" onchange="upload()"/>
      
      <a href="#" onclick="removess();" id="remove2" style="display: none;"><font size="2" color="black" face="Arial">Remove</font></a>	
      
      <label1> You can upload screen shot of Error page	</label1>	
      
      <button>Submit</button>







      <!-- <button>Reset</button> --> 
      
      </div>
</div>
      
    </form> 



</body>
</html>
