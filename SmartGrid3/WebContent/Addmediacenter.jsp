<%@ include file="headernew.jsp"%>

<%@page import="java.util.*" %> 
<%-- <%@page contentType="text/html" pageEncoding="UTF-8"%> --%>





<%!
Connection con1;
Connection con2;
%>
<% 
System.out.println("MM_dbConn_DRIVER--->"+MM_dbConn_DRIVER);
System.out.println("MM_dbConn_STRING--->"+MM_dbConn_STRING);
System.out.println("MM_dbConn_STRING--->"+MM_dbConn_USERNAME);
System.out.println("MM_dbConn_STRING--->"+MM_dbConn_PASSWORD);
		Class.forName(MM_dbConn_DRIVER);
		con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
		Statement st = null, st1 = null, st3 = null, st4 = null,st2 = null;

		con2 = DriverManager.getConnection("jdbc:mysql://103.241.181.36:3306/smartgrid","fleetview","1@flv");
		Statement st5 = null;
		st = con1.createStatement();
		st1 = con1.createStatement();
		st2 = con1.createStatement();
		st3 = con1.createStatement();
		st4 = con1.createStatement();
		st5 = con2.createStatement();

		System.out.println("ok");
		java.util.Date d = new java.util.Date();
		int hours = (d.getHours());
		int minutes = (d.getMinutes());
		int seconds = (d.getSeconds());
		/* String nwfrmtdte = new SimpleDateFormat("dd-MMM-yyyy")
		.format(new java.util.Date()); */
		 /* DateFormat dateFormat = new SimpleDateFormat("dd-MMM-yyyy");

		Calendar now123=Calendar.getInstance();
		
		String sysdate22 = dateFormat.format(now123.getTime());
		System.out.println(">>>>>>>>>>>>>>>n "+sysdate22);  */
		String nwfrmtdte ="16-NOV-2016";
		String sysdate22 ="16-NOV-2016";
		%>
<!DOCTYPE html>
<html>

<script>
function validation1()
{

	
var document1=document.getElementById("document").value;
var describtion=document.getElementById("describtion").value;	
var describtion=document.getElementById("describtion").value;	

	if(document1.trim()=="")
		{
		
		alert("Please Upload document");
		return false;
		}
	
	if(describtion.trim()=="")
		{
		alert("Please Enter Describtion");
		return false;
		}
	
	
	if(document.getElementById("mediatype").value=="Image")
	{
	var duration=document.getElementById("duration").value;
	var invalid = /^[5]+$/;
// 	var invalid=/^[0-9]+$/;
	if(duration.trim()=="")
	{
	alert("Please Enter Duration In Second For Image");
	return false;
	}
	if(!invalid.test(duration)){
		alert("Please Enter Only 5 Second For Image");
			     return false;
			 }
	}
	
	
	if(document.getElementById("mediatype").value=="Video")
	{
	var duration=document.getElementById("duration").value;
	var invalid=/^[0-9]+$/;
	if(duration.trim()=="")
	{
	alert("Please Enter Duration In Second For Video");
	return false;
	}
	if(!invalid.test(duration)){
		alert("Please Enter Only Numeric value For Duration");
			     return false;
			 }
	
	}
	
	
	
	

	
	
}

function upload()

{
	  

		var file1=document.getElementById("document").value;
	
       var media1=document.getElementById("mediatype").value;
		 if(file1 != '')
		 { 
			 var valid_extensions = /(.jpg|.jpeg|.png|.mpg|.mpeg|.mp4|.gif|.avi)$/i;
			 var valid_extensions_images = /(.jpg|.jpeg|.png|.gif)$/i;
			 var valid_extensions_video = /(.mpg|.mpeg|.mp4|.avi)$/i;
			 
		  if(!valid_extensions.test(file1))
		  { 
			
			 alert("Please upload jpg,jpeg,png,gif,mpg,mpeg,mp4,avi format only");
			 document.getElementById("document").value="";
	
		  }
		  if(media1=="Image")
			  {
			  
				 
			  if(!valid_extensions_images.test(file1))
			  { 
				
				 alert("Please upload images in jpg,jpeg,png,gif format only");
				 document.getElementById("document").value="";
		
			  }
			  else
				  {
				  
				  document.getElementById("remove2").style.display="";
				  }
			  
			  }
		 
		  if(media1=="Video")
		  {
		  
			 
		  if(!valid_extensions_video.test(file1))
		  { 
			
			 alert("Please upload Video in mpg,mpeg,mp4,avi  format only");
			 document.getElementById("document").value="";
	
		  }
		  
		  else
			  {
			  
			  document.getElementById("remove2").style.display="";
			  }
		  
		  
		  }

			  
			  
			  
		  
		  
		  
		  
		 /*  if(valid_extensions_images.test(file1))
		  { 
			
			  document.getElementById("remove2").style.display="";
	
		  }
		 */
		 
	  
	  
	  
	  
}
}



function removess()
{
	  document.getElementById("document").value="";  
	  document.getElementById("remove2").style.display="none";
	  
}






</script>
 <script type="text/javascript">
    function ShowHideDiv() {
        var brandname = document.getElementById("brandname");
        var OtherBrandName = document.getElementById("OtherBrandName");
        OtherBrandName.style.display = brandname.value == "Other" ? "block" : "none";
    }
</script>
    <head>
      <link type="text/css" rel="stylesheet" href="style.css" />
 <!--    <link type="text/css" rel="stylesheet" href="reset.css" />  -->
    <!-- <link type="text/css" rel="stylesheet" href="css/calander.css" /> -->  
    <!-- <style type="text/css">@import url(jscalendar-1.0/calendar-brown.css);</style>
<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script> -->
    <script >function showbox()
       {

    		//alert("hi");
    		var country = document.getElementById("country1").value;
    		//var country=e.options[e.selectedIndex].Text;
    	/* if(country!=null)
    		{
    		document.getElementById("f13").style.display="";
    		
    		}
    	else
    		{
    		document.getElementById("f13").style.display='none';
    		
    		} */
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
    			//	alert(reslt);
    				document.getElementById("state").disabled = false;
    				//alert("after true");
    				document.getElementById("state").innerHTML=reslt;
    				
    				
    			
    			} 
    		};
    		
    		var queryString = "?country="+country;
    		//alert("reslt");
    		ajaxRequest.open("GET", "AjaxGetState.jsp" + queryString, true);
    		ajaxRequest.send(null); 
    		
    		
    	}
    function showbox3()
    {

 		//alert("hi");
 		var city = document.getElementById("city").value;
 		//var country=e.options[e.selectedIndex].Text;
 	/* if(country!=null)
 		{
 		document.getElementById("f13").style.display="";
 		
 		}
 	else
 		{
 		document.getElementById("f13").style.display='none';
 		
 		} */
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
 			//	alert(reslt);
 				document.getElementById("loc").disabled = false;
 				//alert("after true");
 				document.getElementById("loc").innerHTML=reslt;
 				
 				
 			
 			} 
 		};
 		
 		var queryString = "?city="+city;
 		//alert("reslt");
 		ajaxRequest.open("GET", "AjaxGetLocation.jsp" + queryString, true);
 		ajaxRequest.send(null); 
 		
 		
 	}
    
    
    function showbox4()
    {

 		//alert("hi");
 		var country = document.getElementById("country1").value;
 		//var country=e.options[e.selectedIndex].Text;
 	/* if(country!=null)
 		{
 		document.getElementById("f13").style.display="";
 		
 		}
 	else
 		{
 		document.getElementById("f13").style.display='none';
 		
 		} */
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
 			//	alert(reslt);
 				document.getElementById("loc").disabled = false;
 				//alert("after true");
 				document.getElementById("loc").innerHTML=reslt;
 				
 				
 			
 			} 
 		};
 		
 		var queryString = "?country="+country;
 		//alert("reslt");
 		ajaxRequest.open("GET", "AjaxGetLocation.jsp" + queryString, true);
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
       			//document.getElementById("city").disabled = false;
       			document.getElementById("city").innerHTML=reslt;
       			
       		} 
       	};
       	
       	var queryString = "?country="+country;
       	ajaxRequest.open("GET", "AjaxGetCity.jsp" + queryString, true);
       	ajaxRequest.send(null); 
       	
       	
       }
       
       function showbox1()
       {

       	//alert("hi");
       	var state = document.getElementById("state").value;
       //alert(state);
       	//var country=e.options[e.selectedIndex].Text;
      /*  if(state!=null)
       	{
       	document.getElementById("f11").style.display="";
       	
       	}
       else
       	{
       	document.getElementById("f11").style.display='none';
       	
       	} */
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
       	
       	var queryString = "?state="+state;
       	//alert(queryString);
       	ajaxRequest.open("GET", "AjaxGetCity.jsp" + queryString, true);
       	ajaxRequest.send(null); 
       	
       	
       }
       
       function showbox5()
       {

       	//alert("hi");
       	var state = document.getElementById("state").value;
       //alert(state);
       	//var country=e.options[e.selectedIndex].Text;
      /*  if(state!=null)
       	{
       	document.getElementById("f11").style.display="";
       	
       	}
       else
       	{
       	document.getElementById("f11").style.display='none';
       	
       	} */
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
       			document.getElementById("loc").disabled = false;
       			document.getElementById("loc").innerHTML=reslt;
       		
       		} 
       	};
       	
       	var queryString = "?state="+state;
       	//alert(queryString);
       	ajaxRequest.open("GET", "AjaxGetLocation.jsp" + queryString, true);
       	ajaxRequest.send(null); 
       	
       	
       }
       
       </script>     
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <br><br><br><br><br><br>
        <title>Registration</title>
               
    </head>
    <body>
        <form name="userinfo" method="post" action="insertmediacenter.jsp" enctype="multipart/form-data" >
            <center> 
            <br>
            <div class="module form-module">
           <div class="toggle"><!-- <i class="fa fa-times fa-pencil"> --></i>
           </div>
           <div class="form">
    <h2>Media Center</h2>
    <!-- <form> -->
   <!--  <table>
   
		
			
			<tr>
			<td>
			
			<label ><b>MediaType :</b> </label>
		
			</td>
			<td>
			<div >
			 <div align="left">
      <font color="red" size="2"> <b>*</b> </font>
   <font color="black" size="2"> <b>Media Type:</b> </font></div>
			<select  style="width: 100px;" name="mediatype" id="mediatype">
			<option value="Image"> Image  </option>
			<option value="Video"> Video </option>
			
			</select>
			</div>
			</tr>
			<tr>
			<td>
			
		</td>	
			</tr>
			</table>	 -->
			<div align="left">
      
   <font color="red" size="2"> <b>*</b> </font><font color="black" size="2"> <b>Media Type:</b> </font></div>
			<select   name="mediatype" id="mediatype">
			<option value="Image"> Image  </option>
			<option value="Video"> Video </option>
			
			</select>
			<div align="left">
          <font color="red" size="2"> <b>*</b> </font><font color="black" size="2"> <b>Media:</b> </font></div>
			<input type="file" name="document" id="document" onchange="upload()"/> 
			
			  <a href="#" onclick="removess();" id="remove2" style="display: none; text-align: left; "><font size="2" color="black" face="Arial">Remove</font></a>
			  <div align="left">
            <font color="red" size="2"> <b>*</b> </font><font color="black" size="2"> <b>Description:</b> </font></div>
			<input type="text" name="describtion" id="describtion" placeholder="Describtion" /> 
			<div align="left">
           <font color="red" size="2"> <b>*</b> </font> <font color="black" size="2"> <b>Duration:</b> </font></div>
			<input type="text" name="duration" id="duration" placeholder="Duration In Second" /> 
   <div align="left">
    <font color="red" size="2"> <b>*</b> </font> <font color="black" size="2"> <b>BrandName:</b> </font></div>
<!-- 			  <select   name="brandname" id="brandname">
 -->			 <select name="brandname" id="brandname" class="formElement" onchange = "ShowHideDiv()">			
							<option value="Select">Select</option> 
				  		<% String sqlDropdown11="SELECT Distinct(brandname) FROM smartgrid.BrandMaster order by brandname;";
				  			ResultSet rsDropdown11=st5.executeQuery(sqlDropdown11);
				  			while(rsDropdown11.next()){
				  		%>
				  		
				  	<option value="<%=rsDropdown11.getString(1)%>"><%=rsDropdown11.getString(1)%></option>
							
						<% 	}%> 
						<option value="Other">Other</option>
			  </select>
			  <div id="OtherBrandName" style="display: none">
       <input type="text" name="OtherBrandName" id="OtherBrandName" placeholder="*BrandName" />
</div>
			<br>		
      <button onclick="return validation1();">Upload</button>
      </div>
</form>
</div>
</div>

</body>
</html>
<%@ include file="footer.jsp"%>

           