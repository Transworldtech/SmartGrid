<%@page import="java.util.Date"%>
<%@ page import ="java.sql.*" %>
<%@ include file="Conn.jsp"%>
<%

    String user = request.getParameter("user");    
   /*  String pwd = request.getParameter("password");
     String rid = request.getParameter("rid");   */
    String zone = request.getParameter("zone");
    String zcode = request.getParameter("zcode");
    String pols = request.getParameter("pols");
    String premium = request.getParameter("premium");
    String slot = request.getParameter("slots");
   /*  String entryby = request.getParameter("entryby"); */
    /* String time = request.getParameter("time"); */
    
    try{
	    Class.forName("com.mysql.jdbc.Driver").newInstance();
	    Connection con = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
	    
	    if(con != null){
	    	out.println("Connected");
	    
	    Statement st1 = con.createStatement();
	    ResultSet rs;
	    //out.println("Connected");
	     //int id = (int)Math.random();
	    //System.out.println("id: "+id);
	    
	    /* String query="insert into t_security(rid,user,firstname, lastname, password,status,role,createdate,entryby)"
    			+"values ( '"+rid+"','" + fname + "','" + fname + "','" + fname + "','" + fname + "','" + fname + "','" + fname + "','" + lname + "','" + status + "','" + role + "','" + createdate + "','" + entryby + "','" + user + "','" 
    			+ pwd + "')";
	    
	    System.out.println("Insert query------"+query); */
	    String query="insert into t_zonemaster(zone,zonecode, premium,slots,poles)"
    			+"values ( '"+ zone + "','" + zcode + "','" + premium + "','"+ slot +"','" + pols + "')";
	    System.out.println(query);
	    st1.executeUpdate(query);
	    System.out.println(query);
	    //System.out.println("count----->"+i);
	    int i=1;
	    if (i > 0) {
	        session.setAttribute("userid", user);
	        response.sendRedirect("ZoneEntry.jsp");
	        out.print("Location Registration Successfull!");
	    }  else {
	        response.sendRedirect("ZoneEntry.jsp");
	    
	    } } 
    }catch(Exception e){
    	e.printStackTrace();
    	
    }
%>