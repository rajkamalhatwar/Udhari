<%@page import="java.util.Random"%>
<%@ page import = "java.util.*"%>
<%@ page import = " java.util.Properties" %>
<%@ page import = "javax.mail.internet.*"%>
<%@ page import = "javax.mail.*" %>
<%@ page import = "java.sql.*"  %>
<%
   String email = request.getParameter("txtemail");
   
 Random r = new Random();
int otp = r.nextInt(899999)+100000;
session.setAttribute("sesemail",email );
session.setAttribute("sesotp",otp );

try {
    
    Class.forName("com.mysql.jdbc.Driver");                //1st step load driver
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/udhari", "root", "");     //set Connnection
    String sql = "select * from tbl_signup where BuisnessEmail = '"+email+"'";
    PreparedStatement pst = con.prepareStatement(sql);
    ResultSet rs = pst.executeQuery(sql);
  // int i = pst.executeUpdate();
  int flag =0;
   if(rs.next()){
	   flag = 1;
	   
   }
   
   if(flag==1){
        Properties props = new Properties();    
        props.put("mail.smtp.host", "smtp.gmail.com"); 

        props.put("mail.smtp.socketFactory.port", "465");    
        props.put("mail.smtp.socketFactory.class",    
                 "javax.net.ssl.SSLSocketFactory");    
        props.put("mail.smtp.auth", "true");    
        props.put("mail.smtp.port", "465"); 




//get Session   
Session session1 = Session.getInstance(props,    
 new javax.mail.Authenticator() {    
 protected PasswordAuthentication getPasswordAuthentication() {    
 return new PasswordAuthentication("rajkamalhatwar@gmail.com","mxxcwlkzftqjsxkm");  
 }    
}); 



try {    
    MimeMessage message1 = new MimeMessage(session1);    
    message1.addRecipient(Message.RecipientType.TO,new InternetAddress(email));    
    message1.setSubject("your otp");    
    message1.setText("Your OTP is "+otp);    
    //send message  
    Transport.send(message1);    
    System.out.println("message sent successfully"); 
    
    response.sendRedirect("enterotp.jsp");
   } catch (MessagingException e) {throw new RuntimeException(e);}  
                        
                        
                        
       
   }else{
       System.out.println("enter valid registered email");  
       session.setAttribute("sesnotregemail", "Enter Registered Email");
       response.sendRedirect("forgotpass.jsp"); 
   }
   
   
} catch (Exception ex) {
       System.out.println(ex.getMessage());
}



%>


