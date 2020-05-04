<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="headernew.jsp"%>
<%!
Connection con1;
%>


<%
System.out.println("MM_dbConn_DRIVER--->"+MM_dbConn_DRIVER);
System.out.println("MM_dbConn_STRING--->"+MM_dbConn_STRING);
System.out.println("MM_dbConn_STRING--->"+MM_dbConn_USERNAME);
System.out.println("MM_dbConn_STRING--->"+MM_dbConn_PASSWORD);
		Class.forName(MM_dbConn_DRIVER);
		con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
		Statement st = null, st1 = null, st3 = null, st4 = null,st2 = null;
        st = con1.createStatement();
		st1 = con1.createStatement();
		st2 = con1.createStatement();
		st3 = con1.createStatement();
		st4 = con1.createStatement();
		System.out.println("ok");
		
%>

   <style>
 
    
    
    table.tbh {
    border-collapse: collapse;
}

 table.tbh
 {
  border: 1px solid black;
 }
 th.tbh {
    border: 1px solid black;
   color:  white;
    background-color: #3a3f51;
}
td.tbh {
    border: 1px solid black;
  	/* background-color: #f37a4d; */
	color:  #3a3f51;
}
    
   

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
   margin-left: 30px;
    width:100%;
    border:0;
}    
</style>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<link rel="stylesheet" type="text/css" href="css/jquery-ui-1.8.13.custom.css"></link>
<link rel="stylesheet" type="text/css" href="css/ui.dropdownchecklist.themeroller.css"></link>
 <script type="text/javascript" src="Jquery/jquery-1.6.1.min.js"></script>
    <script type="text/javascript" src="Jquery/jquery-ui-1.8.13.custom.min.js"></script>
 
     <script type="text/javascript" src="Jquery/ui.dropdownchecklist.js"></script> 




</head>
<body>



<script>
function showexpence() {
  	

//	  alert("state"+state);
	  
	  
	   
if(document.getElementById('multiselect2').value.length==0)
{
alert("Please Select State");
return false;
}
	  
if(document.getElementById('multiselect1').value.length==0)
{
alert("Please Select City");
return false;
}


if(document.getElementById('multiselect').value.length==0)
{
alert("Please Select Area");
return false;
}
	  
	  

	  var state = [];
	    var s = document.getElementById("multiselect2");
	    
	   
	   
	    if(s=="") //for text use if(strUser1=="Select")
	    {
	    alert("Please select a state");
	    return false;
	    }
	    
	    
	    for (var i = 0; i < s.options.length; i++) {
	       
	    
	    	
	    	if (s.options[i].selected == true) {
	            var stateid = s.options[i].value;
	            state.push(stateid);
	        }
	       
	        
	    }
	    
	var state1=state;

	 
	
	var city = [];
	    var s = document.getElementById("multiselect1");
	    for (var i = 0; i < s.options.length; i++) {
	        if (s.options[i].selected == true) {
	            var cityid = s.options[i].value;
	            city.push(cityid);
	        }
	        
	    }
	    
	var city1=city;

	  var area = [];
	    var s = document.getElementById("multiselect");
	    for (var i = 0; i < s.options.length; i++) {
	        if (s.options[i].selected == true) {
	            var areaid = s.options[i].value;
	            area.push(areaid);
	        }
	       
	    }
	    
	var area1=area;
    
    
    window.location.replace("BothBooking.jsp?state="+state1+"&city="+city1+"&area="+area1+"&chk=Both");

}

</script>

 <script type="text/javascript">
    $(document).ready(function() {
        
     $("#multiselect").dropdownchecklist( {
onItemClick: function(checkbox, selector){
 var justChecked = checkbox.prop("checked");

 var checkCount = (justChecked) ? 1 : -1;

 for( i = 0; i < selector.options.length; i++ ){
  if ( selector.options[i].selected ) checkCount += 1;
  

  
 }
    if ( checkCount > 20 ) {
  alert( "Limit is 20 Area to choose" );
  throw "too many";
 }
    
    
},width: 250 
            });    
    });
    
    
    
   
    
    
    
    $(document).ready(function() {
        
        $("#multiselect1").dropdownchecklist( {
   onItemClick: function(checkbox, selector){
    var justChecked = checkbox.prop("checked");

    var checkCount = (justChecked) ? 1 : -1;

    for( i = 0; i < selector.options.length; i++ ){
     if ( selector.options[i].selected ) checkCount += 1;
     

     
    }
       if ( checkCount > 20 ) {
     alert( "Limit is 20 City to choose" );
     throw "too many";
    }
       
       
   },width: 250 
               });    
       });
    
    
    
 $(document).ready(function() {
        
        $("#multiselect2").dropdownchecklist( {
   onItemClick: function(checkbox, selector){
    var justChecked = checkbox.prop("checked");

    var checkCount = (justChecked) ? 1 : -1;

    for( i = 0; i < selector.options.length; i++ ){
     if ( selector.options[i].selected ) checkCount += 1;
     

     
    }
       if ( checkCount > 20 ) {
     alert( "Limit is 20 State to choose" );
     throw "too many";
    }
       
       
   },width: 250 
               });    
       });
    
    </script>



 <script>

//  "&id"+i+"="
 
 function changeAction() {

	 var cntr=document.getElementById("cntr").value;
	 var cntr1=document.getElementById("cntr1").value;
		var url1="";
		var i1=0;
	      for(var j1=1;j1<=cntr;j1++)
	    	{	
	   		if(document.getElementById("chkbus"+j1).checked==true)
			   {
	   			
	   		 url1=url1+"&bus"+i1+"="+document.getElementById("Deviceidbus"+j1).value;
			 i1++;
	           }
	        }
	
	      if(cntr1!=null)
	    	  {
	    	 var url="";
	    	 var i=i1;
// 	    	 alert("i:-"+i);
	    	for(var j=1;j<=cntr1;j++)
		    	{	
	           if(document.getElementById("chkpole"+j).checked==true)
	    		  {
	    			  
	    			  url=url+"&bus"+i+"="+document.getElementById("Deviceidpole"+j).value;
	    			  
	    			  i++;
	    		  }
		        }
	    	 }
	      
	      
	      var valid=i+i1;
	      
	      if(valid=="0")
	    	  {
	    	  alert("Please select check-box");
	    	  return false;
	    
	    	  }
	      
	      
	      var urladdition=url1+url;
	      
	         document.rohit.action ="FinalBus.jsp?chk=Both"+urladdition+"&cnt="+i;
  	       	 document.rohit.submit();
 }
 

 
 
 
 
 
 function checkUncheckAll(sender) {
	    var chkElements = document.getElementsByName('chkbus');
	    for (var i = 0; i < chkElements.length; i++) {
	        chkElements[i].checked = sender.checked;
	    }
	}
	function checkUnCheckParent() {
	    var chkHeader = document.getElementById('allchk');
	    var chkElements = document.getElementsByName('chkbus');
	    var checkedCount = 0;
	    for (var i = 0; i < chkElements.length; i++) {
	        if (chkElements[i].checked) {
	            checkedCount += 1;
	        }
	    }
	    chkHeader.checked = (checkedCount === chkElements.length);
	}
 
 </script>



<br>
<br>
<br>

<center>
<tr>
<td>
	<div style="margin-center: 200px">
	<font size="3"><B>Bus and Pole Booking</B></font></div>
	</td>
</tr>

</center>

<br>
<br>
<form name="rohit" method="post">


<div class="absolute1" align="center" >


<table width="90%">




<tr>
    <td>
State :<select  id="multiselect2" class="multiselect"  multiple >
				
						<% String sqlDropdown2="SELECT Distinct(State) FROM smartgrid.t_polmaster where AssetType in ('Bus','Pole')";
				  			ResultSet rsDropdown2=st2.executeQuery(sqlDropdown2);
				  			System.out.println("sql2:-"+sqlDropdown2);
				 			 while(rsDropdown2.next()){
				  		%>
				  	<option value="<%=rsDropdown2.getString(1)%>"><%=rsDropdown2.getString(1)%></option>
				<%}%> 

            	</select>
            	</td>
           <td> 
City:<select  id="multiselect1" class="multiselect"  multiple  style='display: block;' >
       <% String sqlDropdown1="SELECT Distinct(City) FROM smartgrid.t_polmaster where AssetType in ('Bus','Pole')";
				  			ResultSet rsDropdown1=st2.executeQuery(sqlDropdown1);
				  			System.out.println("sql1:-"+sqlDropdown1);
				  			while(rsDropdown1.next()){
				  		%>
				  	<option value="<%=rsDropdown1.getString(1)%>"><%=rsDropdown1.getString(1)%></option>
					<% 	}%> 
     
  </select>
  
         </td>
      <td> 
Area:<select  id="multiselect" class="multiselect"  multiple  style='display: block;' >
       <% String sqlDropdown4="SELECT Distinct(Area) FROM smartgrid.t_polmaster where AssetType in ('Bus','Pole')";
				  			ResultSet rsDropdown4=st2.executeQuery(sqlDropdown4);
				  			System.out.println("sql1:-"+sqlDropdown4);
				  			while(rsDropdown4.next()){
				  		%>
				  	<option value="<%=rsDropdown4.getString(1)%>"><%=rsDropdown4.getString(1)%></option>
					<% 	}%> 
     
  </select>
  
         </td>
	
	
	
	
		
	
	<td  style="text-align: right;">
			<input id="saveForm" name="submit" class="button_text"   type="button"  value="Show" onclick="showexpence();return false;" />
				</td>	
	
	</tr>
		
		
		
		
</table>
<br>
</div>

<br>
<br>
<br>
<br>
<div class="absolute1" align="center" >


 <table  class="tbh" width="95%" >
<tr class="tbh">
                      
						 <th class="tbh">
						<input type="checkbox" name="allchk" id="allchk" onclick="checkUncheckAll(this);" ></input>
						</th>
						<th class="tbh">
						SrNo
						</th>
						<th class="tbh">
						BusType
						</th>
                        <th class="tbh">
						Audience
						</th>
						 <th class="tbh">
						RouteFrom
						</th>
					   <th class="tbh">
						RouteTo
						</th>
						<th class="tbh">
						Duration
						</th>
						<th class="tbh">
						TripStartTime
						</th>
						<th class="tbh">
						TripEndTime
						</th>    
			        </tr>
						<% int j=1;
					
						 String Sqlday="";
						 String Sqlday1="";
						 if(request.getParameter("chk")!=null)
						 {
				if(request.getParameter("chk").equalsIgnoreCase("Both"))
				{
				
					
					
					
					
					String Area=request.getParameter("area");
					System.out.println("Area:="+Area);
					String ar1="";
					String area1[]=Area.split(",");
					for(String s1:area1)
					{
						ar1+="'"+s1+"'"+",";
					}
					
					if(ar1.endsWith(","))
					{
						ar1=ar1.substring(0,ar1.length()-1);
					}
					
					System.out.println(""+ar1);
					
					
					String City=request.getParameter("city");
					System.out.println("City:="+City);
					
					
					String ar2="";
					String city1[]=City.split(",");
					for(String s2:city1)
					{
						ar2+="'"+s2+"'"+",";
					}
					
					if(ar2.endsWith(","))
					{
						ar2=ar2.substring(0,ar2.length()-1);
					}
					
					System.out.println(""+ar2);
					
					
					String State=request.getParameter("state");
					System.out.println("State:="+State);
					
					
					String ar3="";
					String state1[]=State.split(",");
					for(String s3:state1)
					{
						ar3+="'"+s3+"'"+",";
					}
					
					if(ar3.endsWith(","))
					{
						ar3=ar3.substring(0,ar3.length()-1);
					}
					
					System.out.println(""+ar3);
					
					
					
					
					
				 //Sqlday="select * from smartgrid.t_polmaster where state='"+request.getParameter("state")+"' and city='"+request.getParameter("city")+"' and AssetType='Bus' and status='1' ";
		         Sqlday="select a.Origin,a.Destination,b.polid,b.Deviceid,b.duration,b.End_customer,b.BusType,a.TripStartTime,a.TripEndTime,b.area,b.city  from  smartgrid.t_routemaster a inner join smartgrid.t_polmaster b on a.Vehiclecode=b.Vehiclecode where b.state in ("+ar3+") and b.city in ("+ar2+") and b.area in ("+ar1+") and b.AssetType in ('Bus')  ";
		         
		         
		        Sqlday1="select a.Origin,a.Destination,b.polid,b.Deviceid,b.Deviceid,b.End_customer,b.area,b.city  from  smartgrid.t_routemaster a inner join smartgrid.t_polmaster b on a.Vehiclecode=b.Vehiclecode where b.city in ("+ar2+") and b.area in ("+ar1+")  and b.AssetType='Pole'";  
		         
		       
	}
				
						 
	ResultSet rst2= st4.executeQuery(Sqlday);
	System.out.println("For Bus:-"+Sqlday);
	int i=0;
	while(rst2.next())

	{ %>
		<tr class="tbh">
<td class="tbh" align='left'><div align='left'><input type="checkbox" name="chkbus" id="chkbus<%=j%>"  value="chkbus<%=j%>"></div></td>                 
		<td class="tbh" align='right' ><div align='right'><%=j%></div></td>

        <td class="tbh" align='left'><div align='left'><%=rst2.getString("BusType")%></div></td>
        <td class="tbh" align='left'><div align='left'><%=rst2.getString("End_Customer")%></div></td>
 		<td class="tbh" align='left'><div align='left'><%=rst2.getString("Origin")%></div></td>
 		<td class="tbh" align='left'><div align='left'><%=rst2.getString("Destination")%></div></td>
 		<td class="tbh" align='right'><div align='right'><%=rst2.getString("duration")%></div></td>
 	    <td class="tbh" align='center'><div align='center'><%=rst2.getString("TripStartTime")%></div></td>
 	    <td class="tbh" align='center'><div align='center'><%=rst2.getString("TripEndTime")%></div></td>
 </tr>
 
 
 <tr>
 <input type="hidden" name="chkbus<%=j%>" id="chkbus<%=j%>"  value="chkbus<%=j%>"></input>
<%-- 				<input type="hidden" name="loc<%=j%>" id="loc<%=j%>"  value="<%=rst2.getString("Location")%>"></input> --%>
	
	<input type="hidden" name="Deviceidbus<%=j%>" id="Deviceidbus<%=j%>"  value="<%=rst2.getString("polid")%>"></input>
 </tr>
	<%
	
	i++;
	j++;
	}
	%>
			<input type="hidden" name="cntr" id="cntr"  value="<%=i%>">
	<%}%>	
		
			
</table>



<script>



function checkUncheckAll1(sender) {
	    var chkElements = document.getElementsByName('chkpole');
	    for (var i = 0; i < chkElements.length; i++) {
	        chkElements[i].checked = sender.checked;
	    }
	}
	function checkUnCheckParent() {
	    var chkHeader = document.getElementById('allchk1');
	    var chkElements = document.getElementsByName('chkpole');
	    var checkedCount = 0;
	    for (var i = 0; i < chkElements.length; i++) {
	        if (chkElements[i].checked) {
	            checkedCount += 1;
	        }
	    }
	    chkHeader.checked = (checkedCount === chkElements.length);
	}

</script>

<br>

<div align="center">
<table  class="tbh" width="50%" >

<tr class="tbh">
                      
						 <th class="tbh">
						<input type="checkbox" name="allchk1" id="allchk1" onclick="checkUncheckAll1(this);" ></input>
						</th>
						<th class="tbh">
						SrNo
						</th>
						<th class="tbh">
						Pole/Location
						</th>
                        <th class="tbh">
						City
						</th>
						
			        </tr>
			        
			        
			        
						<% int j1=1;
					
						
						
						 if(request.getParameter("chk")!=null)
						 {
				if(request.getParameter("chk").equalsIgnoreCase("Both"))
				{
					
					
					String Area=request.getParameter("area");
					System.out.println("Area:="+Area);
					String ar1="";
					String area1[]=Area.split(",");
					for(String s1:area1)
					{
						ar1+="'"+s1+"'"+",";
					}
					
					if(ar1.endsWith(","))
					{
						ar1=ar1.substring(0,ar1.length()-1);
					}
					
					System.out.println(""+ar1);
					
					
					String City=request.getParameter("city");
					System.out.println("City:="+City);
					
					
					String ar2="";
					String city1[]=City.split(",");
					for(String s2:city1)
					{
						ar2+="'"+s2+"'"+",";
					}
					
					if(ar2.endsWith(","))
					{
						ar2=ar2.substring(0,ar2.length()-1);
					}
					
					System.out.println(""+ar2);
					
					
					
					
					
					
		             //Sqlday="select * from smartgrid.t_polmaster where  city='"+request.getParameter("city")+"' and Area='"+request.getParameter("area")+"' and AssetType='Pole' and status='1' ";
		           
				    
				}
				
						 
	ResultSet rst3= st4.executeQuery(Sqlday1);
	System.out.println("For Pole:-"+Sqlday1);
	int i1=0;
	while(rst3.next())
	{ %>
		<tr class="tbh">
<td class="tbh" align='left'><div align='left'><input type="checkbox" name="chkpole" id="chkpole<%=j1%>"  value="chkpole<%=j1%>"></div></td>                 
		<td class="tbh" align='right' ><div align='right'><%=j1%></div></td>
        <td class="tbh" align='left'><div align='left'><%=rst3.getString("area")%></div></td>
        <td class="tbh" align='left'><div align='left'><%=rst3.getString("city")%></div></td>
 		
</tr>
 
 
 <tr>
 <input type="hidden" name="chkpole<%=j1%>" id="chkpole<%=j1%>"  value="chkpole<%=j1%>"></input>
 
 <input type="hidden" name="Deviceidpole<%=j1%>" id="Deviceidpole<%=j1%>"  value="<%=rst3.getString("polid")%>"></input>
 </tr>
	<%
    i1++;
	j1++;
	}
	%>
			<input type="hidden" name="cntr1" id="cntr1"  value="<%=i1%>">
	<%}%>	
		
			
</table>
			                           

<tr>		
	       <td valign="bottom" align="center" colspan="2">
			                           <div><input type="submit" id="button"
				                       name="button" value="Add"  onclick="changeAction();return false;"/></div>
			                      </td>
			                      </tr>
			
			</div>
			                           
			                           
			                           </div>
			           


			                   

</form>
</body>
</html>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<%@ include file="footer.jsp"%> 