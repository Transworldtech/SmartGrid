<%@ page import="java.sql.*" %>
<%@page import="java.util.Date.*"%>
<%@ page import="java.util.List" %>
   <%@ page import="java.util.Iterator" %>
   <%@ page import="java.io.File" %>
   <%@ page import="java.io.*" %>
   <%@ page import="java.util.Properties"%>
   <%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
   <%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
   <%@ page import="org.apache.commons.fileupload.*"%>  
   <%@ page import="org.apache.poi.hssf.usermodel.HSSFWorkbook" %>
   <%@ page import="org.apache.poi.hssf.usermodel.HSSFSheet" %>
   <%@ page import="org.apache.poi.hssf.usermodel.HSSFCell" %> 
   <%@ page import="org.apache.poi.ss.usermodel.*" %> 
   <%@ page import="org.apache.poi.hssf.usermodel.HSSFRow" %>
   <%@ page import = "java.io.FileNotFoundException"%>
   <%@ page import = "java.io.FileOutputStream"%>
   <%@ page import = "java.io.IOException"%>
   <%@ page import="javax.activation.*" %>  
   <%@ page import="java.io.FileInputStream" %>
   <%@ page import="java.math.BigDecimal" %>
   <%@ page import="java.sql.Connection" %>
   <%@ page import="java.sql.DriverManager" %>
   <%@ page import="java.sql.ResultSet" %>
   <%@ page import="java.sql.Statement" %>
   <%@ page import="java.text.SimpleDateFormat" %>
   <%@ page import="java.util.ArrayList" %>
   <%@ page import="java.util.Iterator" %>
   <%@ page import="java.util.List" %>
   <%@ page import="java.util.StringTokenizer" %>
   <%@page import="org.apache.poi.hssf.usermodel.HSSFDateUtil"%>
<%@ include file="Conn.jsp"%>
<script type="text/javascript">
</script>
<%
String file1="";
int saveflag=1;
File savedFile;
String[] filepath =new String[10];
String[] filename =new String[10];
int  count2 = 0, filecount = 0;;
int count=1;
String savefilestring="";
String service_provider = "";
String pon = "";
String activation_date = "";
String plan = "";
System.out.println(">>>>>>>>>>>>>>>>>>>>");
String map= ""; 
//System.out.println(request.getParameter("mapname"));
String user=session.getAttribute("username").toString();

int count1=0;
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
		                        if(name1.equals("operator")) 
		                        {
		                        		service_provider = value;
		                                System.out.print("\n title==>"+service_provider);		                             
		                               
		                        }
		                        if(name1.equals("mapname")) 
		                        {
		                        		map = value;
		                                System.out.print("\n title==>"+map);		                             
		                               
		                        }
		                        if(name1.equals("activation_date")) 
		                        {
		                        		activation_date = value;
		                                System.out.print("\n title==>"+activation_date);		                             
		                               
		                        }
		                        if(name1.equals("plan")) 
		                        {
		                        		plan = value;
		                                System.out.print("\n title==>"+plan);		                             
		                               
		                        }
                    } else {
                                   try {

                                         String itemName = item.getName();
                                         System.out.print("\n\nitemName==>"+itemName);
                                         	file1=itemName;
                                          if(itemName.equalsIgnoreCase(""))
                                          {
                                          }
                                        else
                                         {
                                         
                                     	  	  
                                     		savedFile = new File("/home/hduser/xls/"+itemName);  
                                        //savedFile = new File("/home/user/Desktop/"+itemName);
                                         					System.out.print("\n\nsavedFile==>"+savedFile);
                                                            item.write(savedFile);
                                                            filepath[filecount]=""+savedFile;
                                                            
                                                            filename[filecount]=itemName;
                                                            filecount++;
                                                            if(saveflag==1)
                                                            {
                                                             savefilestring=""+savedFile;
                                                             saveflag++;
                                                            }
                                                            else
                                                            savefilestring=savefilestring+","+savedFile;
                                                             //out.print("successfully saved the file");
                                                            //File file = new File(savedFile);
                                                            String screenshot=savedFile.getAbsolutePath();
                                                   // System.out.println("\n\nscreenshot--->>>"+screenshot);
                                                            }
                                                    
                                                    
                                    } catch (Exception e) {
                                            e.printStackTrace();
                                    }
                    }
            }
	
 }
   //=============================excel reading code========================
try{	   
	   
	   
        		//get connection
        		System.out.println("===========getting connection =============");
        	 	Connection conne = null;
				 Statement st = null;
				 Statement st1 = null;
				
        		try {
						String MM_dbConn_DRIVER = "org.gjt.mm.mysql.Driver";
						/* String MM_dbConn_USERNAME = "root";
						String MM_dbConn_PASSWORD = "root.123"; */
						//String MM_dbConn_GPS = "jdbc:mysql://103.8.126.138/db_gps";
					//	String MM_dbConn_GPS = "jdbc:mysql://103.8.126.138/db_gps"; 
						/* String MM_dbConn_GPS = "jdbc:mysql://103.241.181.36/jsp"; */
			
						Class.forName(MM_dbConn_DRIVER);
						conne = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
						st=conne.createStatement();
						st1=conne.createStatement();
						System.out.println("===========connection created=============");
					
					} catch (Exception e) {
						System.out.print("GetConnection Exception ---->" + e);
					}
					
					/* activation_date = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(activation_date));
					System.out.println(">>>>>>The service Provider is "+service_provider);
					System.out.println(">>>>>>The Purchase Ordernum is "+pon);
					System.out.println(">>>>>>The activation date is "+activation_date);
					System.out.println(">>>>>>The plan is "+plan); */
					
					//read excel file
				
				String fname = "/home/hduser/xls/"+file1;
					//String fname = "/home/user/Desktop/"+file1;
					System.out.println("The filename is :"+file1);
					System.out.println("The filepath is :"+fname);
			        List sheetData = new ArrayList();			 
			        FileInputStream fis = null;
			        try {
			            
			            fis = new FileInputStream(fname);			 
			            HSSFWorkbook workbook = new HSSFWorkbook(fis);			            
			            HSSFSheet sheet = workbook.getSheetAt(0);
			            Iterator rows = sheet.rowIterator();
			            while (rows.hasNext()) {
			                HSSFRow row = (HSSFRow) rows.next();
			                Iterator cells = row.cellIterator();
			 
			                List data = new ArrayList();
			                while (cells.hasNext()) {
			                    HSSFCell cell = (HSSFCell) cells.next();
			                    data.add(cell);
			                    
			                }
			 
			                sheetData.add(data);
			            }
			        } catch (IOException e) {
			            e.printStackTrace();
			        } finally {
			            if (fis != null) {
			                fis.close();
			            }
			        }
			        //show excel data=====
			        	System.out.println("The >>>>>>>>>>>>is :");
			        
			        int cnt=0;
       		// Iterates the data and print it out to the console.	
			        for (int i = 0; i < sheetData.size(); i++) {
			        	//cnt++;
			        	System.out.println( "cnt is :"+cnt);
			        	String row="";
			            List list = (List) sheetData.get(i);
			           
			            try{
			            	//System.out.println( "IN ntry   ");
			            for (int j = 0; j < list.size(); j++) {
			                //Cell cell = (Cell) list.get(j);
			                 HSSFCell cell = (HSSFCell) list.get(j);
			                System.out.println( "The cell type is :"+cell.getCellType());	
			                
			               //if(cell.getCellType()==Cell.CELL_TYPE_NUMERIC) 
			               if(cell.getCellType()==HSSFCell.CELL_TYPE_NUMERIC)  
			               {
			                	//System.out.println( "IN IFFFFFFFFF    ");	
			                	//if(DateUtil.isCellDateFormatted(cell))
			                	if(HSSFDateUtil.isCellDateFormatted(cell)){  
			                	//	System.out.print( new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(cell.getDateCellValue()) );
			                		System.out.println( "hibhihihihih>>>>"+cell.getDateCellValue());
			                		if(row.equals("")){
			                			System.out.println( "IN another iff ");
			                		row=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(cell.getDateCellValue());
			                		}else{
			                			row=row+"$"+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(cell.getDateCellValue());
			                		}
			                    }else{
			                    //	System.out.println( "INanothsr    ELS SSSSSSS ");
			                    	System.out.print(new BigDecimal(cell.getNumericCellValue()).setScale(4, BigDecimal.ROUND_HALF_UP).toString());
			                    	//System.out.print(new Double(cell.getNumericCellValue()).toString());
			                    	if(row.equals("")){
			                    	row=new BigDecimal(cell.getNumericCellValue()).setScale(4, BigDecimal.ROUND_HALF_UP).toString();
			                    	}else{
			                    		row=row+"$"+new BigDecimal(cell.getNumericCellValue()).setScale(4, BigDecimal.ROUND_HALF_UP).toString();
			                    	}
			                    }
			               
			                }
			                
			                else{  
			                	//System.out.println( "IN mainn     ELS SSSSSSS ");
			                	    System.out.print(cell.toString());
			                	    if(row.equals("")){
			                	    row=cell.toString();
			                	    }else{
			                	    	 row=row+"$"+cell.toString();
			                	    }
			                }
			                 
			               
			                if (j < list.size() - 1) {
			                    System.out.print(" ");
			                }   
			            }
			            }catch(Exception ioe){
			            	System.out.println("The exception is :"+ioe);
			            	ioe.printStackTrace();
			            }
			            //code for row
			            System.out.println("\nThe row is >>  "+row);
			         //   insertToDb(rw);
			            //inset row into database
			            				
							String mobno="",simno="";
							int p=0;
							int countFeild=0;
							String para1="",para2="",para3="",para4="";
							List<String> n = new ArrayList<String>();
							
						try
						{
							StringTokenizer stringTokenizer = new StringTokenizer(row,"$");
							System.out.println("The total no. of tokens generated :  " + stringTokenizer.countTokens());
							countFeild  = stringTokenizer.countTokens();
							while(stringTokenizer.hasMoreTokens()){
								for(int k=1;k<=countFeild;k++)		
									n.add(stringTokenizer.nextToken().trim());
									
									}
						//trim the  white space						
						/* para1 = para1.trim();
						para2 = para2.trim();
						para3 = para3.trim();
						para4 = para4.trim(); */
						

						System.out.println("The number of char is+++sim :"+para1.length());
						System.out.println("The number of char is+++mob :"+para2.length());
						simno = para1;
						mobno = para2;
						
						
						
						System.out.println("The sim number is  :"+simno);
						System.out.println("The mobile number is  :"+mobno);
						System.out.println("The sim number is  :"+para3);
						
						
							
							
								
								//check whether sim already exist in database or not
								String sql1 ="select * from jsp.Geomaster where lat = '"+simno+"'";
								ResultSet rs1 = st1.executeQuery(sql1);
				             	if(rs1.next())
				              	{
				             		System.out.println("The record regarding this sim no is already present in db");
				             		
				              	}else{
				              		String sql="";
				              		//insert into table
				              		if(countFeild==2)
							{
				              			if(cnt==0){
				              				sql ="insert into jsp.GeomasterColumn(col1,col2,mapname,insertedby)values('"+n.get(0)+"','"+n.get(1)+"','"+map+"','"+user+"')";
				              			}else{
				              				sql ="insert into jsp.Geomaster(lat,longi,mapname,insertedby)values('"+n.get(0)+"','"+n.get(1)+"','"+map+"','"+user+"')";		
				              			}
										
							}else if(countFeild>=3){
								//System.out.println("New Sql Query111111111111111111111-->");
								if(cnt==0){
									String in1="insert into jsp.GeomasterColumn(";
									String in2="";
									String in3="'";
									String in4=")values(";
									String in5=")";
									for(int t=1;t<=countFeild;t++)	{
										in2=in2+"col"+t+",";
										
										
									}
									//System.out.println("New Sql Query111111111111111111111-->"+in2);
									for(int t=0;t<countFeild;t++)	{
										in3=in3+n.get(t)+"','";
									}
									//System.out.println("New Sql Query111111111111111111111-->"+in3);
									int len=in3.length();
									int end=len-2;
									in2=in2+"mapname,insertedby";
									String in33=in3.substring(0, end);
									in33=in33+",'"+map+"','"+user+"'";
									//System.out.println("New Sql Query111111111111111111111-->"+in33);
									 sql=in1+in2+in4+in33+in5;
									//System.out.println("New Sql Query111111111111111111111-->"+sql;
									
			              			
		              				
		              			}else{
								String in1="insert into jsp.Geomaster(lat,longi";
								String in2="";
								String in3="'";
								String in4=")values(";
								String in5=")";
								for(int t=1;t<=countFeild-2;t++)	{
									in2=in2+",col"+t;
									
									
								}
								//System.out.println("New Sql Query111111111111111111111-->"+in2);
								for(int t=0;t<countFeild;t++)	{
									in3=in3+n.get(t)+"','";
								}
								//System.out.println("New Sql Query111111111111111111111-->"+in3);
								int len=in3.length();
								int end=len-2;
								in2=in2+",mapname,insertedby";
								String in33=in3.substring(0, end);
								in33=in33+",'"+map+"','"+user+"'";
								//System.out.println("New Sql Query111111111111111111111-->"+in33);
								 sql=in1+in2+in4+in33+in5;
								//System.out.println("New Sql Query111111111111111111111-->"+sql;
								
		              			}
								//sql ="insert into jsp.Geomaster(lat,longi,col1,col2)values('"+n.get(0)+"','"+n.get(1)+"','"+n.get(2)+"','"+n.get(3)+"')";
							}
				              		//endif
									System.out.println("The query is :"+sql);
									int k =st.executeUpdate(sql);
									System.out.println("The number of rows updated :"+k);
				              	
								
								
							
						  	}	
						}catch (Exception e) {
					
							System.out.println("exceptionnnn===>>"+e);
						}
							
					
						cnt++;            
								            System.out.println("  ");
				}//end of for loop of show excel data
				
				System.out.println("The total number of records in the excel sheet :"+cnt);
				
				//move the excel file in other folder
			
				File f = new File("/home/hduser/xls/"+file1);
			//File f = new File("/home/user/Desktop/"+file1);
				if(f.renameTo(new File("/home/hduser/xlsDestination/" + file1)))
				{							
					System.out.println("File is moved successful!");
				}
  
        //=======================================================================   
        response.sendRedirect("UploadGeoData.jsp?msg=1");
}catch(Exception e){
	System.out.println("Th exception is >>>>>"+e);
	
}
%>