<%@ page import="java.util.List" %>
   <%@ page import="java.util.Iterator" %>
   <%@ page import="java.io.File" %>
   <%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
   <%@ page import="org.apache.commons.fileupload.disk.*"%>
   <%@ page import="org.apache.commons.fileupload.*"%>
   <%@ page import="java.sql.*" %>
   <%@ include file="Conn.jsp"%>
  
   <%@ page contentType="text/html;charset=UTF-8" language="java" %>
  
<%
		Connection conn=null;
		Class.forName("com.mysql.jdbc.Driver").newInstance();
 		conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
 		String fname="",lname="",comp="",rol="3",pwd="",usr="",addr="",aadh="",email="" ;
 		
 		byte[] itemName=null;
 		byte[] b=null;
		PreparedStatement psImageInsertDatabase=null;	
		String sqlImageInsertDatabase="insert into t_security (firstname,lastname,company,role,user,password,address,email) values(?,?,?,?,?,?,?,?)";
		System.out.println(sqlImageInsertDatabase);
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
                        //String role = item.getFieldName();
                        String company = item.getFieldName();
                        String password = item.getFieldName();
                        String addre = item.getFieldName();
                        String aadha = item.getFieldName();
                        String eml = item.getFieldName();
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
                        
                        if(addre.equals("addr"))
                       {
                        	addr=value;
                              
                        } 
                   
                        if(eml.equals("emal"))
                        {
                        	email=value;
                               
                         } 
                        
                        if(aadha.equals("adh"))
                        {
                        	aadh=value;
                               
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
       
         out.println(" the firstname name is "+fname);
          out.println(" the lastname is "+lname);
          out.println(" the company name is"+comp);
          out.println(" the role name is"+rol);
          out.println(" the username name is"+usr);
          out.println(" the password name is"+pwd);
       }
       psImageInsertDatabase.setString(1,fname);
       psImageInsertDatabase.setString(2,lname);
       psImageInsertDatabase.setString(3,comp);
       psImageInsertDatabase.setInt(4,3);
       psImageInsertDatabase.setString(5,usr);
       psImageInsertDatabase.setString(6,pwd);
       psImageInsertDatabase.setString(7,addr);
      // psImageInsertDatabase.setString(8,aadh);
       psImageInsertDatabase.setString(8,email);
       //psImageInsertDatabase.setBytes(7,itemName);
       psImageInsertDatabase.executeUpdate();
       response.sendRedirect("newRegister.jsp");
%> 