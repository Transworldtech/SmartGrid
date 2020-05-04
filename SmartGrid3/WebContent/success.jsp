<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Smart Grid</title>
<style>
body {
    background: url('http://www.vdgh.ca/wp-content/uploads/2015/09/Silver-Blur-Background.jpg') no-repeat fixed center center;
    background-size: cover;
    font-family: Montserrat;
}
     </style>   
</head>
<body>
<%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
%>
You are not logged in<br/>
<a href="index.jsp">Please Login</a>
<%} else {
%>
Welcome <%=session.getAttribute("userid")%>
<br></br>
<!-- <td><input type="submit" value="logout" /></td> -->
 <a href='logout.jsp'>Log out</a> 
<%
    }
%>
</body>
</html>