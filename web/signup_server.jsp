<%@ page import = "java.sql.*"  %>
<%
    
String name = request.getParameter("txtname");
String email = request.getParameter("txtemail");
String mobno = request.getParameter("txtmobno");
String password = request.getParameter("txtpassword");
String country = request.getParameter("country");
String state = request.getParameter("state");
String city = request.getParameter("city");
String address = request.getParameter("txtadd");


 try {
                     
                     Class.forName("com.mysql.jdbc.Driver");                //1st step load driver
                     Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/udhari", "root", "");     //set Connnection
                    
                     String sql = "insert into tbl_signup(BuisnessName,BuisnessEmail,MobileNo,Password,Country,State,City,Address) values('"+name+"','"+email+"','"+mobno+"','"+password+"','"+country+"','"+state+"','"+city+"','"+address+"')";
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