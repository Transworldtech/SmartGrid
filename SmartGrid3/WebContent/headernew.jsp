<%-- <%@ include file="Conn.jsp"%> --%>
 <%--   <%@page import="java.util.*,java.sql.*" %> --%>
   
   
   
   
<!doctype html>
                        <html>
                        

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-115363888-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-115363888-1');
</script> 


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
                        
                        
                        
                            <head>
                                <meta charset='utf-8'>
                                <meta name='viewport' content='width=device-width, initial-scale=1'>
                                <title>Smart Grid</title>
                               <!--  <link href='//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css' rel='stylesheet'> -->
                               <link href="css/bootstrap.min.css" rel='stylesheet'>
                              <!--  <link rel="stylesheet" href="https://formden.com/static/cdn/bootstrap-iso.css"> -->
                                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
                                <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
                                
                                <style>    body,html{
		height: 100% ;
		
		
	}






/*font size material icons */
.material-icons {
    font-family: 'Material Icons';
    font-weight: normal;
    font-style: normal;
    font-size: 15px;
    line-height: 1;
    letter-spacing: normal;
    text-transform: none;
    display: inline-block;
    white-space: nowrap;
    word-wrap: normal;
    direction: ltr;
    -webkit-font-feature-settings: 'liga';
    -webkit-font-smoothing: antialiased;
}



	/* remove outer padding */
	.main .row{
		padding: 0px;
		margin: 0px;
	}

	/*Remove rounded coners*/

	nav.sidebar.navbar {
		border-radius: 0px;
	}

	nav.sidebar, .main{
		-webkit-transition: margin 200ms ease-out;
	    -moz-transition: margin 200ms ease-out;
	    -o-transition: margin 200ms ease-out;
	    transition: margin 200ms ease-out;
	}

	/* Add gap to nav and right windows.*/
	.main{
		padding: 0 10px 10 10px;
	}

	/* .....NavBar: Icon only with coloring/layout.....*/

	/*small/medium side display*/
	@media (min-width: 768px) {

		/*Allow main to be next to Nav*/
		.main{
			position: absolute;
			width: calc(100% - 180px); /*keeps 100% minus nav size*/
			margin-left: 30px;
			float: right;
		}
@media (min-width: 768px)
   { .navbar-nav>li>a {
    padding-top: 10px;
    padding-bottom: 10px;
   
}
	}	/*lets nav bar to be showed on mouseover*/
		 nav.sidebar:hover + .main{
			margin-left: 200px;
		}  

		/*Center Brand*/
		nav.sidebar.navbar.sidebar>.container .navbar-brand, .navbar>.container-fluid .navbar-brand {
			margin-left: 0px;
		}
		/*Center Brand*/
		nav.sidebar .navbar-brand, nav.sidebar .navbar-header{
			text-align: center;
			width: 100%;
			margin-left: 0px;
		}

		/*Center Icons*/
		nav.sidebar a{
			padding-right: 13px;
		}

		/*adds border top to first nav box */
		nav.sidebar .navbar-nav > li:first-child{
			/* border-top: 1px #e5e5e5 solid;  */
			
		}

		/*adds border to bottom nav boxes*/
		nav.sidebar .navbar-nav > li{
			/* border-bottom: 1px #e5e5e5 solid; */
		}

		/* Colors/style dropdown box*/
		nav.sidebar .navbar-nav .open .dropdown-menu {
			position: static;
			float: none;
			width: auto;
			margin-top: 0;
			background-color: transparent;
			border: 0;
			-webkit-box-shadow: none;
			box-shadow: none;
		}

		/*allows nav box to use 100% width*/
		nav.sidebar .navbar-collapse, nav.sidebar .container-fluid{
			padding: 0 0px 0 0px;
		}

		/*colors dropdown box text */
		.navbar-inverse .navbar-nav .open .dropdown-menu>li>a {
			/* color: #777; */
			    /* color: #EAE9E9; */
			     font-family: 'Source Sans Pro', 'Helvetica Neue', Helvetica, Arial, sans-serif;
			    font-size: 14 px;
			       color:#b4b6bd;
		}
         
         
         .navbar-inverse {
    /* background-color: #222; */
        background-color: #3a3f51;
    border-color: #080808;
}
         
         
         .navbar-inverse .navbar-nav>li>a {
  /*  color: #EFDFDF;  */
   color:#b4b6bd;
      
   font-family: 'Source Sans Pro', 'Helvetica Neue', Helvetica, Arial, sans-serif;
   font-size: 14 px;
        /* color: #EF1111; */
}
		/*gives sidebar width/height*/
		nav.sidebar{
			width: 200px;
			height: 100%;
			margin-left: 0;
			float: left;
			z-index: 8000;
			margin-bottom: 0px;
			  font-size: 14 px;
			      line-height: 1.42857143;
		}

		/*give sidebar 100% width;*/
		nav.sidebar li {
			width: 100%;
		}

		/* Move nav to full on mouse over*/
		nav.sidebar:hover{
			margin-left: 0px;
		}
		/*for hiden things when navbar hidden*/
		.forAnimate{
		/*  opacity:0; */
			opacity: 1;
		}
	}

	/* .....NavBar: Fully showing nav bar..... */

	@media (min-width: 1330px) {

		/*Allow main to be next to Nav*/
		.main{
			width: calc(100% - 200px); /*keeps 100% minus nav size*/
			margin-left: 200px;
		}

		/*Show all nav*/
		nav.sidebar{
			margin-left: 0px;
			float: left;
		}
		/*Show hidden items on nav*/
		nav.sidebar .forAnimate{
			opacity: 1;
		}
	}

	nav.sidebar .navbar-nav .open .dropdown-menu>li>a:hover, nav.sidebar .navbar-nav .open .dropdown-menu>li>a:focus {
		color: #CCC;
		background-color: transparent;
	}

	nav:hover .forAnimate{
		opacity: 1;
	}
	section{
		padding-left: 15px;
	}</style>
                                <script type='text/javascript' src='//code.jquery.com/jquery-1.10.2.min.js'></script>
                            <!--     <script type='text/javascript' src='//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js'></script> -->
                            <script type='text/javascript' src='css/bootstrap.min.js'></script>
                                <script type='text/javascript'>    function htmlbodyHeightUpdate(){
		var height3 = $( window ).height()
		var height1 = $('.nav').height()+50
		height2 = $('.main').height()
		if(height2 > height3){
			$('html').height(Math.max(height1,height3,height2)+10);
			$('body').height(Math.max(height1,height3,height2)+10);
		}
		else
		{
			$('html').height(Math.max(height1,height3,height2));
			$('body').height(Math.max(height1,height3,height2));
		}
		
	}
	$(document).ready(function () {
		htmlbodyHeightUpdate()
		$( window ).resize(function() {
			htmlbodyHeightUpdate()
		});
		$( window ).scroll(function() {
			height2 = $('.main').height()
  			htmlbodyHeightUpdate()
		});
	});</script>
                            </head>
                            <body>
                            
                            
                            <%
              
String role = "",access="";

	
	
// 	role = session.getAttribute("role").toString();
	
	
	try{

		role=session.getAttribute("role").toString();
		
		access=session.getAttribute("Access").toString();
		
		
		

}
catch(Exception e)
{
        response.sendRedirect("index.jsp");
        return;
}


	
              %>          
              
              <%
              
              try{
              
              		String TypeofUser=session.getAttribute("TypeofUser").toString();
	
              String typevalue=session.getAttribute("typevalue").toString();
              
              System.out.println("TypeofUser value--->"+TypeofUser);
              System.out.println("typevalue value--->"+typevalue);
              
              String sql="",VehicleCode="";
              
              Class.forName(MM_dbConn_DRIVER);
         	 Connection REPNo=DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
           Statement st1=REPNo.createStatement();	 
              
		if(TypeofUser.equalsIgnoreCase("Transporter"))
		{
			sql="select VehicleRegNumber,VehicleCode from  db_gps.t_vehicledetails where OwnerName='"+typevalue+"' and status = '-'";
			ResultSet rs=st1.executeQuery(sql);
			System.out.println("buutton value--->"+sql);
			while(rs.next())
			{
				VehicleCode+=","+rs.getString("VehicleCode");
			}
    	}
		else
		{
			sql="select VehRegno,vehcode from db_gps.t_group where GPName='"+typevalue+"' and Active = 'Yes' and VehCode in (select distinct(VehicleCode) from db_gps.t_vehicledetails where Status ='-')";
			ResultSet rs=st1.executeQuery(sql);
			while(rs.next())
			{
				VehicleCode+=","+rs.getString("vehcode");
			}
		}
		
		VehicleCode = VehicleCode.replaceFirst(",","");    
		String vehcode="("+VehicleCode+")";
        session.setAttribute("VehicleCode", vehcode);
        session.setAttribute("vehlist", vehcode);
        System.out.println("vehcode--->"+vehcode);

              }
              catch(Exception e)
              {
            	  e.printStackTrace();
              }
              
		 %>
              
                            <nav class="navbar navbar-inverse sidebar " role="navigation">
    <div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-sidebar-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<img src="smartgrid.png"  height="60" width="200">
			<!-- <a class="navbar-brand" href="#">Brand</a> -->
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="bs-sidebar-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<!-- <li class="">    <a href="#">    Home<span style="font-size:12px; margin-right: 15px;" class="pull-left hidden-xs showopacity glyphicon glyphicon-home"></span></a></li>
				<li >           <a href="#">     Profile<span style="font-size:12px; margin-right: 15px;" class="pull-left hidden-xs showopacity glyphicon glyphicon-user"></span></a></li>
				<li >           <a href="#">     Messages<span style="font-size:12px;margin-right: 15px;" class="pull-left hidden-xs showopacity glyphicon glyphicon-envelope"></span></a></li> -->
				<!-- <li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"><span style="font-size:12px; color:red; margin-right: 15px;" class="pull-left hidden-xs showopacity glyphicon glyphicon-pencil"></span>Registration<span class="caret"></span></a>
					<ul class="dropdown-menu forAnimate" >
						<li><a href="register.jsp">Individual User</a></li>
						<li><a href="Home.jsp">Corporate User</a></li>
						<li><a href="#">Something else here</a></li>
						
					</ul>
				</li> -->
				<!-- 
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"><span style="font-size:12px; color:white; margin-right: 15px;" class="pull-left hidden-xs showopacity glyphicon glyphicon-user"></span>Admin <span class="caret"></span></a>
					<ul class="dropdown-menu forAnimate" role="menu">
						<li><a href="SmartGridEntry.jsp">User Master</a></li>
						
						
					
					</ul>
				</li> -->
				
				<!-- <li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">  <span class=" material-icons" style="color:red; "> location_on</span> &nbsp;  Location <span class="caret"></span><span style="font-size:12px; color:green; margin-right: 15px;" class="pull-left hidden-xs showopacity glyphicon glyphicon-cog"></span></a>
					<ul class="dropdown-menu forAnimate" role="menu">
						<li><a href="LocationEntry.jsp">Location Entry</a></li>
						<li><a href="LocationMasterEntry.jsp">Location Master</a></li>
						
					
					</ul>
				</li> -->
				
				<!-- <li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"><span style="font-size:12px; color:violet; margin-right: 15px;" class="pull-left hidden-xs showopacity fa fa-ravelry"></span>Zone <span class="caret"></span></a>
					<ul class="dropdown-menu forAnimate" role="menu">
						<li><a href="ZoneEntry.jsp">Add Zone</a></li>
						<li><a href="ZoneMasterEntry.jsp">Zone Master</a></li>
						
					
					</ul>
				</li> -->
				<!-- <li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"> <span class=" material-icons" style="color:white; ">language</span> &nbsp; Geo Data <span class="caret"></span></a><span style="font-size:12px; color:green; margin-right: 15px;" class="pull-left hidden-xs showopacity glyphicon glyphicon-cog"></span> 
					<ul class="dropdown-menu forAnimate" role="menu">
						<li><a href="UploadGeoData.jsp">Add Geo Data</a></li>
						<li><a href="ShowGeoOnMap.jsp">Show Geo Data</a></li>
						
					
					</ul>
				</li> -->
				<% if(role.equals("1") ||role.equals("2") || role.equals("3"))  {%>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"><span style="font-size:12px; color:white; margin-right: 15px;" class="pull-left hidden-xs showopacity glyphicon glyphicon-user"></span>My Account <span class="caret"></span></a>
					<ul class="dropdown-menu forAnimate" role="menu">
						<li><a href="">User </a></li>
						<li><a href="updatepassword.jsp">Change Password </a></li>
						
						
						
					
					</ul>
				</li>
				<%if(role.equals("1")) {%>
				
				<%if(access.equalsIgnoreCase("advertiser")){ %>
				
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"><span style="font-size:12px; color:yellow; margin-right: 15px;" class="pull-left hidden-xs showopacity glyphicon glyphicon-pencil"></span>Admin <span class="caret"></span></a>
					<ul class="dropdown-menu forAnimate" role="menu">
					    <li><a href="register.jsp">Individual User</a></li>
						<li><a href="Home.jsp">Corporate User</a></li>
						<li><a href="SmartGridEntry.jsp">User Master</a></li>
												<li><a href="UserLoginHistory.jsp">User Login History Report</a></li>
						
						<li><a href="LocalStorageReport.jsp">Local Storage Report</a></li>
						<li><a href="LocationEntry.jsp">Location Entry</a></li>
						<li><a href="LocalStorageReportforAll.jsp">Local Storage All Report</a></li>
						<li><a href="LocationMasterEntry.jsp">Location Master</a></li>
						<li><a href="PolMasterReport.jsp">Pole Master</a></li>	
						<li><a href="DeviceLocationReport.jsp">Device Location Report</a></li>
	                    <li><a href="RouteMasterReport.jsp">Route Master</a></li>
						<li><a href="ZoneEntry.jsp">Add Zone</a></li>
						<li><a href="ZoneMasterEntry.jsp">Zone Master</a></li>
						<li><a href="UploadGeoData.jsp">Add Geo Data</a></li>
						<li><a href="ShowGeoOnMap.jsp">Show Geo Data</a></li>
						<li><a href="DefaultScheduleMaster.jsp">Default Schedule Master</a></li>
						<li><a href="CreateDefaultScheduleReport.jsp">Add Default Schedule</a></li>
						<li><a href="DefaultScheduleFinalReports.jsp">Default Sch Location Wise</a></li>
						<li><a href="UploadDefaultSchedule.jsp">Upload Default Schedule</a></li>
						<li><a href="AdPlayedReportMediaLocationWise.jsp">AD Played Details Report</a></li>
						<li><a href="AdPlayedReportMediaWise.jsp">Default AD Played Report</a></li>
						<li><a href="ImagesCountReport.jsp"><!-- <span style="font-size:12px;color:yellow;margin-right: 15px;" class=" pull-left hidden-xs showopacity    fa fa-camera"></span> -->Camera Report All</a></li>
						<li><a href="mygridreport.jsp"><!-- <span style="font-size:12px;color:yellow;margin-right: 15px;" class=" pull-left hidden-xs showopacity    fa fa-camera"></span> -->My Grid Report</a></li>
						
						<li><a href="DisplayPanel3.jsp"> <!-- <span class=" material-icons" style="color:violet; ">airplay</span> --><!-- &nbsp;&nbsp;  -->  Display Panel</a></li>
<!-- 						<li><a href="smartcurrentposition.jsp"> Current Position</a></li>
 -->						
					</ul>
			
				</li>
				
			   <% }else if(access.equalsIgnoreCase("ssm")) { %>		
				
					<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"><span style="font-size:12px; color:yellow; margin-right: 15px;" class="pull-left hidden-xs showopacity glyphicon glyphicon-pencil"></span>Admin <span class="caret"></span></a>
					<ul class="dropdown-menu forAnimate" role="menu">
					    <li><a href="register.jsp">Individual User</a></li>
						<li><a href="Home.jsp">Corporate User</a></li>
						<li><a href="SmartGridEntry.jsp">User Master</a></li>
						<li><a href="LocationEntry.jsp">Location Entry</a></li>
						<li><a href="LocationMasterEntry.jsp">Location Master</a></li>
						<li><a href="PolMasterReport.jsp">Pole Master</a></li>	
						<li><a href="DeviceLocationReport.jsp">Device Location Report</a></li>
	                    <li><a href="RouteMasterReport.jsp">Route Master</a></li>
						<li><a href="ZoneEntry.jsp">Add Zone</a></li>
						<li><a href="ZoneMasterEntry.jsp">Zone Master</a></li>
						<li><a href="UploadGeoData.jsp">Add Geo Data</a></li>
						<li><a href="ShowGeoOnMap.jsp">Show Geo Data</a></li>
						<li><a href="ImagesCountReport.jsp"><!-- <span style="font-size:12px;color:yellow;margin-right: 15px;" class=" pull-left hidden-xs showopacity    fa fa-camera"></span> -->Camera Report All</a></li>
						<li><a href="mygridreport.jsp"><!-- <span style="font-size:12px;color:yellow;margin-right: 15px;" class=" pull-left hidden-xs showopacity    fa fa-camera"></span> -->My Grid Report</a></li>
						<li><a href="DisplayPanel3.jsp"> <!-- <span class=" material-icons" style="color:violet; ">airplay</span> --><!-- &nbsp;&nbsp;  -->  Display Panel</a></li>
<!-- 						<li><a href="smartcurrentposition.jsp"> Current Position</a></li>
 -->						
					</ul>
			
				</li>
				
				<%}
			   else
			   {
				%>
					

				
				<%} %>
	            <% }%>			
				
				
		<% if(role.equals("1") || role.equals("2") || role.equals("3")) {%>
				
				<%if(access.equalsIgnoreCase("advertiser")){ %>
				
				
				<li>     
				<a href="mediacenter.jsp"><span style="font-size:12px;color:red;margin-right: 15px;" class="pull-left hidden-xs showopacity  glyphicon glyphicon-film"></span>My Media</a>
				
				</li>

				<li><a href="CampaignReport.jsp"><span style="font-size:12px;color:yellow;margin-right: 15px;" class="pull-left hidden-xs showopacity glyphicon glyphicon-book"></span>My Campaign</a></li>
				
				
				<li><a href="screenbooking.jsp"><span style="font-size:12px;color:yellow;margin-right: 15px;" class="pull-left hidden-xs showopacity glyphicon glyphicon-th"></span>Book My Ad</a></li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"><span style="font-size:12px; color:yellow; margin-right: 15px;" class="pull-left hidden-xs showopacity glyphicon glyphicon-pencil"></span>View Booking<span class="caret"></span></a>
				<ul class="dropdown-menu forAnimate" role="menu">
				<li><a href="Advertise.jsp">Advertise Report</a></li>
				<li><a href="Advertisedetails.jsp">Advertise Detail Report</a></li>
				<li><a href="AdPlayedSummary.jsp">Ad Played Report</a></li>
				</ul>
				</li>
				<li><a href="smartcurrentposition.jsp">
				<span class=" material-icons" style="color:violet; ">airplay</span>&nbsp;&nbsp;   Current Position</a>
				</li>
				
<!-- 				<li><a href="DisplayPanel3.jsp"><span style="font-size:12px;color:Red;margin-right: 15px;" class="pull-left hidden-xs showopacity glyphicon glyphicon-th"></span>Display Panel</a></li> -->
			
				<%} else if(access.equalsIgnoreCase("ssm")){ %>
				
<!-- 				<li><a href="DisplayPanel3.jsp"><span style="font-size:12px;color:Red;margin-right: 15px;" class="pull-left hidden-xs showopacity glyphicon glyphicon-th"></span>Display Panel</a></li>
 -->			
 
 		

<!-- 					//<li><a href="DisplayPanel3.jsp"><span style="font-size:12px;color:Red;margin-right: 15px;" class="pull-left hidden-xs showopacity glyphicon glyphicon-th"></span>Display Panel</a></li>
 -->				<!-- <li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"><span style="font-size:12px; color:yellow; margin-right: 15px;" class="pull-left hidden-xs showopacity glyphicon glyphicon-pencil"></span>Admin <span class="caret"></span></a>
					<ul class="dropdown-menu forAnimate" role="menu">
 					    
						<li><a href="mygridreport.jsp"><span style="font-size:12px;color:yellow;margin-right: 15px;" class=" pull-left hidden-xs showopacity    fa fa-camera"></span>My Grid Report</a></li>
					
					<li>	
					<a href="DisplayPanel3.jsp">  Display Panel</a></li>
						
					</ul>
			
				</li> -->
				
				<ul class="dropdown-menu forAnimate" role="menu">
				
				<li><a href="DisplayPanel3.jsp"><span style="font-size:12px;color:Red;margin-right: 15px;" class="pull-left hidden-xs showopacity glyphicon glyphicon-th"></span>Display Panel</a></li>
				<li><a href="mygridreport.jsp"><span class=" material-icons" style="color:violet; ">airplay</span>&nbsp;&nbsp;   My Grid Report</a></li>
				</li>
				<li><a href="smartcurrentposition.jsp">
				<span class=" material-icons" style="color:violet; ">airplay</span>&nbsp;&nbsp;   Current Position</a>
				</li>
 				</ul>
 	
				<%}
				else {
					
					%>
				
					<%
				}
				
				%>
		<% }%>
				
				
				
				<% if(role.equals("1") || role.equals("2") || role.equals("3") ){ %>
				
				<%if (access.equals("advertiser")){ %>
				<li><a href=""><span style="font-size:15px;color:red;margin-right: 15px;" class=" pull-left hidden-xs showopacity    fa fa-gift"></span>Offers</a></li>
				<%if(role.equals("1") || role.equals("2")){ %>
				<li><a href="ImageCountReport1.jsp">
				<span class=" material-icons" style="color:violet; ">airplay</span>&nbsp;&nbsp;   ViewerShip</a>
				</li>
				<% }%>
				<li><a href=""><span style="font-size:12px;color:red;margin-right: 15px;" class=" pull-left hidden-xs showopacity    fa fa-history"></span>History</a></li>
				
				<li><a href=""><span style="font-size:12px;color:yellow;margin-right: 15px;" class=" pull-left hidden-xs showopacity    fa fa-credit-card"></span>My Wallet</a></li>
				<% } else if (access.equalsIgnoreCase("ssm")){%>
								<%if(role.equals("1") || role.equals("2")){ %>
				<li><a href="mygridreport.jsp">
				<span class=" material-icons" style="color:violet; ">airplay</span>&nbsp;&nbsp;   My Grid Report</a>
				</li>
				<li><a href="DisplayPanel3.jsp">
				<span class=" material-icons" style="color:violet; ">airplay</span>&nbsp;&nbsp;   Display Panel</a>
				</li>
				<li><a href="ImageCountReport1.jsp">
				<span class=" material-icons" style="color:violet; ">airplay</span>&nbsp;&nbsp;   ViewerShip</a>
				</li>
				<li><a href="smartcurrentposition.jsp">
				<span class=" material-icons" style="color:violet; ">airplay</span>&nbsp;&nbsp;   Current Position</a>
				</li>
				<% }%>
				
				<%}
				else
				{
				%>

				<%}%>
			
				<li><a href="logout.jsp?acc=<%=access%>"><span style="font-size:12px;color:red;margin-right: 15px;" class="pull-left hidden-xs showopacity fa fa-power-off"></span>Logout</a></li>
				
				<%}%>
				
				<% }%>
			
			</ul>
		</div>
	</div>
</nav>

<div class="main" style="margin-left:180px;"> 
<% 


%>
<%@ include file="header1.jsp"%>

                            </body>
                        </html>