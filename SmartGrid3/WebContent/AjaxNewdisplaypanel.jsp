<%@ include file="Conn.jsp" %>

<%@page import="java.util.Date"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.*" %>
   
   <%@ page import="java.sql.*" %>

  	<%@ page import = "java.io.FileNotFoundException"%>
  	<%@ page import = "java.io.FileOutputStream"%>
  	<%@ page import = "java.io.IOException"%>
  	<%@ page import="javax.activation.*" %>
  	<%@page import="java.io.BufferedReader" import="java.io.InputStreamReader" import="java.net.URL" %>
  	<%@page import="java.net.URLEncoder" import="java.net.URLConnection"%>
  	
  	 <%@page import="java.text.SimpleDateFormat"%>

<%!
// Connection con1;
// Statement st,st1,st2,st3,st4,st5;

Connection con1 = null;
	Statement st = null;
	Statement st1 = null;
	Statement st2 = null;
	Statement st3 = null;
	Statement st4 = null;
	Statement st5 = null;
	Statement st6 = null;
	

%>


<%
try
{

Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
st=con1.createStatement();
st1=con1.createStatement();
st2=con1.createStatement();
st3=con1.createStatement();
st4=con1.createStatement();
st5=con1.createStatement();
st6=con1.createStatement();


	
	String rows=request.getParameter("rows");
	
	//System.out.println("rows:-"+rows);
	String columscount=request.getParameter("columscount");
	//System.out.println("columscount:-"+columscount);
	
		String gridname=request.getParameter("gridname");
		
		//session.setAttribute("gridselect", gridname);

		
		String row1="";
		String column1="";

	       String username=session.getAttribute("username").toString();

		String sqlmp1 = "Select row,colval,location from smartgrid.t_dispmapping where username='"+username+"' and gridname='"+gridname+"' group by location";


		ResultSet rs11 = st1.executeQuery(sqlmp1);


		System.out.println("In Ajax new fetch Rows and Columns===>"+sqlmp1);

		while(rs11.next()){
			   //count=rs1.getString("count");
			   row1=rs11.getString("row");
			   column1=rs11.getString("colval");
			   
		}
		
		
	int noofrow=Integer.parseInt(row1);
	int noofcolumn=Integer.parseInt(column1);
	//System.out.println(noofrow);
	//System.out.println(noofcolumn);
	 int total=noofrow*noofcolumn;
	   //System.out.println(total);
	  
	  double actrowsize=100/noofrow;
	  double actcolumnsize=100/noofcolumn;
	  String factrowsize=actrowsize+"%";
	  String factcolumnsize=actcolumnsize+"%";
	
	String location="",camerapos="",snaptime="",vehiclecode="",vehicleregnumber="",rawfilename="";
	String nlocation[],ncamerapos[],nsnaptime[],nvehiclecode[],nvehicleregnumber[],nrawfilename[];
	   
       
	    String sqlmp = "Select location,camerapos,snaptime,vehiclecode from smartgrid.t_dispmapping where username='"+username+"' and gridname='"+gridname+"' order by srno asc limit "+total+"";
	   // String sqlmp = "Select location,camerapos,snaptime,vehiclecode from smartgrid.t_dispmapping where username='"+username+"'  order by srno desc limit "+total+"";

	    
	    ResultSet rs1 = st1.executeQuery(sqlmp);
	    System.out.println("Sql MP AjaxNewDisplay:-"+sqlmp);
	   int i1=0;
	   while(rs1.next()){
		   //count=rs1.getString("count");
		   i1++;
		   
		   location+=rs1.getString("location")+"#";
		   
		   vehiclecode+=rs1.getString("vehiclecode")+"####";
		   
		   camerapos+=rs1.getString("camerapos")+"##";
		   
		  
		   
// 		   snaptime+=rs1.getString("snaptime")+"###";
		   
		   //count++;
	   }
	   
	   System.out.println("I1:-"+i1);
	   
	   //System.out.println("camerapos:-"+camerapos);
	   
	   nlocation=location.split("#");
	   ncamerapos=camerapos.split("##");
	   nvehiclecode=vehiclecode.split("####");
	   
	   /* String sql1 = "Select * from smartgrid.t_jpgsnapsmartgrid where vehiclecode='"+nvehiclecode[i]+"' and camerapos='"+ncamerapos[i]+"' order by snapdatetime desc limit 1";
 	   ResultSet rs1 = st3.executeQuery(sql1);
 	   
 	   if(rs.next())
 		   
 	   {
 		    
 	   } */
	   
	   
	

	   for(int i=0;i<total;i++)
 	   {
		   
 		  // String sql = "Select * from smartgrid.t_jpgsnapsmartgrid where vehiclecode='"+nvehiclecode[i]+"' and camerapos='"+ncamerapos[i]+"' order by snapdatetime desc limit 1";
 		   
 		 // String sql = "Select * from smartgrid.t_jpgsnapsOnline where vehiclecode='"+nvehiclecode[i]+"' and camerapos='"+ncamerapos[i]+"' order by snapdatetime desc limit 1";
 		  
 		 String sql = "Select * from smartgrid.t_jpgsnapsOnline where vehiclecode='"+nvehiclecode[i]+"' and camerapos='"+ncamerapos[i]+"' order by snapdatetime desc limit 1"; 
 		 
     	   ResultSet rs = st.executeQuery(sql);
   		 
      	   System.out.println("sql::::::-"+sql);
 		
     	  while(rs.next()){
   			
     		 vehicleregnumber+=rs.getString("vehicleregnumber")+"#";
     		  
     		  
    			  snaptime+=rs.getString("snapdatetime")+"###";
   			
    			  rawfilename+=rs.getString("srno")+"####";
    			  
    			  String UpdateDissMap="update smartgrid.t_dispmapping set snaptime='"+rs.getString("snapdatetime")+"',rawfilename='"+rs.getString("rawfilename")+"',jpgfilename='"+rs.getString("jpgfilename")+"' ,location='"+rs.getString("vehicleregnumber")+"' where vehiclecode='"+rs.getString("vehiclecode")+"' and camerapos='"+rs.getString("camerapos")+"' and username='"+username+"' and gridname='"+gridname+"'";
    			 // System.out.println("Update :- "+UpdateDissMap);
    			  st6.executeUpdate(UpdateDissMap);
    			  //System.out.println("Update :- "+UpdateDissMap);
    			 }
    	   
		   
 	   }
	   
	  // System.out.println("rawfilename:-"+rawfilename);
	   
 	   nsnaptime=snaptime.split("###");
	   
 	  nvehicleregnumber=vehicleregnumber.split("#");
	   
 	 nrawfilename=rawfilename.split("####");
 	  
//  	String dt = snaptime.substring(0,19)));
 	 
//  	 System.out.println("dt:-"+dt);
 	 
	String buffer="";
	
           for(int i=0;i<total;i++)	
            {
        	   
        	   
        	String    dt = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(nsnaptime[i].substring(0,19)));
        	  
          
        	String rawfile=nrawfilename[i];
        	
        	
        	   buffer+="<div id='div"+i+"'    style='width:"+factcolumnsize+"; height:"+factrowsize+";  outline:3px solid #000; float: left;'><b>"+nvehicleregnumber[i]+"            "+ncamerapos[i]+"     </b><a href='#'  onClick='showFTPImage1("+rawfile+");'><img id='imgZoom"+i+"' class='pqr1' border='5'/></a></div>";
             
        	   
          	  // System.out.println("Buffer Here 0000 : -"+buffer);
        	   
            } 
          
          out.println(buffer);
	       
					
				



}
catch(Exception e)
{
	out.print("Please Reload");
}
finally
{
		st.close();
		st1.close();
		con1.close();
}

%>