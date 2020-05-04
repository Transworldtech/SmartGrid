<%@ include file="headernew.jsp"%> 
 <%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@page import="java.text.DecimalFormat"%>

<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Local Storage Report</title>
   
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
	                        title: 'Local Storage Report-'+ " "+ "From"+ " "+$("#date_ex").val()+" "+"To"+" "+$("#date_ex1").val(),
	                        },
	                    {
	                        extend: 'pdf',
	                        title: 'Local Storage Report-'+ " "+ "From"+ " "+$("#date_ex").val()+" "+"To"+" "+$("#date_ex1").val(),
	                    },
	                    {
	                        extend: 'csv',
	                        title: 'Local Storage Report-'+ " "+ "From"+ " "+$("#date_ex").val()+" "+"To"+" "+$("#date_ex1").val(),
	                    },
	                    {
	                        extend: 'print',
	                        title: 'Local Storage Report-'+ " "+ "From"+ " "+$("#date_ex").val()+" "+"To"+" "+$("#date_ex1").val(),
	                    },
	                    {
	                        extend: 'copy',
	                        title: 'Local Storage Report-'+ " "+ "From"+ " "+$("#date_ex").val()+" "+"To"+" "+$("#date_ex1").val(),
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

<script type="text/javascript">
 function showFTPImage(imageName)
 {	
 	var url="http://twtech.in/SmartGrid/Media/"+imageName;

 	//var url="https://s3.ap-south-1.amazonaws.com/smartgridinfra/" +imageName;
 	testwindow1 = window.open(url,"Image", "width=500,height=500");
     testwindow1.moveTo(250,100);
 }
 												
 </script>
  
<link href="http://cdn.syncfusion.com/16.4.0.42/js/web/flat-azure/ej.web.all.min.css" rel="stylesheet" />
 <!-- <script src="http://cdn.syncfusion.com/js/assets/external/jquery-1.10.2.min.js"> </script>
  -->   <script src="http://cdn.syncfusion.com/16.4.0.42/js/web/ej.web.all.min.js"></script>
       
<script>
      $(function() {
    	/*  var date=new Date();
    	    var date1=new Date();
    	   
    	    date.setDate(date.getDate()-3);
    	    date1.setDate(date1.getDate()); 
    	        	        	     */
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
    	 /* var date=new Date();
    	    var date1=new Date();
    	   
    	    date.setDate(date.getDate()-3);
    	    date1.setDate(date1.getDate());  */
    	        	        	    
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
	  
	  
	   var dateStart=new Date(document.getElementById("date_ex").value).getTime();
	 	 var dateEnd=new Date(document.getElementById("date_ex1").value).getTime();
	 	   if(dateStart > dateEnd)
	     {
		 		swal('From Date Should Be Less Than To Date.'); 

	         return false; 
	     }
	         
	         return true;  
	         
	        
  }
 
</script>
   
 </head>
 <body style="background: #FFFFFF;">
<%! Connection conn = null;
	Statement st = null;
	Statement st1 = null;
	Statement st2 = null;
	Statement st3 = null;
	Statement st4 = null;
	Statement st5= null;
	Statement st6= null;
	Statement st7= null;
	Statement st8=null;
	/* String date1 = "";
	String date2 = ""; */
	String time1 = "";
	String time2 = "";
	
	String vehno="";
%>
<%
String from="",to="";%>
<%

	 String vehlist = session.getAttribute("vehlist").toString();
	
	System.out.println("Session Veh List :- "+vehlist);
	String date1 = "";
	String date2 = "";

	String date11 = "";
	String date22 = "";
	String date111 = "";
	String date222 = "";

	String time1 = "";
	String time2 = "";
	String  default_date_1="";
	String default_date_3="";

	String dateStart = "";
	String dateEnd = "";
	dateStart = request.getParameter("date_ex");
	dateEnd = request.getParameter("date_ex1");
	System.out.println("dateStart is ==>"+dateStart);

	System.out.println("dateEnd  is ==>"+dateEnd);

	if(dateStart==null){
	// To Date
	  default_date_1 = new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new Date());
	String  hh=new SimpleDateFormat("HH").format(new Date());

	int hh1=Integer.parseInt(hh);
	int hh2=hh1-2;
	// From Date
	 default_date_3 = new SimpleDateFormat("dd-MMM-yyyy ").format(new Date());


	String  default_date_5 = new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new Date());
	String  mm=new SimpleDateFormat("mm").format(new Date());

	int mm1=Integer.parseInt(mm);
	int mm2=mm1;




	default_date_3=default_date_3+""+hh2+":"+mm2;


	String defaultDate2 = new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new Date());
	System.out.println("The default date is(from date) ==>"+default_date_3);

	System.out.println("The default_date_1 (to date) is ==>"+default_date_1);

	date11=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(default_date_3)); 

	date22= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(default_date_1));

}
else
{
	
	date111=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(dateStart)); 

	date222= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(dateEnd));

 date1=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").parse(dateStart)); 

 date2= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").parse(dateEnd));

 System.out.println("The default date1 is ==>"+date1);

 System.out.println("The date2  is ==>"+date2);

}
	
	System.out.println("The default date11 is ==>"+date11);

	System.out.println("The date22  is ==>"+date22);
	System.out.println("The default date111 is ==>"+date111);

	System.out.println("The date222  is ==>"+date222);

	
%>	

<%
String company = "";
try{
	
	String frompage = request.getParameter("frompage");
	company = session.getAttribute("company").toString();
	//System.out.println("The vehicle list>>>>"+vehlist);
	
	/* String Vehiclecode = session.getAttribute("VehicleCode").toString();
				System.out.println("Session Veh Code :- "+Vehiclecode); */

	if(frompage!=null && frompage.equalsIgnoreCase("OS"))
	{
		String thedate = request.getParameter("date_ex");
		String thedate1 = request.getParameter("date_ex1");
		dateStart = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(thedate));
		from=dateStart;
		time1 = new SimpleDateFormat("HH:mm").format(new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(thedate));
		dateEnd = new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(thedate1));
		to=dateEnd;
		time2 = new SimpleDateFormat("HH:mm").format(new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(thedate1));
	}
	else
	{
		dateStart = request.getParameter("date_ex");
	 from=dateStart;
	 System.out.println("date1 "+dateStart);
	 time1 =":00";
	 dateEnd = request.getParameter("date_ex1");
	 to=dateEnd;
	 System.out.println("date2 "+dateEnd);
	 time2 = ":00";
	} 
	
	 Class.forName(MM_dbConn_DRIVER);
	 conn = DriverManager.getConnection(MM_dbConn_STRING1, MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
	 st = conn.createStatement();
	 st1 = conn.createStatement();
	 st2 = conn.createStatement();
	 st3 = conn.createStatement();
	 st4 = conn.createStatement();
	 st5 = conn.createStatement();
	 st6 = conn.createStatement();
	 st7 = conn.createStatement();
	 st8=conn.createStatement();

	 System.out.println("  Date1 ==>"+date1+ "Date2 ==>"+date2);

}catch(Exception e){
	System.out.println("Exception "+e);
}
%>
 <body>
<br>
 <br>
 <div id="head" name="head"  class="form" align="center" style="font-size: 16px;  " >
 
 <form id="camera_jpg_report" name="camera_jpg_report" action="" method="post"  " >
 <font id="head1" name="head1" face="san-serif" color="#333" size="3"><b>Local Storage Report</b></font>


<br></br>
<table  align="center"style="width:54%" cellspacing="10">
<tr>
	
	<td align="center"> <font color="black" style="font-size: 14px ; face:san-serif;"><b>From :</b></font>
</td>
<td>
 <input  type="text" id="date_ex" value="<%if(dateStart==null){ %><%=date11%><%}else{%><%=date111%><%}%>"></input>
</td>
<td>  
<font color="Black" style="font-size: 14px ; face:san-serif;"><b>To :</b></font>
</td>
<td>
<input  type="text" id="date_ex1" value="<%if(dateEnd==null){ %><%=date22%><%}else{%><%=date222%><%}%>"></input>
</td>
<td>
 <input type="submit" name="Submit" button onclick="return chk();" value="Submit" style="height: 30px; text-align: center; font-size: 14px; color: black">
 </td>
</tr>
</table>
</form>
</div>

<div class="form" style="margin-left: 2%;margin-top: 2%;">
<table id="example" class="display" style="width:100%" cellspacing="0" >
 <thead>
		 <tr>
			<th width ="5%" style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #424658; color: white;">Sr No</th>
		    <th width ="30%" style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #424658; color: white;">Customer</th>
			<th width ="15%" style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #424658; color: white;">Location</th>
			<th width ="10%" style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #424658; color: white;">Total Images</th>
			<th width ="10%" style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #424658; color: white;">Cam1</th>
			<th width ="10%" style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #424658; color: white;">Cam2</th>
            <th width ="10%" style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #424658; color: white;">Cam3</th>
             <th width ="10%" style="font-size: 14px ; face:san-serif; border: 1px solid #ddd; padding: 10px;padding-top: 12px;padding-bottom: 12px; text-align: left; background-color: #424658; color: white;">Cam4</th> 
			
			</tr>
</thead>
<tbody>
	<%
	String vehno="",vehcode="";
	String unitid="";
	
	 String type="";
	String typ1="";
	//type= request.getParameter("unitid");
	
	type= request.getParameter("vehcode");
	
	System.out.println("Type="+type); 
	//smartgrid.t_jpgsnapsmartgrid
	
	String uniquevehcode="";
	
	
	
	String typ = "";
	String typnw="";
	int vehcode1=0;
	String loc="";
	//String sqlcat1 = "Select DISTINCT(unitid) from smartgrid.t_jpgsnapsmartgrid order by unitid ASC";
	company = session.getAttribute("company").toString();
	
	String typevalue=session.getAttribute("typevalue").toString();
  System.out.println("typevalue on image four page:-"+typevalue);
	String TypeofUser=session.getAttribute("TypeofUser").toString();
	System.out.println("TypeofUser on image four page:-"+TypeofUser);
	if(TypeofUser.equalsIgnoreCase("Transporter"))
	{
	String sqlcat1 = "select distinct(VehicleRegNumber),VehicleCode  from db_gps.t_vehicledetails where ownername like '%"+company+"%' and description='SmartGrid' and status='-' ";
	System.out.println("sql type "+sqlcat1);
	ResultSet rstcat1 = st5.executeQuery(sqlcat1);
	System.out.println("sql type "+sqlcat1);
	while(rstcat1.next())
	{	
		typ = rstcat1.getString("VehicleRegNumber") ;
		if(typ.equals("-")){
			typnw="Other";
			vehcode1=0;
		}else
			typnw = rstcat1.getString("VehicleRegNumber") ;
             vehcode=rstcat1.getString("VehicleCode");
			
		if(null != type)
			{
			%>
		<%-- 	<option value="<%=vehcode%>"  --%><% if(type.equals(vehcode)){loc=typnw;uniquevehcode=vehcode; %>Selected<% } %>><!-- </option>  -->
			<%
			}else
			{
				%> <%-- <option  value="<%=vehcode%>" ></option>  --%><%
				//type=unitid;
				unitid=type;
			}
		
	} 
	System.out.println("UNIQUEVEHCODE IS ------->>>>>> "+ uniquevehcode);
	
	}
	else
		
	{
		
		String sqlcat1 = "select distinct(transporter),VehCode  from db_gps.t_group where gpname like '%"+typevalue+"%' ";
		//System.out.println("sql type "+sqlcat1);
		ResultSet rstcat1 = st5.executeQuery(sqlcat1);
		//System.out.println("sql type "+sqlcat1);
		while(rstcat1.next())
		{	
			typ = rstcat1.getString("transporter") ;
			if(typ.equals("-")){
				typnw="Other";
				vehcode1=0;
			}else
				typnw = rstcat1.getString("transporter") ;
	             vehcode=rstcat1.getString("VehCode");
				
			if(null != type)
			{
			 %>
			<option value="<%=vehcode%>" <% if(type.equals(vehcode)){loc=typnw;uniquevehcode=vehcode; %>Selected<% } %>> </option> 
				<%
				}else
				{
					%> <option  value="<%=vehcode%>" ></option> <%
					//type=unitid;
					unitid=type;
				}
				
		} 
		System.out.println("UNIQUEVEHCODE IS ------->>>>>> "+ uniquevehcode);
		
		
	}
	 %>

			<%
			int count=0;
		    
			String ownername="";
			String camerapos="",type2="",type3="",type4="",type5="",type6="",location="";
			String category="",category1="",category2="",category3="",category4="",category5="",category6="",category7="";
			int cnt1=0,cnt2=0,cnt3=0,cnt4=0,cnt5=0,cnt6=0,cnt7=0;
		String slotdate="";String time8=" ";
		 
			 if(dateStart==null)
		      { 
				  slotdate="select Concat(date,' ',time) as Datetime,duration from smartgrid.mediamaster where Concat(date,' ',time) between '"+date11+"'  and  '"+date22+"'  and company='"+company+"' order by  Concat(date,' ',time);";
					
		    	   
		    	  }else
		    	  {
		    		   slotdate="select Concat(date,' ',time) as Datetime,duration from smartgrid.mediamaster where Concat(date,' ',time) between '"+date1+"'  and  '"+date2+"'  and company='"+company+"' order by  Concat(date,' ',time);";
						
		    		  }
				String datetime="";
				String datetime1="";
				int duration=0;
				ResultSet slotdate1=st8.executeQuery(slotdate);

				String sql="";
				String sql1="";
				typevalue=session.getAttribute("typevalue").toString();
			
				TypeofUser=session.getAttribute("TypeofUser").toString();
	              System.out.println("TypeofUser----------->>" + TypeofUser );
       	 		  System.out.println("typevalue----------->>" + typevalue );
				  if(dateStart==null)
			      { 
			    	  
				if(TypeofUser.equalsIgnoreCase("Transporter"))
				{
				 
				 sql="select a.unitid,a.camerapos,b.OwnerName,b.vehiclecode,a.vehicleregnumber,count(*) as Totalimg,sum(if(camerapos='Cam1',1,0)) as Cam1,sum(if(camerapos='Cam2',1,0)) as cam2, sum(if(camerapos='Cam3',1,0)) as cam3, sum(if(camerapos='Cam4',1,0)) as cam4,sum(if(camerapos in ('Cam1','Cam2','Cam3','Cam4'),1,0)) as cam5 from smartgrid.t_LocalStorage  a left outer join db_gps.t_vehicledetails b on (a.vehiclecode=b.vehiclecode) where snapdatetime between '"+date11+"' and '"+date22+"'  and b.Status='-' and b.vehiclecode in "+vehlist+" group by VehicleCode ORDER BY VehicleCode";
				}
				
				else
				{
				sql="select a.unitid,a.camerapos,b.OwnerName as OwnerName ,b.vehiclecode as vehiclecode,a.vehicleregnumber,count(*) as Totalimg,sum(if(camerapos='Cam1',1,0)) as Cam1,sum(if(camerapos='Cam2',1,0)) as cam2, sum(if(camerapos='Cam3',1,0)) as cam3, sum(if(camerapos='Cam4',1,0)) as cam4,sum(if(camerapos in ('Cam1','Cam2','Cam3','Cam4'),1,0)) as cam5 from smartgrid.t_LocalStorage  a left outer join db_gps.t_vehicledetails b on (a.vehiclecode=b.vehiclecode) where snapdatetime between '"+date11+"' and '"+date22+"'   and b.vehiclecode in "+vehlist+" group by VehicleCode ORDER BY VehicleCode";
				}
			    	  }else
			    	  {
			       	  
				if(TypeofUser.equalsIgnoreCase("Transporter"))
				{
				 
				 sql="select a.unitid,a.camerapos,b.OwnerName,b.vehiclecode,a.vehicleregnumber,count(*) as Totalimg,sum(if(camerapos='Cam1',1,0)) as Cam1,sum(if(camerapos='Cam2',1,0)) as cam2, sum(if(camerapos='Cam3',1,0)) as cam3, sum(if(camerapos='Cam4',1,0)) as cam4,sum(if(camerapos in ('Cam1','Cam2','Cam3','Cam4'),1,0)) as cam5 from smartgrid.t_LocalStorage  a left outer join db_gps.t_vehicledetails b on (a.vehiclecode=b.vehiclecode) where snapdatetime between '"+date1+"' and '"+date2+"'  and b.Status='-' and b.vehiclecode in "+vehlist+" group by VehicleCode ORDER BY VehicleCode";
				}
				
				else
				{
				sql="select a.unitid,a.camerapos,b.OwnerName as OwnerName ,b.vehiclecode as vehiclecode,a.vehicleregnumber,count(*) as Totalimg,sum(if(camerapos='Cam1',1,0)) as Cam1,sum(if(camerapos='Cam2',1,0)) as cam2, sum(if(camerapos='Cam3',1,0)) as cam3, sum(if(camerapos='Cam4',1,0)) as cam4,sum(if(camerapos in ('Cam1','Cam2','Cam3','Cam4'),1,0)) as cam5 from smartgrid.t_LocalStorage  a left outer join db_gps.t_vehicledetails b on (a.vehiclecode=b.vehiclecode) where snapdatetime between '"+date1+"' and '"+date2+"'   and b.vehiclecode in "+vehlist+" group by VehicleCode ORDER BY VehicleCode";
				}
			    		  }
			
				
				  
				  System.out.println("SQL+++"+sql);
				ResultSet rs=st1.executeQuery(sql);
				while(rs.next())
				{
					
				 System.out.println("Viewership Report 1");	
				        time8="Snaptime";
				        System.out.println("time8 is----->>>>" + time8);	
						      
					    vehcode=rs.getString("vehiclecode");
					    unitid=rs.getString("vehicleregnumber");
						location=rs.getString("vehicleregnumber");
						ownername=rs.getString("OwnerName");
						cnt1=rs.getInt("cam1");
						cnt2=rs.getInt("cam2");
						cnt3=rs.getInt("cam3");
						cnt4=rs.getInt("cam4");
						cnt5=rs.getInt("cam5");
					
				
				%>
               <tr>
				
				<td  width ="5%"><div style="text-align:right;font:normal 13px Arial,Helvtica,sans-serif;"><%= ++count %></div></td>
				<td style="text-align: right;font:normal 13px Arial,Helvtica,sans-serif;"><div align="left"><%=ownername%>  </div></td>
				<td ><div style="text-align: left;font:normal 13px Arial,Helvtica,sans-serif; "><%= location %></div></td>
				
				  <%if(cnt5>0) { %>   
				   <%if(dateStart==null)
			          { %>
			          		   
			          		    <td style="text-align: right;font:normal 13px Arial,Helvtica,sans-serif;"><div align="right"><a href="cameraimagereportdetail1.jsp?data=<%=date11+time1%>&data1=<%=date22+time2%>&cat='cam1'&vehreg=<%=vehcode%>&time8=<%=time8%>" target="_blank"><%= cnt5%></a> </div></td>
			          		          
			    	    <%-- <td style="text-align: right;font:normal 13px Arial,Helvtica,sans-serif;"><div align="right"><a href="imagefour1.jsp?data=<%=date11+time1%>&data1=<%=date22+time2%>&vehreg=<%= unitid%>&vehcode=<%=vehcode%>&cat=cam1,cam2,cam3,cam4" target="_blank"><%= cnt5%></a> </div></td>
			    	    --%>
			    	     <%}else{%>
			    	     
			    	     
			          		      <td style="text-align: right;font:normal 13px Arial,Helvtica,sans-serif;"><div align="right"><a href="cameraimagereportdetail1.jsp?data=<%=date1+time1%>&data1=<%=date2+time2%>&cat='cam1'&vehreg=<%=vehcode%>&time8=<%=time8%>" target="_blank"><%= cnt5%></a> </div></td>
			    	     
			    	   
			    	 <%--  <td style="text-align: right;font:normal 13px Arial,Helvtica,sans-serif;"><div align="right"><a href="imagefour1.jsp?data=<%=date1+time1%>&data1=<%=date2+time2%>&vehreg=<%= unitid%>&vehcode=<%=vehcode%>&cat=cam1,cam2,cam3,cam4" target="_blank"><%= cnt5%></a> </div></td>
			    	  --%>   
			    		  <%} %>
				
				
				  <% } else { %>
				 <td style="text-align: right;font:normal 13px Arial,Helvtica,sans-serif;"><div align="right"> <font color="blue"><%= cnt5%> </font></div></td>
				<% }%>  
				
							
		
					<td style="text-align: right;font:normal 13px Arial,Helvtica,sans-serif;"><div align="right"><%= cnt1%></a></div></td>
				 
				<td style="text-align: right;font:normal 13px Arial,Helvtica,sans-serif;"><div align="right"><%= cnt2%></a></div></td>
				<%-- <td style="text-align: right;font:normal 13px Arial,Helvtica,sans-serif;"><div align="right"><a href="CameraSlideReport.jsp?data=<%=date1+time1 %>&data1=<%= date2+time2%>&Vehicle1=<%= vehno%>&cat=<%=category1 %>&type=<%=type1 %> " target="_blank"><%= cnt2%></a></div></td> --%>
				<td style="text-align: right;font:normal 13px Arial,Helvtica,sans-serif;"><div align="right"><%= cnt3%></a></div></td>
				<td style="text-align: right;font:normal 13px Arial,Helvtica,sans-serif;"><div align="right"><%= cnt4%></a></div></td>			
				</tr>
				<%
			 	}
			
            
                System.out.println("Viewership Report 2");    

				
                                 String TypeofUser1 = session.getAttribute("TypeofUser").toString();
                               //  System.out.println("TypeofUser1----------->>" + TypeofUser1 );
                      	 		String TypeofValue=session.getAttribute("typevalue").toString();
                      	 	 // System.out.println("TypeofValue----------->>" + TypeofValue );
                      	 		String sessionveh="";
                      	 		  if(TypeofUser1.equals("Transporter"))
                      	 		  {
                      	 			sessionveh="select distinct(vehiclecode) as vehiclecode from db_gps.t_vehicledetails where status='-' and ownername='"+TypeofValue+"'";        
                      	 		  }
                      	 		  else
                      	 		  {
                      	 			  sessionveh="select distinct(VehCode) as vehiclecode  from db_gps.t_group where GPName='"+TypeofValue+"' and Active='Yes' ";
                      	 		  }
                      	 		  
                      	 		  ResultSet rs_active = st1.executeQuery(sessionveh);
                      	 		  
                //      	 		  System.out.println("Veh List Query :- "+sessionveh);
                      	 		  String nonvehid="",nonvehid1="",nonvehid2="";
                      	 		  String vehid123="";
                      	 		  
                      	 		  while(rs_active.next())
                      	 		  {
                      	 			nonvehid1="";
                      	 			 vehid123=rs_active.getString("vehiclecode");
                      	 			 nonvehid="select vehiclecode from smartgrid.t_LocalStorage  where vehiclecode='"+vehid123+"' and snapdatetime between '"+dateStart+"' and '"+dateEnd+"'";
                      	 			 ResultSet rsnonvehid=st7.executeQuery(nonvehid);
                  //    	 			System.out.println("Non Veh Id Query :- "+nonvehid);
                      	 			 
                      	 			 if(!rsnonvehid.next()){
                      	 				nonvehid1=vehid123;
                      	 				nonvehid2=nonvehid2+","+nonvehid1;
                      	 			 }
                      	 				 
                      	 		  }
                      	 		
                      			// System.out.println("Non Veh Id :- "+nonvehid2);
                      			 String nonvehid3=nonvehid2.substring(1);
                      			 
                      			//System.out.println("Non Veh Id :- "+nonvehid3);
                      			
                      			String vehmaster="select * from db_gps.t_vehicledetails where vehiclecode in ("+nonvehid3+")";
                      			ResultSet rsvehmaster=st8.executeQuery(vehmaster);
                      			String unitid1="";
                      			String Owner="";
                      			String  vehicleregnumber1="";
                      			int cnt11=0,cnt21=0,cnt31=0,cnt41=0,cnt51=0;
                      			while(rsvehmaster.next())
                      			{
                      				unitid1=rsvehmaster.getString("UnitID");
                      				Owner=rsvehmaster.getString("OwnerName");
                      				vehicleregnumber1=rsvehmaster.getString("VehicleRegNumber");
                      			%> 
                                 
                     			<tr>	
                     				<td  width ="5%"><div style="text-align:right;font:normal 13px Arial,Helvtica,sans-serif;  "><%= ++count %></div></td>
                     				<td ><div style="text-align: left;font:normal 13px Arial,Helvtica,sans-serif; "><%= Owner %></div></td>
                     				<td ><div style="text-align: left;font:normal 13px Arial,Helvtica,sans-serif; "><%= vehicleregnumber1 %></div></td>
                     				<td style="text-align: right;font:normal 13px Arial,Helvtica,sans-serif;"><div align="right"><%= cnt51%></a></div></td>
                     				<td style="text-align: right;font:normal 13px Arial,Helvtica,sans-serif;"><div align="right"><%= cnt11%></a></div></td>
                     				 <td style="text-align: right;font:normal 13px Arial,Helvtica,sans-serif;"><div align="right"><%= cnt21%></a></div></td>
                     				<td style="text-align: right;font:normal 13px Arial,Helvtica,sans-serif;"><div align="right"><%= cnt31%></a></div></td>
                     				<td style="text-align: right;font:normal 13px Arial,Helvtica,sans-serif;"><div align="right"><%= cnt41%></a></div></td>
                     		
                     		
                     		</tr>		
                     		<% 	
                      			}
                      		%> 
	
	</tbody>
	</table>

 <%@ include file="footer.jsp" %>    

</div>

</body>
</body>
</html>

<%-- </jsp:useBean> --%>



	

   
