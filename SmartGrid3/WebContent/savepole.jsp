

<% 

String poleid=request.getParameter("poleid");
System.out.println("poleid:-"+poleid);


String fromdate=request.getParameter("data");
System.out.println("fromdate:-"+fromdate);

String todate=request.getParameter("data1");
System.out.println("todate:-"+todate);

String hh=request.getParameter("hh1");
System.out.println("hh:-"+hh);
String mm=request.getParameter("mm1");
String ss=request.getParameter("hh2");

String mediatype=request.getParameter("mediatype");

String mediafile=request.getParameter("mediafile");

String durtio=request.getParameter("durtio");




String bulkrecord="insert into smartgrid.mediamaster(DATE,Poleid,country,state,city,location,Startdate,Enddate,time,medianame,Originalmedianame,duration,Company,EntryBy,VehicleCode,BookingCompany,mediatype) values('"+fromdate+"','"+poleid+"','"+Country+"','"+State+"','"+City+"','"+Location+"',Date_add('"+fromdate+" "+hh+":"+mm+":"+ss+"',INTERVAL "+k+" Day),Date_add('"+Time+"',INTERVAL "+k+" Day),'"+HH+":"+MM+":"+SS+"','"+mediafile+"','"+orignalmedia+"','"+durtio+"','"+Company+"','"+session.getAttribute("userid")+"','"+Vehiclecode+"','"+BookingCompany+"','"+mediatype+"')";
 //String bulkrecord="insert into smartgrid.mediamaster(DATE,Poleid,country,state,city,location,Startdate,Enddate,time,medianame,duration,Company,EntryBy,VehicleCode,BookingCompany) values('"+From1+"','"+polid+"','"+Country+"','"+State+"','"+City+"','"+Location+"',Date_add('"+From1+" "+HH+":"+MM+":"+SS+"',INTERVAL "+k+" Day),Date_add('"+From1+"',INTERVAL "+k+" Day),'"+HH+":"+MM+":"+SS+"',Add_time('"+HH+":"+MM+":"+SS+"',INTERVAL "+duration+" Second),'"+mediafile+"','"+duration+"','"+Company+"','"+session.getAttribute("userid")+"','"+Vehiclecode+"','"+BookingCompany+"')";
  System.out.println("bulkrecord==insertion===>"+bulkrecord);
// st.executeUpdate(bulkrecord);










out.println("<script>");

out.println("alert('User Created Sucessfully!');");
out.println("history.go(-1);");
out.println("</script>");


%>