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
 		String country1="",state="",city="",location1="",date1="",hour="",minute="",second="",slot="",deviceid="",poleid="" ;
 		String itemName="";
 		File savedFile;
 		//byte[] itemName=null;
 		byte[] b=null;
		PreparedStatement psImageInsertDatabase=null;	
		PreparedStatement psSelectDatabase=null;	
		String sqlSelectDatabase="select * from t_polmaster where Country = ? and State = ? and City = ? and Location =?";
		/* System.out.println(sqlImageInsertDatabase); */
	      psSelectDatabase=conn.prepareStatement(sqlSelectDatabase);
		String sqlImageInsertDatabase="insert into mediamaster (country,state,city,location,Poleid,deviceid,Date,time,medianame,duration) values(?,?,?,?,?,?,?,?,?,?)";
		
		
		/* System.out.println(sqlImageInsertDatabase); */
	      psImageInsertDatabase=conn.prepareStatement(sqlImageInsertDatabase);
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
                        String country = item.getFieldName();
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
                               
                         }
 
            }
       
            else                                      //this else part for process about PDF file
             {

        		 itemName = item.getName();
        		out.println("itemName====>"+itemName);
        		if(itemName=="null" || itemName.equals(""))
        		{
        			out.println("itemName in if loop===========================================================>"+itemName);
        			itemName="-";
        		}else{
        		itemName=itemName.replaceAll(" ","_");
        		savedFile = new File(config.getServletContext().getRealPath("/")+"/Media/"+itemName);
        		//savedFile = new File("/home/hduser/newworkspace/DemoWeb/WebContent/Media/"+itemName);
        		//savedFile = new File("/home/javaprg/PhysicalDamageImage/"+itemName);
        		//File savedFile = new File("/home/s_dhole/test/"+itemName);
                //fname2+=savedFile+",";
                
        		System.out.println("savedFile===========================================================>"+savedFile);
        		
        		item.write(savedFile);
        		//imagename=imagename+","+itemName;
        		//System.out.println("imagename&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&=>"+imagename);
        		}
              }
          }
       
          /* out.println(" the firstname name is "+fname);
          out.println(" the lastname is "+lname);
          out.println(" the status name is"+sta);
          out.println(" the role name is"+rol);
          out.println(" the username name is"+usr);
          out.println(" the password name is"+pwd); */
       }
     
       psSelectDatabase.setString(1, country1);
       psSelectDatabase.setString(2, state);
       psSelectDatabase.setString(3, city);
       psSelectDatabase.setString(4, location1);
       
       ResultSet rs = psSelectDatabase.executeQuery();
       while ( rs.next() )
       {
        deviceid=rs.getString("Deviceid");
        poleid=rs.getString("polid");
       }
     
       psImageInsertDatabase.setString(1,country1);
       psImageInsertDatabase.setString(2,state);
       psImageInsertDatabase.setString(3,city);
       psImageInsertDatabase.setString(4,location1);
       psImageInsertDatabase.setString(5,poleid);
       psImageInsertDatabase.setString(6,deviceid);
       psImageInsertDatabase.setString(7,new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(date1)));
       psImageInsertDatabase.setString(8,hour+":"+minute+":"+second);
       psImageInsertDatabase.setString(9,itemName);
       psImageInsertDatabase.setString(10,slot);
       psImageInsertDatabase.executeUpdate();
       response.sendRedirect("locschedul.jsp");
%> 