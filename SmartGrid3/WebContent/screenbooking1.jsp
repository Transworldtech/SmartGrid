
  <%@page import="org.apache.naming.java.javaURLContextFactory"%>
<%@ include file="headernew.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ page import="java.util.Date"%>
  <%@ page import = "java.sql.*"%>
  <%@page import="java.text.DecimalFormat"%>
  <%@ page  import="java.text.SimpleDateFormat" %>
  <%@page import="org.json.JSONObject" %>
  <%@page import="org.json.JSONArray" %>
          
         
    
      <style>
      
      
      select.medium
{
	width:70%;
	
	
	
}
    fieldset {
      border: 0;
    }
    label {
      display: block;
      margin: 30px 0 0 0;
    }
    .overflow {
      height: 200px;
    }
    
    
    
   
    
  </style>
    
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
		java.util.Date d = new java.util.Date();
		int hours = (d.getHours());
		int minutes = (d.getMinutes());
		int seconds = (d.getSeconds());
		/* String nwfrmtdte = new SimpleDateFormat("dd-MMM-yyyy")
		.format(new java.util.Date()); */
		 /* DateFormat dateFormat = new SimpleDateFormat("dd-MMM-yyyy");

		Calendar now123=Calendar.getInstance();
		
		String sysdate22 = dateFormat.format(now123.getTime());
		System.out.println(">>>>>>>>>>>>>>>n "+sysdate22);  */
		String nwfrmtdte ="16-NOV-2016";
		String sysdate22 ="16-NOV-2016";
		%>
  
<html>
<head>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=utf-8"> -->
<meta name="viewport" content="width = device-width">
<title>Smart-Grid</title>
<!-- <!-- <link rel="stylesheet" type="text/css" href="img/style1.css"> -->
<!-- <style type="text/css">@import url(jscalendar-1.0/calendar-blue.css);</style> -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="img/jquery.seat-charts.min.js"></script>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
   <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 <!-- <script src="jquery-1.8.2.js"></script> -->
<script src="jquery.ajaxfileupload.js"></script>
<!-- <script type="text/javascript" language="javascript" src="calendar/prototype-1.js"></script>
<script type="text/javascript" language="javascript" src="calendar/prototype-base-extensions.js"></script>
<script type="text/javascript" language="javascript" src="calendar/prototype-date-extensions.js"></script>
<script type="text/javascript" language="javascript" src="calendar/behaviour.js"></script> 
<script type="text/javascript" language="javascript" src="calendar/datepicker.js"></script> 
<link rel="stylesheet" href="calendar/datepicker.css">
<script type="text/javascript" language="javascript" src="calendar/behaviors.js"></script>  -->
</head>
<body>
<!-- <div id="page">
<div class="section header clear">
<div class="logo">
<h1 class="theme-name"><a href="http://www.goocode.net"><strong>Goocode</strong><span>Demo Platform</span></a></h1>
</div>
<div class="author-details">
Created: November 17, 2014<br>
Last Updated: November 17, 2014<br>
Author: goocode<br>
email: <a href="/cdn-cgi/l/email-protection#6e0f0a0307002e0901010d010a0b40000b1a"><span class="__cf_email__" data-cfemail="d6b7b2bbbfb896b1b9b9b5b9b2b3f8b8b3a2">[email&#160;protected]</span><script data-cfhash='f9e31' type="text/javascript">/* <![CDATA[ */!function(t,e,r,n,c,a,p){try{t=document.currentScript||function(){for(t=document.getElementsByTagName('script'),e=t.length;e--;)if(t[e].getAttribute('data-cfhash'))return t[e]}();if(t&&(c=t.previousSibling)){p=t.parentNode;if(a=c.getAttribute('data-cfemail')){for(e='',r='0x'+a.substr(0,2)|0,n=2;a.length-n;n+=2)e+='%'+('0'+('0x'+a.substr(n,2)^r).toString(16)).slice(-2);p.replaceChild(document.createTextNode(decodeURIComponent(e)),c)}p.removeChild(t)}}catch(u){}}()/* ]]> */</script></a>
</div>
</div>
<div class="section">
<p>Dear,<br>
You come to the demo platform for goocode.net. Some scripts or examples are displayed here, including PHP scripts, Javascript, MySQL, plugins, ets. Most of them are related to the front-end technology. May you like them.
</p>
</div> -->
<!-- <div class="section">
	<div style="text-align:center;">
		<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
		goocode-728*90
		<ins class="adsbygoogle"
			 style="display:inline-block;width:728px;height:90px"
			 data-ad-client="ca-pub-3762305523564574"
			 data-ad-slot="6959772397"></ins>
		<script>
		(adsbygoogle = window.adsbygoogle || []).push({});
		</script>
	</div>	
<h2 id="toc">jQuery election seat reservations online</h2>
<h3 id="1">1. Demo presentation</h3> -->
<p>

<script>
$(document).ready(function()  {
	
// 	 $('#mySpan').hide();
	 $('#total1').hide();
	 $('#x1').hide();
	/*  var duration=document.getElementById("noslot").value; 
	   console.log("duration===>"+duration);
	   var invalid=/^[0-9]+$/;
	    
	    var dura=duration*10;
	  var dura1=JSON.parse(dura);
	  alert("dura1==>"+dura1);
	    var x=$(this).val();
	    if(x=="video")
	    	{
	    	$('#mySpan').show();
	        $('#total').hide();
	        $('#x').show();
	        
	     
	        	 console.log("duration in if cond===>"+duration);
	        	$('#x').text("wscsc");
	        	
	        	
	        	
	        	
	    	
	    	}
	  if(x=="image")
	  {
	    	$('#mySpan').hide();
	    	$('#total').show();
	    	$('#x').hide();
	    	}	 */
	    	
	    
	
	
	
	
	$('input[type="file"]').ajaxfileupload({
		'action' : 'UploadFile.jsp',
		
		
	
		
		
		'onComplete' : function(response) {
			$('#upload').hide();
			$('#message').show();
			
			var statusVal = JSON.stringify(response.status);

			if(statusVal == "false")
			{
				$("#message").html("<font color='red'>"+ JSON.stringify(response.message) +" </font>");
			}	
			if(statusVal == "true")
			{
				$("#message").html("<font color='green'>"+ JSON.stringify(response.message) +" </font>");
			}			
		},
		'onStart' : function() {
			$('#upload').show();
			$('#message').hide();
		}
	});
});

</script>

<script>



<%-- document.getElementById("thealtdate").innerHTML = <%=x%>; --%>
	
$(function(){
	   $("#datepicker").datepicker({
	        dateFormat: 'dd-M-yy',
	        altField: '#thealtdate',
	        altFormat: 'yy-mm-dd'
	    });

	/* $('#mediatype').change(function() {
	    console.log($(this).val());
	   var duration=document.getElementById("noslot").value; 
	   console.log("duration===>"+duration);
	   var invalid=/^[0-9]+$/;
	    
	    var dura=duration*10;
	  var dura1=JSON.parse(dura);
	 // alert("dura1==>"+dura1);
	    var x=$(this).val();
	    if(x=="video")
	    	{
	    	$('#mySpan').show();
	        $('#total').hide();
	        $('#total1').hide();
	        $('#x').show();
	        $('#x1').show();
	        ratecalc();
	        	
	        	
	    	
	    	}
	  if(x=="image")
	  {
	    	$('#mySpan').hide();
	    	$('#total').show();
	    	$('#total1').show();
	    	$('#x').hide();
	    	$('#x1').hide();
	    	//ratecalc();
	    	}
	  
	  if(x=="select")
	  {
	    	$('#mySpan').hide();
	    	$('#total').hide();
	    	$('#total1').hide();
	    	$('#x').hide();
	    	$('#x1').hide();
	    	//ratecalc();
	    	}
	  
	  
	  
	  
	    	
	    
	}); */
	
	
	
	$('#noslot').change(function() {
	
		   var duration=document.getElementById("noslot").value; 
		   console.log("no slotduration===>"+duration);
		   var invalid=/^[0-9]+$/;
		    
		   var dura1=0;
		   var dura2=0;
		   var dura3=0.00;
		   if(duration.trim()!="")
			   {
			    dura1=parseInt(duration)/5;
			    //alert("dura1==>"+dura1);
			    dura2=duration%5;
			  // alert("dura2==>"+dura2);
			   if(dura2!="0")
				   {
				   dura3=dura1+1;
				   //alert("dura3==>"+dura3);
				   }
			   else
				   {
				   dura3=dura1;
				   }
			    
		    var dura=(parseInt(dura3)*price).toFixed(2);
		
		    $('#x').text(dura);
		
			   }
		   
		   if(duration.trim()=="")
		   {
	    var dura=0;
	
	    $('#x').text(dura);
	
		   }
	});
	
	
	
    $("#datepicker").datepicker({
        dateFormat: 'dd-M-yy',
        altField: '#thealtdate',
        altFormat: 'yy-mm-dd'
    });



});	

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

 <script >
 function showbox()
          {

    		//alert("hi");
    		var country = document.getElementById("country1").value;
    		//var country=e.options[e.selectedIndex].Text;
    	/* if(country!=null)
    		{
    		document.getElementById("f13").style.display="";
    		
    		}
    	else
    		{
    		document.getElementById("f13").style.display='none';
    		
    		} */
    		//alert(country);
    		
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
    			//	alert(reslt);
    				document.getElementById("state").disabled = false;
    				//alert("after true");
    				document.getElementById("state").innerHTML=reslt;
    				
    				
    			
    			} 
    		};
    		
    		var queryString = "?country="+country;
    		//alert("reslt");
    		ajaxRequest.open("GET", "AjaxGetState.jsp" + queryString, true);
    		ajaxRequest.send(null); 
    		
    		
    	}
    function showbox3()
    {

 		//alert("hi");
 		var city = document.getElementById("city").value;
 		//var country=e.options[e.selectedIndex].Text;
 	/* if(country!=null)
 		{
 		document.getElementById("f13").style.display="";
 		
 		}
 	else
 		{
 		document.getElementById("f13").style.display='none';
 		
 		} */
 		//alert(country);
 		
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
 			//	alert(reslt);
 				document.getElementById("loc").disabled = false;
 				//alert("after true");
 				document.getElementById("loc").innerHTML=reslt;
 				
 				
 			
 			} 
 		};
 		
 		var queryString = "?city="+city;
 		//alert("reslt");
 		ajaxRequest.open("GET", "AjaxGetLocation.jsp" + queryString, true);
 		ajaxRequest.send(null); 
 		
 		
 	}
    
    
    function showbox4()
    {

 		//alert("hi");
 		var country = document.getElementById("country1").value;
 		//var country=e.options[e.selectedIndex].Text;
 	/* if(country!=null)
 		{
 		document.getElementById("f13").style.display="";
 		
 		}
 	else
 		{
 		document.getElementById("f13").style.display='none';
 		
 		} */
 		//alert(country);
 		
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
 			//	alert(reslt);
 				document.getElementById("loc").disabled = false;
 				//alert("after true");
 				document.getElementById("loc").innerHTML=reslt;
 				
 				
 			
 			} 
 		};
 		
 		var queryString = "?country="+country;
 		//alert("reslt");
 		ajaxRequest.open("GET", "AjaxGetLocation.jsp" + queryString, true);
 		ajaxRequest.send(null); 
 		
 		
 	}
    
       function showbox2()
       {

       	//alert("hi");
       	var country = document.getElementById("country1").value;
       	//var country=e.options[e.selectedIndex].Text;

       	//alert(country);
       	
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
       			//alert(reslt);
       			document.getElementById("city").disabled = false;
       			document.getElementById("city").innerHTML=reslt;
       			
       		} 
       	};
       	
       	var queryString = "?country="+country;
       	ajaxRequest.open("GET", "AjaxGetCity.jsp" + queryString, true);
       	ajaxRequest.send(null); 
       	
       	
       }
       
       function showbox1()
       {

       	//alert("hi");
       	var state = document.getElementById("state").value;
       //alert(state);
       	//var country=e.options[e.selectedIndex].Text;
      /*  if(state!=null)
       	{
       	document.getElementById("f11").style.display="";
       	
       	}
       else
       	{
       	document.getElementById("f11").style.display='none';
       	
       	} */
       	//alert(country);
       	
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
       			//alert(reslt);
       			document.getElementById("city").disabled = false;
       			document.getElementById("city").innerHTML=reslt;
       		
       		} 
       	};
       	
       	var queryString = "?state="+state;
       	//alert(queryString);
       	ajaxRequest.open("GET", "AjaxGetCity.jsp" + queryString, true);
       	ajaxRequest.send(null); 
       	
       	
       }
       
       function showmediafile()
       {

       	//alert("hi");
       	var mediatype = document.getElementById("mediatype").value;
       //alert(state);
       	//var country=e.options[e.selectedIndex].Text;
      /*  if(state!=null)
       	{
       	document.getElementById("f11").style.display="";
       	
       	}
       else
       	{
       	document.getElementById("f11").style.display='none';
       	
       	} */
       	//alert(country);
       	
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
       			//alert(reslt);
       			document.getElementById("mediafile").disabled = false;
       			document.getElementById("mediafile").innerHTML=reslt;
       		
       		} 
       	};
       	
       	var queryString = "?mediatype="+mediatype;
       	//alert(queryString);
       	ajaxRequest.open("GET", "AjaxMediaFile.jsp" + queryString, true);
       	ajaxRequest.send(null); 
       	
       	
       }
     
       function showbox2()
       {

       	//alert("hi");
       	var country = document.getElementById("country1").value;
       	//var country=e.options[e.selectedIndex].Text;

       	//alert(country);
       	
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
       			//alert(reslt);
       			document.getElementById("city").disabled = false;
       			document.getElementById("city").innerHTML=reslt;
       			
       		} 
       	};
       	
       	var queryString = "?country="+country;
       	ajaxRequest.open("GET", "AjaxGetCity.jsp" + queryString, true);
       	ajaxRequest.send(null); 
       	
       	
       }
       
       
       
       
       
       
       
  
       </script>     
<style type="text/css">
.demo{width:700px; margin:40px auto 0 auto; min-height:450px;}
@media screen and (max-width: 360px) {.demo {width:400px}}

.front{width: 300px;margin: 5px 32px 45px 32px;background-color: #f0f0f0;	color: #666;text-align: center;padding: 3px;border-radius: 5px;}
.booking-details {float: right;position: relative;width:200px;height: 450px; }
.booking-details h3 {margin: 5px 5px 0 0;font-size: 13px;}
.booking-details p{line-height:26px; font-size:16px; color:#999}
.booking-details p span{color:#666}
div.seatCharts-cell {color: #182C4E;height: 25px;width: 25px;line-height: 25px;margin: 3px;float: left;text-align: center;outline: none;font-size: 13px;}
div.seatCharts-seat {color: #fff;cursor: pointer;-webkit-border-radius: 5px;-moz-border-radius: 5px;border-radius: 5px;}
div.seatCharts-row {height: 40px;}
div.seatCharts-seat.available {background-color: #B9DEA0;}
div.seatCharts-seat.focused {background-color: #76B474;border: none;}
div.seatCharts-seat.selected {background-color: #E6CAC4;}
div.seatCharts-seat.unavailable {background-color: #472B34;cursor: not-allowed;}
div.seatCharts-container {border-right: 1px dotted #adadad;width: 450px;padding: 20px;float: left;}
div.seatCharts-legend {padding-left: 0px;position: absolute;bottom: 16px;}
ul.seatCharts-legendList {padding-left: 0px;}
.seatCharts-legendItem{float:left; width:90px;margin-top: 10px;line-height: 2;}
span.seatCharts-legendDescription {margin-left: 5px;line-height: 30px;}
.checkout-button {display: block;width:80px; height:24px; line-height:20px;margin: 10px auto;border:1px solid #999;font-size: 14px; cursor:pointer}
#selected-seats {max-height: 150px;overflow-y: auto;overflow-x: none;width: 200px;}
#selected-seats li{float:left; width:72px; height:26px; line-height:26px; border:1px solid #d3d3d3; background:#f7f7f7; margin:6px; font-size:14px; font-weight:bold; text-align:center}
</style>
   <div class="demo">
   		<div id="seat-map">
			<div class="front">TIME-SLOT</div>					
		</div>
					
			

		<div class="booking-details" >
	


<div id="legend" style="margin-top:10px;"></div>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>		 


<%
String Origin="",Destination="";

String routeidd=request.getParameter("routeid");

String query1="select  c.Routeid,a.seat_capacity,b.AssetType,b.BusType,a.Origin,a.Destination,a.Duration,b.polid,b.Deviceid,b.End_customer,b.area,b.city,a.TripStartTime,a.TripEndTime  from  smartgrid.t_routemaster a inner join smartgrid.t_polmaster b on a.Vehiclecode=b.Vehiclecode inner join smartgrid.t_routepoints c on a.Routeid=c.Routeid   where a.Routeid='"+routeidd+"'";
System.out.println("query1"+query1);
ResultSet rs=st.executeQuery(query1);
if(rs.next())
{
 Origin=rs.getString("Origin");	
 Destination=rs.getString("Destination");
}

%>





<% 
String sttime1=request.getParameter("TripStarTime");
String endtime1=request.getParameter("TripEndTime");
String st12[]=sttime1.split(":");
String endtime2[]=endtime1.split(":");
String hh1=st12[0];
String mm1=st12[1];
String hh2=endtime2[0];
String mm2=endtime2[1];
/* DecimalFormat formatter = new DecimalFormat("00");
String hh2=formatter.format(hh1);
String mm2=formatter.format(mm1 *);*/
%>
			<!-- Hour: -->
<input type="hidden" name="hh" id="hh" value="<%=hh1%>" readonly="readonly" style="width: 20px;">
<input  type="hidden"   name="hh1" id="hh1" value="<%=hh2%>" readonly="readonly" style="width: 20px;">
<input  type="hidden"   name="mm1" id="mm1" value="<%=mm2%>" readonly="readonly" style="width: 20px;">

<!--   	Min: -->
  	<input type="hidden" name="mm" id="mm" value="<%=mm1 %>" readonly="readonly" style="width: 20px;">

  

 
<input type="hidden" id="loc" name="loc"  value="<%=request.getParameter("loc")%>"  >


	 <input type="hidden" id="datepicker" size="13" class="element text medium" style="width: 135px; height: 25px;" value="<%=request.getParameter("datetime") %>"></input>
			 <input id="thealtdate" type="hidden" />
 	<input type="hidden" id="mediatype" name="mediatype" value="<%=request.getParameter("mediatype")%>">
 	
<!--  	
<select class="element select medium" name="mediatype" id="mediatype" onchange="showmediafile();">
<option value="select">Select</option>
 <option value="image">Image</option>
 <option value="video">Video</option>
  -->

<!-- </select> -->

 <!--  <div> -->
<!--         <input id="btn" type="button" value="Show Slot" /> -->
   <!--  </div> -->



 


<br>
<br><br><br><br><br><br><br><br><br><br><br><br><br>
	
<!-- 		<font color="red">*</font> <font color="black" size="2">Media File:</font> -->
		<input type="hidden" id="mediafile" name="mediafile" value="<%=request.getParameter("mediafile")%>">
		 <!-- <br> <select   class="element select medium" disabled="disabled"  id="mediafile" name="mediafile" style="width: 400 px;">
			 <option value="Select">Select &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
</select> -->

<div>
TripFrom:<input type="text" readonly value="<%=Origin%>">
</div>

<br>
<br>

<div>
TripTo:<input type="text" readonly value="<%=Destination%>">
</div>
<br>
<br>

<div>
Date:<input type="text" readonly value="<%=request.getParameter("datetime")%>">
</div>

	<%
String duration=request.getParameter("duration");
System.out.println("duration:--------->"+duration);
int value=Integer.parseInt(duration)/5;
System.out.println("value:--------->"+value);
%>	
		
      <br>
      <%if(request.getParameter("mediatype").equals("Video"))
      {
    	  
    	  %>
<span id="mySpan" >
 <font color="red">*</font> <font color="black" size="2">No of Slots For Video:</font><br> <input type="text"  name="noslot" id="noslot" size="13" class="element text medium" value="<%=value%>" readonly style="width: 135px; height: 25px;"></input>   
</span>

<%}
      
      else
      {%>
    	  <span id="mySpan" >
 <font color="red">*</font> <font color="black" size="2">No of Slots For Image:</font><br> <input type="text"  name="noslot" id="noslot" size="13" class="element text medium" value="<%=value%>" readonly style="width: 135px; height: 25px;"></input>   
    	 </span>  
      <%}
      
      
      %>
<!-- 			<p><font color="black"> Rate :</font> <span id="rate">0</span></p> -->

<!-- <div>
<p><font color="black"> Duaration(Sec) :</font><input id="duration" type="text" readonly value=" "/>
</div> -->

			<p><font color="black">Slot: </font></p>
			<ul id="selected-seats"></ul>
			<p><font color="black"> No Slots :</font> <span id="counter">0</span></p>
			
	<span id="total1"><p><font color="black">Total: </font><b>₹<span id="total">0</span>
			
			
			</b></p></span>
			<!-- video total -->
	<span id="x1">	<font color="black">Total ₹</font><span id="x">0</span> </span>
		<br>
				<input type="submit" name="submit"  value="submit" style="border-style: outset; border-color: black" onclick="abc('total');return false">	
	
			<!-- <button class="checkout-button" name="b1" onclick="abc(total);">BUY</button> -->
			
			
<!-- 			<div id="legend"> -->
			
			
<!-- 			</div> -->
		</div>
	
		<!-- <div style="clear:both"></div> -->
   </div>

<script type="text/javascript">
var price=0; //price
var row1=0;
var column1=5;
var dd,mm,yy;
var dd1,mm1,yy1;
var mm3;
var date5;

var bookedseats=[];
var sc;

$(document).ready(function()  
		{
/* 	var country=document.getElementById("country1").value;
	var city=document.getElementById("city").value;
	var state=document.getElementById("state").value; */
	var location=document.getElementById("loc").value;	
	
	var mediatype=document.getElementById("mediatype").value;
	
	/* if(country=="Select" ||country.trim()=="")
	{
		
		alert("Please Select country");
		return false;
	}
	if(state=="Select" ||state.trim()=="")
	{
		
		alert("Please Select State");
		return false;
	}
	
	if(city=="Select" ||city.trim()=="")
	{
		
		alert("Please Select City");
		return false;
	}
	
	if(location=="Select" ||location.trim()=="")
	{
		
		alert("Please Select Location");
		return false;
	} */
	
	
	var date=document.getElementById("thealtdate").value;
	var hour=document.getElementById("hh").value;
	var min=document.getElementById("mm").value;
	/* if(date=="")
	{
    alert("Please select date");
    
    return false;
	} */
	
	/* if(mediatype=="select")
		
		{
		alert("Please Select Mediatype");
		return false;
		
		} */
	
	//alert("date==>"+date);
	date5=date+" "+hour+":"+min+":"+"00";
	//alert("date5==>"+date5);
	 pqr(date,hour,min)
	/* window.location.href="screenbooking.jsp?test1="+date; */
/* 	dd=date.substring(0,2);
	mm3=date.substring(3,6);
	mm=dateformat(mm3);
	yy=date.substring(7,11); */
	<%
	String sttime=request.getParameter("TripStarTime");
	String endtime=request.getParameter("TripEndTime");
	
	SimpleDateFormat format = new SimpleDateFormat("HH:mm:ss");
	Date d1 = null;
	Date d2 = null;
	
	d1 = format.parse(sttime);
	d2 = format.parse(endtime);
	
	long diff = d2.getTime() - d1.getTime();
	long diffMinutes = diff / (60 * 1000) % 60;
	long diffHours = diff / (60 * 60 * 1000) % 24;
	System.out.println("Diffminutes"+diffMinutes);
	System.out.println("Diffhour"+diffHours);

	String t1[]=sttime.split(":");
	String t2[]=endtime.split(":");
	System.out.println("T2 "+t2[0]);
	System.out.println("T1 "+t1[0]);
	int hr=Integer.parseInt(t2[0])-Integer.parseInt(t1[0]);
	int min=Integer.parseInt(t2[1])-Integer.parseInt(t1[1]);
	
	System.out.println("Hr---->"+hr);
	System.out.println("MIN---->"+min); 
	long diffMinutes1=60 * diffHours + diffMinutes;
	System.out.println("interval=====>"+diffMinutes1);
	
	%>
	
	document.getElementById("interval").value=<%=diffMinutes1%>;
	
var y;

	var $cart = $('#selected-seats'), //Sitting Area
	$counter = $('#counter'), //Votes
	$total = $('#total'); //Total money
    
	 sc = $('#seat-map').seatCharts({
		map: [
		      
		    
			 <%
			 
		
			 
			 for(int i=0;i<diffMinutes1;i++)
			 {
				 out.println("'aaaaaaaaaaaa',");
			 }
			 
			 
			 %>
			  
			  
		      
		      //Seating chart
			/* 'aaaaaaaaaaaa',
            'aaaaaaaaaaaa',
            'aaaaaaaaaaaa',
            'aaaaaaaaaaaa',
            'aaaaaaaaaaaa',
			'aaaaaaaaaaaa',
			'aaaaaaaaaaaa',
			'aaaaaaaaaaaa',
			'aaaaaaaaaaaa',
            'aaaaaaaaaaaa',
            //////10 rows
            'aaaaaaaaaaaa',
            'aaaaaaaaaaaa',
            'aaaaaaaaaaaa',
            'aaaaaaaaaaaa',
            'aaaaaaaaaaaa',
			'aaaaaaaaaaaa',
			'aaaaaaaaaaaa',
			'aaaaaaaaaaaa',
			'aaaaaaaaaaaa',
            'aaaaaaaaaaaa',
            //////10 rows
            'aaaaaaaaaaaa',
            'aaaaaaaaaaaa',
            'aaaaaaaaaaaa',
            'aaaaaaaaaaaa',
            'aaaaaaaaaaaa',
			'aaaaaaaaaaaa',
			'aaaaaaaaaaaa',
			'aaaaaaaaaaaa',
			'aaaaaaaaaaaa',
            'aaaaaaaaaaaa', */
            //////10 rows
            

          
            		],
		naming : {
			top : false,
			getLabel : function (character, row, column) {
				return (column-1)*5;
			}
		},
		legend : { //Definition legend
			node : $('#legend'),
			items : [
				[ 'a', 'available',   'Option' ],
				[ 'a', 'unavailable', 'Sold']
			]					
		},
		click: function () { //Click event
			if (this.status() == 'available') { //optional seat
				$('<li>'+(this.settings.row)+' '+this.settings.column*column1+'</li>')
					.attr('id', 'cart-item-'+this.settings.id)
					.data('seatId', this.settings.id)
					.appendTo($cart);
	           //alert("settingid==>"+cart);
				$counter.text(sc.find('selected').length+1);
		
		         //var x=parseFloat(recalculateTotal(sc))+parseFloat(price);
		         //console.log("X cehcked==>"+x);
		         //var j=parseFloat(x);
				   //console.log("j checked==>"+j);
		         $total.text(price*(sc.find('selected').length+1));
				//$total.text(recalculateTotal(sc)+price);
				//alert(this.settings.id);	
				//seatids.push(this.settings.id);
				//alert(this.settings.row+"_"+this.settings.column*column1);
					abc(this.settings.row+"_"+this.settings.column*column1,'seatselected');

				
				<%-- <%xyz=%>this.settings.id; --%>
				
			<%-- 	al.add(this.settings.id);
			<%	
			
			
			 while(itr.hasNext()){  
				   System.out.println(itr.next());  
				  }   
				%> --%>
				return 'selected';
			} else if (this.status() == 'selected') { //Checked
					//Update Number
					$counter.text(sc.find('selected').length-1);
					//update totalnum
					 // var x=recalculateTotal(sc)-price;
					   var x=parseFloat(recalculateTotal(sc))-parseFloat(price);
					   console.log("X unchecked==>"+x);
					   var j=parseFloat(x);
					   console.log("j unchecked==>"+j);
					   
					   $total.text(price*(sc.find('selected').length-1));
		        // $total.text(x);
					
					
					//$total.text(recalculateTotal(sc)-price);
						
					//Delete reservation
					$('#cart-item-'+this.settings.id).remove();
					//optional
					//alert(this.settings.row+" "+this.settings.column*column1);
					abc(this.settings.row+"_"+this.settings.column*column1,'seatremoved');
					//abc(this.settings.id,'seatremoved');
			
					return 'available';
			} else if (this.status() == 'unavailable') { //sold
				return 'unavailable';
			} else {
				return this.style();
			}
		}
		
		
	});
	//sold seat
	


/*  var bkseat=document.getElementById("booked").value;
	 alert(bkseat);  */
//sc.get().status('unavailable');
	// 
	//sc.get(['1_2', '4_4','4_5','6_6','6_7','8_5','8_6','8_7','8_8', '10_1', '10_2']).status('unavailable');
//sc.status(bookedseats,'unavailable');	
});


//sc.get(bookedseats).status('unavailable');
//sum total money
function recalculateTotal(sc) {
	var total = 0.00;
	//alert(seatids[0]);
	var i=0;
	sc.find('selected').each(function () {
		
		total += price;
		
	});
			
	return total;
}




</script>

<script>








function myFunction()
{
	
	{
		$('input[type="file"]').ajaxfileupload({
			'action' : 'UploadFile.jsp',
			
			
		
			
			
			'onComplete' : function(response) {
				$('#upload').hide();
				$('#message').show();
				
				var statusVal = JSON.stringify(response.status);

				if(statusVal == "false")
				{
					$("#message").html("<font color='red' size='13 px'>"+ JSON.stringify(response.message) +" </font>");
				}	
				if(statusVal == "true")
				{
					$("#message").html("<font color='green' size='13 px'>"+ JSON.stringify(response.message) +" </font>");
				}			
			},
			'onStart' : function() {
				$('#upload').show();
				$('#message').hide();
			}
	
	});
	
	console.log("inside myfunction");
	};
	
	
	
}


function ratecalc()

{
	var date=document.getElementById("datepicker").value;
	var hour=document.getElementById("hh").value;
	var min=document.getElementById("mm").value;

	var fullpath=document.getElementById("mediafile").value;
	console.log("fullpath==>"+fullpath);
	
	
	
	var location=document.getElementById("loc").value;	
	var mediatype=document.getElementById("mediatype").value;


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

	// Create a function that will receive data sent from the server
	ajaxRequest.onreadystatechange = function()
	{ //document.getElementById("dirid2").style.display="none";
		if(ajaxRequest.readyState == 4)
		{     
		    
			  var reslt=ajaxRequest.responseText;
			   var abc=reslt;
			
			
				alert("abc==>"+abc.trim());
				
				  $('#rate').text(abc.trim());
				price=abc.trim();
			 

		} 
	}
	//alert("abc");
	var queryString = "?date="+date+"&hour="+hour+"&min="+min+"&country="+country+"&state="+state+"&city="+city+"&location="+location+"&mediatype="+mediatype;
	ajaxRequest.open("GET", "Ajaxratecalc.jsp" + queryString, true);
	ajaxRequest.send(null);	
	
	
}







function abc(id,action){
	//alert(id);
	//alert("Licence No:-"+id);
	var fullpath=document.getElementById("mediafile").value;
	//console.log("fullpath==>"+fullpath);
	var regex = new RegExp("[^/]+\.[^/]+");
	var fileName = regex.exec(fullpath);
	var noslot=document.getElementById("noslot").value;
console.log("filename==>"+fileName);
	
	console.log("counter==>"+sc.find('selected').length);
	
	var file=document.getElementById("mediafile").value;
	var mediatype=document.getElementById("mediatype").value;
	var fileExtension = file.replace(/^.*\./, '');
	var invalid=/^[0-9]+$/;
	

	var total=0;
	
	var date=document.getElementById("datepicker").value;
	var hour=document.getElementById("hh").value;
	var min=document.getElementById("mm").value;
	/* var country=document.getElementById("country1").value;
	var city=document.getElementById("city").value;
	var state=document.getElementById("state").value;
	 */var location=document.getElementById("loc").value;	
	var mediatype=document.getElementById("mediatype").value;
	
	var videorate=document.getElementById("x").innerText;
	var imagerate=document.getElementById("total").innerText;
	var totalcost="";
	
	var interval=document.getElementById("interval").value;
	
	var tohr=document.getElementById("hh1").value;
	var tomm=document.getElementById("mm1").value;
	

	
	
	
	
			
	var ajaxRequest;  // The variable that makes Ajax possible!
	
	if(id=="total")
		{
	 	if(fullpath.trim()=="Select")
		{
	
		alert("Please Select File to upload");
		return false;
	
		} 
		if(mediatype=="image")
		{
			
		if(fileExtension=="mp4" || fileExtension=="mpeg" || fileExtension=="mpg")	
			{
			alert("Please select mediatype image only");
			return false;
			}			
		}
		
		if(mediatype=="video")
		{
			
		if(fileExtension=="jpg" || fileExtension=="jpeg" || fileExtension=="png" || fileExtension=="gif")	
			{
			alert("Please select mediatype video only");
			return false;
			}			
		}
		
		
		
		
	if((fileExtension=="mp4" || fileExtension=="mpeg" || fileExtension=="mpg" || fileExtension=="jpg" || fileExtension=="jpeg" || fileExtension=="png" || fileExtension=="gif" )&& noslot.trim()=="")
		
		{
			alert("Please Enter Duration");
			return false;
			
		}
		
		
		
		
		
		
		 myFunction();
		}
		
	if(mediatype=="image")
	{
	
	totalcost=imagerate;
	}
	
	if(mediatype=="i")
		{
		
		totalcost=videorate;
		}

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

	// Create a function that will receive data sent from the server
	ajaxRequest.onreadystatechange = function()
	{ //document.getElementById("dirid2").style.display="none";
		if(ajaxRequest.readyState == 4)
		{     
		    
			  var reslt=ajaxRequest.responseText;
			   var abc=reslt;
			//alert(abc.trim());
			  if(abc.trim()=="total")
				  {
			 alert("Slot's reserved successfully");
			  window.location.reload();
				  }
			   if(abc.trim()=="empty"){
				 
				  alert("Please select slot");
				  //document.getElementById("licenceno").value="";
				  //return on;
			      //document.getElementById("err1").innerHTML=reslt;
			  } 
			   
			   if(abc.trim()=="noslot")
				  {
				   alert("Please Enter No of slot");
				  }
			   
			   if(abc.trim()=="listconfilct")
				  {
				   alert("Invalid No of slots");
				  }
			   
			   if(abc.trim()=="oneslotonly")
				  {
				   alert("Select first slot only");
				  }
			   
			   if(abc.trim()=="Only1slot")
				  {
				   alert("Only 1 slot allowed ");
				  } 
			   
			   if(abc.trim()=="invalidnoslots")
				  {
				   alert("Enter Valid no ofslots only");
				  } 
			   
			   if(abc.trim()=="notallowed")
				  {
				   alert("Last slot not allowed ");
				  } 
			   //document.getElementById("err1").innerHTML=reslt;
			   
			   else
				   {
				   }
				   
			 

		} 
	}
	//alert("abc");
	var queryString = "?rowcolmn="+id+"&action="+action+"&date="+date+"&hour="+hour+"&min="+min+"&location="+location+"&fname="+fullpath+"&noslot="+noslot+"&interval="+interval+"&tohr="+tohr+"&tomm="+tomm;
	ajaxRequest.open("GET", "Ajaxdb1.jsp" + queryString, true);
	ajaxRequest.send(null); 
	//document.getElementById("dirid2").style.display="none";

	
}

function pqr(date,hour,min)

{
	var date=document.getElementById("datepicker").value;
	var location=document.getElementById("loc").value;
	
	var tohr=document.getElementById("hh1").value;
	var tomm=document.getElementById("mm1").value;
	
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

	// Create a function that will receive data sent from the server
	ajaxRequest.onreadystatechange = function()
	{ //document.getElementById("dirid2").style.display="none";
		if(ajaxRequest.readyState == 4)
		{     
		    
			  var reslt=ajaxRequest.responseText;
			   var abc=reslt;
			
			/*   if(abc.trim()=="Empty")
				  {
			
				  }
			   
			   
			   else
				  { */
				   //alert(abc);
				   //bookedseats=abc;
				   bookedseats=JSON.parse(abc);
	
				 sc.get(bookedseats).status('unavailable');
				  //sc.get(['1_1','1_2', '4_4','4_5','4_1','6_6','6_7','8_5','8_6','8_7','8_8', '10_1', '10_2']).status('unavailable');
				  
				  
				  //  }
			   //document.getElementById("err1").innerHTML=reslt;
			 

		} 
	}
	//alert("abc");
	var queryString = "?date="+date+"&hour="+hour+"&min="+min+"&location="+location+"&tohr="+tohr+"&tomm="+tomm;
	ajaxRequest.open("GET", "Ajaxvalid1.jsp" + queryString, true);
	ajaxRequest.send(null);	
	
	
}

</script>


</p>  	
<!-- 	<div style="text-align:center;">
		<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
		goocode-728*90
		<ins class="adsbygoogle"
			 style="display:inline-block;width:728px;height:90px"
			 data-ad-client="ca-pub-3762305523564574"
			 data-ad-slot="6959772397"></ins>
		<script>
		(adsbygoogle = window.adsbygoogle || []).push({});
		</script>
	</div>	 -->
    <!-- <h3 id="2">2. End</h3>
    <p>Thanks for ur reviewing. Any questions feel free to write to us.</p>
</div>
<p>
<a href="javascript:history.back(-1)">BACK</a>&nbsp;&nbsp;<a href="http://www.goocode.net/js/73-jquery-election-seat-reservations-online-theater-piece.html">jQuery seat reservations</a>
</p> -->
<!-- <div class="footer">
<h1 class="theme-name"><strong>Goocode.net</strong><span>&copy; 2013 - 2016 GOOCODE</span></h1>
</div>
</div> -->

<!-- <div style="display:none"><script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1253486628'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s23.cnzz.com/stat.php%3Fid%3D1253486628%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));</script></div>

<script type="text/javascript">/* <![CDATA[ */(function(d,s,a,i,j,r,l,m,t){try{l=d.getElementsByTagName('a');t=d.createElement('textarea');for(i=0;l.length-i;i++){try{a=l[i].href;s=a.indexOf('/cdn-cgi/l/email-protection');m=a.length;if(a&&s>-1&&m>28){j=28+s;s='';if(j<m){r='0x'+a.substr(j,2)|0;for(j+=2;j<m&&a.charAt(j)!='X';j+=2)s+='%'+('0'+('0x'+a.substr(j,2)^r).toString(16)).slice(-2);j++;s=decodeURIComponent(s)+a.substr(j,m-j)}t.innerHTML=s.replace(/</g,'&lt;').replace(/>/g,'&gt;');l[i].href='mailto:'+t.value}}catch(e){}}}catch(e){}})(document);/* ]]> */</script></body> -->

<input type="hidden" name="interval" id="interval" >



</html>
	<%-- <%@ include file="footer.jsp"%> --%>
    