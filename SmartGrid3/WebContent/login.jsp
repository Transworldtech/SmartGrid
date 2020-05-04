<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<%@ page import ="java.sql.*" %>

<%@ page import ="java.text.SimpleDateFormat" %>

<%@ page import="java.util.Date,java.io.*,java.util.Enumeration"%>
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
	
	  swal('Please Update Password  ','','success');
	  // swal("Good job!", "You clicked the button!", "success");
	 location='updatepassword.jsp';
	//	 location='EwayInsertForm.jsp';
  

}
function Redirect2()
{
	swal('Password Not Update Successfully Try Again','','error');
	 location='index.jsp';
	//	 location='EwayInsertForm.jsp';
}

</script>
 
</head>
<body>

<%
    String userid = request.getParameter("user"); 
System.out.println("userid"+userid);

    String pwd = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
    
   /*  String MM_dbConn_DRIVER="org.gjt.mm.mysql.Driver";
    String MM_dbConn_USERNAME="fleetview";
    String MM_dbConn_PASSWORD="1@flv";
    String MM_dbConn_STRING="jdbc:mysql://192.168.2.26/smartgrid"; */
    
    Connection con = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
    Statement st = con.createStatement();
    Statement st1 = con.createStatement();
    System.out.println("kkkkkkkkkkkkkkkkkkkkkkk");
	Statement stquery=con.createStatement();
	Statement s2=con.createStatement();

    
	String sessionid = "";
    

    ResultSet rs,rs1;
    rs = st.executeQuery("select * from t_security where user='" + userid + "' and password='" + pwd + "'");
    if (rs.next()) {
        session.setAttribute("userid", userid);
        session.setAttribute("username", rs.getString("firstname"));
        session.setAttribute("company", rs.getString("company"));
        session.setAttribute("role", rs.getString("role"));
        session.setAttribute("Userlevel", rs.getString("Userlevel"));
        session.setAttribute("typevalue", rs.getString("typevalue"));
        session.setAttribute("TypeofUser", rs.getString("TypeofUser"));
        session.setAttribute("Access", rs.getString("Access"));
        session.setAttribute("User", rs.getString("user"));
        System.out.println("rs " + rs);
        
    	java.util.Date now = new java.util.Date();
        out.println(now.toString()); 
        
        
        long millis=System.currentTimeMillis();  
        java.sql.Date date=new java.sql.Date(millis);  
        System.out.println(date);  
        
        java.util.Date date1 = new java.util.Date();
        String[] d = date1.toString().split("\\s+");
         String ss=d[3];
            System.out.println(d[3]);

    	session.setAttribute("logindate",now);
    	session.setAttribute("logintime",now);
    	sessionid=session.getId().toString();
        String sql11="insert into smartgrid.t_loguseractivity(RecordDate,RecordTime,Comments,UserIp,SessionID) values('"+date+"','"+ss+"','"+userid+"','"+request.getRemoteAddr()+"','"+sessionid+"')";
    	
    	/*Query to insert query in db_gps.t_sqlquery table*/
    	String abcd=sql11.replace("'","#");
    	abcd=abcd.replace(",","$");
    	stquery.executeUpdate("insert into db_gps.t_sqlquery(dbname,query)values('db_gps','"+abcd+"')");
    	/*****************************/
    	int eee=s2.executeUpdate(sql11);
    	System.out.println("*******   "+sql11);


        //out.println("welcome " + userid);
        //out.println("<a href='logout.jsp'>Log out</a>");
         rs1 = st1.executeQuery("select * from t_security where user='" + userid + "' and password='" + pwd + "' and passwordchange='No'");
        if(rs1.next())
        {

            out.println("Please Update Password ...!!!<a href='updatepassword.jsp'> Update </a>");


        }
        else
        {
        if(rs.getString("Access").equalsIgnoreCase("ssm"))
        {
        //	response.sendRedirect("DisplayPanel3.jsp");
        	 response.sendRedirect("Home.jsp");
        }
        else if(rs.getString("Access").equalsIgnoreCase("ssmbasic"))
        {
        	response.sendRedirect("DisplayPanel3.jsp");
        }
        else
        {
        response.sendRedirect("Home.jsp");
        }
    }
    } else {
        out.println("Please Enter Correct UserName and Password ...!!!<a href='http://smartgridinfra.com/login'>try again</a>");
    } 
  
    
  
    
    
    
%>

  </body>
	
</html>       