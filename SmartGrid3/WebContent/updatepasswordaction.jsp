<%-- <%@page import="com.jdbc.connection.ConnectionTest"%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<%@ page import ="java.sql.*" %>
<%@ include file="Conn.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <script type="text/javascript">
function Redirect1()
{
	alert('Password Update Successfully');  
	swal('Password Update Successfully  ','','success');
	  // swal("Good job!", "You clicked the button!", "success");
	 location='index.jsp';
	//	 location='EwayInsertForm.jsp';
  

}
function Redirect2()
{
	alert('Password Not Update Successfully Try Again');  

	swal('Password Not Update Successfully Try Again','','error');
	 location='index.jsp';
	//	 location='EwayInsertForm.jsp';
}

</script>
 
</head>

<%
    String userid = request.getParameter("user");    
    String oldpwd = request.getParameter("oldpassword");
    String newpwd = request.getParameter("newpassword");
    int count1=0;
    Class.forName("com.mysql.jdbc.Driver");
    /* String MM_dbConn_DRIVER="org.gjt.mm.mysql.Driver";
    String MM_dbConn_USERNAME="fleetview";
    String MM_dbConn_PASSWORD="1@flv";
    String MM_dbConn_STRING="jdbc:mysql://192.168.2.26/smartgrid"; */
    Connection con = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
    Statement st = con.createStatement();
    ResultSet rs;
    String sql6= "update t_security set password='" + newpwd + "',passwordchange='Yes'  where user='" + userid + "' and password='" + oldpwd + "' ";
    count1=st.executeUpdate(sql6);
	System.out.println("sql6"+sql6);

	System.out.println("count1"+count1);
    if(count1>0)
    {
    	out.println("<script>  Redirect1();</script>");

    }
    else
    {
    	out.println("<script>  Redirect2();</script>");

    }
    
%>