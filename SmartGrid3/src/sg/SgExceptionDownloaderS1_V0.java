package sg;

import com.mysql.jdbc.PreparedStatement;

import java.io.File;
import java.io.PrintStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Properties;
import java.util.StringTokenizer;

import javax.mail.BodyPart;
import javax.mail.Flags;
import javax.mail.Flags.Flag;
import javax.mail.Folder;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Store;
import javax.mail.internet.ContentType;
import javax.mail.internet.MimeMultipart;

public class SgExceptionDownloaderS1_V0
  implements Runnable
{
  private Connection con1 = null;
  private static Statement stat = null;
  private Statement stat1 = null;
  private static Statement stat2 = null;
  private static Statement stat3 = null;
  private static Statement stat4 = null;
  private static Statement stat5 = null;
  private static Statement st5 = null;
  private static Statement stmt = null;
  private static Statement st1 = null;
  private static Statement st6 = null;
  private static Statement st3 = null;
  private static Statement st4 = null;
  private static Statement st7 = null;
  private static Statement st8 = null;
  Thread t;
  static String tablename1 = "";
  static String tablename2 = "";
  private static Connection myCon = null;
  private static Connection conOriginal=null;
  static boolean flag = false;
  static int interval = 0;
  static String updatesecondaryserver = "";
  static String host = "";
  static String username = "";
  static String server = "";
  static String password = "";
  static String body = "";
  static String msgname = "";
  static java.sql.Date msgdate;
  static int msgno = 0;
  static int totalmsgno = 0;
  static int msgsize = 0;
  static String subject = "";
  static String tbname = "";
  static String tbname1 = "";
  static String nokiatable = "";
  static String tbname2 = "";
  static String cardId;
  static String invaliddata;
  static String stamp;
  static String orignalstamp;
  static String dt;
  static String tm;
  static String lat;
  static String lon;
  static String latdir;
  static String tstamp;
  static String sen5;
  static String londir;
  static String dd;
  static String speed;
  static String distance;
  static String adc1;
  static String adc2;
  static String date1;
  static String time1;
  static String insertdate;
  static String inserttime;
  static String storeddate;
  static String storedtime;
  static String sen1;
  static String sen2;
  static String sen3;
  static String sen4;
  static String unittype;
  static String location;
  static Format frt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
  static Format frt1 = new SimpleDateFormat("yyyy-MM-dd");
  static Format frt2 = new SimpleDateFormat("HH:mm:ss");
  static String maildate = "";
  static String mailtime = "";
  static String dbdriver;
  static String connstring;
  static String dbuser;
  static String dbpass;
  static Properties props = new Properties();
  static Session session = Session.getDefaultInstance(props, null);
  private static final long serialVersionUID = 1L;
  static Connection conn;
  static Connection conn1;
  static Statement st;
  static Statement st2;
  static Statement stsecond;
  static Store store;
  private static Connection con;
  public static File file=null;
  
  public SgExceptionDownloaderS1_V0()
  {
    this.t = new Thread(this);
    this.t.start();
  }
  
  public static void main(String[] args) throws Exception
  {
	  //System.out.println("main");
	 
	 // //new SaveExceptionS1(file, " ", " ");
   new SgExceptionDownloaderS1_V0();
  }
  
  public static String showMultiPart(Message m)
  {
    String aa = null;
    try
    {
      MimeMultipart content = (MimeMultipart)m.getContent();
      BodyPart part = content.getBodyPart(0);
      aa = part.getContent().toString();
      System.out.println("AA -----------------------" + aa);
      System.out.println("in function\n");
    }
    catch (Exception e)
    {
      e.printStackTrace();
      try {
		Thread.sleep(1000);
	} catch (InterruptedException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
      //new SaveExceptionS1(file, e.toString(), " in showMultiPart()");
    }
    return aa;
  }
  
  public static String GetTable()
  {
    java.util.Date d = new java.util.Date();
    String tb = new SimpleDateFormat("yyyy-MM-dd").format(d);
    tb = tb.replace("-", "_");
    int createStatus = 0;
    tablename1 = "t_sgexceptions" + tb;
    tablename2 = "t_sgexceptions" + tb + "_bulk";
    PreparedStatement ps1 = null;
    PreparedStatement ps2 = null;
    try
    {
      String sql1 = "CREATE TABLE  IF NOT EXISTS " + tablename1 + "  (RID  double NOT NULL auto_increment,MailDate  date default NULL,MailTime  time default NULL,StoredDate  date default NULL,StoredTime  time default NULL,MailFrom  varchar(100) default '-',MailTo  varchar(100) default '-',Subject  varchar(100) default '-',Header  longtext,Body  longtext,UnitID  varchar(50) default '-',VehRegNo  varchar(50) default '-',Transporter  varchar(100) default '-',vehID  int default '0',Status  varchar(50) default 'Pending',UnProcessedStamps  longtext,ProcessStatus  varchar(50) default 'Complete',Server varchar(50) default 'S3',Key RID(RID),Key unitid(unitid,status,storedtime)) ";
      String sqlbulk1 = "CREATE TABLE IF NOT EXISTS " + tablename2 + "  (RID  double NOT NULL auto_increment,MailDate  date default NULL,MailTime  time default NULL,StoredDate  date default NULL,StoredTime  time default NULL,MailFrom  varchar(100) default '-',MailTo  varchar(100) default '-',Subject  varchar(100) default '-',Header  longtext,Body  longtext,UnitID  varchar(50) default '-',VehRegNo  varchar(50) default '-',Transporter  varchar(100) default '-',vehID  int default '0',Status  varchar(50) default 'Pending',UnProcessedStamps  longtext,ProcessStatus  varchar(50) default 'Complete',Server varchar(50) default 'S3',Key RID(RID),Key unitid(unitid,status,storedtime)) ";
      
     myCon=getCon();
      ps1 = (PreparedStatement)myCon.prepareStatement(sql1);
      createStatus = ps1.executeUpdate();
      
      ps2 = (PreparedStatement)myCon.prepareStatement(sqlbulk1);
      createStatus = ps2.executeUpdate();
      if (flag)
      {
        String sql2 = "CREATE TABLE  IF NOT EXISTS " + tablename1 + "  (RID  double NOT NULL auto_increment,MailDate  date default NULL,MailTime  time default NULL,StoredDate  date default NULL,StoredTime  time default NULL,MailFrom  varchar(100) default '-',MailTo  varchar(100) default '-',Subject  varchar(100) default '-',Header  longtext,Body  longtext,UnitID  varchar(50) default '-',VehRegNo  varchar(50) default '-',Transporter  varchar(100) default '-',vehID  int default '0',Status  varchar(50) default 'Pending',UnProcessedStamps  longtext,ProcessStatus  varchar(50) default 'Complete',Server varchar(50) default 'S3',Key RID(RID),Key unitid(unitid,status,storedtime)) ";
        String sqlbulk2 = "CREATE TABLE 3IF NOT EXISTS " + tablename2 + "  (RID  double NOT NULL auto_increment,MailDate  date default NULL,MailTime  time default NULL,StoredDate  date default NULL,StoredTime  time default NULL,MailFrom  varchar(100) default '-',MailTo  varchar(100) default '-',Subject  varchar(100) default '-',Header  longtext,Body  longtext,UnitID  varchar(50) default '-',VehRegNo  varchar(50) default '-',Transporter  varchar(100) default '-',vehID  int default '0',Status  varchar(50) default 'Pending',UnProcessedStamps  longtext,ProcessStatus  varchar(50) default 'Complete',Server varchar(50) default 'S3',Key RID(RID),Key unitid(unitid,status,storedtime)) ";
        
        ps1 = (PreparedStatement)myCon.prepareStatement(sql1);
        createStatus = ps1.executeUpdate();
        
        ps2 = (PreparedStatement)myCon.prepareStatement(sqlbulk1);
        createStatus = ps2.executeUpdate();
      }
    }
    catch (Exception ex)
    {
      System.out.print("Exception in get table--->" + ex);
      try {
		Thread.sleep(1000);
	} catch (InterruptedException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
      //new SaveExceptionS1(file, ex.toString(), " in getTable()-");
    }
    String bothtable = tablename1 + "," + tablename2;
    return bothtable;
  }
  
  public void download()
  {
	 
    try
    {
      int k = 0;
      try
      {
        /*Class.forName("com.mysql.jdbc.Driver");
        
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smartgrid", "fleetview", "1@flv");
       // con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smartgrid", "fleetview", "1@flv");
        */
        con=getCon(); //System.out.println("CON : "+con);
        
        System.out.println("Connected To Database !");
        st1 = con.createStatement();
        st2 = con.createStatement();
        st3 = con.createStatement();
        st4 = con.createStatement();
        st5 = con.createStatement();
        st6 = con.createStatement();
        st7 = con.createStatement();
        st8 = con.createStatement();
        
       /* String query = "create table IF NOT EXISTS t_config (Id int auto_increment primary key, Email varchar(100) not null, Pass varchar(100) not null, HostName varchar(100) unique, StopTime int not null, NoOfMails int, server varchar(30))";
        int i1 = st6.executeUpdate(query);
        System.out.println("Table t_config is created ");
        username = "sgimages";
        password = "sgimages@123";
        String host2 = "localhost";
        interval = 60000;
        k = 100;*/
        
        flag = false;
        
        String sqlconf = "select * from t_config where id=5";
        if (myCon == null) 
        {
          myCon = getCon();
        }
        ResultSet rstconf = st8.executeQuery(sqlconf);
        String serverName = "";
        while (rstconf.next())
        {
          username = rstconf.getString("Email");
          password = rstconf.getString("Pass");
          host = rstconf.getString("HostName");
          interval = rstconf.getInt("StopTime");
          k = 100;
          rstconf.getInt("NoOfMails");
          serverName = rstconf.getString("server");
          server = rstconf.getString("server");
          
          System.out.println("username from t_config--->" + username);
          System.out.println("password from t_config--->" + password);
          System.out.println("host from t_config--->" + host);
          
          tbname = GetTable();
          
          StringTokenizer stk = new StringTokenizer(tbname, ",");
          if (stk.hasMoreTokens()) {
            tbname1 = stk.nextElement().toString();
          }
          if (stk.hasMoreTokens()) {
            tbname2 = stk.nextElement().toString();
          }
          store.connect(host, 110, username, password);
          
          System.out.println("Connected to the host : " + host);
          
          Folder folder = store.getFolder("INBOX");
          System.out.println("Folder--->" + folder);
          if (folder.isOpen())
          {
            System.out.println("Folder is open");
            folder.close(true);
            System.out.println("Closing Folder");
          }
          folder.open(2);
          if (folder.isOpen()) {
            System.out.println("Folder is open in read write mode");
          }
          System.out.println("Read Write operation done on Folder contents");
          Message[] messages = folder.getMessages();
          int msgcount = folder.getUnreadMessageCount();
          System.out.println("messageCount--->" + msgcount);
          if (msgcount < k) {
            k = msgcount;
          }
          if (msgcount == 0)
          {
            System.out.println("NO MAILS ARE THERE FOR IP : " + host);
            Thread.sleep(6000);
          }
          for (int i = 0; i < k;) {
            try
            {
              ContentType ct = new ContentType(messages[i].getContentType());
              System.out.println("ct----> " + ct);
              msgno = i + 1;
              subject = messages[i].getSubject();
              System.out.println("subject----> " + subject);
              
              msgsize = messages[i].getSize();
              System.out.println("msgsize----> " + msgsize);
              
              body = messages[i].getContent().toString();
              System.out.println("body ---->" + body);
              
              maildate = new SimpleDateFormat("yyyy-MM-dd").format(messages[i].getSentDate());
              System.out.println("maildate----> " + maildate);
              
              mailtime = new SimpleDateFormat("HH:mm:ss").format(messages[i].getSentDate());
              System.out.println("mailtime----> " + mailtime);
              if ((subject == null) || (body == null) || (maildate == null) || (mailtime == null) || (subject.equals("null")) || (body.equals("null")) || (maildate.equals("null")) || (mailtime.equals("null")))
              {
                if (ct.getPrimaryType().equals("multipart")) {
                  body = showMultiPart(messages[i]);
                }
              }
              else
              {
                subject = subject.trim();
                System.out.println("Messages read");
                if (ct.getPrimaryType().equals("multipart")) {
                  body = showMultiPart(messages[i]);
                }
                java.util.Date now = new java.util.Date();
                
                String sss = now.getYear() + 1900 + "-" + (1 + now.getMonth()) + "-" + now.getDate();
                
                String tt = now.getHours() + ":" + now.getMinutes() + ":" + now.getSeconds();
                int insertStatus = 0;
                try
                {
                  String newBody = body.replace("'", "\"");
                  StringTokenizer stk1 = new StringTokenizer(body, ",");
                  int cnt = stk1.countTokens();
                  System.out.println("count--->" + cnt);
                  if (cnt <= 1023)
                  {
                    String sql = "insert into " + tbname1 + " (StoredDate,StoredTime,Subject,UnitId,Body,Status,VehRegNo,Transporter,MailDate,MailTime,MailFrom,MailTo,Header,UnProcessedStamps,Server) values('" + sss + "','" + tt + "','" + subject + "','" + subject + "','" + newBody + "','Pending','-','-','" + maildate + "','" + mailtime + "','SMTP','" + username + "','-','-','" + serverName + "')";
                    System.out.println(sql);
                    if (myCon == null)
                    {
                      System.out.println("myCon is NULL : ");
                      myCon = getCon();
                    }
                    insertStatus = st1.executeUpdate(sql);
                    System.out.println(insertStatus + " records inserted in " + tbname1);
                    if (flag) {
                      try
                      {
                        String sql3 = "insert into " + tbname1 + " (StoredDate,StoredTime,Subject,UnitId,Body,Status,VehRegNo,Transporter,MailDate,MailTime,MailFrom,MailTo,Header,UnProcessedStamps,Server) values('" + sss + "','" + tt + "','" + subject + "','" + subject + "','" + newBody + "','Pending','-','-','" + maildate + "','" + mailtime + "','SMTP','" + username + "','-','-','" + serverName + "')";
                        System.out.println(sql3);
                        
                        PreparedStatement ps2 = (PreparedStatement)myCon.prepareStatement(sql3);
                        insertStatus = st2.executeUpdate(sql3);
                        System.out.println(insertStatus + " records inserted in " + tbname1);
                      }
                      catch (Exception e)
                      {
                        System.out.print("Insert In Secondary Database Exception--->" + e);
                        e.printStackTrace();
                        Thread.sleep(1000);
                        //new SaveExceptionS1(file, e.toString(), " while inserting mail details into t_sgiamgesYYYY-MM-DD");
                      }
                    }
                  }
                  else
                  {
                    System.out.println("Connection from else {} : " + myCon);
                    String sql = "insert into " + tbname2 + " (StoredDate,StoredTime,Subject,UnitId,Body,Status,VehRegNo,Transporter,MailDate,MailTime,MailFrom,MailTo,Header,UnProcessedStamps,Server) values('" + sss + "','" + tt + "','" + subject + "','" + subject + "','" + newBody + "','Pending','-','-','" + maildate + "','" + mailtime + "','SMTP','" + username + "','-','-','" + serverName + "')";
                    System.out.println(sql);
                    
                    insertStatus = st3.executeUpdate(sql);
                    System.out.println(insertStatus + " records inserted in " + tbname2);
                    if (flag) {
                      try
                      {
                        System.out.println("Connection from try{} while storing mail details : " + myCon);
                        String sql3 = "insert into " + tbname2 + " (StoredDate,StoredTime,Subject,UnitId,Body,Status,VehRegNo,Transporter,MailDate,MailTime,MailFrom,MailTo,Header,UnProcessedStamps,Server) values('" + sss + "','" + tt + "','" + subject + "','" + subject + "','" + newBody + "','Pending','-','-','" + maildate + "','" + mailtime + "','SMTP','" + username + "','-','-','" + serverName + "')";
                        System.out.println(sql3);
                        
                        insertStatus = st4.executeUpdate(sql3);
                        System.out.println(insertStatus + " records inserted in " + tbname2);
                      }
                      catch (Exception e)
                      {
                        System.out.print("Insert In Secondary Database Exception--->" + e);
                        Thread.sleep(1000);
                        //new SaveExceptionS1(file, e.toString(), " while inserting mail details into t_sgiamgesYYYY-MM-DD_Bulk");
                      }
                    }
                  }
                  if (insertStatus != 0)
                  {
                    messages[i].setFlag(Flags.Flag.DELETED, true);
                    System.out.println("************* Message Deleted ! ***************");
                  }
                }
                catch (Exception e)
                {
                  e.printStackTrace();
                  folder.close(true);
                  Thread.sleep(1000);
                  //new SaveExceptionS1(file, e.toString(), " in getting mails");
                }
              }
              i++;
            }
            catch (Exception e)
            {
              //System.out.println("******      " + e);
              e.printStackTrace();
              Thread.sleep(1000);
              //new SaveExceptionS1(file, e.toString(), " in fetchting mails");
            }
          }
          folder.close(true);
          store.close();
          System.out.println("store closed ! ");
        }
      }
      catch (Exception e)
      {
        con=getCon();
        e.printStackTrace();
        Thread.sleep(1000);
        //new SaveExceptionS1(file, e.toString(), " in download()");
      }
      
    }
    catch (Exception e)
    {
      e.printStackTrace();
      try {
		Thread.sleep(1000);
	} catch (InterruptedException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
      //new SaveExceptionS1(file, e.toString(), " in download()");
    }
    finally
    {
    	/*try{
    	con.close();
    	}catch(Exception e){}*/
    }
  }
  
  public static Connection getConnection() throws Exception
  {
//	  System.out.println("getCon");
    Connection con = null;
    try
    {
      Class.forName("com.mysql.jdbc.Driver");
      //con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smartgrid", "sgjava", "sgjava@1sg");
      con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smartgridrawdata", "fleetview", "1@flv");
     // System.out.println("getCon Connected ");
      props.setProperty("mail.pop3.port", "110");
      props.setProperty("mail.pop3.socketFactory.port", "110");
      store = session.getStore("pop3");
    }
    catch (Exception e)
    {
      System.out.println("Exception got in Database Connectivity : " + e);
      Thread.sleep(1000);
      //new SaveExceptionS1(file, e.toString(), " in getConnection()");
    }
    return con;
  }
  
  public void CloseConnection() throws Exception 
  {
    try
    {
      System.out.println("CLOSING DATABASE CONNECTION ");
      myCon.close();
      System.out.println("DATABASE CONNECTION CLOSED ");
    }
    catch (Exception ec)
    {
      System.out.print("Exception in close connection--->" + ec);
      Thread.sleep(1000);
      //new SaveExceptionS1(file, ec.toString(), " in closing connections");
    }
  }
  
  public void run()
  {
	  while(true)
    try
    {
      for (;;)
      {
        myCon = getCon();
        
        download();
      
      }
    }
    catch (Exception e)
    {
      System.out.println("exception in run" + e);
      try {
		Thread.sleep(1000);
	} catch (InterruptedException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
      //new SaveExceptionS1(file, e.toString(), " in run()");
    }
    finally
    {
    	  //CloseConnection();
    }
  }
  
  public static Connection getCon()
  {
    if (conOriginal == null) {
      try {
		System.out.println(conOriginal = getConnection());
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
    }
    return conOriginal;
  }
}