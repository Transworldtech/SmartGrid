<!DOCTYPE html>
<%@page import="javax.mail.Flags.Flag"%>
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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style type="text/css">
.footer text-muted{
color: black;
}
 .line{
width: 1120px;
height: 25px;
border-bottom: 2px solid black;
position: absolute;
}
</style>
 <script type="text/javascript">
 $(document).ready(function() {
	    $('table.cell-border').DataTable( {
	    /* 	"pagingType": "full_numbers", */
	    	"searching": false,
 	    	"bPaginate": false, 
    	    "bLengthChange": false,
    	    "bInfo": false,
    	    "bAutoWidth": false
	    } );
	} );

</script>

<script>
function Redirect()
{
	swal("Plan Created Successfully", "", "success");
	//alert("Plan Created Successfully");
    window.location="MyCart.jsp";
	
}
</script>

<script type="text/javascript">
$(document).ready(function() {
	 $("#checkAll").click(function () {
	     $('input:checkbox').not(this).prop('checked', this.checked);
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
<jsp:useBean id="date" class="java.util.Date" />
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
            <li><a href="home.jsp"><i class="icon-home2 position-left"></i> Home &nbsp;</a> <a href="MakeCampaign.jsp"> <i class="glyphicon glyphicon-folder-open position-left"></i>Make Campaign &nbsp;</a> <i class="icon-home2 position-left"></i> View Campaign &nbsp;</li>
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
                    <div class="panel panel-flat" style="background-color: #f2f2f2">
                    <form action="MyCart.jsp" method="post">
                       <div class="panel-heading" role="tab" id="headingmycampaign">
     					 <h4 class="panel-title">
     					   <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#mycampaign" aria-expanded="false" aria-controls="mycampaign">
     					   <i class="icon-home2 position-center"></i> My Availability
     					   </a>
     					 </h4>
    					</div>
                      <br>
                     
<%

Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);


 
DateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
String CurrentDate = dateformat.format(date);


String typevalue=session.getAttribute("typevalue").toString();
String username=session.getAttribute("username").toString();
System.out.println("Type Value: "+typevalue);
System.out.println("User Name: "+username);

String CampaignName= request.getParameter("Campaign_Name");
String Location= request.getParameter("location");
String Frequency= request.getParameter("frequency");
String Media= request.getParameter("media");

String City= request.getParameter("city");
String FromDate= request.getParameter("fromdate");
String ToDate= request.getParameter("todate");
String ContentType= request.getParameter("contenttype");
String Content= request.getParameter("content");
String FromTime= request.getParameter("fromtime");
String ToTime= request.getParameter("totime");
String VehCode= request.getParameter("VehCode");
String Deviceid= request.getParameter("Deviceid");
String content= request.getParameter("content");

//String Duration = request.getParameter("duration");
int Duration = Integer.parseInt(request.getParameter("duration"));
FromTime=FromTime+":00";
ToTime=ToTime+":00";

/* Session values  */

String EntryBy = request.getParameter("entryby");

/* Session Values Ends  */

System.out.println("Campaign Name :- "+CampaignName);
System.out.println("Location :- "+Location);
System.out.println("Frequency :- "+Frequency);
System.out.println("Media :- "+Media);
System.out.println("City :- "+City);
System.out.println("FromDate :- "+FromDate);
System.out.println("ToDate :- "+ToDate);
System.out.println("ContentType :- "+ContentType);
System.out.println("Content :- "+Content);
System.out.println("FromTime :- "+FromTime);
System.out.println("ToTime :- "+ToTime);
System.out.println("Duration :- "+Duration);
System.out.println("Deviceid :- "+Deviceid);
/* 
for(int i=0; i<PoleID.length; i++){
	  System.out.println("PoleID : " + PoleID[i]);
	  } */
/* 

String PoleID = request.getParameter("PoleID");
	  System.out.println("Pole ID :-"+PoleID);
	  
 */
 String[] ids=request.getParameterValues("PoleID");
System.out.println("Poles ID's : "+ids);
// this will get array of values of all checked checkboxes
for(String PoleID:ids){


 
System.out.println("Poles  : "+PoleID);


try{
	st = con1.createStatement();
	
	System.out.println("Statement Created");
	String AvailabilitySql="insert into smartgrid.CheckAvailabilityMaster (CampaignName,Frequency,Media,"
			+ "City,FromDate,ToDate,ContentType,Content,FromTime,ToTime,Duration,PoleID,EntryBy,EntryDateTime) values ('"+CampaignName+"',"
			+ "'"+Frequency+"','"+Media+"','"+City+"','"+FromDate+"','"+ToDate+"',"
					+ "'"+ContentType+"','"+Content+"','"+FromTime+"','"+ToTime+"','"+Duration+"','"+PoleID+"','"+EntryBy+"','"+CurrentDate+"')";

	
	System.out.println("Query is :"+AvailabilitySql);
	 
	//int i = st.executeUpdate(AvailabilitySql); 
	
/* 	if(i>0){
		 out.println("<script type=\"text/javascript\">");
		   out.println("alert('Campaign Added Successfully ');");
		   out.println("location='ViewDetails.jsp';");
		   out.println("</script>");
		
	} */
}
catch (Exception e) {
	// TODO: handle exception
}

	  
	  
/* Check Availability Calculations */	  
	  
/* Check Availability Calculations ends*/	  
%> 

                          <%if(FromDate==null){ %>
                          <div class="form-group">
                            <div class="row">
                             <h3 align="center" ><b>Please Select Time <a href="ViewDetails.jsp">Select Campaign</a> </b></h3>
                          </div>
                          </div>
                          
                          <%}else{ %>
                          
                           <div class="form-group">
                            <div class="row">
                             <h3 align="center" ><b>Slot Availability For <%-- <%=Location%> , <%=City%>--%> Your Time From <%=FromTime %> To <%=ToTime %>  </b></h3>
                          </div>
                          
							
							<%
							String SlotValue;
					

						
 
							  SimpleDateFormat formatter = new SimpleDateFormat("ddMMMyyyy");  
						      String strDate= formatter.format(date);  
						      System.out.println(strDate); 
							
							try {
									Class.forName(MM_dbConn_DRIVER);
							con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

								
							%>
							
<table id="" class="cell-border" style="width:100%; border: 1px; border-color: black;"  cellspacing="0" >
        <thead>
            <tr>
            	<!-- <th style="font-size: 16px;">RequesterId</th> -->
            	<th style="font-size: 14px ; face:san-serif;width: 5px;" ><div class="pretty p-default">
       				 <input type="checkbox"  id="checkAll"  />
       				
        			<div class="state p-success">
         			   <label><b>Select All</b></label>
       				 </div>
    			</div></th>
            	<th style="font-size: 14px ; face:san-serif;width: auto;"><b>PoleID</b></th>
            	<th style="font-size: 14px ; face:san-serif;width: auto;"><b>Location</b></th>
            	<th style="font-size: 14px ; face:san-serif;width: auto;"><b>Date</b></th>
            	<th style="font-size: 14px ; face:san-serif;"><b>Slot From</b></th>
                <th style="font-size: 14px ; face:san-serif;"><b>Slot To</b></th>
               
                
                
                
                    
            </tr>
        </thead>
        <tbody>
      <%  
      int ID =0;

      String Status = "";
    String Slot="";
      String EntryDateTime = "";
      String RequiredSlot = "";
      int Count ;
      
      String MinSlotValueSql="select slottime from smartgrid.t_MinimunSlotTime ";
	 System.out.println("Query is : "+MinSlotValueSql);
	int SlotDuration=0;
	  rs = st.executeQuery(MinSlotValueSql);
	  while(rs.next()){
		 
			
		  SlotDuration=rs.getInt("slottime");
				
			System.out.println(SlotDuration);
	  }
      Count = (Duration/SlotDuration);
      System.out.println("Count:- "+Count);
      long CountValue = Math.round(Count);
      System.out.println("CountValue:- "+CountValue); 
      
	 /* Calculation For From Time   */ 
	 
      String HRSFrom=FromTime.substring(0,2); 
      String MINFrom=FromTime.substring(3,5); 
      String SECFrom=FromTime.substring(6); 

      System.out.println("HrsFrom:- "+HRSFrom+" MinsTo:- "+MINFrom+" SecondsTo:- "+SECFrom);
      int HRSFromNew = Integer.parseInt(HRSFrom);	
      int MINFromNew = Integer.parseInt(MINFrom);
      int SECFromNew = Integer.parseInt(MINFrom);
      
      int FromSlotID= ((HRSFromNew*3600)+(MINFromNew*60)+(SECFromNew))/SlotDuration;
      
      System.out.println("FromSlotID:- "+FromSlotID);
    
      /* Calculation For To Time   */
      
      String HRSTo=ToTime.substring(0,2); 
      String MINTo=ToTime.substring(3,5);   
      String SECTo=ToTime.substring(6); 
     
      System.out.println("HrsTo:- "+HRSTo+" MinsTo:- "+MINTo+" SecondsTo:- "+SECTo);
     
      int HRSToNew = Integer.parseInt(HRSTo);	
      int MINToNew = Integer.parseInt(MINTo);
      int SECToNew = Integer.parseInt(MINTo);
      
      int ToSlotID= ((HRSToNew*3600)+(MINToNew*60)+(SECToNew))/SlotDuration;
      
      System.out.println("ToSlotID:- "+ToSlotID);
      
 /*      int slotid=0;
      for(slotid = FromSlotID; slotid < ToSlotID; slotid++)
      {
    	  boolean flag = true;
    		for(int i=1; i<6; i++)
    		{
    			  String StatusValue="select * from smartgrid.PID_11030_26May2018 where SlotID BETWEEN '"+FromSlotID+"' and '"+ToSlotID+"'";
    				 System.out.println("Query is : "+StatusValue);
    				
    				  rs = st.executeQuery(StatusValue);
    				  while(rs.next()){
    					 
    						
    					 String SlotStatus=rs.getString("Status");
    							
    						System.out.println(SlotStatus);
    				
    			
    			
    			if(SlotStatus=="Booked")
    			{
    				slotid= FromSlotID+i;
    				flag=false;
    			}
    				  }
    		}
    	  
      }
       */
     
      String FromTimeNew = FromTime.substring(3,5);
      String ToTimeNew = ToTime.substring(3,5);
     
      int resultFromTime = Integer.parseInt(FromTimeNew);	
      int resultToTime = Integer.parseInt(ToTimeNew);
      
      System.out.println("FromTime New :- "+resultFromTime);
      System.out.println("ToTime New :- "+resultToTime);
      
      int fromSlotDurationID= resultFromTime * 60;
      int SlotIDFromNew = fromSlotDurationID/Count;
      System.out.println("SlotId of From Time :- "+SlotIDFromNew);
      
      int toSlotDurationID= resultToTime * 60;
      int SlotIDToNew = toSlotDurationID/Count;
      System.out.println("SlotId of To Time :- "+SlotIDToNew);
      
      
	  //String sql="select * from smartgrid.PID_11030_"+strDate+" where Status='Available' and SlotValue BETWEEN '"+FromTime+"' and '"+ToTime+"' order by SlotValue limit "+CountValue+""; /* "+City+" */
		
	  //String sql="select * from smartgrid.PID_11030_25May2018 where Status='Available' and  SlotValue ="+FromTime+"  order by SlotValue limit "+CountValue+"";
	  
	  //String sql="select CreationDate,SlotID,MIN(SlotValue) as MinSlot, MAX(SlotValue) as MaxSlot from smartgrid.PID_11030_26May2018 where Status='Available' and SlotValue BETWEEN '"+FromTime+"' and '"+ToTime+"' ";
	  
	  
	  
	  //String sql="select * from smartgrid.PID_11030_26May2018 where SlotValue BETWEEN '"+FromTime+"' and '"+ToTime+"' and Status='Available' order by SlotID limit "+CountValue+" ";
	  String SlotDate="";
	  String CampDate="";
	  String Slot2="";
	   
	  for(int j=1;j<=1;j++)
	  {
	  
		  String sql="select * from smartgrid.PID_"+PoleID+"_26May2018 where SlotID >='"+FromSlotID+"' and SlotID <='"+ToSlotID+"' and Status='Available' and VehCode='"+PoleID+"' order by SlotID limit "+CountValue+" ";
		  
		  
	  //String sql="select * from smartgrid.PID_11030_26May2018 where SlotID >='"+FromSlotID+"' and SlotID <='"+ToSlotID+"' and Status='Available' and VehCode='"+Poles[k]+"' order by SlotID limit "+CountValue+" ";
	  
	  
	  System.out.println("Query is : "+sql);
  	  
	  rs = st.executeQuery(sql);
      int i=1;
      String MaxSlot="";
      String MinSlot="";
      String ToCC = "",FieldName="",FieldName1="";
      String FieldName2="",FieldName3="",FieldName4="";
      boolean flag = true;
  	  
      while(rs.next()){  
    			  
    			   SlotDate=rs.getString("CreationDate");
    			   SimpleDateFormat formatter1 = new SimpleDateFormat("dd-MMM-yyyy");  
			       CampDate= formatter1.format(date);  
			      ID= rs.getInt("SlotID");
    	  		  Slot=rs.getString("SlotValue");
    	  
    		
			 String SlotStatus=rs.getString("Status");
	 	     System.out.println("Status:- "+SlotStatus);
				
		
	if(SlotStatus=="Booked")
	{
		ID= FromSlotID+1;
		
		flag=false;
	}
	else
	{
		FieldName1=FieldName1+","+Slot;
		FieldName2=FieldName2+","+ID;
	}
	
    	  String Slot1=Slot.substring(6);
    	  String Slot3=Slot.substring(3);
    	  int slot2=Integer.parseInt(Slot1)+05;
    	  int slot3=Integer.parseInt(MINTo)+1;
    	  
    	  
    	  
    	  //String ac=(String)slot2;
    	  String s=String.valueOf(slot2);  
    	  
    	  
    	  if(slot2<=9){
    		  s="0"+slot2;
    		  
    	  }
     			  	 
    	  
    	  if(slot2==60){
    		  s="00";
    		  Slot3=Slot3+slot3+s;    		  
    	  }
    	  
    	   Slot2=Slot.substring(0, 5)+":"+s;
    	
    	/* 
    	  			MaxSlot=rs.getString("MaxSlot");
    	 			MinSlot=rs.getString("MinSlot"); 
    	  
    	   */
    	  //String dateformated1=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(PickupDateTime));
    	  
    	 
    	  
    	  System.out.println("FieldName :- "+FieldName1);
    	  
  	 }
  	 
  	 if(flag=true)
  	 {
  		FieldName4=FieldName1;
		FieldName3=FieldName2;
		
		String []arr=FieldName4.split(",");
		System.out.println("arr length:-"+arr.length);
		Slot=arr[1];
		Slot2=arr[arr.length-1];
		System.out.println("arr length:-"+arr[1]);
		
		System.out.println("arr length:-"+arr[arr.length-1]);
		
		
		String []arr1=FieldName3.split(",");
		System.out.println("arr length :-"+arr1.length);
		
		System.out.println("arr length :-"+arr1[1]);
		
		System.out.println("arr length :-"+arr1[arr1.length-1]);
  		 
		FromSlotID=ID+1;
  	 }
  	 else
  	 {
  		FromSlotID=ID;
  	 }
  	
  	 
  	 
	  if(MinSlot==null){
		  
		  
 
%>   	

				
                   <%}else{ %>  
		<tr>		
		<td><div class="pretty p-default">
  				 <input type="checkbox" class="PoleID"  id="PoleID" name="PoleID" value="<%=ID%>" />
  				<input type="hidden" id="POLE" name="POLE" value="<%=PoleID%>">
  				<input type="hidden" id="FromSlot" name="FromSlot" value="<%=Slot%>">
  				<input type="hidden" id="ToSlot" name="ToSlot" value="<%=Slot2%>">
  				<input type="hidden" id="CampDate" name="CampDate" value="<%=CampDate%>">
  				<input type="hidden" id="EntryBy" name="EntryBy" value="<%=EntryBy%>">
  				<input type="hidden" id="Media" name="Media" value="<%=Media%>">
  				<input type="hidden" id="ContentType" name="ContentType" value="<%=ContentType%>">
  				<input type="hidden" id="Time" name="Time" value="<%=FromTime%>">
  				<input type="hidden" id="Duration" name="Duration" value="<%=Duration%>">
  				<input type="hidden" id="VehCode" name="VehCode" value="<%=VehCode%>">
  				<input type="hidden" id="Deviceid" name="Deviceid" value="<%=Deviceid%>">
  				<input type="hidden" id="content" name="content" value="<%=content%>">
  			
   			<div class="state p-success">
    			   <label></label>
  				 </div>
			</div></td>          
		<td style="font-size: 13px; face:san-serif; color:black" ><%=PoleID%></td>
		<td style="font-size: 13px; face:san-serif; color:black" ><%=Location%>, <%=City %></td>
		<td style="font-size: 13px; face:san-serif; color:black"><%=CampDate%></td>
		<td style="font-size: 13px; face:san-serif; color:black"><%=Slot%></td>
		<td style="font-size: 13px; face:san-serif; color:black"><%=Slot2%></td>
  
       </tr>
          
          
             <%
           /*   i++;    */         
 } 
		
  	 System.out.println("SlotMin : "+MinSlot);
	  }  
	           %>     
            
        </tbody>
      
    </table>
							
							  <div class="line"></div>
							
                          </div>
                        
                          
                          
                          
                          <%
                      	
								
							
                          
                          
                          } catch(Exception e){
                        	  e.printStackTrace();
                          }
                          }
}
                          %>
                          <div class="form-group">




                          </div>       
                          <div class="text-right">
                            <button type="submit" id="checkAvail" class="btn btn-primary" >Add To Cart <i class="glyphicon glyphicon-shopping-cart position-right"></i></button>
                          </div>
                       </form> 
                      </div>
                    </div>
                    <!-- /profile info --> 
                    
                    <!-- Account settings -->
                    
                    <!-- /account settings --> 
                    
                  </div>
                </div>
              </div>
               </div>
            
            <div class="row">
              <!-- Footer -->
        
        <div class="footer text-muted" > <a href="#">Privacy Policy</a> | <a href="#" >Terms </a> | <a href="#">Send feedback</a> |
          &copy; <%= new java.text.SimpleDateFormat("yyyy").format(new java.util.Date()) %> <a href="#" target="_blank">SmartGridInfra LLP</a> </div>
        <!-- /footer --> 
            
            </div>
               
              <div class="col-lg-12">
                  
                  	
                  <div class="tab-pane fade in active" id="settings"> 
                    
                    <!-- Profile info -->
                 
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
        
      
        
      </div>
      <!-- /content area --> 
      
    </div>
    <!-- /main content --> 
    
  </div>
  <!-- /page content --> 
  
		<!-- <figure class="snip1418"><img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/sample85.jpg" alt="sample85"/>
 					 <div class="add-to-cart"> <i class="ion-android-add"></i><span>Add to Cart</span></div>
  					<figcaption>
   						 <h3>Koregaon Park - Pune   </h3>
   						 <p>Pole</p>
   						 <div class="price">
   						   <s>1000 Rs/Hr</s>900 Rs/Hr.
  						  </div>
 					 </figcaption><a href="#"></a>
					</figure>    -->                      
					
					

<!-- /page container -->

<!-- container -->

 
<script type="text/javascript">
$(document).ready(function () {
    $('#checkAvail').click(function() {
      checked = $("input[type=checkbox]:checked").length;

      if(!checked) {
        alert("Choose Atlest One Slot.");
        return false;
      }

    });
});

</script> 

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
