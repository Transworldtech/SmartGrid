<%@page import="java.io.*" import="java.sql.*" %>
<%@page import="java.text.*"%>
<%@page import="java.util.*"%>

<%

String country=request.getParameter("country");
String state=request.getParameter("state");
String city=request.getParameter("city");
String loc=request.getParameter("loc");
String action=request.getParameter("action");
String position=request.getParameter("position");


%>



<jsp:useBean id="addloc" class="com.smartgrid.beans.AddLOC" > 

  <jsp:setProperty name="addloc" property="country"
                    value="<%=country %>"/>
   <jsp:setProperty name="addloc" property="state" 
                    value="<%=state %>"/>
   <jsp:setProperty name="addloc" property="city" 
                    value="<%=city %>"/>
                    
    <jsp:setProperty name="addloc" property="loc" 
                    value="<%=loc %>"/>  
                    
      <jsp:setProperty name="addloc" property="action" 
                    value="<%=action %>"/>                    
                    
          <jsp:setProperty name="addloc" property="position" 
                    value="<%=position %>"/>                    
                               
           <jsp:getProperty name="addloc" property="country"/>                
             <jsp:getProperty name="addloc" property="state"/>     
             <jsp:getProperty name="addloc" property="city"/>     
             <jsp:getProperty name="addloc" property="loc"/>
             <jsp:getProperty name="addloc" property="action"/>
             <jsp:getProperty name="addloc" property="position"/>
                                  
                    </jsp:useBean>
<% 

/* String country=request.getParameter("country");
String state=request.getParameter("state");
String city=request.getParameter("city");
String loc=request.getParameter("loc");
String action=request.getParameter("action");
String position=request.getParameter("position"); */

try
{
	
	
	
	
	
}

catch(Exception e)
{
	e.printStackTrace();
}

%>
