   <%@ page import="java.sql.*" %>
   <%@ include file="Conn.jsp"%>
   
   
   
   <%
   Connection conn=null;
  	Class.forName("com.mysql.jdbc.Driver").newInstance();
  	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
      Statement st1=conn.createStatement();
      
      
      String rid=request.getParameter("rid");
      String firstname=request.getParameter("fname");
      String lastname=request.getParameter("lname");
      String status=request.getParameter("status");
      String rol=request.getParameter("rol");
      
   
      System.out.println("rid===>"+rid);
      System.out.println("firstname===>"+firstname);
      System.out.println("lastname===>"+lastname);
      System.out.println("status===>"+status);
      System.out.println("role===>"+rol); 
   
      String Sql="Update smartgrid.t_security  set firstname='"+firstname+"',lastname='"+lastname+"',status='"+status+"',Userlevel='"+rol+"'  where rid='"+rid+"'";
   System.out.println("SQL===>"+Sql);
   
   
   st1.executeUpdate(Sql);
   
   out.println("<script>");

   out.println("alert('User Updated Sucessfully!');");
   out.println("location='SmartGridEntry.jsp';");
   out.println("</script>");
   
   
   
   
   
   %>
   
   
   
   