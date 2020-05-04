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
		Statement st = null, st1 = null, st3 = null, st4 = null,st2 = null,st5=null;
        st = con1.createStatement();
		st1 = con1.createStatement();
		st2 = con1.createStatement();
		st3 = con1.createStatement();
		st4 = con1.createStatement();
		st5 = con1.createStatement();
		System.out.println("ok");
		
		
		 String lattit="";
			String longitude="";
		
%>
 <script>
      function showexpence() {

    	  var state=document.getElementById("country1").value;
//     	  alert(state);
    	  if(state=="Select")
		  {
		  alert("Please Select State");
		  return false;
		  }
    	  
    	  var city=document.getElementById("state").value;
    	 
    	  if(city=="Select")
		  {
		  alert("Please Select City");
		  return false;
		  }
    	  
    	  var area=document.getElementById("city").value;
     	 
     	  if(area=="Select")
 		  {
 		  alert("Please Select Area");
 		  return false;
 		  }


    	/*     var state = [];
    	    var s = document.getElementById("country1");
    	    for (var i = 0; i < s.options.length; i++) {
   	    	if (s.options[i].selected == true) {
   	            var stateid = s.options[i].value;
   	            state.push(stateid);
   	        }
    	       
     	    }
        	var state1=state;

    	    var city = [];
    	    var s = document.getElementById("state");
    	    for (var i = 0; i < s.options.length; i++) {
   	    	if (s.options[i].selected == true) {
   	            var cityid = s.options[i].value;
   	            city.push(cityid);
   	        }
    	       
     	    }
        	var city1=city;
    	 
        
        	
        	var area = [];
     	    var s = document.getElementById("city");
     	    for (var i = 0; i < s.options.length; i++) {
    	    	if (s.options[i].selected == true) {
    	            var areaid = s.options[i].value;
    	            area.push(areaid);
    	        }
     	       
      	    }
         	var area1=area; */
    	
              window.location.replace("smartgridmap.jsp?state="+state+"&city="+city+"&area="+area+"&chk=Bus");
   }
      function addarea()
      {
    	  var state1=document.getElementById("country1").value;
    	  var city1=document.getElementById("state").value;
    	  if(state1=="Select")
    		  {
    		  alert("Please Select State");
    		  return false;
    		  }
    	  if(city1=="Select")
		  {
		  alert("Please Select City");
		  return false;
		  }
    	  
    	
      	var state = document.getElementById("newcountry").value;
//             alert("state:-"+state);
           	
        	var ajaxRequest;  // The variable that makes Ajax possible!
     	try{
     		// Opera 8.0+, Firefox, Safari
     		ajaxRequest = new XMLHttpRequest();
     	}  
     	catch (e)
     	{
     		// Internet Explorer Browsers
     		try
     		{
     			ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
     		} 
     		catch (e)
     		{
     			try
     			{
     				ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
     			} 
     			catch (e)
     			{
     				// Something went wrong
     				alert("Your browser broke!");
     				return false;
     			}
     		}
     	}
     	ajaxRequest.onreadystatechange = function()
     	{
     		if(ajaxRequest.readyState == 4)
     		{
     			var reslt=ajaxRequest.responseText;
     			alert(reslt.trim());
     			window.location.reload();
     			
     		} 
     	};
     	
     	var queryString = "?area="+state+"&state1="+state1+"&city1="+city1;
      	ajaxRequest.open("GET", "AjaxAddArea.jsp" + queryString, true);
     	ajaxRequest.send(null); 
     	
           	
      }

       function showbox()
      {
   		var country = document.getElementById("country1").value;
   		var ajaxRequest;  // The variable that makes Ajax possible!
   		try{
   			// Opera 8.0+, Firefox, Safari
   			ajaxRequest = new XMLHttpRequest();
   		}  
   		catch (e)
   		{
   			// Internet Explorer Browsers
   			try
   			{
   				ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
   			} 
   			catch (e)
   			{
   				try
   				{
   					ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
   				} 
   				catch (e)
   				{
   					// Something went wrong
   					alert("Your browser broke!");
   					return false;
   				}
   			}
   		}
   		ajaxRequest.onreadystatechange = function()
   		{
   			if(ajaxRequest.readyState == 4)
   			{
   				var reslt=ajaxRequest.responseText;
   			//	alert(reslt);
   				document.getElementById("state").disabled = false;
   				//alert("after true");
   				document.getElementById("state").innerHTML=reslt;
   				
   				
   			
   			} 
   		};
   		
   		var queryString = "?country="+country;
   		//alert("reslt");
   		ajaxRequest.open("GET", "AjaxGetState1.jsp" + queryString, true);
   		ajaxRequest.send(null); 
   		
   		
   	}
   
  
  
   
      function showbox2()
      {

      	//alert("hi");
      	var country = document.getElementById("country1").value;
      	//var country=e.options[e.selectedIndex].Text;

      	//alert(country);
      	
      	var ajaxRequest;  // The variable that makes Ajax possible!
      	try{
      		// Opera 8.0+, Firefox, Safari
      		ajaxRequest = new XMLHttpRequest();
      	}  
      	catch (e)
      	{
      		// Internet Explorer Browsers
      		try
      		{
      			ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
      		} 
      		catch (e)
      		{
      			try
      			{
      				ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
      			} 
      			catch (e)
      			{
      				// Something went wrong
      				alert("Your browser broke!");
      				return false;
      			}
      		}
      	}
      	ajaxRequest.onreadystatechange = function()
      	{
      		if(ajaxRequest.readyState == 4)
      		{
      			var reslt=ajaxRequest.responseText;
      			//alert(reslt);
      			document.getElementById("city").disabled = false;
      			document.getElementById("city").innerHTML=reslt;
      			
      		} 
      	};
      	
      	var queryString = "?country="+country;
      	ajaxRequest.open("GET", "AjaxGetCity1.jsp" + queryString, true);
      	ajaxRequest.send(null); 
      	
      	
      }
      
      function showbox1()
      {

      	//alert("hi");
      	var state = document.getElementById("state").value;

      	
      	var ajaxRequest;  // The variable that makes Ajax possible!
      	try{
      		// Opera 8.0+, Firefox, Safari
      		ajaxRequest = new XMLHttpRequest();
      	}  
      	catch (e)
      	{
      		// Internet Explorer Browsers
      		try
      		{
      			ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
      		} 
      		catch (e)
      		{
      			try
      			{
      				ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
      			} 
      			catch (e)
      			{
      				// Something went wrong
      				alert("Your browser broke!");
      				return false;
      			}
      		}
      	}
      	ajaxRequest.onreadystatechange = function()
      	{
      		if(ajaxRequest.readyState == 4)
      		{
      			var reslt=ajaxRequest.responseText;
      			//alert(reslt);
      			document.getElementById("city").disabled = false;
      			document.getElementById("city").innerHTML=reslt;
      		
      		} 
      	};
      	
      	var queryString = "?state="+state;
      	//alert(queryString);
      	ajaxRequest.open("GET", "AjaxGetCity1.jsp" + queryString, true);
      	ajaxRequest.send(null); 
      	
      	
      }
      
     

      
    
      
    
						</script>   

<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyA8hvZnNy4mo2JapiKXWN1ZLMlxTJgLz30"></script>
   <script type="text/javascript">
   var markers = [
    
            {
              
               "lat": '18.641400',
               "lng": '72.872200',
              
           }
    
       ,
    
            {
              
               "lat": '18.964700',
               "lng": '72.825800',
              
           }
    
       ,
    
            {
              
               "lat": '18.523600',
               "lng": '73.847800',
              
           }
    
   ];
   </script>
   <script type="text/javascript">
 
       window.onload = function () {
           var mapOptions = {
               center: new google.maps.LatLng(markers[0].lat, markers[0].lng),
               zoom: 8,
               mapTypeId: google.maps.MapTypeId.ROADMAP
           };
           var path = new google.maps.MVCArray();
           var service = new google.maps.DirectionsService();
 
           var infoWindow = new google.maps.InfoWindow();
           var map = new google.maps.Map(document.getElementById("dvMap"), mapOptions);
           var poly = new google.maps.Polyline({ map: map, strokeColor: '#FF8200' });
           var lat_lng = new Array();
           for (i = 0; i < markers.length; i++) {
               var data = markers[i]
               var myLatlng = new google.maps.LatLng(data.lat, data.lng);
               lat_lng.push(myLatlng);
               var marker = new google.maps.Marker({
                   position: myLatlng,
                   map: map,
                   title: data.title
               });
               (function (marker, data) {
                   google.maps.event.addListener(marker, "click", function (e) {
                       infoWindow.setContent(data.description);
                       infoWindow.open(map, marker);
                   });
               })(marker, data);
           }
           for (var i = 0; i < lat_lng.length; i++) {
               if ((i + 1) < lat_lng.length) {
                   var src = lat_lng[i];
                   var des = lat_lng[i + 1];
                   path.push(src);
                   poly.setPath(path);
                   service.route({
                       origin: src,
                       destination: des,
                       travelMode: google.maps.DirectionsTravelMode.DRIVING
                   }, function (result, status) {
                       if (status == google.maps.DirectionsStatus.OK) {
                           for (var i = 0, len = result.routes[0].overview_path.length; i < len; i++) {
                               path.push(result.routes[0].overview_path[i]);
                           }
                       }
                   });
               }
           }
       }
   </script>
   <center>
   <table width="90%">


   <tr>
    <td>
    <label><b>State:</b></label> </td><td>
    <div class="styled-select slate">
				<select  id="country1" name="country1"  onchange="showbox();showbox2();"    >
				  	<option value="Select">Select</option>
				  		<%  
				  		String sqlDropdown3="SELECT Distinct(State) FROM smartgrid.t_areamaster ";
				  			ResultSet rsDropdown3=st2.executeQuery(sqlDropdown3);
				  			System.out.println("sqlDropdown3-->"+sqlDropdown3); 
				  			while(rsDropdown3.next()){System.out.println("rsDropdown3.getString(1)"+rsDropdown3.getString(1));
				  		%>
				  	<option value="<%=rsDropdown3.getString(1)%>"><%=rsDropdown3.getString(1)%></option>
							
						<% 	}%> 
				</select></div>
				
		</td>
		<!-- </tr>
		<tr>	 -->
		<td>	
	<label ><b>City:</b></label></td><td>
	<div class="styled-select slate">
				<select  disabled  id="state"  name="state"   onchange="showbox1()" > 
					<option value="Select">Select</option>
						<% String sqlDropdown2="SELECT Distinct(City) FROM smartgrid.t_areamaster";
						System.out.println("sqlDropdown2-->"+sqlDropdown2); 
				  			ResultSet rsDropdown2=st2.executeQuery(sqlDropdown2);
				 			 while(rsDropdown2.next()){
				  		%>
				  	<option value="<%=rsDropdown2.getString(1)%>"><%=rsDropdown2.getString(1)%></option>
							
						<% 	}%> 

            	</select></div>
			</td>
		<!-- 	</tr>
			<tr> -->
			<td>	
	<label ><b>Area:</b> </label></td><td>
	<div class="styled-select slate">
				<select  disabled  id="city" name="city"  style='width: px; height: auto;'>
					<option value="Select">Select</option>
				  		<% String sqlDropdown1="SELECT Distinct(Area) FROM smartgrid.t_areamaster";
				  			ResultSet rsDropdown1=st2.executeQuery(sqlDropdown1);
				  			System.out.println("sqlDropdown1-->"+sqlDropdown1); 
				  			while(rsDropdown1.next()){
				  		%>
				  	<option><%=rsDropdown1.getString(1)%></option>
							
						<% 	}%> 
				</select>
				  	 <input type="text" class="element text medium" name="newcountry" id="newcountry" style="display: none"/> <input type="button" id="Go" value="Go" onclick="addarea();" style="display: none"> <a href="#" style="font-weight: bold; color: blue;display: none " id="f14" onclick="showminus2('-')"><font  size="2" >(-)</font></a>
	
				
				<a href="#" style="font-weight: bold; color: blue;" id="f15" onclick="showentryform2();">Add Area</a>
				</div>
			</td>
			
	
            	
		
	<td  style="text-align: right;">
			<input id="saveForm" name="submit" class="button_text"   type="button"  value="Show" onclick="showexpence();return false;" />
				</td>	
	
	</tr>
		
		
		
		
</table>
   
   
   <div id="dvMap" style="width: 500px; height: 500px"></div>
   </center>