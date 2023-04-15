<%@page import="java.sql.*"%>
<html lang="en">
<head>
    <title>How To Create</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">   
     
  <link rel="stylesheet" href="css/registration.css">

  <link rel="stylesheet" href="https://kit.fontawesome.com/561ad73844.css" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/561ad73844.js" crossorigin="anonymous"></script>
      
 
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>  
 


</head>
<body>
    <div id="sid">
                                                <label>State :<span class="text-danger">*</span></label>
                                                <div class="input-group">
                                                    <div class="input-group-text"><i class="fa-sharp fa-solid fa-flag-usa"></i></div>
                                                    <select name="state" id="state" class="form-select" >
                                                          <option>Select State</option>
                                                          <%
                                                               Connection con;
                                                               PreparedStatement pst;
                                                               ResultSet rs;
                                                              String cname=request.getParameter("countryname");
                                                             //  String cname="India";
                                                              // System.out.println(cname);
                                         try{
                   
                                       Class.forName("com.mysql.jdbc.Driver");
                                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/udhari", "root", "");
                                        String sql = "select distinct StateName from dropdowntest where CountryName='"+cname+"'";
                                        pst = con.prepareStatement(sql);
                                        rs=pst.executeQuery();
                                        while(rs.next())
                                        {
                                             
                                            %>
                                            <option><%=rs.getString("StateName")%></option>
                                           <%
                                        }
                                      %>
                                      </select>
                                           </div>
                                            </div>
                                      <%
        }
        catch(Exception e)
        {
            out.println(e.getMessage());
        }
                                                           %>
                                                          
                                                     
</body>
</html>