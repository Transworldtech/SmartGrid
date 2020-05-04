<%@ page import="java.util.List" %>
   <%@ page import="java.util.Iterator" %>
   <%@ page import="java.io.File" %>
   <%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
   <%@ page import="org.apache.commons.fileupload.disk.*"%>
   <%@ page import="org.apache.commons.fileupload.*"%>
   <%@ page import="java.sql.*" %>
   <%@ page import="java.text.SimpleDateFormat" %>
  
   <%@ page contentType="text/html;charset=UTF-8" language="java" %>
  <%@ include file="Conn.jsp"%>
<%
		Connection conn=null;
		Class.forName("com.mysql.jdbc.Driver").newInstance();
 		conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
 		String InsertDateTime=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());
 		String InsertDateTime1=new SimpleDateFormat("yyyy-MM-dd_HH_mm_ss").format(new java.util.Date());
 		System.out.println("Insertdate time==>"+InsertDateTime);
 		String datetime[]=InsertDateTime.split(" ");
 		//String datetime1[]=InsertDateTime1.split(" ");
 		String date1=datetime[0];
 		String time1=datetime[1];
 		
 		///String date2=datetime1[0];
 		///String time2=datetime1[1];
 		
 		
 		
 		
 		
 		System.out.println("date1==>"+date1);
 		System.out.println("time1==>"+time1);
 		
 		
 		///System.out.println("date2==>"+date2);
 		///System.out.println("time2==>"+time2);
 		
 		String itemName="";
 		File savedFile;
 		
 		String userid=session.getAttribute("userid").toString(); 
 		String username=session.getAttribute("username").toString();
 		if(username==null || username.equals("null") || username.equals("-"))
 		{

 			response.sendRedirect("index.jsp");

 		}
 		
 		//String company=session.getAttribute("company").toString();
 		//byte[] itemName=null;
 		byte[] b=null;
		Statement st=conn.createStatement();
		Statement st1=conn.createStatement();	

	String currdate="",currtime="",mediatype="",describtion="",originalmedianame="",changedmedianame="";
 String dura="";
 String brandname="";
 String OtherBrandName="";
	PreparedStatement psinsertmediacentre=null;	
	PreparedStatement psinsertmediacentre1=null;	

	
	String sqlinsertmediacentre="insert into  t_globalmediamaster (Date,time,originalmedianame,changemedianame,Company,UserName,UserId,insertdate,mediatype,describtion,duration,brandname) values(?,?,?,?,?,?,?,?,?,?,?,?)";
	String sqlinsertmediacentre1="insert into  smartgrid.BrandMaster (brandname,entryby) values(?,?)";

	psinsertmediacentre=conn.prepareStatement(sqlinsertmediacentre);
	psinsertmediacentre1=conn.prepareStatement(sqlinsertmediacentre1);

     boolean isMultipart = ServletFileUpload.isMultipartContent(request);
     if (!isMultipart)
     {
    	 
     }
     else
     {
       FileItemFactory factory = new DiskFileItemFactory();
       ServletFileUpload upload = new ServletFileUpload(factory);
       List items = null;
       try
       {
               items = upload.parseRequest(request);
       }
       catch (FileUploadException e)
       {
               e.printStackTrace();
       }
       Iterator itr = items.iterator();     //this will create iterator object from list..used for traversing the data.
       
       
       while (itr.hasNext())
       {
           FileItem item = (FileItem) itr.next();
         
           if (item.isFormField())   //checking if its normal field then we read as normal. no need to store in disc
            {
        	   
        	   String value = item.getString();  	   
        	        String  mediatype1=item.getFieldName();
        	          
        	        String desc1=item.getFieldName();
        	        String duration=item.getFieldName();
        	        String brandname1=item.getFieldName();
        	        String brandname2=item.getFieldName();

        	        
        	        if(mediatype1.equals("mediatype"))
        	   
        	        {
        	        	
        	        	mediatype=value;
        	        }
        	        	
        	        if(desc1.equals("describtion"))
        	        {
        	        	
        	        	describtion=value;
        	        }
        	  
        	        
        	        if(duration.equals("duration"))
        	        {
        	        	
        	        	dura=value;
        	        }
        	        if(brandname1.equals("brandname"))
        	        {
        	        	
        	        	brandname=value;
        	        }
        	        if(brandname2.equals("OtherBrandName"))
        	        {
        	        	
        	        	OtherBrandName=value;
        	        }
        	   
        	   
                        /* String country = item.getFieldName();
                        String stat = item.getFieldName();
                        String cty = item.getFieldName();
                        String location = item.getFieldName();
                        String date = item.getFieldName();
                        String hh = item.getFieldName();
                        String mm = item.getFieldName();
                        String ss = item.getFieldName();
                        String slt = item.getFieldName();
                       String value = item.getString();
                                           
                       if(country.equals("country1"))
                       {
                    	   country1=value;
                              
                        }
                
                       if(stat.equals("state"))
                       {
                    	   state=value;
                              
                        }
                     
                       if(cty.equals("city"))
                       {
                    	   city=value;
                              
                        }
                        
                       if(location.equals("loc"))
                       {
                    	   location1=value;
                              
                        }
                   
                       
                       if(date.equals("fueldate"))
                       {
                    	   date1=value;
                              System.out.println(" date1"+ date1);
                        }
                       
                       if(hh.equals("fueltime1"))
                       {
                    	   hour=value;
                              
                        }
                       if(mm.equals("fueltime2"))
                       {
                    	   minute=value;
                              
                        }                             
                       if(ss.equals("fueltime3"))
                       {
                    	   second=value;
                              
                        }if(slt.equals("slot"))
                        {
                     	   
                        	int slot1= Integer.parseInt(value)*5;
                     	   slot=String.valueOf(slot1);
                               
                         } */
 
            }
       
            else                                      //this else part for process about PDF file
             {

        		 itemName = item.getName();
        	System.out.println("itemName====>"+itemName);
        		if(itemName=="null" || itemName.equals(""))
        		{
        			out.println("itemName in if loop===========================================================>"+itemName);
        			itemName="-";
        		}else{
        		itemName=itemName.replaceAll(" ","_");
        		originalmedianame=itemName;
        		//itemName=date2+""+time2+""+userid+""+itemName;
        		itemName=InsertDateTime1+""+userid+""+itemName;
        		changedmedianame=itemName;
        		
        		savedFile = new File(config.getServletContext().getRealPath("/")+"/Media/"+itemName);
        	
               
        		System.out.println("savedFile===========================================================>"+savedFile);
        		
        		item.write(savedFile);
        		
        		}
              }
          }
       
       
       }
     
     
     System.out.println("Mediatype"+mediatype);
     System.out.println("originalmedia"+originalmedianame);
     System.out.println("changedmedia"+changedmedianame);
     
     System.out.println("Describtion"+describtion);
     System.out.println("Insertdatetime"+InsertDateTime);
     System.out.println("Filename"+itemName);
     System.out.println("User Name"+username);
     System.out.println("userid"+userid);
     String companyname=session.getAttribute("company").toString();
     System.out.println("Company==>"+companyname);
     System.out.println("BrandName"+brandname);
     System.out.println("OtherBrandName"+OtherBrandName);
if(brandname.equalsIgnoreCase("Other"))
{
    System.out.println("In IFF select");

	
	 psinsertmediacentre.setString(1, date1);
     psinsertmediacentre.setString(2, time1);
     psinsertmediacentre.setString(3, originalmedianame);
     psinsertmediacentre.setString(4, changedmedianame);
     psinsertmediacentre.setString(5, companyname);
     psinsertmediacentre.setString(6, username);
     psinsertmediacentre.setString(7, userid);
     psinsertmediacentre.setString(8, InsertDateTime);
     psinsertmediacentre.setString(9, mediatype);
     psinsertmediacentre.setString(10, describtion);
     psinsertmediacentre.setString(11, dura);
     psinsertmediacentre.setString(12, OtherBrandName);

    psinsertmediacentre1.setString(1, OtherBrandName);
     psinsertmediacentre1.setString(2, userid);


     psinsertmediacentre1.executeUpdate();

}
else
{
    System.out.println("In else select");

     psinsertmediacentre.setString(1, date1);
     psinsertmediacentre.setString(2, time1);
     psinsertmediacentre.setString(3, originalmedianame);
     psinsertmediacentre.setString(4, changedmedianame);
     psinsertmediacentre.setString(5, companyname);
     psinsertmediacentre.setString(6, username);
     psinsertmediacentre.setString(7, userid);
     psinsertmediacentre.setString(8, InsertDateTime);
     psinsertmediacentre.setString(9, mediatype);
     psinsertmediacentre.setString(10, describtion);
     psinsertmediacentre.setString(11, dura);
     psinsertmediacentre.setString(12, brandname);
}


     psinsertmediacentre.executeUpdate();

     
     out.println("<script>");
       
        out.println("alert('Submited successfully!');");
        out.println("location='mediacenter.jsp';");
        out.println("</script>");
     
    /*    response.sendRedirect(""); */
%> 