<%@ include file="headernew.jsp"%> 

<%@ page import="java.sql.*" %>
 <%@
page import=  
    
      "java.io.BufferedReader,
 java.io.File,
 java.io.FileNotFoundException,
 java.io.IOException,
 java.io.InputStreamReader,
 java.io.PrintStream,
 java.io.PrintWriter,
 java.net.URL,
 java.net.URLConnection,
 java.sql.Connection,
 java.sql.DriverManager,
 java.sql.ResultSet,
 java.sql.SQLException,
 java.sql.Statement,
 java.text.DateFormat,
 java.text.Format,
 java.text.SimpleDateFormat,
 java.util.Map,
 java.util.Properties,
 java.util.StringTokenizer,
 java.util.regex.Matcher,
 java.util.regex.Pattern,

 org.json.JSONObject,
  org.json.JSONObject,
   java.sql.PreparedStatement"%>


<%! 
Connection conn=null;


%>
<% 




	Class.forName("com.mysql.jdbc.Driver").newInstance();
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
    Statement st=conn.createStatement();
  Statement st1=conn.createStatement();
  Statement st2=conn.createStatement();
  
  String username=session.getAttribute("username").toString();



String status="";
String gridname="";
String ugridname="";

 gridname=request.getParameter("gridname").toString();
 status =request.getParameter("status").toString();
System.out.println("my value gridname-----------------------" + gridname);
System.out.println("my value staus-----------------------" + status);
System.out.println("my value username-----------------------" + username);


	
	
	if(status.equals("delete"))
	{
			System.out.println("In deletestatus:-"+status);

	
 String deletequery=" update  smartgrid.t_dispmapping set gridstatus='DeActive',defaultgrid='No' where  gridname='"+gridname+"' and username='"+username+"'";
	System.out.println("deletestatus:-"+deletequery);

 			 int deletestatus=st1.executeUpdate(deletequery);
  			System.out.println("deletestatus:-"+deletequery);

			
 			System.out.println("deletestatus:-"+deletestatus);
	}		
 	
else if(status.equals("update"))
{
	System.out.println("In Updatestatus:-"+status);

	String media="select * from smartgrid.t_dispmapping where defaultgrid='Yes'  and username='"+username+"'";
    ResultSet rs77=st1.executeQuery(media);
		
	 while(rs77.next())
	 {
		 ugridname=rs77.getString("gridname");
	 
		 
		 
	 }

	 String updatequery11="update  smartgrid.t_dispmapping set defaultgrid='No' where  gridname='"+ugridname+"' and username='"+username+"'";
		System.out.println("updatestatus11:-"+updatequery11);

  int updatestatus11=st1.executeUpdate(updatequery11);
		System.out.println("updatestatus11:-"+updatequery11);

			System.out.println("updatestatus11:-"+updatestatus11);
	 
	 
	 
	 
        String updatequery="update  smartgrid.t_dispmapping set defaultgrid='Yes' where  gridname='"+gridname+"' and username='"+username+"'";
		System.out.println("updatestatus:-"+updatequery);

        int updatestatus=st1.executeUpdate(updatequery);
		System.out.println("updatestatus:-"+updatequery);

			System.out.println("updatestatus:-"+updatestatus);
        
        
}		
 	
	 
	 
%>
	


<script type="text/javascript">
alert("Grid Updated Successfully");
		window.location="mygridreport.jsp";
		
		</script>




