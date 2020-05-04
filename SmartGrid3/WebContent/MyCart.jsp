<!DOCTYPE html>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page import="java.sql.*,java.util.*" %>
 <%@page import="java.sql.Date"%>
<%@ include file="Conn.jsp"%>
<%@ page import="java.text.*" %>

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
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

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
<jsp:useBean id="date" class="java.util.Date" />
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
/* SQL Queries Ends Here  */

String FromSlot=request.getParameter("FromSlot");
String ToSlot=request.getParameter("ToSlot");
String PoleID=request.getParameter("POLE");
String CampDate=request.getParameter("CampDate");

String Media=request.getParameter("Media");
String EntryBy=request.getParameter("EntryBy");
String ContentType=request.getParameter("ContentType");
String Time=request.getParameter("Time");
String Duration=request.getParameter("Duration");
String Deviceid=request.getParameter("Deviceid");
//String content="2018-02-06_16_30_40ankitasafty3.jpg";
String content=request.getParameter("content");
//String VehCode="11448";
//VehCode=request.getParameter("VehCode");


SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");  
String CampDateNew= formatter.format(date);  
System.out.println(CampDateNew); 

String typevalue=session.getAttribute("typevalue").toString();
String username=session.getAttribute("username").toString();
String Price = "1200";


System.out.println("Type Value: "+typevalue);
System.out.println("User Name: "+username);
System.out.println("FromSlot:- "+FromSlot);
System.out.println("ToSlot:- "+ToSlot);
System.out.println("PoleID:- "+PoleID);
System.out.println("CampDate:- "+CampDate);
System.out.println("ContentType:- "+ContentType);
System.out.println("Deviceid:- "+Deviceid);
System.out.println("content:- "+content);

try{
	String selectUnitID="select unitid from db_gps.t_vehicledetails where ";
}
catch(Exception e){
	e.printStackTrace();
}

/* try{
	
	String UpdateSlotStatusSql="update smartgrid.PID_11030_26May2018 set Status='Booked' where SlotValue >= '"+FromSlot+"' and SlotValue <= '"+ToSlot+"'";
		System.out.println("UpdateSlotStatusSql Query :- "+UpdateSlotStatusSql);
		st = con1.createStatement();
		int i = st.executeUpdate(UpdateSlotStatusSql); 
	
}
catch(Exception e){
	e.printStackTrace();
} */


try{
	
	String InsertCartSql = "insert into smartgrid.mediamaster (Date,time,medianame,mediatype,Poleid,EntryBy,duration,Deviceid) values ('"+CampDateNew+"','"+Time+"','"+content+"','"+ContentType+"','"+PoleID+"','"+EntryBy+"','"+Duration+"','"+Deviceid+"')";
System.out.println("InsertCartSql Query :- "+InsertCartSql);
	st = con1.createStatement();
	int i = st.executeUpdate(InsertCartSql); 
	
}
catch(Exception e){
	e.printStackTrace();
}

try{
	
	String InsertCartSql = "insert into smartgrid.CartMaster (SlotID,BookedBy,Date,Price,EntryBy) values ('"+PoleID+"','"+username+"','"+CampDateNew+"','"+Price+"','"+username+"')";
System.out.println("InsertCartSql Query :- "+InsertCartSql);
	st = con1.createStatement();
	int i = st.executeUpdate(InsertCartSql); 
	
}
catch(Exception e){
	e.printStackTrace();
}

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
        <div class="page-header-content">
         
        </div>
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
  <div > 
          
         
			
     <div class="row">
          <!-- User profile -->
              
              <div class="col-lg-12" id="MainCampaign">
              <div class="tabbable">
                <div class="tab-content">
                  
                  	
                  <div class="tab-pane fade in active" id="settings"> 
                    
                    <!-- Profile info -->
                    <div class="panel panel-flat">
                       <div class="panel-heading" role="tab" id="headingmycampaign">
     					 <h4 class="panel-title">
     					   <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#mycampaign" aria-expanded="false" aria-controls="mycampaign">
     					   <i class="icon-home2 position-center"></i> My Cart
     					   </a>
     					 </h4>
    					</div>
                      <br>
                      <div class="panel-body" >
                    <!--     <form action="MakeCampaign" method="post" > -->
                          
                     <%
                     
                     
                     %>     
                          
                          
                       
                          <div class="form-group">
                            <div class="row">
                             <h3 align="center"><b> Your Cart is Empty </b></h3>
                          </div>             
                            
                          </div>
                          
                          <div class="form-group">
                            <div class="row">
                            
                            
                            
                            </div>
                          </div>       
                          <div class="text-right">
                            <button type="submit" class="btn btn-primary">Make Payment <i class="glyphicon glyphicon-credit-card position-right"></i></button>
                          </div>
                       <!--  </form> -->
                      </div>
                    </div>
                    <!-- /profile info --> 
                    
                    <!-- Account settings -->
                    
                    <!-- /account settings --> 
                    
                  </div>
                </div>
              </div>
               </div>
               
              <div class="col-lg-12">
                  
                  	
                  <div class="tab-pane fade in active" id="settings"> 
                    
                    <!-- Profile info -->
                    <div class="panel panel-flat">
                       <div class="panel-heading" role="tab" id="headingmycampaign">
     					 <h4 class="panel-title">
     					   <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#mycampaign" aria-expanded="false" aria-controls="mycampaign">
     					  
     					   </a>
     					 </h4>
     					
    					</div>
                      <br>
                      <div class="panel-body" >
               
                       
                       
                      </div>
                    </div>
                    <!-- /profile info --> 
                    
                    <!-- Account settings -->
                    
                    <!-- /account settings --> 
                    
                  </div>
                </div>
              
              
           
            
            
            
   


              
              <!-- panel-group -->
	
              
            </div>
            
            
          </div>
          <!-- /user profile --> 
          
     
     
        </div>
        <!-- /grid --> 
        
        <!-- Footer -->
      
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

/* var sections = $('.images_1_of_4');
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
updateContentVisibility(); */
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
