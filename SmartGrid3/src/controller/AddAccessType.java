package controller;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import model.AccessTypeBean;

/**
 * Servlet implementation class AddAccessType
 */
@WebServlet("/accesstype")
public class AddAccessType extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddAccessType() {
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
		
		String accesstype = request.getParameter("accesstype");
		System.out.println("New Access Type :"+accesstype);
		AccessTypeBean bean = new AccessTypeBean();
		bean.setAccesstype(accesstype);
		request.setAttribute("bean", bean);
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
		
		//java.sql.Statement st = con2.createStatement();
		System.out.println("Statement Created");
		ResultSet rs,rs1;
		System.out.println("Resultset Created");
		//String query="select * from t_security where user='akash' and password='akash'";
		//rs = st.executeQuery(query);
		//String user = null;
		
		String access_sql="insert into accesstype (accesstype) values (?)";
		PreparedStatement pst = con2.prepareStatement(access_sql);
		System.out.println("In Query ");
		pst.setString(1, accesstype);
		
		int n = pst.executeUpdate();
		
		System.out.println("Inserted Successfully in Database");
		if (n>0) {
			response.sendRedirect("AddMenu.jsp");
		}
		else{	
			response.sendRedirect("login.jsp");
		}
		
		//sdoGet(request, response);
		
		}
		
		catch (Exception e) {
			// TODO: handle exception
		}
		//doGet(request, response);
	}

}
