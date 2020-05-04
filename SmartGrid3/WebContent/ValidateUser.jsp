<%-- <%@page import="com.jdbc.connection.ConnectionTest"%> --%>
<%@ page import ="java.sql.*" %>
<%@ include file="Conn.jsp"%>
<%
    String userid = request.getParameter("user");    
    String pwd = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from t_security where user='" + userid + "' and password='" + pwd + "'");
    if (rs.next()) {
        session.setAttribute("userid", userid);
        session.setAttribute("username", rs.getString("firstname"));
        session.setAttribute("company", rs.getString("company"));
        session.setAttribute("role", rs.getString("role"));
        session.setAttribute("Userlevel", rs.getString("Userlevel"));
        session.setAttribute("typevalue", rs.getString("typevalue"));
        session.setAttribute("TypeofUser", rs.getString("TypeofUser"));
        //out.println("welcome " + userid);
        //out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("Home.jsp");
    } else {
        out.println("Please Enter Correct UserName and Password ...!!!<a href='http://smartgridinfra.com/login'>try again</a>");
    } 
    
%>
