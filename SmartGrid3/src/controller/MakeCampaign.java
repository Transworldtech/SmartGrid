package controller;

import java.io.IOException;


import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

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
import java.util.Arrays;
import java.util.List;

/**
 * Servlet implementation class MakeCampaign
 */
@WebServlet("/MakeCampaign")
public class MakeCampaign extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MakeCampaign() {
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
		
		System.out.println("In MakeCampaign Servlet");
		java.sql.Connection con;
		java.sql.Connection con1;
		java.sql.Connection con2;
		java.sql.Statement st = null;
		Statement st1;
		int rs = 0;
		ResultSet rs1,rs2;
		
		try {
		Context ctx = new InitialContext();

		DataSource ds = (DataSource) ctx.lookup("java:/comp/env/db_gps");
		con1 = ds.getConnection();
		System.out.println("In Context ");
		DataSource ds1 = (DataSource) ctx.lookup("java:/comp/env/smartgrid");
		con2=ds1.getConnection();

		st = con2.createStatement();
		System.out.println("Statement Created");


		System.out.println("Resultset Created");
		
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		HttpSession session = request.getSession();
		Date date = new Date(); 
		DateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String CurrentDate = dateformat.format(date);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		String Company = request.getParameter("Company");
		String Compaign_Name = request.getParameter("Compaign_Name");
		String Frequency = request.getParameter("Frequency");
		String City = request.getParameter("City");
		String Country = request.getParameter("Country");
		String State = request.getParameter("State");
		String Media= request.getParameter("Media");
	
		System.out.println("City :"+City);
		System.out.println("Country :"+Country);
		System.out.println("State :"+State);
		
		System.out.println("Media :"+Media);
		String FromDate = request.getParameter("FromDate");
		String ToDate = request.getParameter("ToDate");
		String ContentType= request.getParameter("ContentType");
		String Content = request.getParameter("Content");
		String EntryBy = request.getParameter("entryby");
		String typevalue = request.getParameter("typevalue");
		
		System.out.println("Company Name: "+Company);
		System.out.println("Compaign Name: "+Compaign_Name);
		System.out.println("Frequency: "+Frequency);
		System.out.println("From Date: "+FromDate);
		System.out.println("To Date: "+ToDate);
		System.out.println("ContentType: "+ContentType);
		System.out.println("Content: "+Content);
		System.out.println("EntryBy: "+EntryBy);
		System.out.println("TypeValue: "+typevalue);
		
		try {
			
			
			String sqlRequesterData = "insert into smartgrid.CampaignMaster (Company,CampaignName,Frequency,Media,"
					+ "FromDate,ToDate,ContentType,Content,EntryBy,EntryDateTime,City,TypeValue) values ('"+Company+"',"
							+ "'"+Compaign_Name+"','"+Frequency+"','"+Media+"','"+FromDate+"','"+ToDate+"',"
									+ "'"+ContentType+"','"+Content+"','"+EntryBy+"','"+CurrentDate+"','"+City+"','"+typevalue+"')";
			
			System.out.println("Query is :"+sqlRequesterData);
			rs = st.executeUpdate(sqlRequesterData);
		
			
		
		
		if(rs>0) {
			
			String SrNo;
			String CampaignLocationSql="select SrNo from smartgrid.CampaignMaster order by SrNo DESC limit 1";
			
			System.out.println("Query is : "+CampaignLocationSql);
			  rs1 = st.executeQuery(CampaignLocationSql);

		      int i=1;
		      while(rs1.next()){
		    	  SrNo=rs1.getString("SrNo");
		    	  
		    	  String InsertLocationSql= "insert into smartgrid.CampaignLocation (CampaignId,"
					+ "City,State,Country,EntryBy,EntryDateTime) values ('"+SrNo+"',"
							+ "'"+City+"','"+State+"','"+Country+"','"+EntryBy+"','"+CurrentDate+"')";
			
		    	  System.out.println("Query is :"+InsertLocationSql);
					rs = st.executeUpdate(InsertLocationSql);
		      
		   out.println("<script type=\"text/javascript\">");
		   out.println("alert('Campaign Added Successfully ');");
		   out.println("location='ViewDetails.jsp';");
		   out.println("</script>");
		//response.sendRedirect("MakeCampaign.jsp");
		      }}
		else {
			out.println("");
			out.println("<script type=\"text/javascript\">");
		   out.println("alert('Failed to Add Campaign ');");
		   out.println("location='MakeCampaign.jsp';");
		   out.println("</script>");
		//doGet(request, response);
	}}
	
		 catch (Exception e) {
			// TODO: handle exception
		}
		}}
	
