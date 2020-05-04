<%@ page import="java.util.List" %>
   <%@ page import="java.util.Iterator" %>
   <%@ page import="java.io.File" %>
   <%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
   <%@ page import="org.apache.commons.fileupload.disk.*"%>
   <%@ page import="org.apache.commons.fileupload.*"%>
   <%@ page import="java.sql.*" %>
   <%@ include file="Conn.jsp"%>
  
<%--    <%@ page contentType="text/html;charset=UTF-8" language="java" %> --%>
  
<%
		Connection conn=null;
		Class.forName("com.mysql.jdbc.Driver").newInstance();
 		conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
 		String fname="",lname="",comp="",rol="",pwd="",usr="" ;
 		
 		byte[] itemName=null;
 		byte[] b=null;
		PreparedStatement psImageInsertDatabase=null;	
		Statement st2=conn.createStatement();
		
		
		
		String sqlImageInsertDatabase="insert into t_security (firstname,lastname,company,Userlevel,user,password,bImage) values(?,?,?,?,?,?,?)";
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
                        String firstname = item.getFieldName();
                        String lasttname = item.getFieldName();
                        String user = item.getFieldName();
                       // String status = item.getFieldName();
                        String role = item.getFieldName();
                        String company = item.getFieldName();
                        String password = item.getFieldName();
                       String value = item.getString();
                                           
                       if(firstname.equals("fname"))
                       {
                    	   fname=value;
                              
                        }
                
                       if(lasttname.equals("lname"))
                       {
                    	   lname=value;
                              
                        }
                     
                       if(company.equals("company"))
                       {
                    	   comp=value;
                              System.out.println(comp);
                        }
                        
                       if(role.equals("rol"))
                       {
                    	   rol=value;
                              
                    	   System.out.print("rol->"+rol);
                    	   
                        }
                   
                       
                       if(user.equals("usr"))
                       {
                    	   usr=value;
                              
                        }
                       
                       if(password.equals("pwd"))
                       {
                    	   pwd=value;
                              
                        }
                                
            }
       
            else                                      //this else part for process about PDF file
             {
                try
                {
       
                    itemName = item.get();    //this will return the pdf file name
                   
                   System.out.println("b==="+itemName);
                  
                /* {
                       b = itemName.getBytes();
                       System.out.println("b==="+b);
                   }*/
                       
                
                }catch(Exception ste)
                {
                    out.println(ste);
                }
              }
          }
       
          /* out.println(" the firstname name is "+fname);
          out.println(" the lastname is "+lname);
          out.println(" the company name is"+comp);
          out.println(" the role name is"+rol);
          out.println(" the username name is"+usr);
          out.println(" the password name is"+pwd); */
       }
     
     
   String  sql5="select * from smartgrid.t_security where user='"+usr+"'";
     ResultSet rst2=st2.executeQuery(sql5);
     if(rst2.next())
     {
    	 out.println("<script>");

         out.println("alert('User Name Already Exist!!Please Enter Unique User Name')");
         out.println("location='register.jsp';");
         out.println("</script>"); 
    	 
    	 
     }
     
     
     else
     {
       psImageInsertDatabase.setString(1,fname);
       psImageInsertDatabase.setString(2,lname);
       psImageInsertDatabase.setString(3,comp);
       psImageInsertDatabase.setString(4,rol);
       psImageInsertDatabase.setString(5,usr);
       psImageInsertDatabase.setString(6,pwd);
       psImageInsertDatabase.setBytes(7,itemName);
       psImageInsertDatabase.executeUpdate();
       out.println("<script>");

       out.println("alert('User Created Sucessfully!');");
       out.println("location='SmartGridEntry.jsp';");
       out.println("</script>");
     } 
       
%> 