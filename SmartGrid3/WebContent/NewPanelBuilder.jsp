<%-- <jsp:useBean id="fleetview" class="com.fleetview.beans.classes" scope="page"> --%>
<%-- <%@page contentType="text/html" %> --%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.util.*,java.sql.*" %>
<%@ include file="headernew.jsp"%>
<%-- <%@ include file="DisplayPanelHeader.jsp"%> --%>
<%-- <%@ include file="DisplayPanelHeader.jsp"%> --%>
<!DOCTYPE html>
<html>
<head>
    <title>Camera Report</title>
    <link href="themes/4/js-image-slider.css" rel="stylesheet" type="text/css" />
    <script src="themes/4/js-image-slider.js" type="text/javascript"></script>
    <link href="" rel="stylesheet" type="text/css" />
    
<link rel="stylesheet" type="text/css" href="css/cpanel_002_popup.css"> 
<link rel="stylesheet" type="text/css" href="css/cpanel_colors.css">
<link rel="stylesheet" type="text/css" href="css/form.css" media="all">
    
<script type="text/javascript" language="javascript" src="calendar/prototype-1.js"></script>
<script type="text/javascript" language="javascript" src="calendar/prototype-base-extensions.js"></script>
<script type="text/javascript" language="javascript" src="calendar/prototype-date-extensions.js"></script>
<script type="text/javascript" language="javascript" src="calendar/behaviour.js"></script>
<script type="text/javascript" language="javascript" src="calendar/datepicker.js"></script>
<link rel="stylesheet" href="calendar/datepicker.css">
<script type="text/javascript" language="javascript" src="calendar/behaviors.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>



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

   /* div.absolute {
    position: absolute;
    left: 200px;
    width:100%;
    border:2;
}     */

html, body { height: 100%; padding: 0; margin: 0; } 

/* #topdisppanel,
#bottomdisppanel {
    position: absolute;
    left: 0;
    right: 0;
    height: 80%;
}

#topdisppanel {
    top: 0%;
   /*  background-color: orange; */
  background-color: orange;
}

#bottomdisppanel {
    bottom: 0%;
    background-color: white;
}

#footerdisppanel {
    bottom: 0%;
    background-color: DarkGray;
}   
 */
/* div.mainabc { width: 100%; height: 5%; float: left; } */
div.abc { width: 50%; height: 50%; float: left; }
#div0 { background: #AAA; }
#div1 { background: #AAA; }
#div2 { background: #AAA; }
#div3 { background: #AAA; }

div.pqr { width: 25%; height: 50%; float: left; }
#div0 { background: #AAA; }
#div1 { background: #AAA; }
#div2 { background: #AAA; }
#div3 { background: #AAA; }
#div4 { background: #AAA; }
#div5 { background: #AAA; }
#div6 { background: #AAA; }
#div7 { background: #AAA; }

img.pqr1 {width:100%; height:100%}
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

</style>
    
<script type="text/javascript"> 

   


function dateformat(days)
{
	if(days=='Jan')
		return(1);
	else if(days=='Feb')
		return(2);
	else if(days=='Mar')
		return(3);
	else if(days=='Apr')
		return(4);
	else if(days=='May')
		return(5);
	else if(days=='Jun')
		return(6);
	else if(days=='Jul')
		return(7);
	else if(days=='Aug')
		return(8);
	else if(days=='Sep')
		return(9);
	else if(days=='Oct')
		return(10);
	else if(days=='Nov')
		return(11);
	else if(days=='Dec')
		return(12);
 }


function formvalidation()
{
	var row = document.getElementById("element_3_11").value;
	
	var column = document.getElementById("element_3_12").value;
	
	var total=row*column;
	
	
	var i;
	for (i = 0; i < total; i++) {

 	var location = document.getElementById("element_3_8"+i).value;
 	
 	if(location=="Select")
 		{
 		alert("Please Select Location");
 		
 		return false;
 		
 		}
	
 	var campos = document.getElementById("element_3_9"+i).value;
 	
 	if(campos=="Select")
		{
		alert("Please Select Camera Position");
		
		return false;
		
		}
 	
	}	
	
}


function datevalidate()
{
	
	alert("Here");
	
	
// 	var locations = document.getElementById("element_3_8").value;
// 	alert("locations:-"+locations);
	
	var date1 = document.getElementById("date1").value;
	var hr1="";
	var min1="";
	var dm1,dd1,dy1,dm2,dd2,dy2;
	var dd11,yy11,mm1,mm2,mm11,dd22,yy22,mm22;
	dd11=date1.substring(0,2);
	mm1=date1.substring(3,6);
	mm11=dateformat(mm1);
	yy11=date1.substring(7,11);
	hr1 = date1.substring(12,14)
	min1 = date1.substring(15,17)
	var date=new Date();
	var month=date.getMonth()+1;
	var day=date.getDate();
	var hr=date.getHours();
	var min=date.getMinutes();
	//alert(hr);
	//alert(min);
	var year=date.getFullYear();
	//alert("year1   "+yy11+"   year  "+year);
	if(yy11<year) 
	{
		
		alert("selected date should not be Less than todays date");
		document.getElementById("date1").value="";
		document.getElementById("date1").focus;
		return false;
	}
	else if(year==yy11)
	{
		//alert("month1   "+mm11+"   month  "+month);
			if(mm11<month)
		{
			alert("selected date should not be Less than todays date");
			document.getElementById("date1").value="";
			document.getElementById("date1").focus;
			return false;
		}
			else
				if(mm11==month)
				{
					//alert("day1   "+dd11+"   day  "+day);
					if(dd11<day)
					{
						alert("selected date should not be Less than todays date");
						document.getElementById("date1").value="";
						document.getElementById("date1").focus;
						return false;
					}
					else
						if(dd11==day)
						{
							//alert("hr1   "+hr1+"   hr  "+hr);
							if(hr1<hr)
							{
								alert("selected date should not be Less than todays date");
								document.getElementById("date1").value="";
								document.getElementById("date1").focus;
								return false;
							}
							else
								if(hr1==hr)
								{
									//alert("min1   "+min1+"   min  "+min);
									if(min1<min)
									{
										alert("selected date should not be Less than todays date");
										document.getElementById("date1").value="";
										document.getElementById("date1").focus;
										return false;
									}
								}
					    }
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
					if(days=='May') //timeformat: "%M:%S"
						
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




<script type="text/javascript">

setInterval(autorequest, (20 * 1000));

function autorequest(){
	
	var locations = document.getElementById("element_3_8").value;
	//var location=document.getElementById("element_3_1").value;
	//var km=document.getElementById("element_3_2").value;
	 try
		{
	//alert("ajax 222");
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
				//alert(reslt);
				var reslt1=reslt.split("#");
			
				var sampletext="https://s3.ap-south-1.amazonaws.com/smartgridinfra/"+reslt1[0].trim();
				var sampletext1="https://s3.ap-south-1.amazonaws.com/smartgridinfra/"+reslt1[1].trim();
				var sampletext2="https://s3.ap-south-1.amazonaws.com/smartgridinfra/"+reslt1[2].trim();
				var sampletext3="https://s3.ap-south-1.amazonaws.com/smartgridinfra/"+reslt1[3].trim();
				//alert("sampletext:-"+sampletext);
				//alert("sampletext1:-"+sampletext1);
				//alert("sampletext2:-"+sampletext2);
				//alert("sampletext3:-"+sampletext3);
				//$('#imgZoom').src=sampletext;
				
				for(var j=0;j<reslt1.length;j++)
					{
					//alert("imgZoom"+j);
					//alert(reslt1[j].trim());
					try{
					document.getElementById("imgZoom"+j).src="https://s3.ap-south-1.amazonaws.com/smartgridinfra/"+reslt1[j].trim();
					}catch( e){}
					
					}
				
				
		
				}
				catch(e)
				{
					alert(e);
				}
			}
		};
		
	
		ajaxRequest.open("POST", "displaypanelAjax.jsp" , true);
		ajaxRequest.send(null); 
		}
		catch(e)
		{
			alert(e);
		}
	
}

function AutoRefresh( t ) {
    setTimeout("location.reload(true);", t);
 }
 
 
 function Redirct(){
	 
	 	 	try{
	 	 		
	 	 	var access=document.getElementById("element_3_10").value;
	 	 //	alert("access:-"+access);
	 	 		if(access == "ssmbasic")
	 			{
	 		var rows = 2;
// 	 		alert("rows:-"+rows);
	 		var columscount = 4;
	 			}
	 	 		else
	 	 			{
	 	 			var rows = document.getElementById("element_3_6").value;
//	 	 	 		alert("rows:-"+rows);
	 		 		var columscount = document.getElementById("element_3_7").value;
	 	 			}
	 		var gridname = document.getElementById("element_3_88").value;
	 		//alert("gridname"+gridname);
	 		
	 		//alert("rows:-"+rows);
// 	 		alert("columscount:-"+columscount);a
	 		
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
	 				//if (request.status == 200) {
	 				try
	 				{
	 					
	 				var reslt=ajaxRequest.responseText;
	 			    var buffer;
	 				//var result1;
	 				//result1=reslt;
	 				//var abc=result1.split("#");
	 				var abc=ajaxRequest.responseText.split("#");
//  	 				alert(abc[0]);
 	 				var rs=abc[0];
 	 				var rs1=rs.trim();
//  	 				alert("vverferf"+rs1);
 	 				if(rs1=="NotDone")
 	 					{
 	 					alert("Please Try Again!!");
 	 					}
 	 				else
 	 					{
	 				document.getElementById("element_3_6").value="";
	 				document.getElementById("element_3_7").value="";
	 				document.getElementById("bottomdisppanel").innerHTML=abc[0];
	 				document.getElementById("element_3_10").value=abc[1];
	 				//alert("abc[0]"+abc[1]);
	 				document.getElementById("element_3_11").value=abc[2];
	 				//alert("abc[0]"+abc[2]);
	 				document.getElementById("element_3_12").value=abc[3];
 	 					}
	 	
	 					
	 				}catch(e)
	 				{
	 				alert(e);
	 				}
	 				
	 				//}//
	 			} 
	 		};
	 		 var queryString = "?rows="+rows+"&columscount="+columscount+"&access="+access+" ";
	 		ajaxRequest.open("GET", "AjaxNewpanelBuilder.jsp" + queryString, true);
	 		ajaxRequest.send(null); 
	 		}
	 	    catch(e)
	 		{
	 		  alert(e);
	 		}	
	 	
	 	
	 	
 }

</script>											


</head>

<%! Connection conn = null;
	Statement st = null;
	Statement st1 = null;
	Statement st2 = null;
	Statement st3 = null;
	Statement st4 = null;
	Statement st5 = null;
	Statement st6 = null;
	
	String date1 = "";
	String date2 = "";
	String from ="";
	String to ="";
	String fromdate="";
	String todate="";
	
	String time1 = "";
	String time2 = "";
	String time3="";
	String time4="";
	
	String vehno="";
%>

<%

	
%>	

<%
String vehlist = "";
String unitid="",camerapos="";
try{
	access=session.getAttribute("Access").toString();
	System.out.println("access>>>>"+access);
	String frompage = request.getParameter("frompage");
	//vehlist = session.getAttribute("VehList").toString();
	//System.out.println("The vehicle list>>>>"+vehlist);

	
	 Class.forName(MM_dbConn_DRIVER);
	 conn = DriverManager.getConnection(MM_dbConn_STRING, MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
	 st = conn.createStatement();
	 st1 = conn.createStatement();
	 st2 = conn.createStatement();
	 st3 = conn.createStatement();
	 st4 = conn.createStatement();
	 st5 = conn.createStatement();
	 st6 = conn.createStatement();
	 
	 //statusname=request.getParameter("status");
	 //System.out.println("statusname "+statusname);
// 	 if(statusname==null)
// 	 {
// 	 	statusname="All";
// 	 }
// 	 System.out.println("statusname "+statusname);
	 System.out.println("  Date1 ==>"+date1+ "Date2 ==>"+date2);

}catch(Exception e){
	System.out.println("Exception "+e);
}
%>on


<body>
<br>
<br>

<div align="center">
	<div style="margin-center: 200px">
	<font size="3"><B>Display Panel Settings</B></font></div>
</div>
<%


int count = 0;

%> 

<%if(!access.equalsIgnoreCase("ssmbasic")) {

%>



    <form id="camera_jpg_report" name="camera_jpg_report" action="NewPanelBuilderinsert.jsp" method="post" onsubmit="return formvalidation(); ">

    <div align="center" id="topdisppanel">
    
       
       

      

      
       <table border="0" width="600" align="center" style="padding-top:25px; padding-left:25px;" class="" >
       <br>
       <br>
       <tr><b>Enter No. Of Rows And Columns To View Grid</b></tr>
<tr>
<td>
<label class="description" for="element_1"><b></b> </label>
<b>Rows:</b><input style="width:20%;" id="element_3_6" name="element_3_6" maxlength="2" class="element text small" type="text"  value=""/>
</td>
<td>
<label class="description" for="element_1"><b></b> </label>
<b>Columns:</b><input style="width:20%;" id="element_3_7" name="element_3_7" maxlength="2" class="element text small" type="text"  value=""/>
</td>
<td>
<label class="description" for="element_1"><b></b> </label>
<b>GridName:</b><input style="width:50%;" id="element_3_88" name="element_3_88" maxlength="100" class="element text small" type="text"  value=""/>
</td>
<br>
<br>
<td align="justify">
<input id="saveForm" class="button_text" type="button" name="submit" value="View" onclick="Redirct();"/>
</td>
</tr>
</table>
    
    </div>
    <div align="center">
    <input id="element_3_10" name="element_3_10" class="element text small" type="hidden"  value="<%=access%>"/>
    <input id="element_3_11"  style="display:none" name="element_3_11" class="element text small" type="text"  value=""/>
    <input id="element_3_12"  style="display:none" name="element_3_12" class="element text small" type="text"  value=""/>
    </div>
    
       
<div align="right" id="bottomdisppanel" >
      
      



</div>   
 
 <div id="footerdisppanel">
    
  
    </div> 
     </form>

   <%} else{
   
   
	
   %> 
   <form id="camera_jpg_report" name="camera_jpg_report" action="NewPanelBuilderinsert.jsp" method="post" onsubmit="return formvalidation(); ">

    <div align="center" id="topdisppanel">
    
       
       

      

      
       <table border="0" width="200" align="center" style="padding-top:25px; padding-left:25px;" class="" >
       <br>
       <br>
       <tr><b>Enter No. Of Rows And Columns To View Grid</b></tr>
<tr>
<td>
<label class="description" for="element_1"><b></b> </label>
<input style="display:none" id="element_3_6" name="element_3_6" maxlength="2" class="element text small" type="text"  value="4"/>
</td>
<td>
<label class="description" for="element_1"><b></b> </label>
<input style="display:none" id="element_3_7" name="element_3_7" maxlength="2" class="element text small" type="text"  value="2"/>
</td>
<td>
<label class="description" for="element_1"><b></b> </label>
<b>GridName:</b><input style="width:35%;" id="element_3_88" name="element_3_88"  class="element text small" type="text"  value="Default"/>
</td>

<td align="justify">
<input id="saveForm" class="button_text" type="button" name="submit" value="View" onclick="Redirct();"/>
</td>
</tr>
</table>
    
    </div>
    <div align="center">
    <input id="element_3_10" name="element_3_10" class="element text small" type="hidden"  value="<%=access%>"/>
    <input id="element_3_11"  style="display:none" name="element_3_11" class="element text small" type="text"  value=""/>
    <input id="element_3_12"  style="display:none" name="element_3_12" class="element text small" type="text"  value=""/>
    </div>
    
       
<div align="right" id="bottomdisppanel" >
      
      



</div>   
 
 <div id="footerdisppanel">
    
  
    </div> 
     </form>
   
   
   <%} %>



  
  

</body>
</html>
<%-- </jsp:useBean> --%>
 