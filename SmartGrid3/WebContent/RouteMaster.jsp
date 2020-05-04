<%@include file="headernew.jsp"%> 
 <%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@page import="java.text.DecimalFormat"%>

<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Location Master Report</title>
   
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  
   
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.1/css/responsive.dataTables.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
 --><link rel="stylesheet" href="css/styleMakePlan.css">
<!-- Export Options Links of DataTables -->

<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css">
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script> 
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script> 
<script src=" https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
<script src=" https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js "></script>
 <script type="text/javascript" src="//cdn.datatables.net/plug-ins/1.10.19/sorting/date-dd-MMM-yyyy.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.4/moment.min.js"></script>
 <script type="text/javascript" src="//cdn.datatables.net/plug-ins/1.10.19/sorting/datetime-moment.js"></script>
 
 <script type="text/javascript">
 $(document).ready(function() {
	    $('#example').DataTable( {
	     "pagingType": "full_numbers",
            dom: 'Blfrtip',
            responsive: true,
            scrollY:        "400px",
            scrollX:        true,
            scrollCollapse: true,
            fixedColumns: true,

            /* "columnDefs": [
                { type: 'date-dd-mmm-yyyy', targets: 5 },
              ], */
              
	        buttons: [
	        	
	        	{
	        		extend: 'collection',
	        		
	        		text: 'Export',
	        		buttons: [
	        			
		        			{
		                        extend: 'excel',
		                        title: 'Route Master Report',
		                        },
		                    {
		                        extend: 'pdf',
		                        title: 'Route Master Report',
		                        pageSize : 'A2',
		                    },
		                    {
		                        extend: 'csv',
		                        title: 'Route Master Report',
		                    },
		                    {
		                        extend: 'print',
		                        title: 'Route Master Report-',
		                    },
		                    {
		                        extend: 'copy',
		                        title: 'Route Master Report-',
		                    },
		                   
	                    
	            				/* 'copy', 'csv', 'excel', 'pdf', 'print' */
	            			]
	        	}
	        ],
        	lengthMenu: [[10, 25, 50, 100,-1], [10, 25, 50, 100,"All" ]]
	    	
	    } );
	} );

</script>

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
/* 


div.absolute1 {
    position: absolute;
    left: 30px;
    width:100%;
    border:0;
}   */  
</style>
<style>
#example {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

#example td, #example th {
    border: 1px solid #ddd;
    padding: 8px;
}

#ad {
  text-decoration: underline;
  text-align: left;
  padding-left: 25px;
  
}	

#example tr:nth-child(even){background-color: #f2f2f2;}

#example tr:hover {background-color: #ddd;}

#example th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: left;
    background-color: #4CAF50;
    color: white;
}
</style>

  
<link href="http://cdn.syncfusion.com/16.4.0.42/js/web/flat-azure/ej.web.all.min.css" rel="stylesheet" />
 <!-- <script src="http://cdn.syncfusion.com/js/assets/external/jquery-1.10.2.min.js"> </script>
  -->   <script src="http://cdn.syncfusion.com/16.4.0.42/js/web/ej.web.all.min.js"></script>
   
 </head>
 <body>
<br>
 <br>
 <div id="head" name="head"  class="form" align="center" style="font-size: 16px;  " >
 <form id="camera_jpg_report" name="camera_jpg_report" action="" method="post"  " >
 <font id="head1" name="head1" face="san-serif" color="#333" size="3"><b>Route Master Report</b></font>
 <br>
 <br>

<%
	Connection conn=null;
	Class.forName("com.mysql.jdbc.Driver").newInstance();
		conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
	Statement st=conn.createStatement();
	ResultSet resultset =st.executeQuery("select typevalue  as  CompanyName from db_gps.t_transporter where ActiveStatus='Yes' and category='SMARTGRID'") ;
	String userid=session.getAttribute("userid").toString();
	String company= session.getAttribute("company").toString();
	
	%>

<b>Company:&nbsp;&nbsp;</b>
				<select name="Company" id="Company" 
				style="width: 280px; height:25px; border: 1px solid black; font: normal 13px Arial, Helvetica, sans-serif; color: #000000; border-color: activeborder;">
				   
		 <option value="All"  selected="selected">All</option>
		 
        <%  while(resultset.next()){ %>
        	 
            <option value="<%= resultset.getString("CompanyName").trim()%>"><%= resultset.getString("CompanyName").trim()%></option>
        <% } 
        %>
      
        	 
   		</select>
	 
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="button1" id="button1" value="Submit"  style="border-style: outset; border-color: black; ">

 <%
 String buttonn = request.getParameter("button1");
 String drop = request.getParameter("Company");
 %>


<%
	try {
		Class.forName("org.gjt.mm.mysql.Driver");
		Connection con1 = DriverManager.getConnection("jdbc:mysql://103.241.181.36/smartgrid", "fleetview",
				"1@flv");
%>

<div id="ad">
		<font face="Arial" size="2"><a href="RouteEntry.jsp"
			style="font-weight: bold; color: blue;">Add </a></font>
	</div>
	<div align="right"> 
 <font size="2">
<td align="right" bgcolor="#FFFFFF">
<%=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new java.util.Date())%>
</td>
</div>

<div class="form" style="margin-left: 2%;margin-top: 2%;">
<table id="example" class="display" style="width:100%" cellspacing="0" >
 <thead>
		 <tr>
		    <th width ="5%" style="font-size:  14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #424658; color: white;">Edit</th>
			<th width ="5%" style="font-size:  14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #424658; color: white;">Sr No</th>
		    <th width ="30%" style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #424658; color: white;">Vehicle code</th>
			<th width ="15%" style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #424658; color: white;">Owner</th>
			<th width ="10%" style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #424658; color: white;">Origin</th>
			<th width ="10%" style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #424658; color: white;">Destination</th>
			<th width ="10%" style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #424658; color: white;">RouteName</th>
            <th width ="10%" style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #424658; color: white;">OriginLat</th>
			<th width ="5%" style="font-size:  14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #424658; color: white;">OriginLong</th>
			<th width ="5%" style="font-size:  14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #424658; color: white;">DestLat</th>
		    <th width ="30%" style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #424658; color: white;">DestLong</th>
			<th width ="15%" style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #424658; color: white;">TripStartTime</th>
			<th width ="10%" style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #424658; color: white;">TripEndTime</th>
			<th width ="10%" style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #424658; color: white;">EntryBy</th>
			<th width ="10%" style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #424658; color: white;">EntryDateTime</th>
            <th width ="10%" style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #424658; color: white;">OriginLat</th>
			
			</tr>
</thead>
<%
						    int i =1 ;
							String Vehiclecode = " ";
							String Owner = " ";
							String Origin = " ";
							String Destination = " ";
						    String RouteName = " ";
							String OriginLat = " ";
							String OriginLong = " ";
							String DestLat = " ";
							String DestLong = " ";
							String TripStartTime = " ";
						    String TripEndTime = " ";
							String EntryBy = " ";
							String EntryDateTime = " ";
							String UpdatedDateTime = " ";
							

							Statement stmt0 = con1.createStatement();
                     
							 String sql="";
							 
							if(buttonn == null || buttonn.equals("null") || drop.equals("All")){
							
							 sql = "select SrNo,Vehiclecode,Owner,Origin,Destination,Routename,originlat,originlong,destlat,destlong,TripStartTime,TripEndTime,Entryby,Date_Format(InsertDateTime,'%d-%b-%Y %H:%i') as InsertDateTime,Date_Format(UpdatedDate,'%d-%b-%Y %H:%i') as UpdatedDateTime from smartgrid.t_routemaster";

							} else if(buttonn=="Submit" || buttonn.equals("Submit"))	
							{
							
							sql = "select SrNo,Vehiclecode,Owner,Origin,Destination,Routename,originlat,originlong,destlat,destlong,TripStartTime,TripEndTime,Entryby,Date_Format(InsertDateTime,'%d-%b-%Y %H:%i') as InsertDateTime,Date_Format(UpdatedDate,'%d-%b-%Y %H:%i') as UpdatedDateTime from smartgrid.t_routemaster where Owner like '" + drop + "'";
                            
							System.out.println("gggggg" + sql);
							
							}
								String srno="";
						 						
							
							ResultSet result = stmt0.executeQuery(sql);
							while (result.next()) {

								Vehiclecode = result.getString("Vehiclecode");
								Owner = result.getString("Owner");
								Origin = result.getString("Origin");
								Destination = result.getString("Destination");
								RouteName = result.getString("Routename");
								OriginLat = result.getString("originlat");
								OriginLong = result.getString("originlong");
								DestLat = result.getString("destlat");
								DestLong = result.getString("destlong");
								TripStartTime = result.getString("TripStartTime");
								TripEndTime = result.getString("TripEndTime");
								EntryBy = result.getString("Entryby");
								EntryDateTime = result.getString("InsertDateTime");
								UpdatedDateTime = result.getString("UpdatedDateTime");
								srno=result.getString("SrNo");
								
					%>
					<tr>
						<td><a href="RouteEdit.jsp?SrNo=<%=srno%>" target="_blank">Edit</a></td></td>
						<td><%=i%></td>
						<td><%=Vehiclecode%></td>
						<td><%=Owner%></td>
						<td><%=Origin%></td>
						<td><%=Destination%></td>
						<td><%=RouteName%></td>
						<td><%=OriginLat%></td>
						<td><%=OriginLong%></td>
						<td><%=DestLat%></td>
						<td><%=DestLong%></td>
						<td><%=TripStartTime%></td>
						<td><%=TripEndTime%></td>
						<td><%=EntryBy%></td>
						<td><%=EntryDateTime%></td>
						<td><%=UpdatedDateTime%></td>
						

					</tr>

					<%
						i++;
					
							}

						} catch (Exception e) {
							e.printStackTrace();
						}
					%>
</tbody>
				</table>
			</div>
</form>	
</div>		
</body>
</html>
<%@include file="footer.jsp"%>



