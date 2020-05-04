
<%@ include file="Conn.jsp" %>
<%@ page import="java.sql.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
   <%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
   <%@ page import="org.apache.commons.fileupload.*"%>  
   <%@ page import="java.util.List" %>
   <%@ page import="java.util.Iterator" %>

<%!
Connection con1;
Statement st;
%>
<% 
try {

Class.forName(MM_dbConn_DRIVER);

con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
//con1 = DriverManager.getConnection("jdbc:mysql://1 03.241.181.36/jsp","root","root.123");
st=con1.createStatement();
ResultSet rst=null;
String sql="";
boolean flag=false;
int element=99;
String result="";
String map="";
boolean isMultipart = ServletFileUpload.isMultipartContent(request);
System.out.println("\n\n ismultipart-->>"+isMultipart);
        if (!isMultipart) {
        System.out.println("\n\nin multipart..");
        } else {
                System.out.println("\n\n in else with  multipart..");
                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);
                List items = null;
                try {
                        items = upload.parseRequest(request);
                //      System.out.print("\n\n items==>"+items);
                } catch (FileUploadException e) {
                        e.printStackTrace();
                }
                Iterator itr = items.iterator();
                
                
                while (itr.hasNext()) {
                    FileItem item = (FileItem) itr.next();
                    if(item.isFormField()) 
                    {
		                    	String name1 = item.getFieldName();
		                        System.out.print("\n name==>"+name1);
		                        String value = item.getString();
		                        System.out.print("\n value==>"+value);
		                        
		                        if(name1.equals("mapname")) 
		                        {
		                        		map = value;
		                                System.out.print("\n title==>"+map);		                             
		                               
		                        }
		                       
		                        
                    } 
            }
	
 }

	
		sql="select distinct(mapname) from jsp.Geomaster where mapname='"+map+"'";		

//System.out.println(session.getValue("usertypevaluemain"));
System.out.println("*****"+sql);
rst=st.executeQuery(sql);
//int i=1;
if(rst.next())
{
	result = "Yes";
	}else{
		result = "No";
	}

if(result.equalsIgnoreCase("Yes"))
{
	out.print(result);
}else{
	out.print(result);
}


} catch(Exception e) { 
	
	}
	finally
	{
	//	st.close();
		//con1.close();
	}

%>