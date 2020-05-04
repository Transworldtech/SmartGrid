<%@page import="java.io.*" import="java.sql.*" %>
<%@page import="java.text.*"%>
<%@page import="java.util.*"%>


<%-- <jsp:useBean id="smart" class="com.smartgrid.beans.Smart" scope="page"> --%> 

<% 
Connection conn=null;
Statement st=null;
%>
<% 
try
{


String noofdattimeslot=request.getParameter("nooftimeslot");
int noofslot=Integer.parseInt(noofdattimeslot);
//String html = "<option value='Select' selected='selected'>Select</option>";
String html=null;

StringBuilder buffer=new StringBuilder();

buffer.append("<table style='overflow-y:scroll; margin-left: 50px; margin-top:50px;' class='tbh'  id='myTable'   >" );
buffer.append("<tr class='tbh'><th class='tbh' ><b>Sr.No</b></th> <th class='tbh' ><b>Date</b></th> <th class='tbh' ><b>HH</b></th> <th class='tbh' ><b>MM</b></th> <th class='tbh' ><b>SS</b></th></tr> "); 
int i=1;
while(noofslot!=0)
{
	  buffer.append("<tr class='tbh' ><td class='tbh' >");
	     buffer.append("<div align='right'>"+i+" </div> </label></td>");
        buffer.append("<td class='tbh' style= 'width: 30 px;' > <input type='text' id='fueldate' name='fueldate' size='1' value='16-May-2018' style='width :100px;'>  <script type='text/javascript'>Calendar.setup(  { inputField  : 'fueldate', ifFormat:'%d-%b-%Y;, button : 'fueldate');</script> </td>");
        buffer.append("<td class='tbh' ><select name='hh1' id='hh1'>");
        for(int j=0;j<24;j++)
        {
        buffer.append("<option value="+j+">"+j+"</option>");
        }
        buffer.append("</select> </td>");
        
        buffer.append("<td class='tbh' ><select name='mm1' id='mm1'>");
        for(int k=0;k<60;k++)
        {
        buffer.append(" <option value="+k+">"+k+"</option>");
        }
        buffer.append("</select> </td>");
        buffer.append("<td class='tbh' ><select name='ss11' id='ss1'>");
        for(int k=0;k<60;k++)
        {
        buffer.append(" <option value="+k+">"+k+"</option>");
        }
        
        buffer.append("</select> </td>");
        i++;
	noofslot--;	
}
	
        buffer.append("</table>");
	 System.out.println("AjaxDatetime1");
	 out.println(buffer);


}

catch(Exception e)
{
	e.printStackTrace();
}

%>
<%-- </jsp:useBean> --%>