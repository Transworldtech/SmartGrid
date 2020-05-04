<%@ include file="Conn.jsp" %>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@ page import="java.util.List" %>
   <%@ page import="java.util.Iterator" %>
   <%@ page import="java.io.File" %>
   <%@ page import="java.io.*" %>
   <%-- <%@ page import="java.util.Properties,javax.mail.*,javax.mail.internet.*"%> --%>
   <%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
   <%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
   <%@ page import="org.apache.commons.fileupload.*"%>
   <%@ page import="java.sql.*" %>

  	<%@ page import = "java.io.FileNotFoundException"%>
  	<%@ page import = "java.io.FileOutputStream"%>
  	<%@ page import = "java.io.IOException"%>
  	<%@ page import="javax.activation.*" %>
  	<%@page import="java.io.BufferedReader" import="java.io.InputStreamReader" import="java.net.URL" %>
  	<%@page import="java.net.URLEncoder" import="java.net.URLConnection"%>
  	
  	 

<%!
Connection conn;
Statement st,st1,st2,st3,st4,st5,st6;
//String buffer="";
%>

<% 
try {	
	//out.println("here0");
	Class.forName(MM_dbConn_DRIVER);
	 conn = DriverManager.getConnection(MM_dbConn_STRING, MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
	 st = conn.createStatement();
	 st1 = conn.createStatement();
	 st2 = conn.createStatement();
	 st3 = conn.createStatement();
	 st4 = conn.createStatement();
	 st5 = conn.createStatement();
	 st6 = conn.createStatement();
	 
	  String  jpgfilename ="",unitid="",snapdatetime="",jpgfilename1="",jpgfilename2="",jpgfilename3="";
       String sql="",buffer="",sqlmp="";
 	   String location="",camerapos="",snapdatetime1="",vehiclecode="";
 	   int count=0,count2=0;
 	   String location1[],camerapos1[],snapdatetime2[],vehiclecode1[];

       StringBuilder sb=new StringBuilder();
       
       String rows=request.getParameter("rows");
   	
   	//System.out.println("rows:-"+rows);
   	String columscount=request.getParameter("columscount");
   	//System.out.println("columscount:-"+columscount);
   	
   	String gridname=request.getParameter("gridname");
 		System.out.println("gridname:-"+gridname);
   	
 		

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

      // String username=session.getAttribute("username").toString();
       //System.out.println("username:-:-:-:-"+username);
       
   	String typevalue=session.getAttribute("typevalue").toString();

   	//System.out.println("typevalue:-"+typevalue);
   	
   	
   	String TypeofUser=session.getAttribute("TypeofUser").toString();
       
       
       
   	String company = session.getAttribute("company").toString();
//   	count=4;

       sqlmp = "Select location,camerapos,vehiclecode,snaptime from smartgrid.t_dispmapping where username='"+username+"' and gridname='"+gridname+"' order by srno asc limit "+total+" ";
	   ResultSet rs1 = st1.executeQuery(sqlmp);
	   
	  System.out.println("sqlmp displayAjax:-"+sqlmp);
	   
	   if (rs1.next()) {
		    do {
		    
		    	 location+=rs1.getString("vehiclecode")+"#";
		 		   camerapos+=rs1.getString("camerapos")+"#";
		 		  snapdatetime1+=rs1.getString("snaptime")+"#";
		 		 vehiclecode+=rs1.getString("vehiclecode")+"#";
		 		   count++;
		    	
		    } while(rs1.next());
		}
      
	    else 
		{
		
			
			String sqlwesite="",snapdate="",snapdate1="",dt="",locationnew="",vehcodee="";
			
 		
			
			if(TypeofUser.equalsIgnoreCase("Transporter"))
			{
		         sqlwesite="select Vehiclecode,vehicleregnumber from  db_gps.t_vehicledetails  where ownername='"+typevalue+"' and Status='-' order by vehicleregnumber limit 4";
			}
			else
			{
				sqlwesite="select b.Vehiclecode,b.vehicleregnumber from  db_gps.t_group a inner join db_gps.t_vehicledetails  b on (b.vehiclecode=a.VehCode)  where  b.Status='-' and a.gpname='"+typevalue+"' order by vehicleregnumber limit 4;";
			}
 			
			System.out.println("sqlwebsite:-"+sqlwesite);
				
			 ResultSet rs5=st1.executeQuery(sqlwesite);
		    
 
			 
			 while(rs5.next())
			    {
				      locationnew+=rs5.getString("vehicleregnumber")+"#";  
				    
				     
				      vehcodee+=rs5.getString("Vehiclecode")+"#";

				   
				      
//   				      snapdate+=rs5.getString("snapdatetime")+"#";
				    
  				      
			 	   
   				     


				   
 				      count2++;
			
		     	}

	
			 
			
			   
			   String locationnew1[],vehcodee1[],dt1[],snapdate3[];
			   
			   locationnew1=locationnew.split("#");
			   vehcodee1=vehcodee.split("#");
// 			   snapdate3=snapdate.split("#");
			   
			   
 			 //  System.out.println("snapdate:-"+snapdate);
// 			   dt1=dt.split("#");
			   
 //System.out.println("count2:-"+count2);

     if(count2>=4)
     {
    	 
    	   for(int i=0;i<count2;i++)
		   {
		
		   
 String sql5= "insert into smartgrid.t_dispmapping(location,camerapos,username,row,colval,vehiclecode)  values ('"+locationnew1[i]+"','cam1','"+username+"','2','2','"+vehcodee1[i]+"')";
 	 	 
        int count1=st1.executeUpdate(sql5);
	
//System.out.println("sql5:-"+sql5);
		 
		   }
    	 
      }
     else
     {
    	 
    	 for(int i=0;i<count2;i++)
		   {
    	 
    	 String sql5= "insert into smartgrid.t_dispmapping(location,camerapos,username,row,colval,vehiclecode)  values ('"+locationnew1[i]+"','cam1','"+username+"','1','2','"+vehcodee1[i]+"')";
 	 	 
         int count1=st1.executeUpdate(sql5);
    	 
         //System.out.println("sql5:-"+sql5);
     }
    	 
     }

         

			
		}
	   

	   location1=location.split("#");
	   camerapos1=camerapos.split("#");
	   snapdatetime2=snapdatetime1.split("#");
	   vehiclecode1=vehiclecode.split("#");
       //out.println(location1);
       sb.setLength(0);
       //for(int i=0;i<=mu.length-1;i++)
    	   String vehicleregnumber="",rawfilename="",camerapos2="",vehcode="";
      for(int i=0;i<total;i++)
       {
    	   //sql = "Select * from smartgrid.t_jpgsnapsmartgrid where vehiclecode='"+location1[i]+"' and camerapos='"+camerapos1[i]+"' order by snapdatetime desc limit 1";
    	   try{
    		   
    	   sql = "Select * from smartgrid.t_jpgsnapsOnline where vehiclecode='"+vehiclecode1[i]+"' and camerapos='"+camerapos1[i]+"' and  snapdatetime > '"+snapdatetime2[i]+"' order by snapdatetime desc limit 1";
    	   ResultSet rs = st.executeQuery(sql);
   		 
     	   System.out.println("sql:-"+sql);
     	   
   		
   		 if(rs.next()){
   			
   			  unitid = rs.getString("unitid");
   			
   			  jpgfilename = rs.getString("rawfilename");
   			
   			  snapdatetime = rs.getString("snapdatetime");
   			  
   			vehicleregnumber=rs.getString("vehicleregnumber");
   		  
   		    rawfilename=rs.getString("srno");
   		    
   		 camerapos2=rs.getString("camerapos");
   		 
   		 vehcode=rs.getString("vehiclecode");
   		 
   		String UpdateDissMap="update smartgrid.t_dispmapping set snaptime='"+rs.getString("snapdatetime")+"',rawfilename='"+rs.getString("rawfilename")+"',jpgfilename='"+rs.getString("jpgfilename")+"'  where vehiclecode='"+rs.getString("vehiclecode")+"' and camerapos='"+rs.getString("camerapos")+"' and username='"+username+"'";
   		st6.executeUpdate(UpdateDissMap);
   		System.out.println("Update :- "+UpdateDissMap);	
   			 }
   		 else
   		 {
   			jpgfilename="DoNotReload";
   		 }
   		 
   	//	System.out.println(" VehCode   :-"+vehcode); 
   		//System.out.println(" location   :-"+vehicleregnumber);
   		//System.out.println(" Camera    :-"+camerapos2);
   		//System.out.println(" snapdatetime :-"+snapdatetime);
   		//System.out.println(" jpgfilename  :-"+jpgfilename);
   		
   		
   		
   		//double noofrow=3.00;
   		//double noofcolumn=2.00;
   		
   		double actrowsize=100/noofrow;
  	  double actcolumnsize=100/noofcolumn;
  	  String factrowsize=actrowsize+"%";
  	  String factcolumnsize=actcolumnsize+"%";
   				
  //	String    dt = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(snapdatetime.substring(0,19)));
  	
   	//	String  buffer1="<div id='div"+i+"'    style='width:"+factcolumnsize+"; height:"+factrowsize+";  outline:3px solid #000; float: left;'><b>"+vehicleregnumber+"            "+camerapos2+"      "+dt+" </b><a href='#'  onClick='showFTPImage1("+rawfilename+");'><img id='imgZoom"+i+"' class='pqr1' border='5'/></a></div>";
        
   		buffer+=jpgfilename+"##";
   		
    	  System.out.println("Buffer Here:-"+buffer);
    	   
   		
   		//buffer+=buffer1+"**";
   		//buffer+=jpgfilename+"#";
   		
   		
    	   }
       catch(Exception e)
       {
    	   
       }
       
       
       
   
       System.out.println("\n");

       }
      
      sb.append(buffer);
 		
 		System.out.println("Inside Buffer Plus Buffer 1 :-"+buffer);
 		
 		out.println(buffer);
} catch(Exception e) { 
	out.print("NotDone2222"+e);
	
	}
	finally
	{
		//st.close();
		//st1.close();
		//con1.close();
	}

%>