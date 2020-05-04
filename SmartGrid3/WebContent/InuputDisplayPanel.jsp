<%@page import="java.awt.Window"%>
<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@page import="java.io.File"%>
<%@page import="java.io.*" %>
<%@page import="com.transworld.fleetview.framework.DisconnectionReport"
	import="com.transworld.fleetview.framework.VehiclePositionsViewDataHelper"
	import="com.transworld.fleetview.framework.DisconnectionReportViewData"
	import="com.transworld.fleetview.framework.VehicleDao"
	import="com.transworld.fleetview.framework.Utilities"
	import="com.transworld.fleetview.framework.VehicleRegistrationNumberList"
	import="powerOnOffReport.ImplementationOfDisconnection"
	import="powerOnOffReport.DisconnectionData"
	import="com.transworld.fleetview.framework.VehicleRegistrationNumberList"%>
	
	<!-- <link href="/FormTool/WebContent/css/Fleetview.css" rel="stylesheet" type="text/css"></link>
	
	
<style type="text/css">@import url(jscalendar-1.0/calendar-blue.css);</style>
<link href="css/css.css" rel="StyleSheet" type="text/css"></link> 
<link href="css/erratic.css" rel="StyleSheet" type="text/css"></link> -->

<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
	
	
<jsp:useBean id="fleetview" class="com.fleetview.beans.classes" scope="page">
<script>	

function Redirect()
{
    //alert("Record Inserted Successfully");
    window.location="MainFormDesign.jsp";
    //window.opener.location.reload();
	window.close();
	
}

function createnewform()
{
	try{

		var nameofproject = document.getElementById("element_3").value;
		var pagename = document.getElementById("element_3_1").value;
		//var cssname = document.getElementById("element_3_3").value;
		//var matrix = document.getElementById("element_3_4").value;
		var rows = document.getElementById("element_3_6").value;
		var columscount = document.getElementById("element_3_7").value;
		//var headerpage=document.getElementById("element_3_8").value;
		//var footerpage=document.getElementById("element_3_9").value;
		//alert(rows);
		//alert(columscount);
		
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
			
				var result1;
				result1=reslt;
				document.getElementById("element_3").value="";
				document.getElementById("element_3_1").value="";
				//document.getElementById("element_3_3").value="";
				//document.getElementById("element_3_4").value="";
				document.getElementById("element_3_6").value="";
				document.getElementById("element_3_7").value="";
				//document.getElementById("element_3_8").value="";
				//document.getElementById("element_3_9").value="";
				//document.getElementById("element_3_5").value=result1;
				//document.getElementById("element_3_2").value=result1;
				 alert(result1.trim());
				 window.location="MainFormDesign.jsp";
				 window.opener.location.reload();
				 window.close();
				 //request.getRequestDispatcher("MainFormDesign.jsp").forward(request, response);
				//location.reload();
				
					
				}catch(e)
				{
				alert(e);
				}
			} 
		};
		 //var queryString = "?nameofproject="+nameofproject+"&pagename="+pagename+"&cssname="+cssname+"&matrix="+matrix+"&rows="+rows+"&columscount="+columscount+"&headerpage="+headerpage+"&footerpage="+footerpage+" ";
		 var queryString = "?nameofproject="+nameofproject+"&pagename="+pagename+"&rows="+rows+"&columscount="+columscount+" ";
		//ajaxRequest.open("GET", "driver_briefing_RMail_Ajax.jsp" + queryString, true);
		ajaxRequest.open("GET", "Newforminsert.jsp" + queryString, true);
		ajaxRequest.send(null); 
		}
	    catch(e)
		{
		  alert(e);
		}	
	
	
	}

</script>
<%-- <%@ include file="Connections/conn.jsp" %> --%>
<%@ include file="FormToolHeader.jsp"%> 
<%!
Connection con1;
Statement st,st1;
%>

<%
//fleetview.getConnection(MM_dbConn_DRIVER,MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
st=con1.createStatement();
String datenew1="",datenew2="";
datenew1=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
datenew2=datenew1;

%>

 

 <!-- <form name="amcrep" method="post" action=""> --> 

<table border="0" width="400" align="center" Style="padding: 14px 0 0 10px;" class="sortable_entry" >
<tr>
<td>
<label class="description" for="element_1"><b>Web-site:</b> </label>
</td>
<td>
<!-- <input id="element_3" name="element_3"  class="element text small" type="text"  value=""/> -->
<select class="element select medium" id="element_3" name="element_3"> 
<option value="Select" selected="selected">Select</option>
<% String sqlwesite="select distinct(Website) from t_websitemaster";
      ResultSet rssqlwebsite=st.executeQuery(sqlwesite);
    while(rssqlwebsite.next())
    {%>
	<option value="<%=rssqlwebsite.getString("Website")%>" ><%=rssqlwebsite.getString("Website")%></option>  
 	 	  
 <%  } %>
</select>

</td>
</tr>

<tr>
<td>
<label class="description" for="element_1"><b>Page Name:</b> </label>
</td>
<td>
<input id="element_3_1" name="element_3_1"  class="element text small" type="text"  value=""/>
</td>
</tr>


<!-- <tr>
<td>
<label class="description" for="element_1"><b>CSS Name:</b> </label>
<input id="element_3_3" name="element_3_3"  class="element text small" type="text"  value=""/>
</td>
<td>
<select class="element select medium" id="element_3_3" name="element_3_3"> 
<option value="Select" selected="selected">Select</option>
<option value="FleetView" >FleetView</option>
<option value="ERP" >ERP</option>
</select>

</td>
</tr>

<tr>
<td>
<label class="description" for="element_1"><b>HeaderPage Name:</b> </label>
</td>
<td>
<select class="element select medium" id="element_3_8" name="element_3_8"> 
<option value="Select" selected="selected">Select</option>
<option value="FleetView" >FleetView</option>
<option value="ERP" >ERP</option>
</select>
</td>
</tr>


<tr>
<td>
<label class="description" for="element_1"><b>FooterPage Name:</b> </label>
</td>
<td>
<select class="element select medium" id="element_3_9" name="element_3_9"> 
<option value="Select" selected="selected">Select</option>
<option value="FleetView" >FleetView</option>
<option value="ERP" >ERP</option>
</select>
</td>
</tr> -->


<!-- <tr>
<td>
<label class="description" for="element_1"><b>Matrix Name:</b> </label>
<select class="element select medium" id="element_3_4" name="element_3_4"> 
<option value="Select" selected="selected">Select</option>
<option value="1,1" >1,1</option>
<option value="2,2" >2,2</option>
<option value="3,3" >3,3</option>
</select>
</td>
</tr> -->

<tr>
<td>
<label class="description" for="element_1"><b>Rows:</b> </label>
</td>
<td>
<input id="element_3_6" name="element_3_6" maxlength="2" class="element text small" type="text"  value=""/>
</td>
</tr>


<tr>
<td>
<label class="description" for="element_1"><b>Columns:</b> </label>
</td>
<td>
<input id="element_3_7" name="element_3_7" maxlength="2" class="element text small" type="text"  value=""/>
</td>
</tr>


<tr>
<td>
</td>
<td>
<input id="saveForm" class="button_text" type="submit" name="submit" value="Create" onclick="createnewform()"/>
<!-- <input id="element_3_5" name="element_3_5"  class="element text small"   value=""/> -->
<%-- <input id="saveForm" class="button_text" type="submit" name="submit" value="Submit" onclick="window.open('formdesign.jsp?pagename=<%=request.getParameter("element_3_5")%>','_self');"/> --%>
<!-- <input id="saveForm" class="button_text" type="submit" name="submit" value="Submit" onclick="window.open('MainFormDesign.jsp','_self');"/> -->
<input id="saveForm" class="button_text" type="submit" name="submit" value="Cancel" onclick="Redirect();"/>

</td>
</tr>



</table>
<input id="element_3_2" name="element_3_2"  class="element text small" type="hidden"  value=""/>

<%
String output="";
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
st=con1.createStatement();
st1=con1.createStatement();

ResultSet rst=null;
String form123=request.getParameter("element_3_2");
String sql="select body from t_pagemaster ";
//out.println("sql:-"+sql);
ResultSet rs=st.executeQuery(sql);
while(rs.next()){
	output=rs.getString("body");
	String fileName="trial";
	 File tagFile=new File("/usr/share/tomcat7/webapps/FleetViewtest1/",fileName+".jsp");
	 if(!tagFile.exists()){
	 try {
		tagFile.createNewFile();
		 FileWriter filewriter = new FileWriter(tagFile, true);
           filewriter.write(output);
           filewriter.close();
           //response.sendRedirect(formdesign.jsp);
           //<%-- <jsp:forward page="http://myfleetview.com:8080/FleetViewTest/formdesign.jsp" /> --
          // String redirectURL = "http://myfleetview.com:8080/FleetViewTest/formdesign.jsp";
	        //response.sendRedirect(redirectURL);
	 } catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	 }
}

%>

<% 
%>

</form>

<!-- </form> -->

</jsp:useBean>
  <%@ include file="footernew.jsp" %> 
 

