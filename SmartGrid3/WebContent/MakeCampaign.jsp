<!DOCTYPE html>
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
<link href="https://cdn.jsdelivr.net/npm/pretty-checkbox@3.0/dist/pretty-checkbox.min.css" rel="stylesheet" type="text/css">

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



<script type="text/javascript">
 $(document).ready(function() {
	    $('#example').DataTable( {
	    	 "bPaginate": false,
	    	    "bLengthChange": false,
	    	    "bInfo": false,
	    	    "bAutoWidth": false
	    } );
	} );

</script>

<!-- /theme JS files -->

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

.tooltiptext{
    display: none;
}

</style>
<style type="text/css">



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

String LocationDetailsQuery="select count(*) as Count ,category,City,State,Country from smartgrid.t_polmaster  where category!=' '   group by country,state,city,category order by Country,State,City,category";
String CountrySql = "select distinct(Country)  from smartgrid.t_polmaster where Country!=' ' ";
String StateSql = "select distinct(State)  from smartgrid.t_polmaster where State!=' ' and State!='-' ";
String CitySql = "select distinct(City)  from smartgrid.t_polmaster where City!=' ' and City!='-' ";
String CategorySql = "select distinct(Category)  from smartgrid.t_polmaster where Category!=' ' ";
String ContentSql = "select * from smartgrid.t_globalmediamaster";

String contentonload=request.getParameter("ContentType");
/* SQL Queries Ends Here  */

%>
<!-- Main navbar -->
<div class="navbar navbar-default navbar-fixed-top header-highlight">
  <div class="navbar-header"> <a class="navbar-brand" href="Home.jsp"><img src="assets/images/logo_light.png" alt=""></a>
   
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
            <li><a href="Home.jsp"><i class="icon-home2 position-left"></i> Home &nbsp;</a>  <i class="glyphicon glyphicon-folder-open position-left"></i>Make Campaign &nbsp; <a href="ViewDetails.jsp"><i class="icon-home2 position-left"></i> View Campaign &nbsp;</a></li>
          </ul>
          
        </div>
      </div>
      <!-- /page header --> 
      
      <!-- Content area -->
      <div class="content"> 
        
        <!-- Grid -->
  <div class="content-wrapper"> 
          
         
			
     <div class="row">
          <!-- User profile -->
              
            <div class="col-lg-3"> 

  <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
  <div class="panel panel-default">
    <div class="panel-heading active" role="tab" id="headingOne">
      <h4 class="panel-title">
        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
         <i class="icon-home2 position-left"></i> Country
        </a>
      </h4>
    </div>
    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
      <div class="panel-body">
      
      <input type="text" value="" class="form-control" name="myInput" id="myCountry" placeholder="Search Country" onkeyup="myCountry()"/>		
		<ul id="myULCountry">
		
		<% 
			rs = st.executeQuery(CountrySql);
			while(rs.next()){
				String Country = rs.getString("Country");
			
			%>
		<li><div class="pretty p-default">
       				 <input type="checkbox" id="Country" class="styled" value="<%=Country%>" />
        			<div class="state p-success">
         			   <label><%=Country%></label>
       				 </div>
    			</div></li>
    			
  				 <%-- <li><input type="checkbox" id="Country" value="<%=Country %>" class="styled"><a href="#" id="country"><%=Country %></a> </li>
			 --%>
			<%} %>
			</ul>
			    
      </div>
      </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingTwo">
      <h4 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
        <i class="icon-home2 position-left"></i>  State
        </a>
      </h4>
    </div>
    <div id="collapseTwo" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingTwo">
      <div class="panel-body">
      
      <input type="text" value="" class="form-control" name="myInput" id="myState" placeholder="Search State" onkeyup="myState()"/>

			<ul id="myULState">
			<%
			rs = st.executeQuery(StateSql);
			while(rs.next()){
				String State = rs.getString("State");
			%>
  				
  			<li><div class="pretty p-default">
       				 <input type="checkbox" class="styled"  id="State" value="<%=State%>" />
        			<div class="state p-success">
         			   <label><%=State%></label>
       				 </div>
    			</div></li>
    				 
  			<%-- <li><input type="checkbox" id="State" value="<%=State %>" class="styled"><a href="#" id="state"><%=State %></a> </li>
		 --%>	
			<%} %>
			</ul>
			
      </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingThree">
      <h4 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
        <i class="icon-home2 position-left"></i> City
        </a>
      </h4>
    </div>
    <div id="collapseThree" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingThree">
      <div class="panel-body"> 
      <div id="filterControls">
      <input type="text" value="" class="form-control" name="myInput" id="myCity" placeholder="Search City" onkeyup="myCity()"/>

			<ul id="myULCity">
			<% 
			rs = st.executeQuery(CitySql);
			while(rs.next()){
				String City =  rs.getString("City").toUpperCase();
			
			%>
			<%-- <li><input type="checkbox" value="<%=City%>" class="styled"><a href="#"><%=City%></a> </li> --%>
		 	 <li><div class="pretty p-default">
       				 <input type="checkbox" id="City" class="styled" value="<%=City%>" />
        			<div class="state p-success">
         			   <label><%=City%></label>
       				 </div>
    			</div></li>	
    			<%-- <li><input type="checkbox" id="City" value="<%=City %>" class="styled"><a href="#" id="city"><%=City %></a> </li>
		 --%>
  			<% }%>
			</ul>
			</div>
      </div>
    </div>
  </div>
</div>
            
            <div class="col-lg-9" id="MainCampaign">
              <div class="tabbable">
                <div class="tab-content">
                  
                  	
                  <div class="tab-pane fade in active" id="settings"> 
                    
                    <!-- Profile info -->
                    <div class="panel panel-flat">
                       <div class="panel-heading" role="tab" id="headingmycampaign">
     					 <h4 class="panel-title">
     					   <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#mycampaign" aria-expanded="false" aria-controls="mycampaign">
     					   <i class="icon-home2 position-center"></i> Add New Campaign
     					   </a>
     					 </h4>
    					</div>
                      <br>
                      <div class="panel-body" >
                        <form action="MakeCampaign" method="post" >
                          <div class="form-group">
                            <div class="row">
                              <div class="col-md-3">
                                <label >Company</label>
                                <input type="text" name="Company" id="Company" class="form-control" required="required">
                              </div>
                              <%
                              String typevalue=session.getAttribute("typevalue").toString();
                              System.out.println("Type Value :"+typevalue);
                              %>
                               <input type="hidden" name="entryby" id="entryby" value="<%=session.getAttribute("username") %>" readonly="readonly"/>  
                              <input type="hidden" name="typevalue" id="typevalue" value="<%=typevalue %>" readonly="readonly"/>
                              <div class="col-md-3">
                                <label>Compaign Name</label>
                                <input type="text" name="Compaign_Name" id="Compaign_Name"  class="form-control"  required="required">
                              </div>
 
                           <div class="col-md-3">
                                <label>Frequency </label>
                                <select class="select" id="Frequency" name="Frequency" required="required">
                                  <option  id="Frequency" selected="selected" value="">Select</option>
                                   <option id="Frequency" value="Daily">Daily</option>
                                  <option id="Frequency" value="Weekly">Weekly</option>
                                  <option id="Frequency" value="Monthly">Monthly</option>
                                 
                                </select>
                              </div>
                            
                              <div class="col-md-3">
                            
                                <label>Media</label>
                                
                                <div class="row">
                               <% 
                               rs = st.executeQuery(CategorySql);
                               while(rs.next()){
                            	   String Category = rs.getString("Category");
                               
                               %> 
                                
                                <div class="col-md-3">
                                <div class="pretty p-default">
       				 <input type="checkbox" id="Media" name="Media" value="<%=Category%>" />
        			<div class="state p-success">
         			   <label><%=Category%></label>
       				 </div>
    			</div>
                                </div>
                              <%} %>
                           
                                </div>
                                </div>
                          </div>
                            
                          </div>
                          <div class="form-group">
                            <div class="row">
                              <div class="col-md-3">
                                <label>From Date</label>
                                <input type="date" value=" " name="FromDate" id="FromDate" required="required" class="form-control" placeholder=" 2018-06-07">
                              </div>
                              <div class="col-md-3">
                                <label>To Date</label>
                                <input type="date" name="ToDate" id="ToDate" required="required" class="form-control">
                              </div>
                              <div class="col-md-3">
                                <label>Content Type</label>
                                
                                <select class="select" id="ContentType" name="ContentType" required="required">
                                  <option id="ContentType" selected="selected">Select</option>
                                  <option id="ContentType" value="Image" >Image</option>
                                  <option id="ContentType" value="Video">Video</option>
                                  <option id="ContentType" value="Gif">Gif</option>
                                 
                                </select>
                              </div>
                              <div class="col-md-3">
                              
                                <label>Content </label>
                             
                               <select class="select" id="selContent" name="Content" style='width: 200px;' required="required">
        
                                  <option  id="Content" value="ABC" selected="selected">Select</option>
                                  <% 
                                  rs = st.executeQuery(ContentSql);
                                  while(rs.next()){
                                	String Content = rs.getString("originalmedianame");  
                                	String changemedianame = rs.getString("changemedianame");
                                	
                                	String Duration = rs.getString("duration");
                                  
                                  %>
                                   <option id="Content" value="<%=changemedianame%>"><%=Content%></option>
                                
 								<%} %>
                                 
                                </select>
                             
                              </div>
                              
                              
                              
                            </div>
                          </div>     
                            <div class="row">
                            <div class="tab-content">
                  
                  	
                  <div class="tab-pane fade in active" id="settings"> 
                    
                    <!-- Profile info -->
                    <div class="panel panel-flat">
                       <div class="panel-heading" role="tab" id="headingmycampaign">
     					 <h4 class="panel-title">
     					   <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#mycampaign" aria-expanded="false" aria-controls="mycampaign">
     					   <i class="icon-home2 position-center"></i>Select City
     					   </a>
     					 </h4>
     					
    					</div>
                      <br>
                      <div class="panel-body" >
                      
                      
 <table id="example" class="display" style="width:100%;"  cellspacing="0" >
        <thead>
            <tr>
            <th style="font-size: 14px ; face:san-serif;"><b>Select</b></th>
            	<th style="font-size: 14px ; face:san-serif;"><b>Country</b></th>
            	<th style="font-size: 14px ; face:san-serif;"><b>State</b></th>
            	<th style="font-size: 14px ; face:san-serif;"><b>City</b></th>
            	<th style="font-size: 14px ; face:san-serif;"><b>Category</b></th>
            	<th style="font-size: 14px ; face:san-serif;"><b>Count</b></th>
            	
            	
            	

                
                
                
                
                    
            </tr>
        </thead>
        <tbody>
      <%  
      
      System.out.println("Type Value: "+typevalue);
      int ID =0;
      int RequestID =0;
      String Country = "";
      String State = "";
      String Count = "";
      String Category = "";
      String FromDate = "";
      String ToDate = "";
      String City = "";
	  
    
      System.out.println("Content on lOad is : "+contentonload);
	 
	  System.out.println("Query is : "+LocationDetailsQuery);
	  rs = st.executeQuery(LocationDetailsQuery);

      int i=1;
      while(rs.next()){
    	  City=rs.getString("City").toUpperCase();
    	  Country=rs.getString("Country");
    	  State=rs.getString("State");
    	  Category=rs.getString("Category");
    	  Count=rs.getString("Count");
	  
%>   	

			<tr>	
				<td><div class="pretty p-default">
       				 <input type="checkbox" class="cid"  id="City" name="City" value="<%=City%>" />
       				 <input type="hidden" id="Country" name="Country" value="<%=Country%>">
       				 <input type="hidden" id="State" name="State" value="<%=State%>">
        			<div class="state p-success">
         			   <label></label>
       				 </div>
    			</div></td>
			<%-- 	<td style="font-size: 13px; face:san-serif; color:black" ><input type="checkbox" id="City" name="City" value="<%=City%>"></td> --%>
				<td style="font-size: 13px; face:san-serif; color:black" class="country"><%=Country%></td>
            	<td style="font-size: 13px; face:san-serif; color:black" class="state"><%=State%></td>
            	<td style="font-size: 13px; face:san-serif; color:black" class="city"><%=City%></td>
            	<td style="font-size: 13px; face:san-serif; color:black"><%=Category%></td>
            	<td style="font-size: 13px; face:san-serif; color:black"><%=Count%></td>
            	
            	
            </tr>
               
               
                  <%
                /*   i++;    */         
      } 
                  
                 
                  %>     
            
        </tbody>
      
    </table>
                      
                      
                    <%--  <%

							out.println("<div class='col-sm-4 col-md-4 col-xs-12 content-holder ng-scope'>");
							out.println("<div class='see'>");
							out.println("</div>");
							out.println("<div class='clear'></div>");
							out.println("</div>");
						

						try {
						
							rs = st.executeQuery(LocationDetailsQuery);
							int i = 1;
							int chk = 0;
							boolean isPresent = false;
							while (rs.next()) {
								isPresent = true;
								if (i == 1)
								
								out.println("<div class='section group'>");
								String City = rs.getString("City").toUpperCase();
								String State = rs.getString("State").toUpperCase();
								
								out.println("<div style='z-index:999999' class='grid_1_of_4 images_1_of_4'>");
								out.println("<img src='assets/images/punetour.jpg' alt='City ' width='700' height='100'>");
								out.println("<a href='ViewDetails.jsp?City=" + rs.getString("City") + "'></a>");
								%>
								
								<div class="city">
       								 <input type="checkbox" id="City"  name="City" width="20" height="20"  value="<%=City%>" />
        							<div class="state p-success">
         							   <label style="font-size: 30px;"><b><%=City %></b></label>
       								 </div>
    							</div>
								<% 
								String concatCat = "";
								if(rs.getString("Category").equalsIgnoreCase("Bus")){
									concatCat="es";
								}
								else{
									concatCat="s";
								}
								
								out.println("<h5>" + rs.getString("State") + "</h5>");
								out.println("<div class='price-details'>");
								out.println("<div class='price-number'>");
								out.println("<p><span class='rupees'>" + rs.getString("Category").concat(concatCat) + "</span>  <span class='rupees'>" + rs.getString("Count") + "</span>  </p>");
								
								out.println("</div>");
							/* 	out.println("<div class='add-cart'>");
								out.println("<h4><a href='ViewDetails.jsp?City=" + rs.getString("City")
										+ "'>View Details</a></h4>");
								out.println("</div>"); */
								out.println("<div class='clear'></div>");
								out.println("</div>");
								out.println("</div>");
								
								System.out.println("Count :"+rs.getString("Count"));
								if (i == 3) {
									out.println("</div>");
									chk = 1;
									i = 1;
								} else {
									chk = 0;
									i++;
								}

							}
							if (chk == 0)
								out.println("</div>");
							
							if (!isPresent) {
								out.println("<h2>Available City: </h2>");
							}
							rs.close();
							st.close();
							//con.close();
						} catch (SQLException sqe) {
							out.println(sqe);
						}
					%> 
                       
                       
                       
                      </div> --%>
                    </div>
                    <!-- /profile info --> 
                    
                    <!-- Account settings -->
                    
                    <!-- /account settings --> 
                    
                  </div>
                </div>
                            </div>
                          <div class="text-right">
                            <button type="submit" class="btn btn-primary">Create Campaign <i class="icon-arrow-right14 position-right"></i></button>
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
            
            
            
   


              
              <!-- panel-group -->
	
              
            </div>
            
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

<!-- container -->

<!-- <script type="text/javascript">
$(document).ready(function () {

    $("input:checkbox.styled").on("change", function () {
        var a = $("input:checkbox:checked").map(function () {
            return $(this).val()
        })
        $("tbody tr").hide(); 
        var cities = $(".city").filter(function () {
            var city = $(this).text(),
                index = $.inArray(city, a);
            return index >= 0
        }).parent().show();
    }) 
   
});

</script> -->



<script type="text/javascript">
$(document).ready(function() {
    $('#Compaign_Name').bind("cut copy paste", function(e) {
        e.preventDefault();
         alert("You cannot paste into this text field.");
        $('#Compaign_Name').bind("contextmenu", function(e) {
            e.preventDefault();
        });
    });
});
</script>

<script type="text/javascript">
$(document).ready(function () {

    $("input:checkbox.styled").on("change", function () {
    	
    	if($(':checkbox:checked').length > 0){
        var a = $("input:checkbox:checked").map(function () {
            return $(this).val()
        })
        $("tbody tr").hide();
        var cities = $(".state").filter(function () {
            var state = $(this).text(),
                index = $.inArray(state, a);
            return index >= 0
        }).parent().show();
        
        var cities = $(".city").filter(function () {
            var city = $(this).text(),
                index = $.inArray(city, a);
            return index >= 0
        }).parent().show();
        
        var cities = $(".country").filter(function () {
            var country = $(this).text(),
                index = $.inArray(country, a);
            return index >= 0
        }).parent().show();
        
        
    }
    	else{
    		$("tbody tr").show();
        }
    }
    
    ) 
  
});


</script>

<script type="text/javascript">
$('.filter').change(function(){     
    //on each click, refresh visible / hidden for each item
    $('li.result').each(function(i, item){
      var city = $(this).data('city');
      var visible = $('input.filter[data-city="' + city + '"]:checked').length > 0;
      visible ? $(this).show() : $(this).hide();
    });
    
    //if no checkboxes are checked, show everything
    if($('input.filter:checked').length === 0) $('li.result').show();
});

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
//Create the tooltips only when document ready
$(document).ready(function () {
    
    // Apply tooltip on all <a/> elements with title attributes. Mousing over
    // these elements will the show tooltip as expected, but mousing onto the
    // tooltip is now possible for interaction with it's contents.
    $('a').each(function () {
        $(this).qtip({
            content: $(this).next('.tooltiptext'),
            hide: {
                fixed: true,
                delay: 300
            }
        });
    });
    
});
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
