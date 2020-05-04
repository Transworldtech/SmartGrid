<%@ include file="Conn.jsp" %>

<%@page import="java.util.Date"%>
<%@ page import="java.util.List" %>
   <%@ page import="java.util.Iterator" %>
   <%@ page import="java.io.File" %>
   <%@ page import="java.io.*" %>
   <%-- <%@ page import="java.util.Properties,javax.mail.*,javax.mail.internet.*"%> --%>
<%--    <%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
   <%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
   <%@ page import="org.apache.commons.fileupload.*"%> --%>
   <%@ page import="java.sql.*" %>
   
   <%@page import="java.text.SimpleDateFormat"%>

  	<%@ page import = "java.io.FileNotFoundException"%>
  	<%@ page import = "java.io.FileOutputStream"%>
  	<%@ page import = " java.io.IOException"%>
  	<%@ page import = " java.util.*"%>
  	<%@ page import="javax.activation.*" %>
  	<%@page import="java.io.BufferedReader" import="java.io.InputStreamReader" import="java.net.URL" %>
  	<%@page import="java.net.URLEncoder" import="java.net.URLConnection"%>
  	
  	 

<%!
Connection con1;
Statement st,st1,st2,st3,st4,st5;
%>
<%
try {

	String totcount=request.getParameter("element_3_10");
	//out.println(totcount);
	String row=request.getParameter("element_3_11");
	//out.println(row);
	String column=request.getParameter("element_3_12");
	//out.println(column);
	
	String gridname=request.getParameter("element_3_88");
	//out.println(gridname);
	
	//String matrix=request.getParameter("matrix");
	//String rows=request.getParameter("rows");
	//String columscount=request.getParameter("columscount");
	//String headerpage=request.getParameter("headerpage");
	//String footerpage=request.getParameter("footerpage");
	
	//int dtotcount=Integer.parseInt(totcount);
	 
	int noofrow=Integer.parseInt(row);
	System.out.println("noofrows:-"+noofrow);
	int noofcolumn=Integer.parseInt(column);
	System.out.println("noofcolumn:-"+noofrow);
	int total=noofrow*noofcolumn;
	
	System.out.println("gridname:-"+gridname);
	
	//out.println(total);
	//out.println(dtotcount);
		
	
	
	
 



	
	
	
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
st=con1.createStatement();
st1=con1.createStatement();
st2=con1.createStatement();
st3=con1.createStatement();
st4=con1.createStatement();
st5=con1.createStatement();

ResultSet rst=null;
String sql="",body="";
String location="",campos="",access="";
//String username=session.getAttribute("userid").toString();
String username=session.getAttribute("User").toString();
 System.out.println("username:"+username);


access=session.getAttribute("Access").toString();
	System.out.println("access>>>>"+access);



try{
	
	
	

 	/* String sql6= "Delete from smartgrid.t_dispmapping where username='"+username+"' ";
	int count1=st1.executeUpdate(sql6); */
	
	if(access.equalsIgnoreCase("ssmbasic"))
	{
		String ssmquery="select * from smartgrid.t_dispmapping where username='"+username+"'";
		ResultSet ssmrs=st5.executeQuery(ssmquery);
		if(ssmrs.next())
	    {
			String sql6= "Delete from smartgrid.t_dispmapping where username='"+username+"' ";
			int count1=st1.executeUpdate(sql6);
			System.out.println("count1"+count1);
	    }
	}
	
	
	
// 	 for (int[] arr : matrix1) {
	    int row1 = 0;
	    int col = 0;
	    int i=1;
	    int j=1;   
		// System.out.println(Arrays.toString(arr));
	     
	 int[][] matrix1 = new int[noofrow][noofcolumn];
	
	 
 
	 

		System.out.println("total--------------:-"+total);

	 
for(int k=0;k<total;k++)
{

// 	 if(i<=noofrow)
//      {
//      if(j<=noofcolumn)
//      {
//         row1=i;
//         col=j;
//      }
//      }

		System.out.println("k---------------:-"+k);


	
    String vehiclecode="",snapdate="";


location=request.getParameter("element_3_8"+k).replace("&"," ");
	
    
    	
    	
     
	 campos=request.getParameter("element_3_9"+k);

	 
	 
	 
	 
	 
    	
	  	String sqlwesite=" select a.Vehiclecode,a.vehicleregnumber,a.snapdatetime from  smartgrid.t_jpgsnapsOnline a inner join db_gps.t_vehicledetails b using (vehiclecode) where b.VehicleRegNumber like '%"+location+"%' group by vehiclecode";

 	 ResultSet rssqlwebsite=st1.executeQuery(sqlwesite);
 	System.out.println("sqlwesite:-"+sqlwesite);

 	 while(rssqlwebsite.next())
 	 {
	 
 		  vehiclecode=rssqlwebsite.getString("Vehiclecode");
 		  
 		  
 		  snapdate=rssqlwebsite.getString("snapdatetime");
     }
 	   
//  	System.out.println("snapdatetime"+snapdate);
 
 	String dt ="";
 	
	String sql5="";
 	
// if(location.equalsIgnoreCase("select")){
	
// 	String sql8= "insert into smartgrid.t_dispmapping(location,camerapos,username,row,colval,vehiclecode)  values ('"+location+"','"+campos+"','"+username+"',"+row+","+column+","+vehiclecode+")";
// 	int count=st1.executeUpdate(sql8);
	
	
// }
// else
// {
	
	String snapdate1="";
	
	if(snapdate=="")
	{
		
		
// 		dt="0000-00-00 00:00:00";
		

// 	 	sql5= "insert into smartgrid.t_dispmapping(location,camerapos,username,row,colval,vehiclecode)  values ('"+location+"','"+campos+"','"+username+"',"+row+","+column+","+vehiclecode+")";
	 	 
// 	 	int count=st1.executeUpdate(sql5);

		String insertSQL = "Insert into smartgrid.t_dispmapping(location,camerapos,username,row,colval,vehiclecode,gridname,entryby) values('"+location+"','"+campos+"','"+username+"',"+row+","+column+",'"+vehiclecode+"','"+gridname+"','"+username+"')";
		int count1=st2.executeUpdate(insertSQL);
		System.out.println("insertSQL:-"+insertSQL);

		
		
	}
	else
	{
 	    snapdate1=snapdate.substring(0,19);
 	    
 	  
 	 	
 	 	 dt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
 		.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
 				.parse(snapdate1));
 	 	 

 	 	sql5= "insert into smartgrid.t_dispmapping(location,camerapos,username,row,colval,vehiclecode,gridname,snaptime,entryby)  values ('"+location+"','"+campos+"','"+username+"',"+row+","+column+",'"+vehiclecode+"','"+gridname+"','"+dt+"','"+username+"')";
 	 	 
 	 	int count=st2.executeUpdate(sql5);
 		System.out.println("sql5:-"+sql5);

	}
	
	
 	
 	 
// }

 
 	
  
//   	System.out.println("sql5:-"+sql5); 	

//   	System.out.println("dt:-"+dt);
 	
  
  	
 
				
// 				if(j<noofcolumn)
// 				{
// 				j++;
// 				}
// 				else
// 				{
// 				j=1;
// 				i++;
// 				}			

}			


// 	 }
          //response.sendRedirect(ar g0);
           
         /*   out.println("<script>");
           out.println("window.location='DisplayPanel3.jsp';");
           out.println("window.opener.location.reload();");
           out.println("window.close();");
           out.println("</script>");
 */
					
                    }
					catch(Exception e)
					{e.printStackTrace();}
					
				



} catch(Exception e) { 
	out.print("NotDone");
	}
	finally
	{
	
			st.close();
			st1.close();
			st2.close();
			con1.close();
		}
	

%>


<script type="text/javascript">
alert("Grid Created Successfully");
		window.location="DisplayPanel3.jsp";
		
		</script>