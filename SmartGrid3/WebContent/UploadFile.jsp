<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Smart Grid</title>
</head>
<body>
<% 
String UPLOAD_DIRECTORY = "/home/bunnty/Documents";
boolean isMultipart = ServletFileUpload.isMultipartContent(request);

// process only if it is multipart content
if (isMultipart) {
        // Create a factory for disk-based file items
        FileItemFactory factory = new DiskFileItemFactory();

        // Create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);
        try {
        // Parse the request
        List<FileItem> multiparts = upload.parseRequest(request);

        for (FileItem item : multiparts)
        {
        if (!item.isFormField())
        {
        String name = new File(item.getName()).getName();
        
        System.out.println("name===>"+name);
        item.write(new File(config.getServletContext().getRealPath("/")+"/Media/"+name));
        
       // item.write(new File(UPLOAD_DIRECTORY + File.separator + name));
        }//if
        }//for
        } //try
        catch (Exception e) 
        {
          e.printStackTrace();
        }
}





%>
</body>
</html>