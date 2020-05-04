<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="Conn.jsp"%>
    
    <%@page import="java.util.*,java.sql.*" %>
     <%
                ArrayList list = new ArrayList();
                ArrayList sublist = new ArrayList();
                try {
                    Class.forName("com.mysql.jdbc.Driver");  
                    Connection con = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
           
                
                }
                catch (Exception e1) {
                	System.out.println("Exception:--->"+e1);
                }
                    
                    %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<!-- <link rel="stylesheet" type="text/css" href="img/style1.css"> -->
<style>
/* <link href="http://fonts.googleapis.com/css?family=Bitter&subset=latin" rel="stylesheet" type="text/css"> */
  
<style>

body { 


 /* webkit adjacent sibling bug fix */
 /*  -webkit-animation: bugfix infinite 1s;  */
}

 @-webkit-keyframes bugfix { 
  from {padding:0;} 
  to {padding:0;} 
} 

label#sidemenutoggler {   /* Main label icon to toggle menu state */
  z-index: 100;
  display: block;
  position: relative;
  font-size: 10px; /* change font size to change label dimensions. Leave width/height below alone */
  width: 3.5em;
  height: 2em;
  top: 0;
  left: 0;
  background: white;
  text-indent: -1000px;
  border: 0.6em solid black; /* border color */
  border-width: 0.6em 0;
  cursor: pointer;
  -webkit-transition: all 0.3s ease-in;
  transition: all 0.3s ease-in; /* transition for animating label */
}


label#sidemenutoggler::before,
label#sidemenutoggler::after {
  /* inner stripes inside label */
  content: "";
  display: block;
  position: absolute;
  width: 100%;
  height: 0.6em;
  top: 50%;
  margin-top: -0.3em;
  left: 0;
  background: black; /* stripes background color. Change to match border color of parent label above */
  -webkit-transform: rotate(0);
  transform: rotate(0);
  -webkit-transition: all 0.3s ease-in;
  transition: all 0.3s ease-in; /* transition for flipping label */
}

#sidemenucheckbox:checked ~ label#sidemenutoggler {
  /* state of main menu label when menu is open  */
  /* border-color: transparent; */
}

#sidemenucheckbox:checked ~ label#sidemenutoggler::before {
  /* state of main menu label::before when menu is open  */
  -webkit-transform: rotate(-45deg);
  transform: rotate(-45deg);
}

#sidemenucheckbox:checked ~ label#sidemenutoggler::after {
  /* state of main menu label::after when menu is open  */
  /* -webkit-transform: rotate(45deg);
  transform: rotate(45deg); */
}

#sidemenucheckbox{ /* main side bar menu style */
	display:block; 
}

#leftsidemenu{
	position: fixed;
	
	top: 0;
	left: 0;
	width: 180px; /* width of menu */
	height: 100%;
	background: #D8592B ; /* background of menu */
  /* font: bold 1em 'Bitter', sans-serif; */ /* Use google custom fonts for this menu */
  z-index: 1001;
    margin:0;
  margin-top: 0.67em;
 /*  -webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
  visibility: hidden;
  box-shadow: 5px 0 10px rgba(0,0,0,.2); */
	/* -webkit-transform: translate3d(-100%,0,0) rotate(20deg); /* offset and rotate menu. Remove rotate() if desired */
	/*transform: translate3d(-100%,0,0) rotate(20deg);*/
}

#leftsidemenu a{
	text-decoration: none;
  color: black;
  /* text-transform: uppercase; */
}

#leftsidemenu ul{
  list-style: none;
  margin: 0;
  padding: 0;
  position: relative;
  display: block;
  font-size: 1 em;
  
 /*  -webkit-transform: translate3d(0,-20%,0); /* move UL upwards slightly, so it slides down menu opened */
  /*transform: translate3d(0,-20%,0);
  opacity: 0; */
}

#leftsidemenu ul li{

}

#leftsidemenu ul li a{
  padding: 5px 5px;
  display: block;
  border-top: 1px solid #ccc;
  
  
}

#leftsidemenu ul li a:hover{
  background: #A3D363;
  transition: all 0.5s;
  
}
.overlay{
 /*  content: ''; */
  position: fixed;
  visibility: visible;
  width: 100%;
  height: 100%;
  background: gray;
  left: 0;
  top: 0;
  opacity: 0;
  z-index: 1000;
  /* -webkit-transition: opacity .3s, visibility 0s .3s;
  transition: opacity .3s, visibility 0s .3s; */
}

.overlay label{
  width: 100%;
  height: 100%;
  left: 0;
  top: 0;
  position: absolute;
}

#leftsidemenu label#closex{ /* Large x close button inside nav */
  width: 50px;
  height: 50px;
	overflow: hidden;
  display: block;
  position: absolute;
  cursor: pointer;
	text-indent: -1000px;
  z-index: 10;
  top: 0;
  right: 0;
}


#leftsidemenu label#closex::before,
#leftsidemenu label#closex::after{ /* render large cross inside close button */
  content: "";
  display: block;
  position: absolute;
  width: 100%;
  height: 6px;
  background: black;
  top: 50%;
  margin-top: -3px;
 /*  -ms-transform: rotate(-40deg);
  -webkit-transform: rotate(-40deg);
  transform: rotate(-40deg); */
}

#leftsidemenu label#closex::after{ /* render large cross inside close button */
 /*  -ms-transform: rotate(40deg);
  -webkit-transform: rotate(40deg);
  transform: rotate(40deg); */
}

#sidemenucheckbox:checked ~ #leftsidemenu{
  visibility: visible;
/* 	-webkit-transform: translate3d(0,0,0);
	transform: translate3d(0,0,0);
  -webkit-transition: -webkit-transform .5s ease-in-out;
  transition: transform .5s ease-in-out; */
}

#sidemenucheckbox:checked ~ #leftsidemenu ul{
  /* -webkit-transform: translate3d(0,50px,0); /* shift menu downwards when revealed */
  /*transform: translate3d(0,50px,0);
  opacity: 1; */
/*   -webkit-transition: opacity 1s .5s, -webkit-transform 1s .5s;
  transition: opacity 1s .5s, transform 1s .5s; */
}

/* #sidemenucheckbox:checked ~ .overlay{
  opacity: .8;
  visibility: visible;
  -webkit-transition: opacity 0.3s;
  transition: opacity 0.3s;
} */

</style>

<script>
//document.createElement('nav')
 

/* function legacybrowsertoggle(){

		var mobilemenunav = document.getElementById("leftsidemenu")
	
			//mobilemenunav.style.visibility = 'visible';
		

}
  */
 
 //window.onload(legacybrowsertoggle());
</script>

<!--[if lte IE 8]>

	<style>

	/* IE8 specific CSS */

	#leftsidemenu label#closex{
		position: static;
		width: auto;
		text-align: center;
		font-size: 2em;
		text-indent: 0;
	}


	</style>

<![endif]-->


</style>
<!--  <script src="menu-vertical.js" type="text/javascript"></script> -->
<style>

.navigation {
   width: 30 px; 
  font-size: 12 px;
  font-style: normal;
 
}

.mainmenu, .submenu, {
  list-style: none;
  padding: 0;
  margin: 1 px;
      border-top: 1px solid #ccc;
}

/* make ALL links (main and submenu) have padding and background color */
.mainmenu a {
  display: block;
  background-color: #D8592B ;
  text-decoration: none;
  padding: 2 px;
  color: #000;
  
}

/* add hover behaviour */
.mainmenu a:hover {
    background-color: #C5C5C5;
}


/* when hovering over a .mainmenu item,
  display the submenu inside it.
  we're changing the submenu's max-height from 0 to 200px;
*/

.mainmenu li:hover .submenu {
  display: block;
  max-height: 800px;
}


/*
  we now overwrite the background-color for .submenu links only.
  CSS reads down the page, so code at the bottom will overwrite the code at the top.
*/

.submenu a {
  background-color: #999;
}

/* hover behaviour for links inside .submenu */
.submenu a:hover {
  background-color: #666;
}



/* this is the initial state of all submenus.
  we set it to max-height: 0, and hide the overflowed content.
*/
.submenu {
  overflow: hidden;
  max-height: 0;
  -webkit-transition: all 0.5s ease-out;
}
header{

/*  margin-top: 0em;
margin-bottom: 0em; */
     padding: 1em;  
    margin-bottom:0 ;
    
    width:100%;
    color: white;
    background-color: #D8592B;
  
    text-align: center;
    font-size: 10px
 
}

</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Smart Grid</title>
</head>
  <% String username1=session.getAttribute("userid").toString(); %>
   <header>
           <h1> Smart Grid      </h1>
           <div align="right">
     <font size="2">   
  Welcome <%=username1 %>
     </font>
           </div>
           </header>
<input type="checkbox" id="sidemenucheckbox" checked="checked" style="visibility: hidden;"/>

<!-- <label id="sidemenutoggler" for="sidemenucheckbox" onClick="legacybrowsertoggle()">Toggle Menu</label> -->

<nav id="leftsidemenu" class="navigation">


<br><br><br><br><br>
 <ul  class="mainmenu">
    <li><a href="">Registration</a>
    
     <ul   class="submenu">
        <li><a href="register.jsp">Individual User</a></li>
        
        
        <li><a href="Home.jsp">Corporate User</a></li>
        
    
      </ul>
    
    
 
    <li><a href="">Admin</a>
    
     
     <ul   class="submenu">
        <li><a href="SmartGridEntry.jsp">UserMaster</a></li>
        
        
     
        
    
      </ul>
    
    
    <li><a href="">Location</a>
      <ul   class="submenu">
        <li><a href="LocationEntry.jsp">LocationEntry</a></li>
        
        
        <li><a href="LocationMasterEntry.jsp">Location Master</a></li>
        </ul>
  

       
    
  

    
     <li><a href="">Zone</a>
      <ul   class="submenu">
        <li><a href="ZoneEntry.jsp">Add Zone</a></li>
        
        
        <li><a href="ZoneMasterEntry.jsp">Zone Master</a></li>
        </ul>
  
   
    
   
     <li><a href="">Geo Data</a>
      <ul   class="submenu">
        <li><a href="UploadGeoData.jsp">Add GeoData</a></li>
        
        
        <li><a href="ShowGeoOnMap.jsp">Show GeoData</a></li>
        </ul>
        
        
        
         <li><a href="UploadMedia.jsp"> Upload Media</a></li>
         
          <li><a href="screenbooking.jsp"> Slot Booking</a></li>
          
           <li><a href="ImagesCountReport.jsp"> Camera Image Report</a></li>
              <li><a href="DisplayPanel.jsp"> Display Panel</a></li>
            <li style="border-bottom: 1px solid #ccc;"><a href="logout.jsp"> Logout</a></li>
  
   </ul> 
    
    
  
  </nav>
	<!-- <ul>
	<li><a href="newpage.jsp">Home</a></li>
	
	<li><a href="http://www.dynamicdrive.com/new.htm">DHTML</a></li>
	<li><a href="http://www.dynamicdrive.com/style/">CSS Library</a></li>
	<li><a href="http://www.cssdrive.com">CSS Gallery</a></li>
	<li><a href="http://www.javascriptkit.com">JavaScript</a></li>
	</ul> -->
<!-- <label id="closex" for="sidemenucheckbox" onClick="legacybrowsertoggle()">Close</label> -->
</nav>
	
<!-- <div class="overlay"><label for="sidemenucheckbox"></label></div> -->







