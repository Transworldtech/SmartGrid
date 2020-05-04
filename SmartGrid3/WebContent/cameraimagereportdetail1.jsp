<%-- <jsp:useBean id="fleetview" class="com.fleetview.beans.classes" scope="page"> --%<%@page import="com.sun.org.apache.xalan.internal.xsltc.compiler.sym"%>
 --%> 
 <%@page import="com.sun.org.apache.xalan.internal.xsltc.compiler.sym"%>
 
 <%@page import="java.text.SimpleDateFormat"%>
 <%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@ include file="headernew.jsp"%>

<!DOCTYPE html>
<html>
<head>
    
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Local Storage Report</title>
    
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    
  <!--  
 <link rel="stylesheet" type="text/css" href="css/cpanel_002_popup.css"> 
<link rel="stylesheet" type="text/css" href="css/cpanel_colors.css">
 <script type="text/javascript" language="javascript" src="calendar/prototype-1.js"></script>
<script type="text/javascript" language="javascript" src="calendar/prototype-base-extensions.js"></script>
<script type="text/javascript" language="javascript" src="calendar/prototype-date-extensions.js"></script>
<script type="text/javascript" language="javascript" src="calendar/behaviour.js"></script>
<script type="text/javascript" language="javascript" src="calendar/datepicker.js"></script>
<link rel="stylesheet" href="calendar/datepicker.css">
<script type="text/javascript" language="javascript" src="calendar/behaviors.js"></script>
     <link type="text/css" rel="stylesheet" href="style.css" />
   -->
 

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

div.absolute {
    position: absolute;
    left: 190px;
    width:100%;
    border:0;
}    
div.absolute1 {
    position: absolute;
    left: 30px;
    width:100%;
    border:0;
}    
</style>

<script type="text/javascript">
function showFTPImage(imageName)
{	
	var url="showcameraftpimage.jsp?imageName=" +imageName;
	testwindow1 = window.open(url,"Image", "width=500,height=500");
    testwindow1.moveTo(250,100);
}
</script>
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
	    	/* "pagingType": "full_numbers",
	        dom: 'Bfrtip', */
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
	                        title: 'Local Storage Report-' + " " + "From"+ " " +$("#date_ex").val()+ " " + "To"+ " " + $("#date_ex1").val() ,
	                        },
	                    {
	                        extend: 'pdf',
	                        title: 'Local Storage Report-' + " " + "From"+ " " +$("#date_ex").val()+ " " + "To"+ " " + $("#date_ex1").val(),
	                    },
	                    {
	                        extend: 'csv',
	                        title: 'Local Storage Report-' + " " + "From"+ " " +$("#date_ex").val()+ " " + "To"+ " " + $("#date_ex1").val(),
	                    },
	                    {
	                        extend: 'print',
	                        title: 'Local Storage Report-' + " " + "From"+ " " +$("#date_ex").val()+ " " + "To"+ " " + $("#date_ex1").val(),
	                    },
	                    {
	                        extend: 'copy',
	                        title: 'Local Storage Report-' + " " + "From"+ " " +$("#date_ex").val()+ " " + "To"+ " " + $("#date_ex1").val(),
	                    },
	                    
	            				/* 'copy', 'csv', 'excel', 'pdf', 'print' */
	            			]
	        	}
	        ],
        	lengthMenu: [[10, 25, 50, 100,-1], [10, 25, 50, 100,"All" ]]
	    	
	    } );
	} );

</script>
 <link href="http://cdn.syncfusion.com/16.4.0.42/js/web/flat-azure/ej.web.all.min.css" rel="stylesheet" />
       <!--  <script src="http://cdn.syncfusion.com/js/assets/external/jquery-1.10.2.min.js"> </script>
 -->      <script src="http://cdn.syncfusion.com/16.4.0.42/js/web/ej.web.all.min.js"></script>
       
<script>
      $(function() {
    	 var date=new Date();
    	    var date1=new Date();
    	   
    	    date.setDate(date.getDate()-3);
    	    date1.setDate(date1.getDate()); 
    	    
    	        	    
         $('#date_ex').ejDateTimePicker({
        	 
        dateTimeFormat: "dd-MMM-yyyy HH:mm:ss",
          timePopupWidth: "150px",
         timeDisplayFormat: "HH:mm:ss",
         interval: 01,
         pickDate: false,
        pickSeconds: false,
         pick12HourFormat: false , 
         /* pickDate: false,
         pickSeconds: false,
         pick12HourFormat: false   */
         // pick24HourFormat: false,   // enables the 12-hour format time picker
         
         // minDateTime:date,
         // maxDateTime:date1,
          width: '200px'
       });
    });
  </script>
  <script>
      $(function() {
    	 var date=new Date();
    	    var date1=new Date();
    	   
    	    date.setDate(date.getDate()-3);
    	    date1.setDate(date1.getDate()); 
    	        	        	    
         $('#date_ex1').ejDateTimePicker({
        	 
        dateTimeFormat: "dd-MMM-yyyy HH:mm:ss",
          timePopupWidth: "150px",
         timeDisplayFormat: "HH:mm:ss",
         interval: 01,
         pickDate: false,
        pickSeconds: false,
        pick12HourFormat: false , 
         /* pickDate: false,
         pickSeconds: false,
         pick12HourFormat: false   */
         // pick24HourFormat: false,   // enables the 12-hour format time picker
         
         // minDateTime:date,
         // maxDateTime:date1,
          width: '200px'
       });
    });
  </script>
<script type="text/javascript">
function chk()
{
	
	 var dateStart=new Date(document.getElementById("date_ex").value);
	 var dateEnd=new Date(document.getElementById("date_ex1").value);
	 
	   if(dateStart > dateEnd)
    {
	 		swal('From Date Should Be Less Than To Date.'); 

        return false; 
    }
        
        return true;
   

}
</script>




</head>
<!-- </head> -->
<body style="background: #FFFFFF;">
<%! Connection conn = null;
	Statement st = null;
	Statement st1 = null;
	Statement st2 = null;
	Statement st3 = null;
	Statement st4 = null;
	Statement st5 = null;
	Statement st6 = null;
	
	Statement st11 = null;
	Statement st22 = null;
	Statement st33 = null;
	Statement st44 = null;
	Statement st55 = null;
	Statement st66 = null;
		
	String date1 = "";
	String date2 = "";
	String from ="";
	String to ="";
	String fromdate="";
	String todate="";
	
	String time1 = "";
	String time2 = "";
	String time3="";
	String time4="";
	
	String vehno="";
	String from1=" "
			,to1="";
%>

<%
//String statusname="";
	String  default_date_1 = new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new Date());
	String  hh=new SimpleDateFormat("HH").format(new Date());
	
	int hh1=Integer.parseInt(hh);
	int hh2=hh1-2;
	
	String default_date_3 = new SimpleDateFormat("dd-MMM-yyyy ").format(new Date());
	
	
	String  default_date_5 = new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new Date());
	String  mm=new SimpleDateFormat("mm").format(new Date());
	
	int mm1=Integer.parseInt(mm);
	int mm2=mm1;
	
	  DecimalFormat formatter = new DecimalFormat("00");
	
	String mm5=formatter.format(mm2);
	default_date_3=default_date_3+""+hh2+":"+mm5;
	
	
	String defaultDate2 = new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new Date());
	System.out.println("The default date is ==>"+default_date_3);
	
	System.out.println("The default_date_1  is ==>"+default_date_1);
	 from= request.getParameter("from");
		
	 to= request.getParameter("to");
	
	try
	{
	date1=new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:MM").parse(default_date_3)); 
	date2= new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:MM").parse(default_date_1)); 
	
	
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	try
	{
from1=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(date1+time1)) ; 
to1=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(date2+time2)) ; 
	}
	catch(Exception e)
	{
		from1=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(date1+time1)) ; 
		to1=new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(date2+time2)) ; 
	}

%>	

<%
String vehlist = "";
String unitid="",camerapos="";
try{
	
	String frompage = request.getParameter("frompage");
	//vehlist = session.getAttribute("VehList").toString();
	//System.out.println("The vehicle list>>>>"+vehlist);

	if(frompage!=null && frompage.equalsIgnoreCase("OS"))
	{
		String thedate = request.getParameter("data");
		String thedate1 = request.getParameter("data1");
		date1 = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(thedate));
		time1 = new SimpleDateFormat("HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(thedate));
		date2 = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(thedate1));
		time2 = new SimpleDateFormat("HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(thedate1));
	}
	else
	{
	 System.out.println("In else date");
		 date1 = request.getParameter("data");
		 date2 = request.getParameter("data1");
		 unitid= request.getParameter("vehreg");
		 from= request.getParameter("from");
		 
		 
		
		 to= request.getParameter("to");
		 try{
		 fromdate= new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(from));
		 time3= new SimpleDateFormat("HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(from));
	
		 camerapos= request.getParameter("camerapos");
		 todate= new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(to));
		 time4= new SimpleDateFormat("HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(to));
		 }catch(Exception e){
			 e.printStackTrace();
		 }
	 System.out.println("date1 "+date1);
	 System.out.println("date2 "+date2);
	 System.out.println("vehreg"+unitid);
	 System.out.println("camerapos "+camerapos);
	 System.out.println("from "+from);
	 System.out.println("to "+to);
	// time1 =":00";
	 
	 
	 
	// time2 = ":59";
	}
	
	 Class.forName(MM_dbConn_DRIVER);
	 conn = DriverManager.getConnection(MM_dbConn_STRING, MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
	 st = conn.createStatement();
	 st1 = conn.createStatement();
	 st2 = conn.createStatement();
	 st3 = conn.createStatement();
	 st4 = conn.createStatement();
	 st5 = conn.createStatement();
	 st6 = conn.createStatement();
	 
	 
	 st11 = conn.createStatement();
	 st22 = conn.createStatement();
	 st33 = conn.createStatement();
	 st44 = conn.createStatement();
	 st55 = conn.createStatement();
	 st66 = conn.createStatement();
	 

	 System.out.println("  Date1 ==>"+date1+ "Date2 ==>"+date2);

}catch(Exception e){
	System.out.println("Exception "+e);
}
%>
<body style="background: #FFFFFF;">

<br>
<br>
<div class="div1"  align="center" style="margin-bottom: 10px;" ><font color="black" size="3" face="Arial"><b>Local Storage Detail Report</b></font>
</div>

<div align="center">

<form  style="height: 20px;"   id="camera_jpg_report" name="camera_jpg_report" action="cameraimagereportdetail1.jsp" method="get" >
<table  style="width: 96%;">
	<tr>

<td align="center"> <font color="black" style="font-size: 14px ; face:san-serif;"><b>From : </b></font>
</td>
<td>
 <input  type="text" id="date_ex" name="from" value="<%if(request.getParameter("data")==null){ %><%=from%><%}else{%><%=date1%><%}%>"></input>
</td>
<td>  
<font color="Black" style="font-size: 14px ; face:san-serif;"><b>To :</b></font>
</td>

<td>
<input  type="text" id="date_ex1"  name="to" value="<%if(request.getParameter("data1")==null){ %><%=to%><%}else{%><%=date2%><%}%>"></input>
</td>
	<td align =left>
	<div align="left"><font color="black" size="2" face="Arial"> <b>Category:</b>

<font color="black">
	<select name="cat" class="element select medium" style="width: 80px" id="cat" >
<%
	String category = "";
	String cat11 = "";
	System.out.println("before category");
	try{
	category = request.getParameter("cat");
	System.out.println("category "+category);
	System.out.println("after category");
	
	
	}catch(Exception e){
		e.printStackTrace();
	}
	
	
	String cat = "";
	String sqlcat = "Select DISTINCT(camerapos) from smartgrid.t_LocalStorage where camerapos <> '-'  order by camerapos ASC";
	ResultSet rstcat = st4.executeQuery(sqlcat);
	System.out.println("sql camerapos "+sqlcat);
	%>
	
 <% 	while(rstcat.next())
	{	
		cat = rstcat.getString("camerapos") ;
		if(null != category)
			{
			%>
			 <%System.out.println("Categort===========>"+category); 
		
			 %>
			 
			
			
			<option value="<%=cat%>" <% if(category.equals(cat)){ %>Selected<% } %>><%=cat%></option>
		
			
			<%
			}else
			{
				%><option  value="<%=cat%>" ><%=cat %></option> <%
				category=cat;
			}
			
	} %>
	
	</select>
	</font>
	</font>
	</div>
	</td> 
		
		 <td align =left> 
	<div align="left"><font color="black" size="2" face="Arial"> <b>Location:</b>
	<font color="black">
	<select name="vehreg" class="element select medium" style="width: 130px" id="type" > 
	<%
	
	 String type="";
	String typ1="";
	//type= request.getParameter("unitid");
	
	type= request.getParameter("vehreg");
	vehlist = session.getAttribute("vehlist").toString(); 
	
	System.out.println("Type="+type); 
	//smartgrid.t_LocalStorage
	
	
		String company = session.getAttribute("company").toString();
	String typ = "";
	String vehcode="";
	String typnw="";
	//String sqlcat1 = "Select DISTINCT(unitid) from smartgrid.t_LocalStorage order by unitid ASC";
	
	
   String vehregvehcode="";
	
	String loc="";
	
	
	//String sqlcat1 ="select distinct(VehicleRegNumber),VehicleCode  from db_gps.t_vehicledetails where ownername  like '%"+company+"%'  and status='-' order by VehicleRegNumber ";
	String sqlcat1 ="select distinct(VehicleRegNumber),VehicleCode from db_gps.t_vehicledetails where vehiclecode in "+vehlist+"";// ownername  like '%"+company+"%'   and description='SmartGrid' and status='-'"; 
	ResultSet rstcat1 = st5.executeQuery(sqlcat1);
	System.out.println("sql type "+sqlcat1);
	while(rstcat1.next())
	{	
		typ = rstcat1.getString("VehicleCode") ;
		if(typ.equals("-")){
			typnw="Other";
		}else
			typnw = rstcat1.getString("VehicleRegNumber") ;
            vehcode=rstcat1.getString("VehicleCode");
			
		if(null != type)
			{
			%>
			<option value="<%=vehcode%>" <% if(type.equals(typ)){loc=typnw;  %>Selected<% } %>><%=typnw%></option> 
			<%
			}else
			{
				%> <option  value="<%=vehcode%>" ><%=typnw %></option> <%
				type=typnw;
			}
			
	} 
	 %>
	</select>
	</font>
	</font>
	</div>
	</td>  
	
		
		<td>
		<%String tim=request.getParameter("dattim");
		System.out.println("tim"+tim);
		%>
		<div align="left"><font color="black" size="2" face="Arial"><font color="black"><b>Report By:</b>
		<select  name="dattim" id="dattim">
		<%if(tim==null)
		{
			tim=request.getParameter("time8");;
		}
		%>
  
             <% if(tim.equalsIgnoreCase("Snaptime")){%>
   
            <option value = "Snaptime" selected="selected">Snaptime</option>
            <option value="Storetime">Storetime</option> 
      
            <%}
             else if(tim.equalsIgnoreCase("Storetime"))
              {   %>
              
            <option value = "Storetime" selected="selected">Storetime</option>
            <option value="Snaptime">Snaptime</option> 
                   
<% }%>         	 
        </select></font>
        </font>
		</div>
		</td>
		<td>
		&nbsp;
		<input type="submit" name="Submit" button onclick="return chk();"  value="Submit" style="height: 30px; text-align: center; color: black" >
		</td>
		</tr>
		</table>
		
<br>
<br>
<% 
String Unitid="All";
 %>
 
 <%
 //out.println("The category is11 ==>"+category);
 if(null != category)
 {
	 if(category.equals("cam1") || category == "cam1")
	 {
	 	category = "('"+category+"')";
	 	cat11 = "cam1";
	 }else if(category.equals("cam2") || category == "cam2" ){
		 category = "('"+category+"')";
		 	cat11 = "cam2";
	 }else if(category.equals("cam3") || category == "cam3" ){
		 category = "('"+category+"')";
		 	cat11 = "cam3";
	 }
	 else  if(category.equals("cam4") || category == "cam4" ){
		 category = "('"+category+"')";
		 cat11 = "cam4";
	 }
	 
	 else
	 {
		 category = "('"+category+"')";
		 cat11 = "cam1,cam2,cam3,cam4";	 
	 }
		 
 }
 
 
 
 if(category.contains(")")  || category.contains("("))
	{
		
		category=category.replace(")","");
		category=category.replace("(","");
		category=category.replace("'","");
		
		
	}
  %>
</form>
</div>	

<%

 	
 	if(date1!=null || date2!=null){
			}
 	else
 	{

 		date1= new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(default_date_3)); 
 		date2= new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(default_date_1)); 
	
 	}
%>	

<%
	
			 //String condition = "And unitid = (select unitid from db_gps.t_vehicledetails where VehicleRegNumber = '"+VehNo1+"' and status='-' ) ";	

%>		 

<%
String time10=" ";
time10 = request.getParameter("time8");
/*   if(time10==null)
 {
 	time10="snaptime";
 }	 */
  
 if(time10==null){
	  
	  time10 = request.getParameter("dattim");
 }

 System.out.println("time10 is :-------->>>>>>>>>>" + time10);
 int count = 0;
 if(time10.equalsIgnoreCase("Storetime")){
	 
	//System.out.println("in if part -----------------------------------"+VehNo1);	
	String unitt = "";
	String vehid="";
	//category="cabin";
	/* String sqlunit = "select unitid,vehiclecode from db_gps.t_vehicledetails where VehicleRegNumber = '"+VehNo1+"' and status='-' ";
	System.out.println(" sqlunit "+ sqlunit);
	
	ResultSet rsunit = st2.executeQuery(sqlunit);
	//out.println(" sqlunit "+ sqlunit);
    if(rsunit.next())
    {
    	 unitt = rsunit.getString("unitid");		
    	 vehid = rsunit.getString("vehiclecode");
    } */
    
    //Get the count of images

String sqlcnt="";
if(category.equals("cam1,cam2,cam3,cam4")){
	if(request.getParameter("data")==null || request.getParameter("data1")==null ){
		sqlcnt = "Select count(*) as cnt from smartgrid.t_LocalStorage where jpgfiledatetime >= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").parse(from))+"' AND vehiclecode='"+unitid+"' ";
	}
else{
	// sqlcnt = "Select count(*) as cnt from smartgrid.t_LocalStorage where jpgfiledatetime >= '"+date1+" "+time1+"' AND jpgfiledatetime <= '"+date2+" "+time2+"' AND jpgfilename not like  '%pod%' "+condition+" ";
	 sqlcnt = "Select count(*) as cnt from smartgrid.t_LocalStorage where jpgfiledatetime >= '"+date1+" "+time1+"' AND vehiclecode='"+unitid+"' ";
}
}else{
	if(request.getParameter("data")==null || request.getParameter("data1")==null ){
		
		System.out.println("in Date null category:-"+category);
		System.out.println("in Date null category from:-"+from);
		System.out.println("in Date null category to:-"+to);
		if(category.equals("cam1,cam2,cam3,cam4"))
		{
			sqlcnt = "Select count(*) as cnt from smartgrid.t_LocalStorage where jpgfiledatetime >= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(from))+"' AND jpgfiledatetime <= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(to))+"' AND camerapos in ('cam1','cam2','cam3','cam4') AND vehiclecode='"+unitid+"'  ";
		System.out.println("sqlcnt==>"+sqlcnt);
		}
		else
		{
		//sqlcnt = "Select count(*) as cnt from smartgrid.t_LocalStorage where jpgfiledatetime >= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(from))+"' AND jpgfiledatetime <= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(to))+"' AND category in ('"+category+"') and type in ('"+type+"')  AND jpgfilename not like  '%pod%' "+condition+" ";
		sqlcnt = "Select count(*) as cnt from smartgrid.t_LocalStorage where jpgfiledatetime >= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(from))+"' AND jpgfiledatetime <= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(to))+"' AND camerapos in ('"+category+"')  AND vehiclecode='"+unitid+"' ";
		
		System.out.println("sqlcnt==>"+sqlcnt);
		}
		
		System.out.println("Count of Images "+sqlcnt);
	}else{
		System.out.println("Inelse");
		//sqlcnt = "Select count(*) as cnt from smartgrid.t_LocalStorage where jpgfiledatetime >= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(from))+"' AND jpgfiledatetime <= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(to))+"' AND category in ('"+category+"') and type in ('"+type+"')  AND jpgfilename not like  '%pod%' "+condition+" ";
		//sqlcnt = "Select count(*) as cnt from smartgrid.t_LocalStorage where jpgfiledatetime >= '"+date1+" "+time1+"' AND jpgfiledatetime <= '"+date2+" "+time2+"' AND category in ('"+category+"') and type in ('"+type+"')  AND jpgfilename not like  '%pod%' "+condition+" ";
	if(category.equals("cam1,cam2,cam3,cam4") || category.equals("cam1") || category.equals("cam2") || category.equals("cam3") || category.equals("cam4"))
		{
			//sqlcnt = "Select count(*) as cnt from smartgrid.t_LocalStorage where jpgfiledatetime >= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(from))+"' AND jpgfiledatetime <= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(to))+"' AND camerapos in ('cam1','cam2','cam3','cam4')  ";
		System.out.println("in category");
		sqlcnt = "Select count(*) as cnt from smartgrid.t_LocalStorage where jpgfiledatetime >= '"+date1+" "+time1+"' AND jpgfiledatetime <= '"+date2+" "+time2+"' AND camerapos in ('"+category+"')  AND vehiclecode='"+unitid+"' ";
		
		}
		
	else
		
	{	

		System.out.println(from);
		System.out.println(to);
	
	String f1=	new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(from));
	String f2=	new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(to));
	System.out.println("f1==>"+f1);
	System.out.println("f2==>"+f2);
	
	
	
		sqlcnt = "Select count(*) as cnt from smartgrid.t_LocalStorage where jpgfiledatetime >= '"+f2+"' AND jpgfiledatetime <= '"+f2+"' AND camerapos in ('"+category+"')  AND vehiclecode='"+unitid+"' ";

	
	}	
	
	}
	}

System.out.println("Count of Images "+sqlcnt);
ResultSet rscount = st3.executeQuery(sqlcnt);
//out.println("Count of Images "+sqlcnt);
if(rscount.next())
{
	count = rscount.getInt("cnt"); //mining job 
} 

System.out.println("count==>"+count);



 }
 
 else  
	//(Snaptime query for count----->>>) 
 {

		String unitt = "";
		String vehid="";
		//category="cabin";
		/* String sqlunit = "select unitid,vehiclecode from db_gps.t_vehicledetails where VehicleRegNumber = '"+VehNo1+"' and status='-' ";
		System.out.println(" sqlunit "+ sqlunit);
		
		ResultSet rsunit = st2.executeQuery(sqlunit);
		//out.println(" sqlunit "+ sqlunit);
	    if(rsunit.next())
	    {
	    	 unitt = rsunit.getString("unitid");		
	    	 vehid = rsunit.getString("vehiclecode");
	    } */
	    
	    //Get the count of images

	String sqlcnt="";
	if(category.equals("cam1,cam2,cam3,cam4")){
		if(request.getParameter("data")==null || request.getParameter("data1")==null ){
			sqlcnt = "Select count(*) as cnt from smartgrid.t_LocalStorage where snapdatetime >= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").parse(from))+"' AND vehiclecode='"+unitid+"' ";
		}
	else{
		// sqlcnt = "Select count(*) as cnt from smartgrid.t_LocalStorage where snapdatetime >= '"+date1+" "+time1+"' AND snapdatetime <= '"+date2+" "+time2+"' AND jpgfilename not like  '%pod%' "+condition+" ";
		 sqlcnt = "Select count(*) as cnt from smartgrid.t_LocalStorage where snapdatetime >= '"+date1+" "+time1+"' AND vehiclecode='"+unitid+"' ";
	}
	}else{
		if(request.getParameter("data")==null || request.getParameter("data1")==null ){
			
			System.out.println("in Date null category:-"+category);
			System.out.println("in Date null category from:-"+from);
			System.out.println("in Date null category to:-"+to);
			if(category.equals("cam1,cam2,cam3,cam4"))
			{
				sqlcnt = "Select count(*) as cnt from smartgrid.t_LocalStorage where snapdatetime >= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(from))+"' AND snapdatetime <= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(to))+"' AND camerapos in ('cam1','cam2','cam3','cam4') AND vehiclecode='"+unitid+"'  ";
			System.out.println("sqlcnt==>"+sqlcnt);
			}
			else
			{
			//sqlcnt = "Select count(*) as cnt from smartgrid.t_LocalStorage where snapdatetime >= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(from))+"' AND snapdatetime <= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(to))+"' AND category in ('"+category+"') and type in ('"+type+"')  AND jpgfilename not like  '%pod%' "+condition+" ";
			sqlcnt = "Select count(*) as cnt from smartgrid.t_LocalStorage where snapdatetime >= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(from))+"' AND snapdatetime <= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(to))+"' AND camerapos in ('"+category+"')  AND vehiclecode='"+unitid+"' ";
			
			System.out.println("sqlcnt==>"+sqlcnt);
			}
			
			System.out.println("Count of Images "+sqlcnt);
		}else{
			System.out.println("Inelse");
			//sqlcnt = "Select count(*) as cnt from smartgrid.t_LocalStorage where snapdatetime >= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(from))+"' AND snapdatetime <= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(to))+"' AND category in ('"+category+"') and type in ('"+type+"')  AND jpgfilename not like  '%pod%' "+condition+" ";
			//sqlcnt = "Select count(*) as cnt from smartgrid.t_LocalStorage where snapdatetime >= '"+date1+" "+time1+"' AND snapdatetime <= '"+date2+" "+time2+"' AND category in ('"+category+"') and type in ('"+type+"')  AND jpgfilename not like  '%pod%' "+condition+" ";
		if(category.equals("cam1,cam2,cam3,cam4") || category.equals("cam1") || category.equals("cam2") || category.equals("cam3") || category.equals("cam4"))
			{
				//sqlcnt = "Select count(*) as cnt from smartgrid.t_LocalStorage where snapdatetime >= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(from))+"' AND snapdatetime <= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(to))+"' AND camerapos in ('cam1','cam2','cam3','cam4')  ";
			System.out.println("in category");
			sqlcnt = "Select count(*) as cnt from smartgrid.t_LocalStorage where snapdatetime >= '"+date1+" "+time1+"' AND snapdatetime <= '"+date2+" "+time2+"' AND camerapos in ('"+category+"')  AND vehiclecode='"+unitid+"' ";
			
			}
			
		else
			
		{	

			System.out.println(from);
			System.out.println(to);
		
		String f1=	new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(from));
		String f2=	new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(to));
		System.out.println("f1==>"+f1);
		System.out.println("f2==>"+f2);
		
		
		
			sqlcnt = "Select count(*) as cnt from smartgrid.t_LocalStorage where snapdatetime >= '"+f2+"' AND snapdatetime <= '"+f2+"' AND camerapos in ('"+category+"')  AND vehiclecode='"+unitid+"' ";

		
		}	
		
		}
		}

	System.out.println("Count of Images "+sqlcnt);
	ResultSet rscount = st3.executeQuery(sqlcnt);
	//out.println("Count of Images "+sqlcnt);
	if(rscount.next())
	{
		count = rscount.getInt("cnt"); //mining job 
	} 

	System.out.println("count==>"+count);

	 
 }

%> 



<%

try{
if(count > 0) {

%>
<br>
<br>
 <div align="center" >
 <table  style="width: 70%;">
<tr style="background-color: white;">
<td align = "right" colspan="8" style="background-color: white;"><div align="right" style="background-color: white;"><font size="2" face="Arial" ><%-- <a href="CameraImageReport.jsp?data=<%=date1+time1 %>&data1=<%= date2+time2%>&VehNo1=<%= VehNo1%>&category=<%=category %>&type=<%=type %>" target="_blank" >Detailed Report</a> --%></font></div></td>
</tr>
</table>
<table  style="width: 70%;">

<tr>
		<td>
			 <div align="center"><font color="black" size="2" face="Arial"> <b>From:</b>
			 	<% if(request.getParameter("data")==null || request.getParameter("data1")==null){ %>
			 	<%=from%>
			 	<%}else{ %>
			 	<%= new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(date1+time1))  %></font>
			 	<%} %>
			 </div>
		</td>
		<td>
			 <div align="left"><font color="black" size="2" face="Arial"> <b>To:</b>
			 <% if(request.getParameter("data")==null || request.getParameter("data1")==null){ %>
			 <%=to%>
			 <%}else{ %>
			 <%= new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(date2+time2)) %></font>
			 <%} %>
			 </div>
		</td>
		
		<td align =left>
			<div align="left"><font color="black" size="2" face="Arial"> <b>Location:</b>
			<%=loc %><%-- <%=type %> --%></font>
			 </div>
		</td>
		<td align =left>
			<div align="left"><font color="black" size="2" face="Arial"> <b>Category:</b>
		<%=category%></font>
			 </div>
			
			
		<td align =left>
			<div align="left"><font color="black" size="2" face="Arial"> <b>Total:</b>
			<%=count %></font>
			 </div>
		</td>
		

</tr>
</table>
</div>
<div class="form" style="margin-left: 2%;margin-top: 2%;">
 <table id="example" class="display" style="width:100%" cellspacing="0" >
 <thead>
 <tr>
			
			<th  style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: center; background-color: #424658; color: white;">Sr No</th>
			<th  style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: center; background-color: #424658; color: white;">Location</th>
			<th style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: center; background-color: #424658; color: white;">File Name</th>
			<th  style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: center; background-color: #424658; color: white;">File Date and Time</th>
			
	</tr>		
			
 </thead>
 <tbody>
 
     <% 
     String sql="";
if(time10.equalsIgnoreCase("Storetime")){
    	 
   
	if(category.equals("cam1,cam2,cam3,cam4") ){
		//category="Cabin";
	System.out.println("Hi");
	if(request.getParameter("data")==null || request.getParameter("data1")==null){
		sql = "Select vehicleregnumber,rawfilename,unitid,jpgfilename, jpgfiledatetime from smartgrid.t_LocalStorage where jpgfiledatetime >= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(from))+"' AND camerapos in ('cam1','cam2','cam3','cam4') AND jpgfiledatetime <= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(to))+"'  AND vehiclecode='"+unitid+"' Order by jpgfiledatetime ASC";
	}
	else{
		
	
		// sql = "Select unitid,jpgfilename,rawfiledatetime, jpgfiledatetime from smartgrid.t_LocalStorage where jpgfiledatetime >= '"+date1+time1+"' AND jpgfiledatetime <= '"+date2+time2+"'  AND jpgfilename not like  '%pod%' "+condition+" Order by jpgfiledatetime ASC";	
	 sql = "Select vehicleregnumber,rawfilename,unitid,jpgfilename, jpgfiledatetime from smartgrid.t_LocalStorage where jpgfiledatetime >= '"+date1+time1+"' AND camerapos in ('cam1') AND jpgfiledatetime <= '"+date2+time2+"'  AND unitid='"+unitid+"' Order by jpgfiledatetime ASC";
	         
	}}else{
		
	if(request.getParameter("data")==null || request.getParameter("data1")==null){
		System.out.println("in Date null");
	//	sql = "Select unitid,jpgfilename,rawfiledatetime, jpgfiledatetime from smartgrid.t_LocalStorage where jpgfiledatetime >= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(from))+"' AND jpgfiledatetime <= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(to))+"' AND category in ('"+category+"') and type in ('"+type+"')  AND jpgfilename not like  '%pod%' "+condition+" Order by jpgfiledatetime ASC";
		sql = "Select vehicleregnumber,rawfilename,unitid,jpgfilename, jpgfiledatetime from smartgrid.t_LocalStorage where jpgfiledatetime >= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(from))+"' AND jpgfiledatetime <= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(to))+"' AND camerapos in ('"+category+"')  AND vehiclecode ='"+type+"' Order by jpgfiledatetime ASC";
		
	}else{
		
	System.out.println("Inbellow else");
		//sql = "Select unitid,jpgfilename,rawfiledatetime, jpgfiledatetime from smartgrid.t_LocalStorage where jpgfiledatetime >= '"+date1+time1+"' AND jpgfiledatetime <= '"+date2+time2+"' AND category in ('"+category+"') and type in ('"+type+"')  AND jpgfilename not like  '%pod%' "+condition+" Order by jpgfiledatetime ASC";
	sql = "Select vehicleregnumber,rawfilename,unitid,jpgfilename, jpgfiledatetime from smartgrid.t_LocalStorage where jpgfiledatetime >= '"+date1+time1+"' AND jpgfiledatetime <= '"+date2+time2+"' AND camerapos in ('"+category+"') AND vehiclecode='"+unitid+"' Order by jpgfiledatetime ASC";
		}
	
	}
	System.out.println("The sql in if==>"+sql);
 
}

else //(SQL QUERY FOR SNAPTIME------------>>>>)
	
{
	
	
	if(category.equals("cam1,cam2,cam3,cam4") ){
		//category="Cabin";
	System.out.println("Hi");
	if(request.getParameter("data")==null || request.getParameter("data1")==null){
		sql = "Select vehicleregnumber,rawfilename,unitid,jpgfilename, snapdatetime from smartgrid.t_LocalStorage where snapdatetime >= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(from))+"' AND camerapos in ('cam1','cam2','cam3','cam4') AND snapdatetime <= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(to))+"'  AND vehiclecode='"+unitid+"' Order by snapdatetime ASC";
	}
	else{
		
	
		// sql = "Select unitid,jpgfilename,rawfiledatetime, snapdatetime from smartgrid.t_LocalStorage where snapdatetime >= '"+date1+time1+"' AND snapdatetime <= '"+date2+time2+"'  AND jpgfilename not like  '%pod%' "+condition+" Order by snapdatetime ASC";	
	 sql = "Select vehicleregnumber,rawfilename,unitid,jpgfilename, snapdatetime from smartgrid.t_LocalStorage where snapdatetime >= '"+date1+time1+"' AND camerapos in ('cam1') AND snapdatetime <= '"+date2+time2+"'  AND unitid='"+unitid+"' Order by snapdatetime ASC";
	         
	}}else{
		
	if(request.getParameter("data")==null || request.getParameter("data1")==null){
		System.out.println("in Date null");
	//	sql = "Select unitid,jpgfilename,rawfiledatetime, snapdatetime from smartgrid.t_LocalStorage where snapdatetime >= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(from))+"' AND snapdatetime <= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(to))+"' AND category in ('"+category+"') and type in ('"+type+"')  AND jpgfilename not like  '%pod%' "+condition+" Order by snapdatetime ASC";
		sql = "Select vehicleregnumber,rawfilename,unitid,jpgfilename, snapdatetime from smartgrid.t_LocalStorage where snapdatetime >= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(from))+"' AND snapdatetime <= '"+new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(to))+"' AND camerapos in ('"+category+"')  AND vehiclecode ='"+type+"' Order by snapdatetime ASC";
		
	}else{
		
	System.out.println("Inbellow else");
		//sql = "Select unitid,jpgfilename,rawfiledatetime, snapdatetime from smartgrid.t_LocalStorage where snapdatetime >= '"+date1+time1+"' AND snapdatetime <= '"+date2+time2+"' AND category in ('"+category+"') and type in ('"+type+"')  AND jpgfilename not like  '%pod%' "+condition+" Order by snapdatetime ASC";
	sql = "Select vehicleregnumber,rawfilename,unitid,jpgfilename, snapdatetime from smartgrid.t_LocalStorage where snapdatetime >= '"+date1+time1+"' AND snapdatetime <= '"+date2+time2+"' AND camerapos in ('"+category+"') AND vehiclecode='"+unitid+"' Order by snapdatetime ASC";
		}
	
	}
	System.out.println("The sql in if==>"+sql);

	
	
}
	
	
	
	
	int i=1;
	ResultSet rs = st.executeQuery(sql);
	ResultSet rs0 = st6.executeQuery(sql);
	if(rs0.next())
	{
		
		while(rs.next())
		{
 %>		
		<tr>
		<td align="right"><%=i %></td>
		<td align ="left"><%=loc %></td>
		<td style="text-align:right;font:normal 13px Arial,Helvtica,sans-serif;"><%=rs.getString("jpgfilename") %></td>
		<%if(time10.equalsIgnoreCase("Storetime")){ %>
		<td align="right"><%= new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rs.getString("jpgfiledatetime")))%></td>
	<%}else { %>
	
	    <td align="right"><%= new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rs.getString("snapdatetime")))%></td>
	<%} %>
	    </tr>	
				
	  <% 		
		
		i++;
		}
		
		
	}

}



else {%>

	      
<font color="white"><b> No data </b></font>     



<%}}


catch(Exception e)
{
e.printStackTrace();	
}

%>		

</tbody> 
 </table>
 
 <%@ include file="footer.jsp" %> 
  
 </div> 
</body>
</body>
</html>


