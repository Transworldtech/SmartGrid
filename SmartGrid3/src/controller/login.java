package controller;

import java.io.IOException;



import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import java.sql.*;
/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*Accept User Name and Password*/ 		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
	
		System.out.println("User Name :"+username);
		System.out.println("Password :"+password);
		
		/*True Session values*/
		HttpSession session = request.getSession(true);
		
		try {
			System.out.println("Try Block");
		java.sql.Connection con1;
		java.sql.Connection con2;
		
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:/comp/env/db_gps");
		con1 = ds.getConnection();
		System.out.println("In Context ");
		DataSource ds1 = (DataSource) ctx.lookup("java:/comp/env/smartgrid");
		con2=ds1.getConnection();
		String logincheck = "select * from smartgrid.t_security where user='" + username + "' and password='" + password + "'";
		java.sql.Statement st = con2.createStatement();
		System.out.println("Statement Created");
		ResultSet rs,rs1;
		System.out.println("Resultset Created");
		//String query="select * from t_security where user='akash' and password='akash'";
		//rs = st.executeQuery(query);
		//String user = null;
		String pass;
		String user;
		//rs1=st.executeQuery("select user,password from t_security ");
		
		rs = st.executeQuery(logincheck);
		System.out.println("Query is : "+logincheck);
		if(rs.next())
		{
			user = rs.getString("user");
			pass = rs.getString("password");
			session.setAttribute("username", username);
	        session.setAttribute("firstname", rs.getString("firstname"));
	        session.setAttribute("company", rs.getString("company"));
	        session.setAttribute("role", rs.getString("role"));
	        session.setAttribute("Userlevel", rs.getString("Userlevel"));
	        session.setAttribute("typevalue", rs.getString("typevalue"));
	        session.setAttribute("TypeofUser", rs.getString("TypeofUser"));
	        session.setAttribute("Access", rs.getString("Access"));
		
		
		
		if(username.equals(user) && (password.equalsIgnoreCase(pass))){
			response.sendRedirect("index.jsp");
		}
		else {
			
			response.sendRedirect("error.jsp");
		}
		}
		//sdoGet(request, response);
		
		}
		
		catch (Exception e) {
			// TODO: handle exception
		}
	}

}
