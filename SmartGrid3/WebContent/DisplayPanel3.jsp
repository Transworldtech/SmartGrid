<%-- <jsp:useBean id="fleetview" class="com.fleetview.beans.classes" scope="page"> --%>
<%-- <%@page contentType="text/html" %> --%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.util.*,java.sql.*" %>
<%@ include file="Conn.jsp"%>
<%-- <%@ include file="DisplayPanelHeader.jsp"%> --%>
<%-- <%@ include file="DisplayPanelHeader.jsp"%> --%>
<!DOCTYPE html>
<html>
<head>
    <title>Camera Report</title>
    <link href="themes/4/js-image-slider.css" rel="stylesheet" type="text/css" />
    <script src="themes/4/js-image-slider.js" type="text/javascript"></script>
    <link href="css/generic.css" rel="stylesheet" type="text/css" />
    
<link rel="stylesheet" type="text/css" href="css/cpanel_002_popup.css"> 
<link rel="stylesheet" type="text/css" href="css/cpanel_colors.css">
<link rel="stylesheet" type="text/css" href="css/form.css" media="all">
    
<script type="text/javascript" language="javascript" src="calendar/prototype-1.js"></script>
<script type="text/javascript" language="javascript" src="calendar/prototype-base-extensions.js"></script>
<script type="text/javascript" language="javascript" src="calendar/prototype-date-extensions.js"></script>
<script type="text/javascript" language="javascript" src="calendar/behaviour.js"></script>
<script type="text/javascript" language="javascript" src="calendar/datepicker.js"></script>
<link rel="stylesheet" href="calendar/datepicker.css">
<script type="text/javascript" language="javascript" src="calendar/behaviors.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>





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



.mainDIV{
    position:relative;
    background:;
    width:%;
    min-width:;
}
.leftDIV{
    position:absolute;
    top:0px;
    left:0px;
    height:20px;
    width:50px;
    background:;
}
.middleDIV{
    height:50px;
    width:300px;
    align:center;
    background:;
    margin:0px auto;
}
.rightDIV{
    position:absolute;
    top:50px;
    right:25px;
    height:30px;
    width:100px;
    background:;
}



.Row
{
    display: table;
    width: 100%; /*Optional*/
    table-layout: fixed; /*Optional*/
    border-spacing: 10px; /*Optional*/
}
.Column
{
    display: table-cell;
    background-color: ; /*Optional*/
}

/* div.absolute {
    position: absolute;
    left: 0px;
    width:20%;
    border:2;
}   */  

html, body { height: 100%; padding: 0; margin: 0; } 


#topdisppanel {
    position: fixed  ;
    left: 0;
    right: 0;
    height: 12%;
}

#bottomdisppanel {
    position: fixed ;
    left: 0;
    right: 0;
    height: 88%;
}

#footerdisppanel {
    position: fixed ;
    left: 0;
    right: 0;
    height: 3%;
}

#topdisppanel {
    top: 0%;

   /*  background-color: orange; */
   background-color: #f5f5f5;
   
}

h1
{
  font-size:2em;
   color:#58666e;
}

#bottomdisppanel {
    bottom: 0%;
    background-color: DarkGray;
}

#footerdisppanel {
    bottom: 0%;
    background-color: #f5f5f5;
}

/* div.mainabc { width: 100%; height: 5%; float: left; } */
div.abc { width: 50%; height: 50%; float: left; }
#div0 { background: #AAA; }
#div1 { background: #AAA; }
#div2 { background: #AAA; }
#div3 { background: #AAA; }

div.pqr { width: 25%; height: 50%; float: left; }
#div0 { background: #AAA; }
#div1 { background: #AAA; }
#div2 { background: #AAA; }
#div3 { background: #AAA; }
#div4 { background: #AAA; }
#div5 { background: #AAA; }
#div6 { background: #AAA; }
#div7 { background: #AAA; }

img.pqr1 {width:100%; height:100%}


</style>
    <script type="text/javascript">
function showFTPImage1(x)
{	
// 	alert("here"+x);
	
 	var url="showcameraftpimage1.jsp?imageName="+x;
 	testwindow1 = window.open(url,"Image", "width=500,height=500");
     testwindow1.moveTo(250,100);
};
			

</script>
<script type="text/javascript"> 

   


function dateformat(days)
{
	if(days=='Jan')
		return(1);
	else if(days=='Feb')
		return(2);
	else if(days=='Mar')
		return(3);
	else if(days=='Apr')
		return(4);
	else if(days=='May')
		return(5);
	else if(days=='Jun')
		return(6);
	else if(days=='Jul')
		return(7);
	else if(days=='Aug')
		return(8);
	else if(days=='Sep')
		return(9);
	else if(days=='Oct')
		return(10);
	else if(days=='Nov')
		return(11);
	else if(days=='Dec')
		return(12);
 }

function datevalidate()
{
	var date1 = document.getElementById("date1").value;
	var hr1="";
	var min1="";
	var dm1,dd1,dy1,dm2,dd2,dy2;
	var dd11,yy11,mm1,mm2,mm11,dd22,yy22,mm22;
	dd11=date1.substring(0,2);
	mm1=date1.substring(3,6);
	mm11=dateformat(mm1);
	yy11=date1.substring(7,11);
	hr1 = date1.substring(12,14)
	min1 = date1.substring(15,17)
	var date=new Date();
	var month=date.getMonth()+1;
	var day=date.getDate();
	var hr=date.getHours();
	var min=date.getMinutes();
	//alert(hr);
	//alert(min);
	var year=date.getFullYear();
	//alert("year1   "+yy11+"   year  "+year);
	if(yy11<year) 
	{
		
		alert("selected date should not be Less than todays date");
		document.getElementById("date1").value="";
		document.getElementById("date1").focus;
		return false;
	}
	else if(year==yy11)
	{
		//alert("month1   "+mm11+"   month  "+month);
			if(mm11<month)
		{
			alert("selected date should not be Less than todays date");
			document.getElementById("date1").value="";
			document.getElementById("date1").focus;
			return false;
		}
			else
				if(mm11==month)
				{
					//alert("day1   "+dd11+"   day  "+day);
					if(dd11<day)
					{
						alert("selected date should not be Less than todays date");
						document.getElementById("date1").value="";
						document.getElementById("date1").focus;
						return false;
					}
					else
						if(dd11==day)
						{
							//alert("hr1   "+hr1+"   hr  "+hr);
							if(hr1<hr)
							{
								alert("selected date should not be Less than todays date");
								document.getElementById("date1").value="";
								document.getElementById("date1").focus;
								return false;
							}
							else
								if(hr1==hr)
								{
									//alert("min1   "+min1+"   min  "+min);
									if(min1<min)
									{
										alert("selected date should not be Less than todays date");
										document.getElementById("date1").value="";
										document.getElementById("date1").focus;
										return false;
									}
								}
					    }
		        }
	}
	return true;
}

function dateformat(days)
{
	 if(days=='Jan')
		return(1);
	 else
		if(days=='Feb')
			return(2);
		else
			if(days=='Mar')
				return(3);
			else
				if(days=='Apr')
					return(4);
				else
					if(days=='May') //timeformat: "%M:%S"
						
						return(5);
					else
						if(days=='Jun')
							return(6);
						else
							if(days=='Jul')
								return(7);
							else
								if(days=='Aug')
									return(8);
								else
									if(days=='Sep')
										return(9);
									else
										if(days=='Oct')
											return(10);
										else
											if(days=='Nov')
												return(11);
											else
												if(days=='Dec')
													return(12);
 }
</script>




<script type="text/javascript">

//setInterval(autorequest, (10 * 1000));

function autorequest(){
	
	var locations = document.getElementById("element_3_8").value;
	//alert("gridname"+document.getElementById("gridname").value);
	  var test=document.getElementById("gridname").value;

	if(test=='Select')
		{
	
		var rows = document.getElementById("element_3_6").value;
 		var columscount = document.getElementById("element_3_7").value;
 		
 		var gridname = document.getElementById("element_3_88").value;
		//alert("gridname88"+document.getElementById("element_3_88").value);

 		
 		
			}
		else
			{
			var rows = document.getElementById("element_3_66").value;
	 		var columscount = document.getElementById("element_3_77").value;
	 		
	 		var gridname = document.getElementById("gridname").value;
			//alert("gridname888"+document.getElementById("element_3_888").value);

	 		
			}
		var total=rows*columscount;
		
		//alert("In Autorequest"+rows+"col"+columscount+"grid"+gridname);
		
		var reslt3="";
		var reslt2="";
		var reslt1="";
		var buffer="";
		//alert("Total :- "+total);
	//var location=document.getElementById("element_3_1").value;
	//var km=document.getElementById("element_3_2").value;
	 try
		{
	//alert("ajax 222");
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
				try
				{
				var reslt=ajaxRequest.responseText;
				//alert("Ajax Length :- "+reslt);
				
				 reslt1=reslt.split("##");
				
				//alert("First :- "+reslt);
				//alert("Total in Ajax:- "+total);
				
				
				
				for(var j=0; j < total; j++)
				{
					//alert("Rslt 1 :- "+reslt1[j]);
				
					if(reslt1[j].trim()=="DoNotReload")
						
					{
					
						
					}
				else
					{
					//alert("Src In Reload :-  "+reslt1[j].trim());
					
					document.getElementById("imgZoom"+j).src="https://s3.ap-south-1.amazonaws.com/smartgridinfra/"+reslt1[j].trim();
					
					}
					
				//	alert("J :- "+j);
					
					
					   /* reslt2=reslt1[j];
					 reslt3=reslt2.split("###");
					for(var k=0; k < 2; k++)
					{
					//alert("Third "+[k]+" :- " +reslt3[k]);
						src=reslt3[k].trim();
					
						//alert("Source "+[k]+" :- " +reslt3[k]);
						//alert("Src "+[k]+" "+reslt3[k].trim());
						
						
						
					}
				//	alert("Src "+reslt3[0].trim());
					
					if(reslt3[0]!="Do Not Reload")
						
						{
						
						alert("Src In Do Not :-  "+reslt3[0].trim());
						document.getElementById("imgZoom"+j).src="https://s3.ap-south-1.amazonaws.com/smartgridinfra/"+reslt3[0].trim();	
						}
					else
						{
						
						} */
					
					//document.getElementById("div"[j]).innerHTML=reslt3[1];
				//buffer+=reslt3[1];
					
					
					
					
				}
				
				//alert("Buffer :- "+buffer);
 				//document.getElementById("bottomdisppanel").innerHTML=buffer;

 				//document.getElementById("imgZoom"+j).src="https://s3.ap-south-1.amazonaws.com/smartgridinfra/"+reslt3[0].trim();
					
				
				
				
				
				
				
				
				
				
				
				}
				catch(e)
				{
					//alert(e);
				}
			}
		};
		 var queryString = "?rows="+rows+"&columscount="+columscount+"&gridname="+gridname+" ";
		//var queryString = "?rows="+rows+"&columscount="+columscount+" ";
		ajaxRequest.open("POST", "displaypanelAjax.jsp" +queryString , true);
		ajaxRequest.send(null); 
		}
		catch(e)
		{
			/* alert(e); */
		}
	
}

function autorequest1(){
//alert("Auto 1");	
//	var locations = document.getElementById("element_3_8").value;
	//alert("gridname"+document.getElementById("gridname").value);
		
	  var test=document.getElementById("gridname").value;
	if(test=='Select')
				{
			
				var rows = document.getElementById("element_3_6").value;
		 		var columscount = document.getElementById("element_3_7").value;
		 		
		 		var gridname = document.getElementById("element_3_88").value;
				//alert("gridname88"+document.getElementById("element_3_88").value);

		 		
		 		
					}
				else
					{
					var rows = document.getElementById("element_3_66").value;
			 		var columscount = document.getElementById("element_3_77").value;
			 		
			 		var gridname = document.getElementById("gridname").value;
					//alert("gridname888"+document.getElementById("element_3_888").value);

			 		
					}

		var total=rows*columscount;
		
		//	alert("In autorequest1"+rows+"col"+columscount+"grid"+gridname);

		
		var reslt3="";
		var reslt2="";
		var reslt1="";
		var buffer="";
		//alert("Total :- "+total);
	//var location=document.getElementById("element_3_1").value;
	//var km=document.getElementById("element_3_2").value;
	 try
		{
	//alert("ajax 222");
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
				try
				{
					var reslt=ajaxRequest.responseText;
					//alert("Ajax Length :- "+reslt);
					
					 reslt1=reslt.split("##");
					
					//alert("First :- "+reslt);
					//alert("Total in Ajax:- "+total);
					
					
					
					for(var j=0; j < total; j++)
					{
						//alert("Rslt 1 :- "+reslt1[j]);
					
						if(reslt1[j].trim()=="DoNotReload")
							
						{
						
							
						}
					else
						{
						//alert("Src In Reload :-  "+reslt1[j].trim());
						
						document.getElementById("imgZoom"+j).src="https://s3.ap-south-1.amazonaws.com/smartgridinfra/"+reslt1[j].trim();
						
						}
						
					//	alert("J :- "+j);
						
						
						   /* reslt2=reslt1[j];
						 reslt3=reslt2.split("###");
						for(var k=0; k < 2; k++)
						{
						//alert("Third "+[k]+" :- " +reslt3[k]);
							src=reslt3[k].trim();
						
							//alert("Source "+[k]+" :- " +reslt3[k]);
							//alert("Src "+[k]+" "+reslt3[k].trim());
							
							
							
						}
					//	alert("Src "+reslt3[0].trim());
						
						if(reslt3[0]!="Do Not Reload")
							
							{
							
							alert("Src In Do Not :-  "+reslt3[0].trim());
							document.getElementById("imgZoom"+j).src="https://s3.ap-south-1.amazonaws.com/smartgridinfra/"+reslt3[0].trim();	
							}
						else
							{
							
							} */
						
						//document.getElementById("div"[j]).innerHTML=reslt3[1];
					//buffer+=reslt3[1];
						
						
						
						
					}
					
					//alert("Buffer :- "+buffer);
	 				//document.getElementById("bottomdisppanel").innerHTML=buffer;

	 				//document.getElementById("imgZoom"+j).src="https://s3.ap-south-1.amazonaws.com/smartgridinfra/"+reslt3[0].trim();
						
					
				
				}
				catch(e)
				{
					//alert(e);
				}
			}
		};
		

		var queryString = "?rows="+rows+"&columscount="+columscount+"&gridname="+gridname+" ";

		//var queryString = "?rows="+rows+"&columscount="+columscount+" ";
		ajaxRequest.open("POST", "displaypanelAjax1.jsp" +queryString , true);
		ajaxRequest.send(null);
		
		setInterval(autorequest, (30 * 1000));
		}
		catch(e)
		{
			/* alert(e); */
		}
	
}

// function AutoRefresh( t ) {
//     setTimeout("location.reload(true);", t);
//  }
 
//setInterval(Redirct, (60 * 1000));




 function Redirect(){
	 
	 	 	try{
	 	 		//alert("gridname"+document.getElementById("gridname").value);
	 	 		
			 /* alert("gridname"+document.getElementById("gridname").value);
			alert("gridname888"+document.getElementById("element_3_888").value);
			alert("col77"+document.getElementById("element_3_77").value);
			alert("row66"+document.getElementById("element_3_66").value);
			alert("gridname88"+document.getElementById("element_3_88").value);
			alert("row6"+document.getElementById("element_3_6").value);
			alert("col7"+document.getElementById("element_3_7").value);
  */
  
  var test=document.getElementById("gridname").value;
			if(test=='Select')
				{
			
	 		var rows = document.getElementById("element_3_6").value;
	 		var columscount = document.getElementById("element_3_7").value;
	 		
	 		var gridname = document.getElementById("element_3_88").value;
			//alert("gridname88"+document.getElementById("element_3_88").value);
	 		//alert("rows"+rows+"columscount"+columscount+"gridname"+gridname);
	 		  if(rows==''||columscount==''||gridname=='')
              {
              alert("Please Add New Grid");
                      location='mygridreport.jsp';
                      ajaxRequest.open("GET", "mygridreport.jsp", true);

              } 
	 		
				}
			else
				{
				var rows = document.getElementById("element_3_66").value;
		 		var columscount = document.getElementById("element_3_77").value;
		 		
		 		var gridname = document.getElementById("gridname").value;
				//alert("gridname888"+document.getElementById("element_3_888").value);

		 		
				}
	 		//alert("gridname--"+gridname);
	 			//	alert("In Redirect"+rows+"col"+columscount+"grid"+gridname);

	 		//alert(rows);
	 		//alert(columscount);
	 		
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
	 				try
	 				{
	 					
	 				var reslt=ajaxRequest.responseText;
	 			

	 				
	 				var result1;
	 				result1=reslt;
	 				
//  	 				alert("result1"+result1.trim());
	 				
	 				
	 					if(result1.trim()=='Please Reload'){
	 						
	 						 window.location.reload(); 
	 					}

	 					
	 				
	 				var reslt=result1.trim();
//  	 				alert("result1"+result1.trim());


	 				
	 				document.getElementById("bottomdisppanel").innerHTML=result1;
	
	 				
	 				}catch(e)
	 				{
	 				//alert(e);
	 				}
	 			} 
	 		};
	 		
	 		 var queryString = "?rows="+rows+"&columscount="+columscount+"&gridname="+gridname+" ";
	 		//var queryString = "?rows="+rows+"&columscount="+columscount+" ";
	 		ajaxRequest.open("GET", "AjaxNewdisplaypanel.jsp" + queryString, true);
	 		ajaxRequest.send(null); 
	 		
			 setTimeout(autorequest1, 10000);
	 		//  setInterval(autorequest1, (10 * 1000));
			// autorequest1();
	 		//var a=autorequest1();
	// 		delay(1000);
	 		
	 		//autorequest1();
	 		
	 		
	 		
	 		}
	 	    catch(e)
	 		{
	 		 // alert(e);
	 		}	
	 	
	 	
	 	
 }
 
 function popUp(pagename)
 { 
 	window.open(pagename,'jav','width=930,height=500,top=50,left=150,resizable=no,scrollbars=yes');
 }

 
 
 function regcomplaint(PageName)
 {
 	try{
 	
 	window.open('RegisterComplaint.jsp?PageName='+PageName,'Win','width=710,height=600,top=200,left=200,scrollbars=yes');	 
 	 }catch(e)
 	 {
 		 alert(e);
 	 }
 }
 
 
 
</script>											


</head>

<%! Connection conn = null;
	Statement st = null;
	Statement st1 = null;
	Statement st2 = null;
	Statement st3 = null;
	Statement st4 = null;
	Statement st5 = null;
	Statement st6 = null;
	
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
%>

<%

String username=session.getAttribute("User").toString();

System.out.println("username:-"+username);
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
	
	
	
	
	default_date_3=default_date_3+""+hh2+":"+mm2;
	
	
	String defaultDate2 = new SimpleDateFormat("dd-MMM-yyyy HH:mm").format(new Date());
	System.out.println("The default date is ==>"+default_date_3);
	
	System.out.println("The default_date_1  is ==>"+default_date_1);
	
	
	
	
	date1=new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(default_date_3)); 
	date2= new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(default_date_1)); 
	
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
		 unitid= request.getParameter("unitid");
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
	 System.out.println("unitid "+unitid);
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

	 System.out.println("  Date1 ==>"+date1+ "Date2 ==>"+date2);

}catch(Exception e){
	System.out.println("Exception "+e);
}
%>

<!-- <body onload="JavaScript:AutoRefresh(30000);"> -->
<body>

<form id="camera_jpg_report" name="camera_jpg_report" action="imagefour.jsp" method="post" onsubmit="return datevalidate(); ">
<!-- <br> -->

<% 
String Unitid="All";
 %>
   <!-- <img src="images/java4s.png"> -->
   
</form>
<!-- </div> -->
<!-- <div id="score"> -->
   
   
   <%-- <font face="verdana" size="2">
Current Time :<%= new java.util.Date() %>
</font> --%>
<%

 	
 	//}
 	if(date1!=null || date2!=null){
		//System.out.println("in else");
		
	
	}
 	else
 	{

 		date1= new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(default_date_3)); 
 		date2= new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new SimpleDateFormat("dd-MMM-yyyy HH:mm").parse(default_date_1)); 
	
 	}
%>	

<%
	
		

%>		 

<%


	//System.out.println("in if part -----------------------------------"+VehNo1);	
	String unitt = "";
	String vehid="";
	String gridname="";
	String gridname1="";

	String row1="";
	String col1="";

int count = 0;

String reportno="";



String Table="CREATE TABLE IF NOT EXISTS smartgrid.t_tmp_" +username+" like smartgrid.t_tmp_User";
//st2.executeUpdate(Table);
System.out.println("Table Query :- "+Table);

try{

Class.forName(MM_dbConn_DRIVER);
Connection REPNo=DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
Statement stRepNo=REPNo.createStatement();


String Reportnosql="Select * from smartgrid.t_reportnumber  where PageName='DisplayPanel3.jsp'";
System.out.println("Report No===>"+Reportnosql);
ResultSet ResRepNo=stRepNo.executeQuery(Reportnosql);
if(ResRepNo.next())
{
	 reportno= ResRepNo.getString("ReportNo");
}

/* String sqlDropdown111="select * from smartgrid.t_dispmapping where username='"+username+"' and defaultgrid='Yes'";

ResultSet rs11 = st1.executeQuery(sqlDropdown111);
while(rs11.next()){
	   //count=rs1.getString("count");
	   gridname=rs11.getString("gridname");
	   
	   
} 
 */
%> 

<%//if(count > 0) {

//String Grid=session.getAttribute("gridselect").toString();
/*  String Grid=request.getParameter("element_3_888");

System.out.println("Grid:-"+Grid);
 */
	%>
 <script>
 
 var test1=document.getElementById("gridname").value;
	
	if(test1=='Select')
		{
	
	var gridname = document.getElementById("element_3_88").value;
	//alert("gridname88"+document.getElementById("element_3_88").value);


		}
	else
		{
		
		var gridname = document.getElementById("gridname").value;
		//alert("gridname888"+document.getElementById("element_3_888").value);

		
		}
 
 var v="Roseindia";
 </script>
 <% String Grid1="<script>document.write(v)</script>";
 System.out.println("Grid:-"+Grid1);
 
 
 
 String location="",row="",column="";

 /* String sqlDropdown111="select * from smartgrid.t_dispmapping where username='"+username+"' and defaultgrid='Yes'";

 ResultSet rs11 = st1.executeQuery(sqlDropdown111);
 while(rs11.next()){
 	   //count=rs1.getString("count");
 	   gridname=rs11.getString("gridname");
 	   
 	   
 }  */
 System.out.println("In Display gridname===>"+gridname);

 String sqlDropdown111="select * from smartgrid.t_dispmapping where username='"+username+"' and defaultgrid='Yes' and gridstatus='Active'";
 String sqlDropdown222="select gridname from smartgrid.t_dispmapping where username='"+username+"'  and gridstatus='Active' limit 1";

 ResultSet rs11 = st1.executeQuery(sqlDropdown111);
 ResultSet rs22 = st2.executeQuery(sqlDropdown222);
 System.out.println("ELSE OF QUERy===>"+sqlDropdown111);

 if(rs11.next()){
 	   //count=rs1.getString("count");
 	   gridname=rs11.getString("gridname");
 	   
 	   
 }
 else
 {
 	
 	if(rs22.next())
 	{
 	gridname=rs22.getString("gridname");
 	}
 }
 System.out.println("In Display gridname11111===>"+gridname);
 
 %>
 

    
 <!-- <div id="" class="absolute"> --> 
    <!-- <div id="left"> -->
    
       <div id="topdisppanel"> 
    
    <div class="mainDIV">
    <div class="leftDIV"><img src="smartgrid.png"  height="50" width="200"></div>
    <div class="middleDIV"><font size="+2">SmartGrid Infra LLP</font></div>
    <div class="rightDIV">Welcome:<%=username%></div>
 </div>
    <table width="53%">
<tr>
<td><a  style="color:black; text-decoration:none" href="Home.jsp" onclick="Home.jsp">Home </a></td>
<td><a  style="color:black; text-decoration:none" href="javascript:void(0)" onclick="popUp('NewPanelBuilder.jsp');">NewGrid </a></div></td>

<td style="color:black; text-decoration:none">Grid </td>


<td>

<!--  <font color="red"></font> <font color="black" size="2">Grid</font>
 -->	 <select selected="select"  class=""   id="gridname" name="gridname" style="width: 120px; height:21px; border: 1px solid black; font: normal 13px Arial, Helvetica, sans-serif; color: #000000; border-color: activeborder;">
<!--<option value="Select">Select &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option> -->
				  		
				  		<option value="Select"><%=gridname%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option> 
				  		<% 
				  		String sqlDropdown11="select distinct(gridname) from smartgrid.t_dispmapping where username='"+username+"' and gridstatus='Active' ";
				  			ResultSet rsDropdown11=stRepNo.executeQuery(sqlDropdown11);
				  			System.out.println();
				  			while(rsDropdown11.next()){
				  				
				  				gridname1=rsDropdown11.getString("gridname");
				  				//Vehicleregno1=rsDropdown11.getString("VehicleRegNumber");
				  		%>
				  	<option value="<%=rsDropdown11.getString("gridname")%>"><%=rsDropdown11.getString("gridname")%></option>
							
						<% 	}%> 
</select>
</td>

<%
String sqlmp1 = "Select row,colval,location from smartgrid.t_dispmapping where username='"+username+"' and gridname='"+gridname1+"'  group by location";


ResultSet rs12 = st1.executeQuery(sqlmp1);


System.out.println("In Display panel fetch Rows and Columns===>"+sqlmp1);

while(rs12.next()){
	   //count=rs1.getString("count");
	   row1=rs12.getString("row");
	   col1=rs12.getString("colval");
	   
}
String Grid=request.getParameter("element_3_888");

System.out.println("Grid:-"+Grid);
//session.setAttribute("gridselect", gridname1);
%>
<input id="element_3_66" name="element_3_66" maxlength="2" class="element text small" type="hidden"  value="<%=row1%>"/>
<input id="element_3_77" name="element_3_77" maxlength="2" class="element text small" type="hidden"  value="<%=col1%>"/>
<input id="element_3_888" name="element_3_888" maxlength="500" class="element text small" type="hidden"  value="<%=gridname1%>"/>
<td><input type="submit" name="button1" id="button1" value="View Grid"  style="border-style: outset; border-color: width: 90px; height:20px; black; font: normal 13px Arial, Helvetica, sans-serif; "  onclick="Redirect();"></td>

 <td><input type="button" style="border-style: outset; border-color: width: 90px; height:20px; black; font: normal 13px Arial, Helvetica, sans-serif; " onclick="location.href='imagefour2.jsp';" value="Image View" /></td>
<td><a  style="color:black; text-decoration:none" href="javascript:void(0)" onclick="regcomplaint('DisplayPanel3.jsp');">Register complaint </a></td>

<td> Report No:<%=reportno%></td>
</tr>
</table>

       
       <table border="0" width="900" align="center" Style="padding: 0px 0 0 0px;" class="" >
            
<tr>

<td>
             
       

<!--  -->



<%
/* int i=0;

if(i==0)
{
String sqlDropdown111="select * from smartgrid.t_dispmapping where username='"+username+"' and defaultgrid='Yes'";

ResultSet rs11 = st1.executeQuery(sqlDropdown111);
while(rs11.next()){
	   //count=rs1.getString("count");
	   gridname=rs11.getString("gridname");
	   
	   
}

i++;
}
else
{
	


} */

//gridname="HPGrid";
//String sqlmp = "Select row,colval,location from smartgrid.t_dispmapping where username='"+username+"' and gridname='"+gridname+"' group by location";

String sqlmp = "Select row,colval,location from smartgrid.t_dispmapping where username='"+username+"' and gridname='"+gridname+"' group by location";


ResultSet rs1 = st1.executeQuery(sqlmp);


System.out.println("In Display panel fetch Rows and Columns===>"+sqlmp);

while(rs1.next()){
	   //count=rs1.getString("count");
	   row=rs1.getString("row");
	   column=rs1.getString("colval");
	   
}
session.setAttribute("griddefault", gridname);

%>
<!-- <label class="description" for="element_1"><b>Rows:</b> </label> -->
<input id="element_3_6" name="element_3_6" maxlength="2" class="element text small" type="hidden"  value="<%=row%>"/>
</td>
<td>
<!-- <label class="description" for="element_1"><b>Columns:</b> </label> -->
<input id="element_3_7" name="element_3_7" maxlength="2" class="element text small" type="hidden"  value="<%=column%>"/>
<input id="element_3_88" name="element_3_88" maxlength="500" class="element text small" type="hidden"  value="<%=gridname%>"/>
<input id="element_3_8" name="element_3_8"  class="element text small" type="hidden"  value=""/>
</td>
<td>
<!-- <input id="saveForm" class="button_text" type="submit" name="submit" value="View" onclick="Redirct();"/> -->
</td>
</tr>
</table>
    <%-- <%@ include file="DisplayPanelHeader.jsp"%> --%>
    </div>
    
      <div id="bottomdisppanel" >
      



 </div>   
    
     <div align="center" id="footerdisppanel" >
      
<%@ include file="footer.jsp" %>   


 </div>   
    
    
     
    
<!--     </div> -->
 
   <%//} else{
   
   
	System.out.println("ELSE OF QUERy===>");
	
    /* String sqlDropdown111="select * from smartgrid.t_dispmapping where username='"+username+"' and defaultgrid='Yes'";

    ResultSet rs11 = st1.executeQuery(sqlDropdown111);
	System.out.println("ELSE OF QUERy===>"+sqlDropdown111);

   while(rs11.next()){
   	   //count=rs1.getString("count");
   	   gridname=rs11.getString("gridname");
   	   
   	   
   }    */ 

	
   %> 
   
<%--     <input id="element_3_888" name="element_3_888" maxlength="2" class="element text small" type="hidden"  value="<%=gridname%>"/>
 --%>    
   
   <%
   
   }
   catch(Exception e)
   {
   	e.printStackTrace();
   }
   
   %>


    <script type="text/javascript">
        //The following script is for the group 2 navigation buttons.
        function switchAutoAdvance() {
            imageSlider.switchAuto();
            switchPlayPauseClass();
        }
        function switchPlayPauseClass() {
            var auto = document.getElementById('auto');
            var isAutoPlay = imageSlider.getAuto();
            auto.className = isAutoPlay ? "group2-Pause" : "group2-Play";
            auto.title = isAutoPlay ? "Pause" : "Play";
        }
        switchPlayPauseClass();
        function switchAutoAdvance1() {
            imageSlider1.switchAuto();
            switchPlayPauseClass1();
        }
        function switchPlayPauseClass1() {
            var auto = document.getElementById('auto1');
            var isAutoPlay = imageSlider1.getAuto();
            auto.className = isAutoPlay ? "group2-Pause" : "group2-Play";
            auto.title = isAutoPlay ? "Pause" : "Play";
        }
        switchPlayPauseClass1();
        function switchAutoAdvance2() {
            imageSlider2.switchAuto();
            switchPlayPauseClass2();
        }
        function switchPlayPauseClass2() {
            var auto = document.getElementById('auto2');
            var isAutoPlay = imageSlider2.getAuto();
            auto.className = isAutoPlay ? "group2-Pause" : "group2-Play";
            auto.title = isAutoPlay ? "Pause" : "Play";
        }
        switchPlayPauseClass2();
        function switchAutoAdvance3() {
            imageSlider3.switchAuto();
            switchPlayPauseClass3();
        }
        function switchPlayPauseClass3() {
            var auto = document.getElementById('auto3');
            var isAutoPlay = imageSlider3.getAuto();
            auto.className = isAutoPlay ? "group2-Pause" : "group2-Play";
            auto.title = isAutoPlay ? "Pause" : "Play";
        }
        switchPlayPauseClass3();
    </script>
<script>
window.onload=Redirect;
//window.onload=autorequest;

</script>
 
  
<%-- <%@ include file="footer.jsp" %> --%>    
</body>
</html>
<%-- </jsp:useBean> --%>
 