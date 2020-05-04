<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  
      pageEncoding="ISO-8859-1"%>  
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
 <%@page import="java.sql.*" %>  
 <html>  
   <head>  
     <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">  
     <title>Insert title here</title>  
   </head>  
   <body>  
     <%  
       String consultant = request.getParameter("Search").toString();   
       String buff2 = "<input type='text' name='frequency' value=''>"; 
       String buff3 = "<input type='text' name='media' value=''>";
       String buff4 = "<input type='date' name='fromdate' value=''>"; 
       String buff5 = "<input type='date' name='todate' value=''>";
       String buff6 = "<input type='text' name='contenttype' value=''>"; 
       String buff7 = "<input type='text' name='content' value=''>";
       String buff8 = "<input type='text' name='city' value=''>";
       String buff9 = "<input type='hidden' name='Locationcity' value=''>";
       
       
     
       try {  
    	   Class.forName("com.mysql.jdbc.Driver");
    Connection	conn=DriverManager.getConnection("jdbc:mysql://173.234.153.82/smartgrid","fleetview","1@flv");
         Statement stmt = conn.createStatement();  
         ResultSet rs = stmt.executeQuery("Select * from CampaignMaster where CampaignName = '" + consultant + "'");  
         while (rs.next()) {  
          
           buff2 = "<input type='text' name='frequency' readonly='readonly' value='" + rs.getString(4) + "'>";  
           buff3 = "<input type='text' name='media' readonly='readonly' value='" + rs.getString(5) + "'>"; 
           buff4 = "<input type='date' name='fromdate' readonly='readonly' value='" + rs.getString(6) + "'>";  
           buff5 = "<input type='date' name='todate' readonly='readonly' value='" + rs.getString(7) + "'>"; 
           buff6 = "<input type='text' name='contenttype' readonly='readonly' value='" + rs.getString(8) + "'>"; 
           buff7 = "<input type='text' name='content' readonly='readonly' value='" + rs.getString(9) + "'>"; 
           buff8 = "<input type='text' name='city' readonly='readonly' value='" + rs.getString(14) + "'>";
           buff9 = "<input type='hidden' name='Locationcity' readonly='readonly' value='" + rs.getString(14) + "'>";
         }  
         
         buff2 = buff2 + "</input>";  
         buff3 = buff3 + "</input>";
         buff4 = buff4 + "</input>";  
         buff5 = buff5 + "</input>";
         buff6 = buff6 + "</input>";
         buff7 = buff7 + "</input>";
         buff8 = buff8 + "</input>";
         buff9 = buff9 + "</input>";
      
         response.getWriter().println(buff2 + "brk" +buff3 + "brk" +buff4+ "brk" +buff5+ "brk" +buff6+ "brk" +buff7+ "brk" +buff8+ "brk"+buff9+ "brk");  
       } catch (Exception e) {  
         System.out.println(e);  
       }  
       
       
       
       
       
       
     %>  
   </body>  
 </html> 