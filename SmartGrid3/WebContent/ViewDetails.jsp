<!DOCTYPE html>
 <%@page import="org.apache.poi.hssf.record.formula.functions.Isblank"%>
<%@ include file="Conn.jsp"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page import="java.sql.*,java.util.*" %>

<html lang="en">
<%
	if (session.getAttribute("username") == null) {
%>
	<script>
	function loginalert() {
		//alert("Please Login First");
		swal("Good job!", "Login Successful!", "success");
}
	</script>
		<jsp:forward page="login.jsp"></jsp:forward>

<%
	}
%>	

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>SmartGrid Infra</title>

<!-- Global stylesheets -->
<link rel="icon" type="image/png" href="assets/images/icons/favicon.ico"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

<link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
<!------ Include the above in your HEAD tag ---------->

 
<link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700,900" rel="stylesheet" type="text/css">
<link href="assets/css/icons/icomoon/styles.css" rel="stylesheet" type="text/css">
<link href="assets/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="assets/css/core.css" rel="stylesheet" type="text/css">
<link href="assets/css/components.css" rel="stylesheet" type="text/css">
<link href="assets/css/colors.css" rel="stylesheet" type="text/css">
<link href="assets/css/LocationDetails.css" rel="stylesheet" type="text/css">
<link href="assets/css/select2.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">


<link rel="stylesheet" type="text/css" href="assets/css/bootstrap-clockpicker.min.css">
<link rel="stylesheet" type="text/css" href="assets/css/github.min.css">
<!-- /global stylesheets -->

<!-- Core JS files -->
<script type="text/javascript" src="assets/js/core/libraries/jquery.min.js"></script>
<script type="text/javascript" src="assets/js/core/libraries/bootstrap.min.js"></script>
<!-- /core JS files -->

<!-- Theme JS files -->
<script type="text/javascript" src="assets/js/plugins/ui/nicescroll.min.js"></script>
<script type="text/javascript" src="assets/js/core/app.js"></script>
<script type="text/javascript" src="assets/js/pages/layout_fixed_custom.js"></script>
<script type="text/javascript" src="assets/js/plugins/ui/ripple.min.js"></script>
<script type="text/javascript" src="assets/js/select2.min.js"></script>
<!-- /theme JS files -->


<link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
<script type="text/javascript"  src="https://code.jquery.com/jquery-1.12.4.js"></script> 
<script type="text/javascript"  src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script> 

<!-- Export Options Links of DataTables -->

<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css">
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script> 
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script> 
<script src=" https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js "></script>
<link href="https://cdn.jsdelivr.net/npm/pretty-checkbox@3.0/dist/pretty-checkbox.min.css" rel="stylesheet" type="text/css">
<style type="text/css">
#example {
    
    border-collapse: collapse;
    width: 100%;
}

#example td, #example th {
    border: 1px solid ;
    padding: 8px;
}

#example tr:nth-child(even){}

#example tr:hover {background-color: #ddd;}

#example th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: left;
   
    color: black;
}
</style>

 <script type="text/javascript">
 $(document).ready(function() {
	    $('#example').DataTable( {
	    	"pagingType": "full_numbers",
	    	
/* 	    	"bPaginate": false, */
    	    "bLengthChange": false,
    	    "bInfo": false,
    	    "bAutoWidth": false
	    } );
	} );

</script>
<script type="text/javascript">
$(document).ready(function() {
	 $("#checkAll").click(function () {
	     $('input:checkbox').not(this).prop('checked', this.checked);
	 });
});
</script>

<script type="text/javascript">

$(document).ready(function() {
    $('#text1').bind("cut copy paste", function(e) {
        e.preventDefault();
        alert("You cannot paste text into this textbox!");
        $('#text1').bind("contextmenu", function(e) {
            e.preventDefault();
        });
    });
});
</script>

<style>
.fixed {
    position: relative;
    display: inline-block;
    border-bottom: 1px dotted black;
}

.fixed .tooltiptext {
    visibility: hidden;
    width: 120px;
    background-color: black;
    color: #fff;
    text-align: center;
    border-radius: 6px;
    padding: 5px 0;
    
    /* Position the tooltip */
    position: absolute;
    z-index: 1;
    bottom: 100%;
    left: 50%;
    margin-left: -60px;
}

.fixed:hover .tooltiptext {
    visibility: visible;
}
</style>

<style>
div.fixed {
    position: fixed;
    bottom: 50px;
    right: 45px;
    width: 40px;
    height:40px;
    border: 0px solid black;
    z-index: 1;
}
.t1
{
margin-right: 3%;

}

header
{
float:left;
align:right;
clear: left;
}

</style>
<style type="text/css">
body{
	font-family: Verdana;
  padding:50px;
  background: #f2f2f2;
}
.wrapper{
  width:70%;
}
@media(max-width:992px){
 .wrapper{
  width:100%;
} 
}
.panel-heading {
  padding: 0;
	border:0;
}
.panel-title>a, .panel-title>a:active{
	display:block;
	padding:15px;
  color:#555;
  font-size:14px;
  font-weight:bold;

	letter-spacing:1px;
  word-spacing:3px;
	text-decoration:none;
}
.panel-heading  a:before {
   font-family: 'Glyphicons Halflings';
   content: "\e114";
   float: right;
   transition: all 0.5s;
}
.panel-heading.active a:before {
	-webkit-transform: rotate(180deg);
	-moz-transform: rotate(180deg);
	transform: rotate(180deg);
} 


</style>
</head>

<body class="navbar-top">
<%
java.sql.Connection con;
java.sql.Connection con1;
java.sql.Connection con2;
java.sql.Statement st ;
Statement st1,st2;
ResultSet rs,rs1,rs2;

Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
/* 
Context ctx = new InitialContext();

DataSource ds = (DataSource) ctx.lookup("java:/comp/env/db_gps");
con1 = ds.getConnection();
System.out.println("In Context ");
DataSource ds1 = (DataSource) ctx.lookup("java:/comp/env/smartgrid");
con2=ds1.getConnection();

st = con2.createStatement();
System.out.println("Statement Created");



System.out.println("Resultset Created");
String sql="",VehicleCode=""; */
st1 = con1.createStatement(); 	 
st2 = con1.createStatement(); 
st = con1.createStatement();
/* SQL Queries  */

String LocationDetailsQuery="select count(*) as Count ,category,City,State,Country from smartgrid.t_polmaster  where category!=' '   group by country,state,city,category order by Country,State,City,category;";
String CountrySql = "select distinct(Country)  from smartgrid.t_polmaster where Country!=' ' ";
String StateSql = "select distinct(State)  from smartgrid.t_polmaster where State!=' ' ";
String CitySql = "select distinct(City)  from smartgrid.t_polmaster where City!=' ' ";
String CategorySql = "select distinct(Category)  from smartgrid.t_polmaster where Category!=' ' ";
String ContentSql = "select distinct(originalmedianame) from smartgrid.t_globalmediamaster";
String CampaignSql = "select distinct(CampaignName) from smartgrid.CampaignMaster"; /*  where EntryBy ="+session.getAttribute("username")+"  */
String City="";

/* SQL Queries Ends Here  */

%>
<!-- Main navbar -->
<div class="navbar navbar-default navbar-fixed-top header-highlight">
  <div class="navbar-header"> <a class="navbar-brand" href="index.jsp"><img src="assets/images/logo_light.png" alt=""></a>
    <ul class="nav navbar-nav pull-right visible-xs-block">
      <li><a data-toggle="collapse" data-target="#navbar-mobile"><i class="icon-tree5"></i></a></li>
      <li><a class="sidebar-mobile-main-toggle"><i class="icon-paragraph-justify3"></i></a></li>
    </ul>
  </div>
  <div class="navbar-collapse collapse" id="navbar-mobile">

     <ul class="nav navbar-right top-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="glyphicon glyphicon-user"></i> My Account(<%=session.getAttribute("username")%>)<b class="caret"></b></a>
                    <ul class="dropdown-menu">
                       <li>
                            <a href="MyCart.jsp"><i class="glyphicon glyphicon-shopping-cart"></i> My Cart</a>
                        </li>
                        <li>
                            <a href="logout.jsp"><i class="glyphicon glyphicon-off"></i> Log Out</a>
                        </li>
                    </ul>
                </li>
            </ul>
  </div>
</div>
<!-- /main navbar --> 

<!-- Page container -->
<div class="page-container"> 
  
  <!-- Page content -->
  <div class="page-content"> 

    <!-- /main sidebar --> 
    
    <!-- Main content -->
    <div class="content-wrapper"> 
      
      <!-- Page header -->
      <div class="page-header page-header-default">
        <div class="breadcrumb-line">
          <ul class="breadcrumb">
            <li><a href="Home.jsp"><i class="icon-home2 position-left"></i> Home &nbsp;</a> <a href="MakeCampaign.jsp"> <i class="glyphicon glyphicon-folder-open position-left"></i>Make Campaign &nbsp;</a> <i class="icon-home2 position-left"></i> View Campaign &nbsp;</li>
          </ul>
          
        </div>
      </div>
      <!-- /page header --> 
      
      <!-- Content area -->
      <div class="content"> 
        
     
        <!-- Grid -->
  <div class="content-wrapper"> 
       
<form action="CheckAvailability.jsp" method="post" > 
     <div class="row">
          <!-- User profile -->
              
              <div class="col-lg-12" id="MainCampaign">
              <div class="tabbable">
                <div class="tab-content">
                  
                  	
                  <div class="tab-pane fade in active" id="settings"> 
                    
                    <!-- Profile info -->
                    <div class="panel panel-flat">
                       
                      <div class="panel-body" >
                  
                          <div class="form-group">
                            <div class="row">
                              <input type="hidden" name="entryby" id="entryby" value="<%=session.getAttribute("username") %>" readonly="readonly"/>  
                              
                              <div class="col-md-3">
                                <label>Select Campaign </label>
                             
                               <select class="select" id="selContent" name="Campaign_Name" style='width: 200px;' required="required" onchange="searchSuggest(this.value);">
        
                                  <option  id="Campaign_Name" value="ABC" selected="selected">Select</option>
                                  <% 
                                  rs = st.executeQuery(CampaignSql);
                                  while(rs.next()){
                                	String Campaign_Name = rs.getString("CampaignName");  
                                	//City = rs.getString("City");
                                  
                                  %>
                                   <option id="Campaign_Name" value="<%=Campaign_Name%>"><%=Campaign_Name%></option>
                                   
 								<%} %>
                                 
                                </select>     </div>
 
                           <div class="col-md-3">
                                <label>Frequency </label>
                               <div id="frequency"> <input type="text" readonly="readonly" name="frequency" id="frequency" ></div>
                              </div>
                            
                             <div class="col-md-3">
                                <label>Media </label>
                               <div id="media"> <input type="text" readonly="readonly" name="media" id="media" ></div>
                             </div>
                              
                               <div class="col-md-3">
                                <label>City </label>
                               <div id="city"> <input type="text" readonly="readonly" name="city" id="city" ></div>
                              </div>
                          </div>
                            
                          </div>
                          <div class="form-group">
                            <div class="row">
                            
                             <div class="col-md-3">
                                <label>From Date </label>
                               <div id="fromdate"> <input type="text" readonly="readonly" name="fromdate" id="fromdate" ></div>
                              </div>
                              
                              <div class="col-md-3">
                                <label>To Date </label>
                               <div id="todate"> <input type="text" readonly="readonly" name="todate" id="todate" ></div>
                              </div>
                              
                              <div class="col-md-3">
                                <label>Content Type</label>
                               <div id="contenttype"> <input type="text" readonly="readonly" name="contenttype" id="contenttype" value="" ></div>
                                
                              </div>
                              <div class="col-md-3">
                              
                                <label>Content </label>
                            	 <div id="content"> <input type="text" readonly="readonly" name="content" id="content" ></div>
                            
                              </div>
                            </div>
                            <div class="row">
                            <div class="col-md-3">
                            <label>From Time</label>
          <!--                   <div id="content">
                            <select id="arrival-time-list" onchange="ChangeSecondList(this.options[this.selectedIndex].value)" name="fromtime">
<option value="">Select From time</option>
<option value="00:00">00:00</option>
<option value="00:15">00:15</option>
<option value="00:30">00:30</option>
<option value="00:45">00:45</option>
<option value="01:00">01:00</option>
<option value="01:15">01:15</option>
<option value="01:30">01:30</option>
<option value="01:45">01:45</option>
<option value="02:00">02:00</option>
<option value="02:15">02:15</option>
<option value="02:30">02:30</option>
<option value="02:45">02:45</option>
<option value="03:00">03:00</option>
<option value="03:15">03:15</option>
<option value="03:30">03:30</option>
<option value="03:45">03:45</option>
<option value="04:00">04:00</option>
<option value="04:15">04:15</option>
<option value="04:30">04:30</option>
<option value="04:45">04:45</option>
<option value="05:00">05:00</option>
<option value="05:15">05:15</option>
<option value="05:30">05:30</option>
<option value="05:45">05:45</option>
<option value="06:00">06:00</option>
<option value="06:15">06:15</option>
<option value="06:30">06:30</option>
<option value="06:45">06:45</option>
<option value="07:00">07:00</option>
<option value="00:15">08:15</option>
<option value="00:30">08:30</option>
<option value="00:45">08:45</option>
<option value="09:00">09:00</option>
<option value="09:15">09:15</option>
<option value="09:30">09:30</option>
<option value="09:45">09:45</option>
<option value="10:00">10:00</option>
<option value="10:15">10:15</option>
<option value="10:30">10:30</option>
<option value="10:45">10:45</option>
<option value="11:00">11:00</option>
<option value="11:15">11:15</option>
<option value="11:30">11:30</option>
<option value="11:45">11:45</option>
<option value="12:00">12:00</option>
<option value="12:15">12:15</option>
<option value="12:30">12:30</option>
<option value="12:45">12:45</option>
<option value="11:00">13:00</option>
<option value="11:15">13:15</option>
<option value="11:30">13:30</option>
<option value="11:45">13:45</option>
<option value="12:00">14:00</option>
<option value="12:15">14:15</option>
<option value="12:30">14:30</option>
<option value="12:45">14:45</option>
<option value="12:00">15:00</option>
<option value="12:15">15:15</option>
<option value="12:30">15:30</option>
<option value="12:45">15:45</option>
<option value="11:00">16:00</option>
<option value="11:15">16:15</option>
<option value="11:30">16:30</option>
<option value="11:45">16:45</option>
<option value="12:00">17:00</option>
<option value="12:15">17:15</option>
<option value="12:30">17:30</option>
<option value="12:45">17:45</option>
<option value="12:00">18:00</option>
<option value="12:15">18:15</option>
<option value="12:30">18:30</option>
<option value="12:45">18:45</option>
<option value="12:00">19:00</option>
<option value="12:15">19:15</option>
<option value="12:30">19:30</option>
<option value="12:45">19:45</option>
<option value="11:00">20:00</option>
<option value="11:15">20:15</option>
<option value="11:30">20:30</option>
<option value="11:45">20:45</option>
<option value="12:00">21:00</option>
<option value="12:15">21:15</option>
<option value="12:30">21:30</option>
<option value="12:45">21:45</option>
<option value="11:00">22:00</option>
<option value="11:15">22:15</option>
<option value="11:30">22:30</option>
<option value="11:45">22:45</option>
<option value="12:00">23:00</option>
<option value="12:15">23:15</option>
<option value="12:30">23:30</option>
<option value="12:45">23:45</option>
<option value="12:45">24:00</option>
</select>
                            </div> -->
                            

                            
                            
					<div class="clearfix">
						<div class="input-group clockpicker pull-center" data-placement="right" data-align="top" data-autoclose="true">
							<input type="text" class="form-control" name="fromtime" id="fromtime" required="required">
							<span class="input-group-addon">
							<span class="glyphicon glyphicon-time"></span>
							</span>
						</div>
					</div>

                             
                              <!-- <input type="text" name="fromtime" id="fromtime" required="required">
                                 -->
                            </div>
                            <div class="col-md-3">
                            <label>To Time</label>
                             
                 <!--    <div id="static-list-div" style="display:block;">
<select>
<option>&#8679; Select an arrival time</option>
<option>&#8679; from the above dropdown.</option>
</select>
</div>

<div id="dynamic-list-div" style="display:none;">
<select id="dynamic-list" name="totime">
<option value=""></option>
</select>
</div> -->

                    
                                      
					<div class="clearfix">
						<div class="input-group clockpicker pull-center" data-placement="right" data-align="top" data-autoclose="true">
							<input type="text" class="form-control" name="totime" id="totime" required="required">
							<span class="input-group-addon">
							<span class="glyphicon glyphicon-time"></span>
							</span>
						</div>
					</div>
                              
                             
                            </div>
                          
                             <div class="col-md-3">
                                <label>Duration (Seconds)</label>
                                
                               <div id="duration"> <input type="text" name="duration" id="duration" ></div>
                                
                              </div> 
                              
                         <!--      <div class="col-md-3">
                                <label></label>
                                
                               <div id="submit"> <button type="submit" class="btn btn-primary">View Location's  <i class="icon-arrow-right14 position-right"></i></button>
                        </div>
                                
                              </div>  -->
                             
                            </div>
                          </div>       
      
                      </div>
                      
                    </div>
                    <!-- /profile info --> 
                    
                    <!-- Account settings -->
                    
                    <!-- /account settings --> 
                    
                  </div>
                </div>
              </div>
               </div>
               
              <div class="col-lg-12"  >
                  
                  	
                  <div class="tab-pane fade in active" id="settings" > 
                    
                    <!-- Profile info -->
                    <div class="panel panel-flat">
                       <div class="panel-heading" role="tab" id="headingmycampaign">
     					 <h4 class="panel-title">
     					   <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#mycampaign" aria-expanded="false" aria-controls="mycampaign">
     					   <i class="icon-home2 position-center"></i> Location Details
     					   </a>
     					 </h4>
     				
    					</div>
                      <br>
                      <div class="panel-body"  >
               
               <table id="example" class="cell-border" style="width:100%; border: 1px; border-color: black;"  cellspacing="0" >
        <thead>
            <tr>
            	<!-- <th style="font-size: 16px;">RequesterId</th> -->
            	<th style="font-size: 14px ; face:san-serif;width: 5px;" ><div class="pretty p-default">
       				 <input type="checkbox"  id="checkAll"  />
       				
        			<div class="state p-success">
         			   <label><b>Select All</b></label>
       				 </div>
    			</div></th>
            	<th style="font-size: 14px ; face:san-serif;width: auto;"><b>ID</b></th>
            	<th style="font-size: 14px ; face:san-serif;"><b>MediaType</b></th>
                <th style="font-size: 14px ; face:san-serif;"><b>Lacality</b></th>
                <th style="font-size: 14px ; face:san-serif;"><b>Landmark</b></th>
                <th style="font-size: 14px ; face:san-serif;"><b>Map Location</b></th>
                <th style="font-size: 14px ; face:san-serif;"><b>Rate</b></th>
                
                
                
                
                
                    
            </tr>
        </thead>
        <tbody>
      <%  
      int ID =0;
      int RequestID =0;
      String MediaType = "";
      String Address = "";
      String Locality= "";
      String RequesterMobileNo = "";
      String EmailId = "";
      String RequesterGender = "";
      String RequesterAge="";
      String PickupDateTime="";
      String PickupLocation="";
      String DropDateTime="";
      String DropLocation="";
      String Status = "";
      String EntryBy = "";
      String EntryDateTime = "";
      String Deviceid="";
     
	  
	  String sql="select * from smartgrid.t_polmaster where City='Pune'"; /* "+City+" */

	  System.out.println("Query is : "+sql);
	  rs = st.executeQuery(sql);

      int i=1;
      while(rs.next()){
    	  ID= rs.getInt("Deviceid");
    	  MediaType=rs.getString("Category");
    	  Address=rs.getString("Originroute");
    	  Deviceid=rs.getString("Deviceid");
    	 // City=rs.getString("City");
    	  
    	  if(Address.contains(" ") ){
    		  Locality=Address+","+City;
    	  }
    	  else{
    		  Locality=Address+City;
    	  }
    	  
    	  
    	  //String dateformated1=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(PickupDateTime));
    	  
    	  
    	  
	  
%>   	
			<tr>		
			<td><div class="pretty p-default">
       				 <input type="checkbox" class="PoleID"  id="PoleID" name="PoleID" value="<%=ID%>" />
       				
        			<div class="state p-success">
         			   <label></label>
       				 </div>
    			</div></td>          
			<td style="font-size: 13px; face:san-serif; color:black" ><%=ID%></td>
			<td style="font-size: 13px; face:san-serif; color:black"><%=MediaType%></td>
            <td style="font-size: 13px; face:san-serif; color:black"><%=Locality %></td>
            <td style="font-size: 13px; face:san-serif; color:black"> - </td>
            <td style="face:san-serif; color:black; width:5px; height:20;">
            <input type="hidden" id="location" name="location" value="<%=Locality%>">
             <input type="hidden" id="Deviceid" name="Deviceid" value="<%=Deviceid%>">
            <div class="w3-container">
  
	<a><img height="25" width="20" onclick="document.getElementById('id01').style.display='block'" src="assets/images/location.png"></a>
  <div id="id01" class="w3-modal" >
    <div class="w3-modal-content w3-animate-zoom w3-card-4" style="height: 50; width: 50">
      <header class="w3-container w3-teal"> 
        <span onclick="document.getElementById('id01').style.display='none'" 
        class="w3-button w3-display-topright">&times;</span>
        <h2>Location on Map</h2>
      </header>
      <div class="w3-container">
        
      </div>
      <footer class="w3-container w3-teal">
       

      </footer>
    </div>
  </div>
</div>
            <!-- <a href="#OpenModel"> <img height="25" width="25" src="images/location.png"></a> --> </td>
             
             <td style="font-size: 13px; face:san-serif; color:black">5000 </td> 
               <%--   <td style="font-size: 13px; face:san-serif; color:black"><%=rs.getString("EmailId") %></td>
                <td style="font-size: 13px; face:san-serif; color:black"><%=rs.getString("RequesterAddress") %></td> --%>

                
                <%-- <td style="font-size: 15px;"><%=EntryDateTime %></td> --%> 
               
                
            </tr>
               
               
                  <%
                /*   i++;    */         
      } 
                  
                 
                  %>     
            
        </tbody>
      
    </table>
       </div>
                   
                    </div>
                    <!-- /profile info --> 
                    
                    <!-- Account settings -->
                    
                    <!-- /account settings --> 
                    
                  </div>
                </div>
              
              
           
            
            

      
            
   


              
              <!-- panel-group -->
	
              
            </div>
            
                             
        <div class="fixed">
			<input id="checkAvail" type="image" src="assets/images/LogoOk.jpeg" alt="Submit" width="80" height="80"  >
			<span class="tooltiptext">Check Avilability</span>
		</div>   
		  
                      </form>
            
            <div class="row">
            <div class="col-lg-3">
            </div>
            
            
            <div class="col-lg-9">
              <div class="tabbable">
                
              </div>
            </div>
            
            
            </div>
            
          </div>
          <!-- /user profile --> 
          
     
     
        </div>
        <!-- /grid --> 
        
        <!-- Footer -->
        <jsp:useBean id="date" class="java.util.Date" />
        <div class="footer text-muted"> <a href="#">Privacy Policy</a> | <a href="#">Terms </a> | <a href="#">Send feedback</a> |
          &copy; <%= new java.text.SimpleDateFormat("yyyy").format(new java.util.Date()) %> <a href="#" target="_blank">SmartGridInfra LLP</a> </div>
        <!-- /footer --> 
        
      </div>
      <!-- /content area --> 
      
    </div>
    <!-- /main content --> 
    
  </div>
  <!-- /page content --> 
  

<!-- /page container -->




<script type="text/javascript" src="assets/js/bootstrap-clockpicker.min.js"></script>
<!-- 
<script type="text/javascript">
$(document).ready(function() {
    $('.display tr').click(function(event) {
        if (event.target.type !== 'checkbox') {
            $(':checkbox', this).trigger('click');
        }
    });
});

</script>
 -->
 
<!--   <script type="text/javascript">
  
    $(document).ready(function() {
        $("#checkAvail").click(function(){
            var PoleID = [];
            $.each($("input[name='PoleID']:checked"), function(){            
            	PoleID.push($(this).val());
            });
           // PoleID=PoleID.join(", ");
           // alert("Locations are: " + PoleID.join(", "));
           alert(PoleID);
           
           document.getElementById("PoleID").innerHTML = PoleID;
           //document.getElementById("PoleID").value = PoleID;
            //return PoleID;
        });
    });

</script> -->
 
 <script type="text/javascript">
    $('#selContent').change(function(event) {
        $('#update').html('This is ' + $('#selContent').val() + ' and other info');
    }); 
</script>
 
 
 <script type="text/javascript">
function ChangeSecondList(value)
{
   if( value.length )
   {
      document.getElementById("static-list-div").style.display = "none";
      document.getElementById("dynamic-list-div").style.display = "block";
      var dropid = document.getElementById("dynamic-list");
      var ta = value.split(":");
      var hour = parseInt(ta[0]);
      var minute = parseInt(ta[1].replace(/\D/g,""));
      var apm = ta[1].replace(/\d/g,"");
      for( var i=0; i<3; i++ )
      {
         minute += 30;
         if( minute > 59 )
         {
            hour++;
            minute -= 60;
            if( hour > 11 )
            {
               apm = apm.replace(/a/,'p');
               apm = apm.replace(/A/,'P');
            }
         }
         //apm = "";
         if( hour > 12 ) { hour -= 12; }
         if( minute < 10 ) { minute = "0"+minute; }
         if( hour < 10 ) { hour = "0"+hour; }
         var valuetext = hour + ":" + minute + apm;
         dropid.options[i].text = valuetext;
         dropid.options[i].value = valuetext;
         minute = parseInt(minute);
      }
      dropid.options[0].selected = true;
   }
   else
   {
      document.getElementById("static-list-div").style.display = "block";
      document.getElementById("dynamic-list-div").style.display = "none";
   }
}

ChangeSecondList(document.getElementById("arrival-time-list").options[document.getElementById("arrival-time-list").selectedIndex].value);
</script>

 
 
<script type="text/javascript">
$(document).ready(function () {
    $('#checkAvail').click(function() {
      checked = $("input[type=checkbox]:checked").length;

      if(!checked) {
        alert("You must check at least one Location.");
        return false;
      }

    });
});

</script> 
 
<script type="text/javascript">
$('.clockpicker').clockpicker()
	.find('input').change(function(){
		console.log(this.value);
	});
var input = $('#single-input').clockpicker({
	placement: 'bottom',
	align: 'right',
	autoclose: true,
	'default': 'now'
});

$('.clockpicker-with-callbacks').clockpicker({
		donetext: 'Done',
		init: function() { 
			console.log("colorpicker initiated");
		},
		beforeShow: function() {
			console.log("before show");
		},
		afterShow: function() {
			console.log("after show");
		},
		beforeHide: function() {
			console.log("before hide");
		},
		afterHide: function() {
			console.log("after hide");
		},
		beforeHourSelect: function() {
			console.log("before hour selected");
		},
		afterHourSelect: function() {
			console.log("after hour selected");
		},
		beforeDone: function() {
			console.log("before done");
		},
		afterDone: function() {
			console.log("after done");
		}
	})
	.find('input').change(function(){
		console.log(this.value);
	});

// Manually toggle to the minutes view
$('#check-minutes').click(function(e){
	// Have to stop propagation here
	e.stopPropagation();
	input.clockpicker('show')
			.clockpicker('toggleView', 'minutes');
});
if (/mobile/i.test(navigator.userAgent)) {
	$('input').prop('readOnly', true);
}
</script>
<script type="text/javascript" src="assets/js/highlight.min.js"></script>
<script type="text/javascript">
hljs.configure({tabReplace: '    '});
hljs.initHighlightingOnLoad();
</script>
<!-- container -->
     <script type="text/javascript">  
       var xmlHttp1 ;  
       function searchSuggest(str)  
       {  
         if (typeof XMLHttpRequest != "undefined")  
         {  
           xmlHttp1= new XMLHttpRequest();  
         }  
         else if (window.ActiveXObject)  
         {  
           xmlHttp1= new ActiveXObject("Microsoft.XMLHTTP");  
         }  
         if (xmlHttp1==null)  
         {  
           alert ("Browser does not support XMLHTTP Request");  
           return  
         }  
         var url="Search.jsp";  
         url += "?Search=" +str;  
         xmlHttp1.onreadystatechange = stateChange1;  
         xmlHttp1.open("GET", url, true);  
         xmlHttp1.send();  
       }  
       function stateChange1()  
       {  
         if (xmlHttp1.readyState==4 || xmlHttp1.readyState=="complete")  
         {  
           var strResponse=xmlHttp1.responseText;  
           if (strResponse != "")  
           {  
             //Split response into array  
             var arrResponse = strResponse.split("brk");  
             var arrLen = arrResponse.length;  
             for(i=0;i<arrLen;i++)  
             {  
               document.getElementById("frequency").innerHTML=arrResponse[0];  
               document.getElementById("media").innerHTML=arrResponse[1];
               document.getElementById("fromdate").innerHTML=arrResponse[2];  
               document.getElementById("todate").innerHTML=arrResponse[3];
               document.getElementById("contenttype").innerHTML=arrResponse[4];
               document.getElementById("content").innerHTML=arrResponse[5];
               document.getElementById("city").innerHTML=arrResponse[6];
               
             }  
           }  
         }  
       }  
     </script>  
<script type="text/javascript">
$(function(){
    var dtToday = new Date();
    
    var month = dtToday.getMonth() + 1;
    var day = dtToday.getDate();
    var year = dtToday.getFullYear();
    if(month < 10)
        month = '0' + month.toString();
    if(day < 10)
        day = '0' + day.toString();
    
    var maxDate = year + '-' + month + '-' + day;
   
    $('#FromDate').attr('min', maxDate);
    $('#ToDate').attr('min', maxDate);
    
});
</script>
<script type="text/javascript">

$("#country").click(function(e) {
	  e.preventDefault();
	  $('#Country').click(function(e) {
	    e.stopPropagation();
	  })
	  $("#Country").prop("checked", !$("#Country").prop("checked"));
	})

</script>
<script type="text/javascript">

var sections = $('.sectionContent');
function updateContentVisibility(){
    var checked = $("#filterControls :checkbox:checked");
    if(checked.length){
        sections.hide();
        checked.each(function(){
            $("." + $(this).val()).show();
        });
    } else {
        sections.show();
    }
}

$("#filterControls :checkbox").click(updateContentVisibility);
updateContentVisibility();


</script>

<script type="text/javascript">
$(document).ready(function(){
    // Initialize select2	
    $("#selContent").select2();
});
</script>

<script type="text/javascript">

function myCountry() {
    var input, filter, ul, li, a, i;
    input = document.getElementById("myCountry");
    filter = input.value.toUpperCase();
    ul = document.getElementById("myULCountry");
    li = ul.getElementsByTagName("li");
    for (i = 0; i < li.length; i++) {
        a = li[i].getElementsByTagName("a")[0];
        if (a.innerHTML.toUpperCase().indexOf(filter) > -1) {
            li[i].style.display = "";
        } else {
            li[i].style.display = "none";

        }
    }
}

function myState() {
    var input, filter, ul, li, a, i;
    input = document.getElementById("myState");
    filter = input.value.toUpperCase();
    ul = document.getElementById("myULState");
    li = ul.getElementsByTagName("li");
    for (i = 0; i < li.length; i++) {
        a = li[i].getElementsByTagName("a")[0];
        if (a.innerHTML.toUpperCase().indexOf(filter) > -1) {
            li[i].style.display = "";
        } else {
            li[i].style.display = "none";

        }
    }
}

function myCity() {
    var input, filter, ul, li, a, i;
    input = document.getElementById("myCity");
    filter = input.value.toUpperCase();
    ul = document.getElementById("myULCity");
    li = ul.getElementsByTagName("li");
    for (i = 0; i < li.length; i++) {
        a = li[i].getElementsByTagName("a")[0];
        if (a.innerHTML.toUpperCase().indexOf(filter) > -1) {
            li[i].style.display = "";
        } else {
            li[i].style.display = "none";

        }
    }
}

</script>
<script>
$('a[data-toggle="collapse"]').on('click',function(){
	  var id=$(this).attr('href');
	  if($(id).hasClass('in'))
	  {
	    $(id).collapse('hide');
	  }
	  
	  else{
	    $(id).collapse('show');
	  }
	});

	$('#collapse-init').on('click',function(){
	  $('#collapse-init').toggleClass('active');  
	  
	  if ($('#collapse-init').hasClass('active')) {
	    $('a[data-toggle="collapse"]').each(function(){
	      	var id=$(this).attr('href');
	    	$(id).collapse('show');
	    });
	  }
	  else {
	  	$('a[data-toggle="collapse"]').each(function(){
	        var id=$(this).attr('href');
	    	$(id).collapse('hide');
	    });
	  }

	});
</script>


</body>
</html>
