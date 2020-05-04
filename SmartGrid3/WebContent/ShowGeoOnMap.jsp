<%@ include file="headernew.jsp" %>
<%-- <%@ include file="Conn.jsp" %> --%>
<%@ page import="java.sql.*" %>
 <%-- <%@ page import="kml.KML1" %> --%>
 
  
    <style>
    div.absolute1 {
    position: absolute;
    left: 100px;
    width:100%;
    border:0;

  
    
} 
    </style>
 <%
//classes fleetview=new classes(); 
//fleetview.getConnection(MM_dbConn_DRIVER,MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

response.setHeader("Cache-Control","no-cache");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);
String username="";
String status=request.getParameter("status");
if(status == null || status.equalsIgnoreCase("null"))
{
	status = "All";
}
String msg=request.getParameter("msg");
String para=request.getParameter("Parameter");
if(para!=null)
{%>
	<script>
	alert("Zoom Level Set successfully");
	window.location="home.jsp";
	</script>
	<%
}
if(msg!=null)
{%>
	<script>
	alert("Data Already present");
	window.location="home.jsp";
	</script>
	<%
}
%>

<%-- <%@page import="com.fleetview.beans.classes"%> --%>

<html xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml">
  <head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <title>OpenLayers MapGuide Layer Example</title>
    <link rel="stylesheet" href="../theme/default/style.css" type="text/css">
    <link rel="stylesheet" href="style.css" type="text/css">

    <style type="text/css">
        #map {
            width: 100%;
            height: 800px;
            border: 1px solid black;
            float:left;
           
        }
        #map2 {
            width: 400px;
            height: 400px;
            border: 1px solid black;
            float:left;
        
    </style>
  <script src="OpenLayers-2.10/OpenLayers.js"></script>
    <script type="text/javascript" src="OpenLayers-2.10/binaryajax.js"></script>
<script type="text/javascript" src="OpenLayers-2.10/binarywrapper.js"></script>
<script type="text/javascript" src="OpenLayers-2.10/shapefile.js"></script>
<script type="text/javascript" src="OpenLayers-2.10/dbf.js"></script>
<script type="text/javascript" src="Jquery/jquery-3.1.1.min.js"></script>
<script src="elabel.js" type="text/javascript"></script>
  <script type="text/javascript">
  function update()
  {
	  
          location.reload();
          
          GetUpdates1();
  }
  </script>
  
<style type="text/css">
.elabelstyle {color:black; padding: 1px; font-size: 1.1em;}
.origelabelstyle {color:#000000; background-color:#ffffaa; border:0px #006699 solid; padding: 2px; font-size: 0.7em;}
</style>
    </head>
    <body>
    
    <%!
    String html1,location;
    double lat,lon;
    %>
    
    <%
    html1 = "";location = "";
    lat = 0.0;lon = 0.0;
    %>
<!--    <br>-->
<!--    <table style="text-align: center;margin-left: 48em;margin-right: 48em;"><tr align="center"><td align="center">-->
<!--<font size="3"><B>All Vehicles on Map</B></font></td></tr></table>-->
<br><br>
<br>
<div align="center"><font size="3"><B>Geo Data on Map</B></font></div>
<br></br>
<%!
Connection conn2,conn;
Statement st,st1,st2,st4,st3;
String smap="",smap1="";
%>
	<%
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
	conn2 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
   st=conn2.createStatement();
   st1=conn2.createStatement();
   st3=conn2.createStatement();
   st2=conn.createStatement();
   st4=conn.createStatement();
   String sqlmap11="select distinct(mapname) from GeomasterColumn";
	//String sqlmap="select * from t_defaultvals where OwnerName='Castrol'";
	ResultSet rsmap11=st2.executeQuery(sqlmap11);
	//System.out.println("started journey querry--------->"  +sqlmap1);
	
	try
	{
	
		
	
    username=(String)session.getAttribute("mainuser");
	System.out.println("username" +username);
	
	}
	catch(Exception e)
	{
		System.out.println("Exception eeeeeeeeeee"  +e);
	}
	%>
	<form name="zoom" id="zoom" method="post" action="insertzoom.jsp">
	<input type="hidden" name="zoom1" id="zoom1" value="<%="" %>"></input>
	<input type="hidden" name="zoomlat" id="zoomlat" value="<%="" %>"></input>
	<input type="hidden" name="zoomlon" id="zoomlon" value="<%="" %>"></input>
	
	<table border="0" style="width: 55%"  align="center"> 
<tr>
		<%-- <td bgcolor="#BDEDFF" class="sorttable_nosort" style="width: 10px;">
			<b>Color Code Indications:-<a href="home.jsp?status=All"><span>All</span></a>
			</b>
		</td>   
		<td style="width: 2px;" bgcolor="#CCFFCC" class="sorttable_nosort"><b><a href="home.jsp?status=moving">Moving</a></b></td>
		<td style="width: 5px;" bgcolor="#FFFFCC" class="sorttable_nosort" ><b><a href="home.jsp?status=Stop">Stop</a></b></td>
		<td style="width:10px" bgcolor="#DCDCDC" class="sorttable_nosort"><b><a href="home.jsp?status=Disconnected">Disconnected</a></b></td>
		<td style="width: 10px" bgcolor="#FF6600" class="sorttable_nosort" ><b><a href="home.jsp?status=Ignition">Iginition off</a></b></td>
		<td style="width: 10px" bgcolor="#D4C0F0" class="sorttable_nosort"><b><a href="home.jsp?status=Stopengine">Idle</a></b></td>
		<td style="width: 10px" bgcolor="#F5DEB3" class="sorttable_nosort"><b><a href="home.jsp?status=Stop>4">Stop>4</a></b></td>				
		<td style="width: 10px" bgcolor="" class="sorttable_nosort"><b><a href="home.jsp?status=Inactive">Inactive</a></b></td>	<td style="width: 10px" align="center"><div align="center">
		--%>		
		<input type="hidden" name="status" id="status" value="<%=status %>">
		<center>
    
        <select id="dropdown" name="dropdown" onchange="update()">
        <option>Select</option>
        <%  while(rsmap11.next())
    	{
    		%>
            <option><%= rsmap11.getString(1)%></option>
        <% } %>
        </select>
</center>
		<!-- <td style="width: 10px" align="center"><div align="center">
			
<input  type="submit" name="submit" id="submit" value="Setzoomlevel" style="border-style: outset; border-color: black" onclick="pass();" >
</div>
</td>  -->
	</tr>		
	</table>

<%




%>
</form>


<table border="0" width="100%" >

<tr>
<td align="left">
		
		<% int i=1; %>
</td>
</tr>
<tr align="center"><td align="center" colspan="2">

<div class="absolute1" id="abc">


<table border="0" width="100%" align="center"  >
<tr>
<td width="85%" align="right" >
<br><br>
  <div id="map" style="width: 900px;height: 600px;overflow:auto;position: relative; " align="center"></div>

  </td>

<td width="15%" align="left">
<div id="sidebar" style="overflow:auto;width: 400px;height: 600px"></div>


</td>
</tr>

</table>

</div></td></tr>
</table>
<!-- <td>
    <div align="center"><font face="Arial" color="black">Copyright &copy; Transworld 2012.All rights reserved</font></div></td>  -->
    <script type="text/javascript">

    
    //<![CDATA[
    try
    {
   		var map, map1,layer1,layer,markers1;
    	var tmarkers = [];
    	var htmls = [];
    	var i=0;
    	var url = "http://203.199.134.131:8008/mapguide/mapagent/mapagent.fcgi?USERNAME=Administrator&PASSWORD=admin";
    	<%
    	try
    	{
    		
    		   double Mapzoomlevel=0,Mapceterlat=0,Mapcenterlon=0,latitude=0;
    		   
    		   
    			   Mapzoomlevel=4;
   			   	Mapceterlat=23.402765;
   			   	Mapcenterlon=77.768553;
    			   %>
    			   zoomlevel = "<%=Mapzoomlevel%>";
    			   newlat = "<%=Mapceterlat%>";
    			   newlon = "<%=Mapcenterlon%>";
    			   <%   
    		   
    	}
    	catch(Exception e)
    	{
    		System.out.println("^^^^   "+e);
    	}
    	%>





    	
    	 function myclick(i,lat, lon) 
    		{
     		try
     		{
         		//alert("in my click");
    			    map1.setCenter(new OpenLayers.LonLat(lon,lat).transform(
      		        new OpenLayers.Projection("EPSG:4326"), // transform from WGS 1984
      		        map1.getProjectionObject() // to Spherical Mercator Projection
      		      ),16);

    			   // map1.events.register('click', lonLatMarker, function(){popup.show();});
    			   /* var popup = new OpenLayers.Popup("olPopup",
    			    		tmarkers[i].lonLat,
                            null,
                           "GeoInfo",
                            true);
                 map1.addPopup(popup);*/

    	      		
    			/*    popup = new OpenLayers.Popup("olPopup",
    	    	      		new OpenLayers.LonLat(lon,lat).transform(
    	    			              new OpenLayers.Projection("EPSG:4326"), // transform from WGS 1984
    	    			              map1.getProjectionObject() // to Spherical Mercator Projection
    	    			            ),
    	    	      		new OpenLayers.Size(250,100),
    	    	      		html[i],
    	    	      		true);
    	    	    popup.closeOnMove = true; 
    	    	      		 map1.addPopup(popup);*/

     		}
     		catch(e)
     		{
         		//alert(e);
     		} 
    	    		
    		    
    		}

    	function returnMarker(latitude,longitude,discription,col1,col2,col3,col4,col5,col6,col7,col8,col9,col10,col11,col12,col13,col14,col15,col16,col17,col18,bcol1,bcol2,bcol3,bcol4,bcol5,bcol6,bcol7,bcol8,bcol9,bcol10,bcol11,bcol12,bcol13,bcol14,bcol15,bcol16,bcol17,bcol18,bcol19,bcol20)
    	{
        	//alert("in ret marker"+latitude+" "+longitude);
    		try{
    			var cIcon;
    		var currentTime = new Date();
    		var day = currentTime.getDate();
    		
    		var size = new OpenLayers.Size(10,20);
    		var offset = new OpenLayers.Pixel(-(size.w/2), -size.h);
    		cIcon= new OpenLayers.Icon('images/mm_20_red.png', size, offset);
    		
    		
    		
			var marker = new OpenLayers.Marker(new OpenLayers.LonLat(longitude,latitude).transform(
		              new OpenLayers.Projection("EPSG:4326"), // transform from WGS 1984
		              map1.getProjectionObject() // to Spherical Mercator Projection
		            ),cIcon);
    
			var html="<font size='1' face='Arial'>";
    		//var html="<font size='1' face='Arial'><br><b>Veh: </b>"+vehregno+"<br><b>Speed: </b>"+speed+" (KM/Hr)<br><b>Updated: </b>"+datetime+"<br><b>KmToday:</b>"+distanceTraveledToday+"<br><b>Loc: </b>"+location;

    	//	alert("tripid    "+tripid+"  vehregno     "+vehregno);
 if(bcol3 == "-" || bcol3=="")
 {
	 //html = html + "<br><b>Trip: </b>"+update11;
 }
 else 
 {
	 html = html + "<br><b>"+bcol3+": </b>"+col1;
	 //html = html + "<br><b>Trip: </b>"+tripid+"<br><b>Org: </b>"+origin+"<br><b>Dest: </b>"+dest+"<br><b>Driver ID/Name: </b>"+drivid+"("+drivname+")<br><b>Driver MobileNo: </b>"+drivemob;
 }
 if(bcol4 == "-" || bcol4=="")
 {
	 //html = html + "<br><b>Trip: </b>"+update11;
 }
 else 
 {
	 html = html + "<br><b>"+bcol4+": </b>"+col2;
	 //html = html + "<br><b>Trip: </b>"+tripid+"<br><b>Org: </b>"+origin+"<br><b>Dest: </b>"+dest+"<br><b>Driver ID/Name: </b>"+drivid+"("+drivname+")<br><b>Driver MobileNo: </b>"+drivemob;
 }if(bcol5 == "-" || bcol5=="")
 {
	 //html = html + "<br><b>Trip: </b>"+update11;
 }
 else 
 {
	 html = html + "<br><b>"+bcol5+": </b>"+col3;
	 //html = html + "<br><b>Trip: </b>"+tripid+"<br><b>Org: </b>"+origin+"<br><b>Dest: </b>"+dest+"<br><b>Driver ID/Name: </b>"+drivid+"("+drivname+")<br><b>Driver MobileNo: </b>"+drivemob;
 }
 if(bcol6 == "-" || bcol6=="")
 {
	 //html = html + "<br><b>Trip: </b>"+update11;
 }
 else 
 {
	 html = html + "<br><b>"+bcol6+": </b>"+col4;
	 //html = html + "<br><b>Trip: </b>"+tripid+"<br><b>Org: </b>"+origin+"<br><b>Dest: </b>"+dest+"<br><b>Driver ID/Name: </b>"+drivid+"("+drivname+")<br><b>Driver MobileNo: </b>"+drivemob;
 }
 if(bcol7 == "-" || bcol7=="")
 {
	 //html = html + "<br><b>Trip: </b>"+update11;
 }
 else 
 {
	 html = html + "<br><b>"+bcol7+": </b>"+col5;
	 //html = html + "<br><b>Trip: </b>"+tripid+"<br><b>Org: </b>"+origin+"<br><b>Dest: </b>"+dest+"<br><b>Driver ID/Name: </b>"+drivid+"("+drivname+")<br><b>Driver MobileNo: </b>"+drivemob;
 }
 if(bcol8 == "-" || bcol8=="")
 {
	 //html = html + "<br><b>Trip: </b>"+update11;
 }
 else 
 {
	 html = html + "<br><b>"+bcol8+": </b>"+col6;
	 //html = html + "<br><b>Trip: </b>"+tripid+"<br><b>Org: </b>"+origin+"<br><b>Dest: </b>"+dest+"<br><b>Driver ID/Name: </b>"+drivid+"("+drivname+")<br><b>Driver MobileNo: </b>"+drivemob;
 }
 if(bcol9 == "-" || bcol9=="")
 {
	 //html = html + "<br><b>Trip: </b>"+update11;
 }
 else 
 {
	 html = html + "<br><b>"+bcol9+": </b>"+col7;
	 //html = html + "<br><b>Trip: </b>"+tripid+"<br><b>Org: </b>"+origin+"<br><b>Dest: </b>"+dest+"<br><b>Driver ID/Name: </b>"+drivid+"("+drivname+")<br><b>Driver MobileNo: </b>"+drivemob;
 }
 if(bcol10 == "-" || bcol10=="")
 {
	 //html = html + "<br><b>Trip: </b>"+update11;
 }
 else 
 {
	 html = html + "<br><b>"+bcol10+": </b>"+col8;
	 //html = html + "<br><b>Trip: </b>"+tripid+"<br><b>Org: </b>"+origin+"<br><b>Dest: </b>"+dest+"<br><b>Driver ID/Name: </b>"+drivid+"("+drivname+")<br><b>Driver MobileNo: </b>"+drivemob;
 }
 
 if(bcol11 == "-" || bcol11=="")
 {
	 //html = html + "<br><b>Trip: </b>"+update11;
 }
 else 
 {
	 html = html + "<br><b>"+bcol11+": </b>"+col9;
	 //html = html + "<br><b>Trip: </b>"+tripid+"<br><b>Org: </b>"+origin+"<br><b>Dest: </b>"+dest+"<br><b>Driver ID/Name: </b>"+drivid+"("+drivname+")<br><b>Driver MobileNo: </b>"+drivemob;
 }
 if(bcol12 == "-" || bcol12=="")
 {
	 //html = html + "<br><b>Trip: </b>"+update11;
 }
 else 
 {
	 html = html + "<br><b>"+bcol12+": </b>"+col10;
	 //html = html + "<br><b>Trip: </b>"+tripid+"<br><b>Org: </b>"+origin+"<br><b>Dest: </b>"+dest+"<br><b>Driver ID/Name: </b>"+drivid+"("+drivname+")<br><b>Driver MobileNo: </b>"+drivemob;
 }
 if(bcol13 == "-" || bcol13=="")
 {
	 //html = html + "<br><b>Trip: </b>"+update11;
 }
 else 
 {
	 html = html + "<br><b>"+bcol13+": </b>"+col11;
	 //html = html + "<br><b>Trip: </b>"+tripid+"<br><b>Org: </b>"+origin+"<br><b>Dest: </b>"+dest+"<br><b>Driver ID/Name: </b>"+drivid+"("+drivname+")<br><b>Driver MobileNo: </b>"+drivemob;
 }
 if(bcol14 == "-" || bcol14=="")
 {
	 //html = html + "<br><b>Trip: </b>"+update11;
 }
 else 
 {
	 html = html + "<br><b>"+bcol14+": </b>"+col12;
	 //html = html + "<br><b>Trip: </b>"+tripid+"<br><b>Org: </b>"+origin+"<br><b>Dest: </b>"+dest+"<br><b>Driver ID/Name: </b>"+drivid+"("+drivname+")<br><b>Driver MobileNo: </b>"+drivemob;
 }
 if(bcol15 == "-" || bcol15=="")
 {
	 //html = html + "<br><b>Trip: </b>"+update11;
 }
 else 
 {
	 html = html + "<br><b>"+bcol15+": </b>"+col13;
	 //html = html + "<br><b>Trip: </b>"+tripid+"<br><b>Org: </b>"+origin+"<br><b>Dest: </b>"+dest+"<br><b>Driver ID/Name: </b>"+drivid+"("+drivname+")<br><b>Driver MobileNo: </b>"+drivemob;
 }
 if(bcol16 == "-" || bcol16=="")
 {
	 //html = html + "<br><b>Trip: </b>"+update11;
 }
 else 
 {
	 html = html + "<br><b>"+bcol16+": </b>"+col14;
	 //html = html + "<br><b>Trip: </b>"+tripid+"<br><b>Org: </b>"+origin+"<br><b>Dest: </b>"+dest+"<br><b>Driver ID/Name: </b>"+drivid+"("+drivname+")<br><b>Driver MobileNo: </b>"+drivemob;
 }
 if(bcol17 == "-" || bcol17=="")
 {
	 //html = html + "<br><b>Trip: </b>"+update11;
 }
 else 
 {
	 html = html + "<br><b>"+bcol17+": </b>"+col15;
	 //html = html + "<br><b>Trip: </b>"+tripid+"<br><b>Org: </b>"+origin+"<br><b>Dest: </b>"+dest+"<br><b>Driver ID/Name: </b>"+drivid+"("+drivname+")<br><b>Driver MobileNo: </b>"+drivemob;
 }
 if(bcol18 == "-" || bcol18=="")
 {
	 //html = html + "<br><b>Trip: </b>"+update11;
 }
 else 
 {
	 html = html + "<br><b>"+bcol18+": </b>"+col16;
	 //html = html + "<br><b>Trip: </b>"+tripid+"<br><b>Org: </b>"+origin+"<br><b>Dest: </b>"+dest+"<br><b>Driver ID/Name: </b>"+drivid+"("+drivname+")<br><b>Driver MobileNo: </b>"+drivemob;
 }
 if(bcol19 == "-" || bcol19=="")
 {
	 //html = html + "<br><b>Trip: </b>"+update11;
 }
 else 
 {
	 html = html + "<br><b>"+bcol19+": </b>"+col17;
	 //html = html + "<br><b>Trip: </b>"+tripid+"<br><b>Org: </b>"+origin+"<br><b>Dest: </b>"+dest+"<br><b>Driver ID/Name: </b>"+drivid+"("+drivname+")<br><b>Driver MobileNo: </b>"+drivemob;
 }
 if(bcol20 == "-" || bcol20=="")
 {
	 //html = html + "<br><b>Trip: </b>"+update11;
 }
 else 
 {
	 html = html + "<br><b>"+bcol20+": </b>"+col18;
	 //html = html + "<br><b>Trip: </b>"+tripid+"<br><b>Org: </b>"+origin+"<br><b>Dest: </b>"+dest+"<br><b>Driver ID/Name: </b>"+drivid+"("+drivname+")<br><b>Driver MobileNo: </b>"+drivemob;
 }
 
    		html = html +"</font>";
    		//alert("Html-->"+html);
    		marker.events.register('mousedown', marker, function(evt) { popup = new OpenLayers.Popup("olPopup",
    	      		new OpenLayers.LonLat(longitude,latitude).transform(
    			              new OpenLayers.Projection("EPSG:4326"), // transform from WGS 1984
    			              map1.getProjectionObject() // to Spherical Mercator Projection
    			            ),
    	      		new OpenLayers.Size(250,100),
    	      		html,
    	      		true);
    	    popup.closeOnMove = true; 
    	      		 map1.addPopup(popup);
    	          });

    		/*marker.events.register('mouseover', marker, function(evt) { popup = new OpenLayers.Popup("olPopup",
    	      		new OpenLayers.LonLat(longitude,latitude).transform(
    			              new OpenLayers.Projection("EPSG:4326"), // transform from WGS 1984
    			              map1.getProjectionObject() // to Spherical Mercator Projection
    			            ),
    	      		new OpenLayers.Size(250,100),
    	      		html,
    	      		true);
    	    popup.closeOnMove = true; 
    	      		 map1.addPopup(popup);
    	          });*/
    	         // alert(discription);
    	         /* if(discription==1)
                  {
               	   map1.setCenter(new OpenLayers.LonLat(longitude,latitude).transform(
              		        new OpenLayers.Projection("EPSG:4326"), // transform from WGS 1984
              		        map1.getProjectionObject() // to Spherical Mercator Projection
              		      ),7);
                  } */
    	          
	          
    	    if(tmarkers[discription])
    	    {
    	    	markers.removeMarker(tmarkers[discription]); 
    	    }

    	    markers1.addMarker(marker);    	    
    	    tmarkers[discription] = marker;
    		htmls[discription] = html;
    		
    		}
    		catch(e){
    			//alert(e);
    		}

    	}

    	
    	function GetUpdates1()
    	{//alert("IN AJAX");
    	<%
		  System.out.println("GetUpdates1 In");
		  %>
    		//var status1=document.zoom.status.value;
    		var status1=document.zoom.dropdown.value;
        	
    		var ajaxRequest;  // The variable that makes Ajax possible!
    		//alert("get updates ");
    		try{
    				ajaxRequest = new XMLHttpRequest();
    		    }  
    	        catch (e)
    	        {
    			    try{
    				   		ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
    			        } 
    	                catch (e)
    	                {
    				   		try{
    				       			ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
    				   			} 
    	                        catch (e)
    	                        {
    				      			alert("Your browser broke!");
    				      			return false;
    				   			}
    			        }
    	          }
    	          ajaxRequest.onreadystatechange = function()
    	          {
    	    	  		if(ajaxRequest.readyState == 4)
    	                {
    		                try{
    	                	var reslt=ajaxRequest.responseText;
    	                    var resnew=reslt.split("@");
    	                    document.getElementById("sidebar").innerHTML=resnew[0];
    	               	 	var markerslist=resnew[1].split("$");
    	               	 

    						for(x=0;x<resnew[2]-1;x++)
    	               	 	{
    	                   	 var marval=markerslist[x].split("~");
    	                   	 returnMarker(marval[0],marval[1],marval[2],marval[3],marval[4],marval[5],marval[6],marval[7],marval[8],marval[9],marval[10],marval[11],marval[12],marval[13],marval[14],marval[15],marval[16],marval[17],marval[18],marval[19],marval[20],marval[21],marval[22],marval[23],marval[24],marval[25],marval[26],marval[27],marval[28],marval[29],marval[30],marval[31],marval[32],marval[33],marval[34],marval[35],marval[36],marval[37],marval[38],marval[39],marval[40]);
    	               	 	}
    		                }
    		                catch(e)
    		                {
    			             //  alert(e);
    		                }
    	                }
    	         	}

    	          queryStringg = "?status="+status1;
    	          ajaxRequest.open("GET", "GeoMap.jsp"+queryStringg, true);
    	      ajaxRequest.send(null); 
    	}
    	
    	 function setToRed ()
 		{
    		 <%
    		  System.out.println("IN settored function");
    		  %>
 			GetUpdates1();
 		}

	      function initialize()
	       {
	var metersPerUnit = 111319.4908;  //value returned from mapguide
	var inPerUnit = OpenLayers.INCHES_PER_UNIT.m * metersPerUnit;

	OpenLayers.INCHES_PER_UNIT["dd"] = inPerUnit;
	OpenLayers.INCHES_PER_UNIT["degrees"] = inPerUnit;
	OpenLayers.DOTS_PER_INCH = 72;


	  
	var	lo=77.2167510986328;
	var	la=28.5687255859375;

	//  var extent1 = new OpenLayers.Bounds(68.1623341674805,6.771473,97.4037974243164,37.064465);
	  var extent1 = new OpenLayers.Bounds(68.162834117480,6.7542559500000,97.41516105,37.06396505);
	  

	  //var tempScales = [20000,10000,5794.74679,2826.95795,1894.95494,796.85673,327.59372,130.69773,100,50,25,12,6,3,2,1,0];
	 var tempScales = [23659291,17074442,11322961,7588641,5059094,3372729,2248486,1498990,999327,666218,444145,296096,197397,131598,87732,58488,38992,25994,17329,11553,7702,5134,3423,2282,1521,1041,676,450,300,0];
	  var mapOptions1 = {
	     maxExtent: extent1, 
	    scales:tempScales,
	          units: "dd"
	  };
	  map1 = new OpenLayers.Map( 'map', mapOptions1 );
	  map1.addControl(new OpenLayers.Control.PanZoomBar());
	  //map1.addControl(new OpenLayers.Control.MouseToolbar());
	  //map1.addControl(new OpenLayers.Control.LayerSwitcher({'ascending':false}));
	  //map1.addControl(new OpenLayers.Control.Permalink());
	  //map1.addControl(new OpenLayers.Control.Permalink('permalink'));
	//  map1.addControl(new OpenLayers.Control.MousePosition());
	  map1.addControl(new OpenLayers.Control.OverviewMap());
	  map1.addControl(new OpenLayers.Control.KeyboardDefaults());
	  var params1 = {
			  //  mapdefinition: 'Library://Samples/Sheboygan/MapsTiled/Sheboygan.MapDefinition'
			  //  mapdefinition: 'Libary://Transworld/Data/Transworld.MapDefinition',
			 //  mapdefinition: 'Library://TransworldMap/IndiaMap.MapDefinition',
			//mapdefinition: 'Library://TWMaps/TWMaps.MapDefinition',
		mapdefinition: 'Library://TranswoldNew/test.MapDefinition',

			 basemaplayergroupname: "Base Layer Group"
			  }
			  var options1 = 
   			  {
			    //singleTile: false 
				  singleTile: true, isBaseLayer: true,
			    transitionEffect: "resize",
			    buffer: 1,
			    useOverlay: false,
			    useAsyncOverlay: false
			  }

	  
			  //layer1 = new OpenLayers.Layer.MapGuide( "INDIA MAP", url, params1, options1 );
	  //layer1=new OpenLayers.Layer.OSM("Local Tiles","http://173.234.153.82/osm/\${z}/\${x}/\${y}.png", {numZoomLevels: 19, 'attribution': false, "tileOptions": {"crossOriginKeyword": null}},params1, options1);
			//  layer1=new OpenLayers.Layer.OSM();
	  <%

//map integrate
/* String sqlmap="select * from t_defaultvals where OwnerName='"+session.getAttribute("usertypevalue")+"'";
//String sqlmap="select * from t_defaultvals where OwnerName='Castrol'";
ResultSet rsmap=st4.executeQuery(sqlmap);
System.out.println("started journey querry--------->"  +sqlmap);
if(rsmap.next())
{
	smap=rsmap.getString("Map");
	System.out.println("Map"  +smap);
} */
smap="OSM";
%>
<%
if(smap.equals("OSM"))
{
	System.out.println("Hi1");
%>
layer1=new OpenLayers.Layer.OSM("Local Tiles","http://maps.myfleetview.com/osm/\${z}/\${x}/\${y}.png", {numZoomLevels: 19, attribution : '<a href="http://myfleetview.com/" style="text-decoration:none"><font face="Hemi Head 426" size="03" color="#0853A0">FleetView <br><font face="Hemi Head 426" size="0.5" color="#0853A0">Transworld Technologies Ltd.  </a>', "tileOptions": {"crossOriginKeyword": null}},params1, options1);
	
	<%
	System.out.println("Hi2 Map");
}

	else if(smap.equals("MPG"))
	{
	%>
	
	layer1 = new OpenLayers.Layer.MapGuide( "INDIA MAP", url, params1, options1 );
	<%
    }
	
	else if(smap.equals(""))
	{
		System.out.println("No Data");
		String sqlmap1="select * from t_defaultvals where OwnerName='Default'";
		//String sqlmap="select * from t_defaultvals where OwnerName='Castrol'";
		ResultSet rsmap1=st2.executeQuery(sqlmap1);
		//System.out.println("started journey querry--------->"  +sqlmap1);
		if(rsmap1.next())
		{
			smap1=rsmap1.getString("Map");
			System.out.println("Map"  +smap1);
		}
		if(smap1.equals("OSM"))
				{
			
			System.out.println("Hi1");
    %>
    layer1=new OpenLayers.Layer.OSM("Local Tiles","http://maps.myfleetview.com/osm/\${z}/\${x}/\${y}.png", {numZoomLevels: 19, attribution : '<a href="http://myfleetview.com/" style="text-decoration:none"><font face="Hemi Head 426" size="03" color="#0853A0">FleetView <br><font face="Hemi Head 426" size="0.5" color="#0853A0">Transworld Technologies Ltd.  </a>', "tileOptions": {"crossOriginKeyword": null}},params1, options1);
	
	<%
		}
		else if(smap1.equals("MPG"))
		{
	System.out.println("MAP");
	%>
	
	layer1 = new OpenLayers.Layer.MapGuide( "INDIA MAP", url, params1, options1 );
	<%
		}
	}
System.out.println("MAP Loading");
    %> 
    
			map1.addLayer(layer1);
			//loadKML("KMLJRM/TWIndiaBoundry.kml");
	  <%
	  System.out.println("MAP Loaded");
	  %>
		  markers1 = new OpenLayers.Layer.Markers( "Markers");
	  		map1.addLayer(markers1);
	  		
		/*var size = new OpenLayers.Size(12,18);
		var offset = new OpenLayers.Pixel(-(size.w/2), -size.h);
		var iconn = new OpenLayers.Icon('images/mm_20_red.png', size, offset);*/
 	  
		<%
		  System.out.println("MAP MArker Loaded");
		  %>
		 map1.setCenter(new OpenLayers.LonLat(77.768553,23.402765).transform(
			        new OpenLayers.Projection("EPSG:4326"), // transform from WGS 1984
			        map1.getProjectionObject() // to Spherical Mercator Projection
			      ),5);

    map1.events.register('zoomend', map1, function(evt)
            {
    	try
        {
            ////////////////////////////////////NEW CODE ADDED TO CALCULATE LAT AND LON FOR A GIVEN POS//////////////////////
        var zoom = map1.getZoom();
      //  alert(zoom);
      <%
		  System.out.println("Zoom");
		  %>
        var pos=map1.getCenter();
      //  alert(pos);
       
             var a =pos.transform(map1.getProjectionObject(),map1.displayProjection);
             var lati=a.lat;
             var longi=a.lon;
          //   alert(lati);
          //  alert(longi);
             <%
   		  System.out.println("LAt");
   		  %>
        
                      
         }
        catch(e)
        {
            //alert(e);
            //e.message();
            
        };
            });
   // alert("SettoRed");
    setToRed ();
    <%
	  System.out.println("settored");
	  %>
      }

	      initialize();

	      function pass()
	      {

	  try
	  {

	     //     alert("---------------------------->");
	          var zoom = map1.getZoom();
	         // alert(zoom);
	          var pos=map1.getCenter();
	       //   alert(pos);
	         
	               var a =pos.transform(map1.getProjectionObject(),map1.displayProjection);
	               var lati=a.lat;
	               var longi=a.lon;
	            //   alert(lati);
	             // alert(longi);
	  }
	  catch(e)
	  {
	 // alert(e);
	  }

	          
	          document.getElementById("zoom1").value=zoom;
	          document.getElementById("zoomlat").value=lati;
	          document.getElementById("zoomlon").value=longi;
	         // alert(zoom);
	        //  alert(lati);
	        //  alert(longi);
	      }  
	      
  //	alert(map1.getZoom());
			<%
			/*lon = 77.768553;
			lat = 23.402765;
			location = "vcbnvhcdgcfnbxn";
			String dt = new SimpleDateFormat("dd-MM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse("2012-08-22"));
			String html1="<b>Last location:</b><br>"+location+"<br><b>Date Time : </b>"+dt+" 15:19:00";*/
			%>
		//	var point1 = 1;
		//	createMarker(point1,"<div class='bodyText'></%=html1%></div>","<div class='bodyText'></%=html1%></div>","AC",</%=lat%>,</%=lon%>);
    }
    catch(e)
    {
        //alert(e);
    }

  


    
    function loadKML(url){
//     	alert("in the function ");
        try
        {
  	  map1.addLayer(new OpenLayers.Layer.GML(url,url, 
  	          {
  	           format: OpenLayers.Format.KML, 
  	           formatOptions: {
  	             extractStyles: true 
  	           }
  	          }));
        }
        catch(e)
        {
            alert(e);
        }
    }
    
    function createMarker(point,name,html,stamp,lat,lon) 
    {//alert("in create marker");
        try
        {
		var cIcon;
		
		/*var mark = new OpenLayers.Layer.Markers( "Markers" );
		map1.addLayer(mark);
		var size = new OpenLayers.Size(21,25);
		var offset = new OpenLayers.Pixel(-(size.w/2), -size.h);*/
		//alert(offset);
		if(stamp=="OS")
		{
			cIcon= new OpenLayers.Icon('images/mm_20_red.png', size, offset);
		}
		if(stamp=="ST" || stamp=="SP")
		{
			cIcon= new OpenLayers.Icon('images/mm_20_white.png', size, offset);
		}
		if(stamp=="AC")
		{
			cIcon= new OpenLayers.Icon('images/t5.png', size, offset);
		}
		if(stamp=="DC")
		{
			cIcon= new OpenLayers.Icon('images/mm_20_yellow.png', size, offset);
		}
		if(stamp=="SI"||stamp=="OF")
		{
			cIcon= new OpenLayers.Icon('images/mm_20_green.png', new OpenLayers.Size(18,27), offset);
		}

			
			//mark.addMarker(new OpenLayers.Marker(new OpenLayers.LonLat(lon,lat),cIcon));
			//mark.addMarker(new OpenLayers.Marker(new OpenLayers.LonLat(lon,lat),cIcon.clone()));
		
	    var mark = new OpenLayers.Marker(new OpenLayers.LonLat(lon,lat).transform(
	              new OpenLayers.Projection("EPSG:4326"), // transform from WGS 1984
	              map1.getProjectionObject() // to Spherical Mercator Projection
	            ),cIcon);
	    
	    

	    
	   mark.events.register('mousedown', mark, function(evt) { popup = new OpenLayers.Popup("olPopup",
	      		new OpenLayers.LonLat(lon,lat).transform(
			              new OpenLayers.Projection("EPSG:4326"), // transform from WGS 1984
			              map1.getProjectionObject() // to Spherical Mercator Projection
			            ),
	      		new OpenLayers.Size(250,100),
	      		html,
	      		true);
	    popup.closeOnMove = true; 
	      		 map1.addPopup(popup);
	          });

	      alert(i);
                          
	          

	    markers1.addMarker(mark);
		gmarkers[i] = mark;
    	htmls[i] = html;
    	i++;
        
        }
        catch(e)
        {
            //alert(e);
        }
	    
      }
    </script>
    
    <%
    System.out.println("**************        *************");
    %>
    </body>
    </html>