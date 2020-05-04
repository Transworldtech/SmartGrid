<!DOCTYPE html>
 <%@page import="java.sql.Date"%>
<%@ include file="Conn.jsp"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page import="java.sql.*,java.util.*" %>
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
<script type="text/javascript" src="//cdn.datatables.net/plug-ins/1.10.19/sorting/date-dd-MMM-yyyy.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.4/moment.min.js"></script>
<script type="text/javascript" src="//cdn.datatables.net/plug-ins/1.10.19/sorting/datetime-moment.js"></script>

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
 <jsp:useBean id="date" class="java.util.Date" />

 <script type="text/javascript">
 $(document).ready(function() {
	    $('#example').DataTable( {

	    	"pagingType": "full_numbers",
	        dom: 'Blfrtip',
	        "columnDefs": [
	            { type: 'date-dd-mmm-yyyy', targets: 4 },
	            { type: 'date-dd-mmm-yyyy', targets: 5 }
	          ],
	        buttons: [
	        	
	        	{
	        		extend: 'collection',
	        		
	        		text: 'Export',
	        		buttons: [
	        			{
	                        extend: 'excel',
	                        title: 'Campaign Report of '+$("#username").val(),
	                    },
	                    {
	                        extend: 'pdf',
	                        title: 'Campaign Report of '+$("#username").val(),
	                    },
	                    {
	                        extend: 'csv',
	                        title: 'Campaign Report of '+$("#username").val(),
	                    },
	                    {
	                        extend: 'print',
	                        title: 'Campaign Report of '+$("#username").val(),
	                    },
	                    {
	                        extend: 'copy',
	                        title: 'Campaign Report '+$("#username").val(),
	                    },
	                    
	            				/* 'copy', 'csv', 'excel', 'pdf', 'print' */
	            			]
	        	}
	        ]
	    	
	    } );
	} );

</script>

<script type="text/javascript">

(function () {

var customDateDDMMMYYYYToOrd = function (date) {
	"use strict"; //let's avoid tom-foolery in this function
	// Convert to a number YYYYMMDD which we can use to order
	var dateParts = date.split(/-/);
	return (dateParts[2] * 10000) + ($.inArray(dateParts[1].toUpperCase(), ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"]) * 100) + (dateParts[0]*1);
};

// This will help DataTables magic detect the "dd-MMM-yyyy" format; Unshift
// so that it's the first data type (so it takes priority over existing)
jQuery.fn.dataTableExt.aTypes.unshift(
	function (sData) {
		"use strict"; //let's avoid tom-foolery in this function
		if (/^([0-2]?\d|3[0-1])-(jan|feb|mar|apr|may|jun|jul|aug|sep|oct|nov|dec)-\d{4} /i.test(sData)) {
			return 'date-dd-mmm-yyyy';
		}
		return null;
	}
);

// define the sorts
jQuery.fn.dataTableExt.oSort['date-dd-mmm-yyyy-asc'] = function (a, b) {
	"use strict"; //let's avoid tom-foolery in this function
	var ordA = customDateDDMMMYYYYToOrd(a),
		ordB = customDateDDMMMYYYYToOrd(b);
	return (ordA < ordB) ? -1 : ((ordA > ordB) ? 1 : 0);
};

jQuery.fn.dataTableExt.oSort['date-dd-mmm-yyyy-desc'] = function (a, b) {
	"use strict"; //let's avoid tom-foolery in this function
	var ordA = customDateDDMMMYYYYToOrd(a),
		ordB = customDateDDMMMYYYYToOrd(b);
	return (ordA < ordB) ? 1 : ((ordA > ordB) ? -1 : 0);
};

})();

</script>
<!-- <script type="text/javascript">
$('#example').dataTable( {
    columnDefs: [
      { type: 'date-dd-mmm-yyyy', targets: 0 }
    ]
 } );
</script> -->

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

%>
<!-- Main navbar -->
<div class="navbar navbar-default navbar-fixed-top header-highlight" >
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
            <li><a href="Home.jsp"><i class="icon-home2 position-left"></i> Home &nbsp;</a><i class="glyphicon glyphicon-folder-open position-left"></i>Campaign Report &nbsp;</li>
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
     					   <i class="glyphicon glyphicon-list-alt position-center"></i> Campaign Report
     					   </a>
     					   
     					 </h4>
     					 <div class="breadcrumb-line">
          <ul class="breadcrumb">
            <li><a href="MakeCampaign.jsp">  <i class="glyphicon glyphicon-pencil position-left"></i> Add New Campaign &nbsp;</a></li>
          </ul>
          
        </div>
    					</div>
                      <br>
                      <div class="panel-body" >
             
                       <input type="hidden" id="username" name="username" value="<%=session.getAttribute("username") %>" > 
   <table id="example" class="cell-border" style="width:100%;"  cellspacing="0" >
        <thead>
            <tr>
            	<th style="font-size: 14px ; face:san-serif;"><b>SrNo</b></th>
            	<th style="font-size: 14px ; face:san-serif;"><b>Customer</b></th>
            	<th style="font-size: 14px ; face:san-serif;"><b>Campaign</b></th>
            	<th style="font-size: 14px ; face:san-serif;"><b>From</b></th>
            	<th style="font-size: 14px ; face:san-serif;"><b>To</b></th>
            	<th style="font-size: 14px ; face:san-serif;"><b>Content</b></th>
            	<th style="font-size: 14px ; face:san-serif;"><b>Frequency</b></th>
            	
            	

                
                
                
                
                    
            </tr>
        </thead>
        <tbody>
      <%  
      String typevalue=session.getAttribute("typevalue").toString();
      System.out.println("Type Value: "+typevalue);
      int ID =0;
      int RequestID =0;
      String Company = "";
      String CampaignName = "";
      String Frequency = "";
      String Media = "";
      String FromDate = "";
      String ToDate = "";
      String City = "";
      String Content = "";
	  
     
      SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");  
      String strDate= formatter.format(date);  
      System.out.println(strDate);  
      
	  String sql="select * from smartgrid.CampaignMaster where TypeValue like '%"+session.getAttribute("typevalue")+"%' ";

	  System.out.println("Query is : "+sql);
	  rs = st.executeQuery(sql);

      int i=1;
      while(rs.next()){
    	  Company=rs.getString("Company");
    	  CampaignName=rs.getString("CampaignName");
    	  Frequency=rs.getString("Frequency");
    	  Media=rs.getString("Media");
    	  FromDate=rs.getString("FromDate");

    	    DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
    	
    	    date = df.parse(FromDate);
    	    DateFormat df1 = new SimpleDateFormat("dd-MMM-yyyy");
    	    FromDate = df1.format(date);
    	    
    	  ToDate=rs.getString("ToDate");
    	  
    	   df = new SimpleDateFormat("yyyy-MM-dd");
      	
  	    date = df.parse(ToDate);
  	    df1 = new SimpleDateFormat("dd-MMM-yyyy");
  	  	ToDate = df1.format(date);
  	    
    	  City=rs.getString("City");
    	  Content=rs.getString("Content");
	  
%>   	
			<tr>		
			<td style="font-size: 13px; face:san-serif; color:black"><%=i%></td>
				<td style="font-size: 13px; face:san-serif; color:black"><%=Company%></td>
            	<td style="font-size: 13px; face:san-serif; color:black"><%=CampaignName%></td>
            	<td style="font-size: 13px; face:san-serif; color:black"><%=FromDate%></td>
            	<td style="font-size: 13px; face:san-serif; color:black"><%=ToDate%></td>
            	<td style="font-size: 13px; face:san-serif; color:black"><%=Content%></td>
           		<td style="font-size: 13px; face:san-serif; color:black"><%=Frequency%></td>
            	
            </tr>
               
               
                  <%
                   i++;      
      } 
                  
                 
                  %>     
            
        </tbody>
      
    </table>
                            
                            
                         
                  
                          <!-- <div class="text-right">
                            <button type="submit" class="btn btn-primary">Make Payment <i class="glyphicon glyphicon-credit-card position-right"></i></button>
                          </div> -->
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
