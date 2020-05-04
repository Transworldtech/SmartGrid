<%@ include file="Conn.jsp" %>

<%@page import="java.util.Date"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.*" %>
   <%@ page import="java.util.Arrays,java.util.List" %>
   <%@ page import="java.sql.*" %>

  	<%@ page import = "java.io.FileNotFoundException"%>
  	<%@ page import = "java.io.FileOutputStream"%>
  	<%@ page import = " java.io.IOException"%>
  	<%@ page import="javax.activation.*" %>
  	<%@page import="java.io.BufferedReader" import="java.io.InputStreamReader" import="java.net.URL" %>
  	<%@page import="java.net.URLEncoder" import="java.net.URLConnection"%>
  	
  	 

<%!
Connection con1;
Statement st,st1,st2,st3,st4,st5;
%>

<%

Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
st=con1.createStatement();
st1=con1.createStatement();
st2=con1.createStatement();
st3=con1.createStatement();
st4=con1.createStatement();
st5=con1.createStatement();
try {

	
	
	
	
	String rows=request.getParameter("rows");
	String columscount=request.getParameter("columscount");
	String access=request.getParameter("access");
	
	
	
	int noofrow=Integer.parseInt(rows);
	int noofcolumn=Integer.parseInt(columscount);
	System.out.println(noofrow);
	System.out.println(noofcolumn);
	 int total=noofrow*noofcolumn;
	   System.out.println(total);
	  
	 
	String deviceid="",cameraposition="";
	String dyoption="",dyoptionofcampos="";
	String Ndeviceid[],Ncameraposition[];
	
	String campos="select distinct(camerapos) as campos from smartgrid.t_jpgsnapsmartgrid";
	ResultSet rscampos=st.executeQuery(campos);
	while(rscampos.next())
    {
		cameraposition+=rscampos.getString("campos")+"#";  
 	 	  
     }
	Ncameraposition=cameraposition.split("#");
    
	if(access.equalsIgnoreCase("ssmbasic"))
	{
		
		
		for(int k=0;k<2;k++)
		    {
		    	/* dyoptionofcampos+="<option value="+Ncameraposition[k]+" >"+Ncameraposition[k]+"</option>"; */
		    	dyoptionofcampos="<option value=Cam1 >Cam1</option><option value=Cam2 >Cam2</option>";
		    	System.out.println("dyoptionofcampos:-"+dyoptionofcampos);
		    }
	}
	else
	{
		for(int k=0;k<2;k++)
	    {
	    	/* dyoptionofcampos+="<option value="+Ncameraposition[k]+" >"+Ncameraposition[k]+"</option>"; */
			dyoptionofcampos="<option value=Cam1 >Cam1</option><option value=Cam2 >Cam2</option>";
	    	System.out.println("dyoptionofcampos:-"+dyoptionofcampos);

	    }
	}
    
     String sqlwesite="";
	
	String typevalue=session.getAttribute("typevalue").toString();

	System.out.println("typevalue:-"+typevalue);
	
	
	String TypeofUser=session.getAttribute("TypeofUser").toString();

	String company = session.getAttribute("company").toString();
	
	System.out.println("company:-"+company);
	
	if(TypeofUser.equalsIgnoreCase("Transporter"))
	{
         sqlwesite=" select Vehiclecode,vehicleregnumber from  db_gps.t_vehicledetails  where ownername='"+typevalue+"' and Status='-' order by vehicleregnumber";
		 
	}
	else
	{
		sqlwesite="select b.Vehiclecode,b.vehicleregnumber from  db_gps.t_group a inner join db_gps.t_vehicledetails  b on (b.vehiclecode=a.VehCode)  where  b.Status='-' and a.gpname='"+typevalue+"' order by vehicleregnumber;";
		
	}	
	
	
	System.out.println("sqlwesite:-"+sqlwesite);
		
	
		
	 ResultSet rssqlwebsite=st1.executeQuery(sqlwesite);
    
    
    
    
    while(rssqlwebsite.next())
    {
	    deviceid+=rssqlwebsite.getString("vehicleregnumber")+"#";  
 	 }
    Ndeviceid=deviceid.split("#");
    
    
    
    

    
    
    for(int j=0;j<Ndeviceid.length;j++)
    {

  
    	String xyx=Ndeviceid[j];
    	
    	xyx=xyx.replaceAll(" ", "&");
    	
    	
    	
    	dyoption+="<option value="+xyx+">"+Ndeviceid[j]+"</option>";

    }
    
    
    
    
    
    

    
//  align='center'
	StringBuilder buffer=new StringBuilder();
	//String buffer=actrowsize+"#"+actcolumnsize+"#"+total;
	buffer.append("<div align='center' float:center;>");
	
	buffer.append("<br>");
	 buffer.append("<br>");

 buffer.append("<br>");
 buffer.append("<br>");

      int wd=80/noofcolumn;   	
      int n=0;   	
             for(int i=0; i<noofrow; i++)
             {
	
             
              for(int j=1; j<=noofcolumn;j++)
             {
         	System.out.println("ij values:-"+i+"j values"+j+"N Value"+n);
       
	
			buffer.append("<div class='' border='' style='width: "+wd+"%;float:left;padding:10px;border: 1px solid black;margin-left: 2%; background-color:RGB(217, 217, 217);' align='right'>");

			 buffer.append("<div align='left' style='font-color:black;'>");
     		 buffer.append("<b>SrNo:</b>");
    	     buffer.append(""+j+"</label>");
    	     buffer.append("<br>");
    	    buffer.append("<b>Location:</b>");
    	    buffer.append("<select class='element select medium' style='width:100%;color:black;' id='element_3_8"+n+"' name='element_3_8"+n+"'><option value='Select' selected='selected'>Select</option>"+dyoption+"</select>");
        	  buffer.append("<br>");  
    	    buffer.append("<b>Camera:</b>");
		buffer.append("<select class='element select medium' style='width:100%;' id='element_3_9"+n+"' name='element_3_9"+n+"'><option value='Select' selected='selected'>Select</option>"+dyoptionofcampos+"</select>");     
         buffer.append("</div>"); 
     	buffer.append("</div>"); 
n++;

}

              buffer.append("<br>");
             



         }  

       

      

       buffer.append("</div>");
       buffer.append("<br>");
       buffer.append("<br>");
       buffer.append("<br>");
       buffer.append("<br>");
       buffer.append("<br>");
       buffer.append("<br>");
       buffer.append("<br>");
       buffer.append("<br><br><br><br><br><br><div align='center' style='margin-left: 3%;'><input id='saveForm' class='button_text' type='submit' name='submit' value='Submit' /> </div>");

       


       out.println(buffer+"#"+total+"#"+noofrow+"#"+noofcolumn);

	 

	
} catch(Exception e) { 
	out.print("NotDone");
	}
	finally
	{
		st.close();
		st1.close();
		con1.close();
	}

%>