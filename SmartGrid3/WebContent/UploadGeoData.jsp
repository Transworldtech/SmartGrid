<%-- <%@page contentType="text/html" pageEncoding="UTF-8"%> --%>
<%@ include file="headernew.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link type="text/css" rel="stylesheet" href="style.css" />
  <!--   <link type="text/css" rel="stylesheet" href="reset.css" />   -->     
<title>Upload File</title>
</head>
<body>

<script>



function getMap()
{
alert("hi");
	var ajaxRequest;
	    try{
	        // Opera 8.0+, Firefox, Safari
	        ajaxRequest = new XMLHttpRequest();
	        alert("hi1");
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
	            try
	            {
	            	
	            var reslt=ajaxRequest.responseText;

	            reslt=reslt.replace(/^\s+|\s+$/g,'');
	alert("Result--->"+reslt);
	if(reslt=="Yes")
	{
	    alert("Map Name already Exist");
	}
	


	            }catch(e)
	            {
	            alert(e);
	            }
	        }
	    };





	   // var queryString ="?vehno="+vahno+"&date="+Rdate+"&trans="+trans+"&unitid="+unitid+"&receiveby="+receiveby+"&receivefrm="+receivefrm+"&receiveIdate="+reidate+"&location="+loc;
	    ajaxRequest.open("GET", "GetMapName.jsp" , true);
	    ajaxRequest.send(null);

}

</script>

<form action="UploadGeoData1.jsp" method="post" enctype="multipart/form-data">
<center>
            <br><br><br><br><br><br><br><br>
            <div class="module form-module">
           <div class="toggle"><!-- <i class="fa fa-times fa-pencil"></i> -->
           </div>
           <div class="form">
    <h2>Upload GEO Data</h2>
    <form>
    <input type="text" name="mapname" value="" id=mapname placeholder="Map Name" />
 <input type="file" name="filetoupload">
<br/>
<button>Upload File</button>
</form>
        </div>
        </div>
        

<%
	String msg=request.getParameter("msg");
	//System.out.println("The msg is :"+msg);
	if(msg !=null) {
 	%>
	<table border="0" width="750px" align="center"> 
		<tr>
			<td  align="center" bgcolor="#f5f5f5"><font size="2"><b>File Uploaded successfully</b></font></td>
		</tr>
	</table>
	<%}else{ %>
	<table border="0" width="750px" align="center"> 
		<tr>
			<td  align="center" bgcolor=""><font size="2"><b>Please upload only excel files with proper format And do not include the column of Serial No.</b></font></td>
		</tr>
	</table>
<%} %>
</center>
</form>

</body>
</html>
<%@ include file="footer.jsp"%>