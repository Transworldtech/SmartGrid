  <%@ include file="headernew.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="css/cpanel_002_popup.css"> 
<link rel="stylesheet" type="text/css" href="css/cpanel_colors.css">
<link type="text/css" rel="stylesheet" href="style.css" />
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



div.absolute1 {
    position: absolute;
    left: 80px;
    width:100%;
    border:0;
}    


button.accordion {
    background-color: #eee;
    color: #444;
    cursor: pointer;
    padding: 18px;
    width: 100%;
    border: none;
    text-align: left;
    outline: none;
    font-size: 15px;
    transition: 0.4s;
}

button.accordion.active, button.accordion:hover {
    background-color: #ddd; 
}

div.panel {
    padding: 0 18px;
    display: none;
    background-color: white;
}



</style>






<body>



<script>
/* var acc = document.getElementsByClassName("accordion");

var i;

for (i = 0; i < acc.length; i++) {
    acc[i].onclick = function(){
        this.classList.toggle("active");
        var panel = this.nextElementSibling;
        if (panel.style.display === "block") {
            panel.style.display = "none";
        } else {
            panel.style.display = "block";
        }
    }
} */


function Displayer(n)
{var check = document.getElementById('Section'+n);
if(check.style.display == 'none')
{check.style.display='inline';}
else{check.style.display='none';}
}



</script>


<br>
<br>



<%

Class.forName(MM_dbConn_DRIVER);
Connection con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
Statement st=con1.createStatement();
Statement st1=con1.createStatement();
/* int countbus=0;
int countpole=0; */
/* String cntrbus=request.getParameter("cntbus");
String cntrpole=request.getParameter("cntpole");
String deviceidbus[];
String deviceidpole[]; */
try
{
	
	String type=request.getParameter("chk");
	String cntrbus="";
	String cntrpole="";
	if(type.equals("Both"))
	{
		 cntrbus=request.getParameter("cntbus");
		cntrpole=request.getParameter("cntpole");
		
		
		
	}	
	
	
	if(type.equals("Bus"))
	{
		 cntrbus=request.getParameter("cntbus");
		
	 cntrpole="0";
		
		
	}	
	
		
	if(type.equals("Pole"))
	{
		 cntrbus="0";
		
		cntrpole=request.getParameter("cntpole");
		
		
	}
	
	
	
	
	/* String cntrbus=request.getParameter("cntbus");
	String cntrpole=request.getParameter("cntpole"); */
	
	
	
	int countbus=Integer.parseInt(cntrbus);
	int countbus1=Integer.parseInt(cntrbus);
	int countpole=Integer.parseInt(cntrpole);
	int countpole1=Integer.parseInt(cntrpole);
if(countbus==0)
	{
	
		countbus=1;
		
	}	
	
	
	if(countpole==0)
	{
	
		countpole=1;
		
	} 	
		
	String deviceidbus[]=new String[countbus];
	 String deviceidpole[]=new String[countpole];
	
	
	
	for(int i=0;i<countbus;i++)
	{
		
		deviceidbus[i]=request.getParameter("Deviceidbus"+i);
	}
	
	for(int i=0;i<countpole;i++)
	{
		
		deviceidpole[i]=request.getParameter("Deviceidpole"+i);
	}
	
	
	
	
	
	
	
	
/* }

catch(Exception e)
{
	e.printStackTrace();
	
} */



/* String cntr=request.getParameter("cntr1");

int count=Integer.parseInt(cntr);
 */


String deviceid="";
String routename="";
/* String device[]=new String[count]; 
String route[]=new String[count];  */

String originbus[]=new String[countbus]; 
String destinationbus[]=new String[countbus]; 
String routebus[]=new String[countbus]; 
String locationbus[]=new String[countbus]; 

String tripstarttimebus[]=new String[countbus]; 
String tripendtimebus[]=new String[countbus];



String originpole[]=new String[countpole]; 
String destinationpole[]=new String[countpole]; 
String routepole[]=new String[countpole]; 
String locationpole[]=new String[countbus]; 

String tripstarttimepole[]=new String[countpole]; 
String tripendtimepole[]=new String[countpole];

originbus[0]="-";
destinationbus[0]="-";
locationbus[0]="-";
routebus[0]="-";
tripendtimebus[0]="-";	
tripstarttimebus[0]="-";
originpole[0]="-";
destinationpole[0]="-";
locationpole[0]="-";
routepole[0]="-";
tripendtimepole[0]="-";	
tripstarttimepole[0]="-";

int k=0;
int m=0;
System.out.println("Countbus==>"+countbus);
if(countbus1 > 0)
{
	for(int i=0;i<countbus;i++)
	{
		
		String query1="Select Origin,Destination,Routename,TripEndTime,TripStartTime,(Select Location from smartgrid.t_polmaster where Deviceid='"+deviceidbus[i]+"') as Location from smartgrid.t_routemaster a where Vehiclecode='"+deviceidbus[i]+"'";	
  System.out.println("Query===>"+query1);
		ResultSet rs1=st.executeQuery(query1);
		while(rs1.next())
			
		{
			
			originbus[k]=rs1.getString("Origin");
			destinationbus[k]=rs1.getString("Destination");
			locationbus[k]=rs1.getString("Location");
			routebus[k]=rs1.getString("Routename");
			tripendtimebus[k]=rs1.getString("TripEndTime");	
		    tripstarttimebus[k]=rs1.getString("TripStartTime");
		     k++;
			
		}
		
		
		
		
	}
}	
		
else
	
	
{
	
	originbus[0]="-";
	destinationbus[0]="-";
	locationbus[0]="-";
	routebus[0]="-";
	tripendtimebus[0]="-";	
    tripstarttimebus[0]="-";

	
}	
	
		
System.out.println("Countpole==>"+countpole);
/* originpole[0]="-";
destinationpole[0]="-";
locationpole[0]="-";
routepole[0]="-";
tripendtimepole[0]="-";	
tripstarttimepole[0]="-"; */

if(countpole1 > 0)
{
	
	
	for(int i=0;i<countpole;i++)
	{
		System.out.println("countpole==>"+countpole);
		String query1="Select Originroute,Destinationroute,Location,TripStartTime,TripEndTime,Route from smartgrid.t_polmaster where Deviceid='"+deviceidpole[i]+"'";	
  
		System.out.println("Query===>"+query1);
		ResultSet rs2=st1.executeQuery(query1);
	
	 if(rs2.next())
			
		{
			
			originpole[m]=rs2.getString("Originroute");
			destinationpole[m]=rs2.getString("Destinationroute");
			locationpole[m]=rs2.getString("Location");
			routepole[m]=rs2.getString("Route");
			tripendtimepole[m]=rs2.getString("TripEndTime");	
		    tripstarttimepole[m]=rs2.getString("TripStartTime");
		    
		     System.out.println("M==>"+m);
			
		}
	 else
	 {
		 originpole[m]="-";
			destinationpole[m]="-";
			locationpole[m]="-";
			routepole[m]="-";
			tripendtimepole[m]="-";	
		    tripstarttimepole[m]="-";
		
		
		
		
	}
	 
	 
	 //m++;
	}
	m++;
}	

else
{
	originpole[0]="-";
	destinationpole[0]="-";
	locationpole[0]="-";
	routepole[0]="-";
	tripendtimepole[0]="-";	
    tripstarttimepole[0]="-";
	
	
}	
	
	
	
	











System.out.println("Countpole==>"+countpole);

%>


<div    align="center" class="absolute1" style="width: 70%">



<div >
<h2   style="background: #485682; color: #ffffff; cursor: pointer; align:left;"
				onClick="Displayer(1)">&nbsp;+ 1. Bus Booking&nbsp;</h2>
<table class="sortable" id="Section1" style="width=70%; display: none;">
<tr>
<th width ="5%">Sr No</th>
		    <th width ="30%">Vehicle/Location</th>
		  <th width ="15%">Origin</th>
		   <th width ="15%">Destination</th>
			<th width ="15%">Route</th>
			<th width ="10%">Trip Start Time</th>
			<th width ="10%">Trip End Time</th>
		
			
			<%for(int i=0;i<countbus;i++)
{ %>
			<tr>
			<td><%=i+1%></td>
			<td><%=locationbus[i]%></td>
			<td><%=originbus[i] %></td>
			<td><%=destinationbus[i] %></td>
			
			<td><%=routebus[i] %></td>
			<td><%=tripstarttimebus[i] %></td>
			<td><%=tripendtimebus[i] %></td>
		
			
			
			
			
			
			</tr>
	

		<%} %>
		


</table>
<br><br><br>
</div>

<div >
<h2   style="background: #485682; color: #ffffff; cursor: pointer; align:left;"
				onClick="Displayer(2)">&nbsp;+ 2. Pole Details&nbsp;</h2>
<table class="sortable" id="Section2" style="width=70%; display: none;">
<tr>
<th width ="5%">Sr No</th>
		    <th width ="30%">Vehicle/Location</th>
		  <th width ="15%">Origin</th>
		   <th width ="15%">Destination</th>
			<th width ="15%">Route</th>
			<th width ="10%">Trip Start Time</th>
			<th width ="10%">Trip End Time</th>
		
			<%int l=1; %>>
			<%for(int i=0;i<m;i++)
{ %>
			<tr>
			<td><%=l+i%></td>
			<td><%=locationpole[i]%></td>
			<td><%=originpole[i] %></td>
			<td><%=destinationpole[i] %></td>
			
			<td><%=routepole[i] %></td>
			<td><%=tripstarttimepole[i] %></td>
			<td><%=tripendtimepole[i] %></td>
		
			
			
			
			
			
			</tr>
	

		<%} %>
		


</table>
<br><br><br>
</div>






<!-- </div> -->

<% 




}

catch(Exception e)
{
	e.printStackTrace();
	
}



%>


</div>


</body>
</html>