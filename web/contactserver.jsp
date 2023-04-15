<%@ page import = "java.sql.*"  %>
<%
    
String name = request.getParameter("txtname");
String email = request.getParameter("txtemail");
String subject = request.getParameter("txtsubject");
String message = request.getParameter("txtmessage");


 try {
                     
                     Class.forName("com.mysql.jdbc.Driver");                //1st step load driver
                     Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/udhari", "root", "");     //set Connnection
                    
                     String sql = "insert into tbl_contact(name,email,subject,message) values('"+name+"','"+email+"','"+subject+"','"+message+"')";
                    PreparedStatement pst = con.prepareStatement(sql);
                    int i = pst.executeUpdate();
                    if(i>0){
                        session.setAttribute("sescontacts", "contact detail submit successfully");
                        response.sendRedirect("index.jsp");
                    }
                      
                    
                   
                    
                } catch (Exception ex) {
                        System.out.println(ex.getMessage());
                }


%>