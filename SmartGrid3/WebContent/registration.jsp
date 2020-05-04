<%@page import="java.util.Date"%>
<%@ page import ="java.sql.*" %>
<%@ include file="Conn.jsp"%>
<%
    String user = request.getParameter("user");    
    String pwd = request.getParameter("password");
    String rid = request.getParameter("rid");
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String status = request.getParameter("status");
    String role = request.getParameter("role");
    String createdate = request.getParameter("createdate");
    String entryby = request.getParameter("entryby");
    
    try{
	    Class.forName("com.mysql.jdbc.Driver").newInstance();
	    Connection con =DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
	    
	    if(con != null){
	    	out.println("Connected");
	    
	    Statement st = con.createStatement();
	    ResultSet rs;
	    //out.println("Connected");
	     //int id = (int)Math.random();
	    //System.out.println("id: "+id);
	    
	    /* String query="insert into t_security(rid,user,firstname, lastname, password,status,role,createdate,entryby)"
    			+"values ( '"+rid+"','" + fname + "','" + fname + "','" + fname + "','" + fname + "','" + fname + "','" + fname + "','" + lname + "','" + status + "','" + role + "','" + createdate + "','" + entryby + "','" + user + "','" 
    			+ pwd + "')";
	    
	    System.out.println("Insert query------"+query); */
	    String query="insert into t_security(rid,user,firstname, lastname, password,status,role,creatdate,entryby)"
    			+"values ( '"+rid+"','"+ user + "','" + fname + "','" + lname + "','" + pwd + "','"+ status +"','" + role + "','" + createdate + "','" + entryby + "')";
	    System.out.println(query);
	    st.executeUpdate(query);
	    System.out.println(query);
	    //System.out.println("count----->"+i);
	    int i=1;
	    if (i > 0) {
	        session.setAttribute("userid", user);
	        response.sendRedirect("welcome.jsp");
	        out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
	    } else {
	        response.sendRedirect("index.jsp");
	    
	    }} 
    }catch(Exception e){
    	e.printStackTrace();
    	
    }
%>