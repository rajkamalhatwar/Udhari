<%@ page import = "java.sql.*"  %>
<%
String email = request.getParameter("mail");

String emaill = request.getParameter("email");
String emailr = request.getParameter("emailr");
//System.out.println(emailr);

try {
    
    Class.forName("com.mysql.jdbc.Driver");                //1st step load driver
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/udhari", "root", "");     //set Connnection
    
    if(emaill==null&&emailr==null){
    String sql = "select * from tbl_signup where BuisnessEmail = '"+email+"'";
    PreparedStatement pst = con.prepareStatement(sql);
    ResultSet rs = pst.executeQuery(sql);
  // int i = pst.executeUpdate();
   if(rs.next()){
	   out.println("email already exist");
	   
   }
   }else if(email==null&&emailr==null){
     String sql2 = "select * from tbl_signup where BuisnessEmail = '"+emaill+"'";
    PreparedStatement pst2 = con.prepareStatement(sql2);
    ResultSet rs2 = pst2.executeQuery(sql2);
  // int i = pst.executeUpdate();
   if(rs2.next()){
	   
	   
   }else{
       out.println("Enter Valid Email");
   }
   }else if(email==null&&emaill==null){
        String sql3 = "select * from tbl_signup where BuisnessEmail = '"+emailr+"'";
    PreparedStatement pst3 = con.prepareStatement(sql3);
    ResultSet rs3 = pst3.executeQuery(sql3);
  // int i = pst.executeUpdate();
   if(rs3.next()){
	   
	   
   }else{
       out.println("enter valid registered email");
   }
   }
    
   
   
   
  
   
   
   
   
} catch (Exception ex) {
       System.out.println(ex.getMessage());
}

%>