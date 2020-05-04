<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> --%>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->


<%@ include file="Conn.jsp"%>
<%@page import="java.util.*,java.sql.*" %>
<html>
<body>
<style>
div.container {
    width: 100%;
    border: 1px solid gray;
}

header{

  font-size: 2em;
    margin-top: -2;
   /*  margin-bottom: 0.67em; */
   margin-bottom:-21 px;
    margin-left: 0;
    margin-right:0;
    font-weight: normal;
  overflow:auto;
   /*  padding: 0.40em; */
   padding: -0.6em;
      color:#58666e;
      font-family:Arial;
      font-weight:300;
      
    /* background-color: #D8592B; */
    
   /*  background-color:#7D7A78; */
        background-color: #f5f5f5;
    clear: left;
    text-align: center;
    -webkit-font-smoothing:antialiased;

  /*  position:fixed;
    left: 20%; */
   }

footer
{

 font-size: 12 px;
    margin-top: 0.3em;
    margin-bottom: 0.3em;
    margin-left: 0;
    margin-right: 0;
    font-weight: bold;

   background-color: #f5f5f5; 
  
    padding: 0em;
   /*  color: white; */
   color:#58666e;
    font-family:'Source Sans Pro', 'Helvetica Neue', Helvetica, Arial, sans-serif;
-webkit-font-smoothing:antialiased;
    clear: left;
    text-align: center;
 overflow:auto;

}


/* div.abs {
    width: 100px;
    height: 100px;
    background: red;
    -webkit-transition-property: width; /* Safari */
    /* -webkit-transition-duration: 2s; /* Safari */
   /* transition-property: width;*/
  /*  transition-duration: 2s; */
    
/*}*/

/* div.abs:hover {
  /*  width: 300px;*/
} */

/* #divfix {
      
       position: fixed;
      
        } */

/* ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #333;
}

li {
    float: left;
}

li a {
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

li a:hover {
    background-color: #111;
}
 */

</style>





 <% String username1=session.getAttribute("userid").toString(); 
 
 String PageName=this.getClass().getName();
String ReportNo="";

 String reportno = "";

 System.out.println("pagename that we got in here is :- "+PageName);

 PageName=PageName.substring(PageName.lastIndexOf(".")+1,PageName.length());
 System.out.println(PageName);
 PageName=PageName.replace("_",".");
 PageName=PageName.replace(".005f","_");
 System.out.println(PageName);
 try
 {
	 
	 Class.forName(MM_dbConn_DRIVER);
	 Connection REPNo=DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
  Statement stRepNo=REPNo.createStatement();	 
 String Reportnosql="Select * from smartgrid.t_reportnumber  where PageName='"+PageName+"'";
 System.out.println("Report No===>"+Reportnosql);
 ResultSet ResRepNo=stRepNo.executeQuery(Reportnosql);
 if(ResRepNo.next())
 {
	 reportno= ResRepNo.getString("ReportNo");
 }
 
 
 
 }
 
 catch(Exception e)
 {
	 e.printStackTrace();
	 
 }
 
 
 

 
 
 %>
 <div style="height:50px;" >
 
<header  >
   SmartGrid Infra LLP
  <!-- <div style="text-align: right; font-size:0.5 px; font-weight: normal;"> login</div> -->
</header>
<%--  <div style="text-align: left; padding-right:50px; font-size:0.5 px; font-weight: normal;background-color: #f5f5f5; "> <input type="hidden" name="PageName" id="PageName" value="<%=PageName %>"/>
		 <a href="#" onclick="regcomplaint('<%=PageName %>')" title="Register Complaint">Register Complaint</a>
		 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
</div> --%>
 
 <%-- <div style="text-align: right; padding-right:0px; padding-top:12px; font-size:0.5 px; font-weight: normal;background-color: #f5f5f5; "> <a   href="#" onclick="regcomplaint('<%=PageName %>')" title="Register Complaint"><font color="black">Register Complaint</font></a>    <font color="black">Report No: <%=reportno %></font> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 
  Welcome <%=username1%></div>
</div> --%>

 <div style="text-align: right; padding-left:50px; font-size:0.5 px; font-weight: normal;background-color: #f5f5f5; "> Welcome <%=username1%></div>
<%-- <div style="margin-left: 60 px; text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#" onclick="regcomplaint('<%=PageName %>')" title="Register Complaint"><font color="black">Register Complaint</font></a>&nbsp;&nbsp;&nbsp; <font color="black">Report No: <%=reportno %></font></div> --%>
</div>
<!-- <ul>
  <li><a class="active" href="#home">Home</a></li>
  <li><a href="#news">News</a></li>
  <li><a href="#contact">Contact</a></li>
  <li><a href="#about">About</a></li>
</ul>
 -->

</body>
<script>

function regcomplaint(PageName)
{
	try{
		 //alert(e);
		// var PageName = document.getElementById("PageName").value;
		// PageName = "bcndsjh";
	window.open('RegisterComplaint.jsp?PageName='+PageName,'Win','width=710,height=600,top=200,left=200,scrollbars=yes');	 
	 }catch(e)
	 {
		 alert(e);
	 }
}
</script>


</html>