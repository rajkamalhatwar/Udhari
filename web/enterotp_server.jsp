<%@ page import = "java.util.*"%>
<%@ page import = " java.util.Properties" %>
<%@ page import = "javax.mail.internet.*"%>
<%@ page import = "javax.mail.*" %>
<%@ page import = "java.sql.*"  %>
<%
 String  otp = request.getParameter("txtotp");
 int otp1 = Integer.parseInt(otp);
 
 
 int sesotp = (int)session.getAttribute("sesotp");
 String sesemail = (String)session.getAttribute("sesemail");

  
  
if(sesotp==otp1){
      String pass = null;
       try{ 
       Class.forName("com.mysql.jdbc.Driver");                //1st step load driver
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/udhari", "root", "");     //set Connnection
        
        String sql ="select Password from tbl_signup where BuisnessEmail='"+sesemail+"' ";
        PreparedStatement pst = con.prepareStatement(sql);
        ResultSet rs = pst.executeQuery();
        while(rs.next()){
        pass = rs.getString(1);
        
        }
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


 MimeMessage message1 = new MimeMessage(session1);    
    message1.addRecipient(Message.RecipientType.TO,new InternetAddress(sesemail));    
    message1.setSubject("your password");    
    message1.setText("Your Password is " +pass);    
    //send message  
    Transport.send(message1);    
    System.out.println("message sent successfully"); 
    session.setAttribute("sessendpass", "password Recover successfully on your Email");
    response.sendRedirect("login.jsp");
       }catch (Exception ex) {
       System.out.println(ex.getMessage());
       }
       
       
}else{
    session.setAttribute("sesinvalidotp", "OTP is Incorrect");
    response.sendRedirect("enterotp.jsp");
    
    
}


%>

