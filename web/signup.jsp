<!DOCTYPE html>
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
<script>  
$(document).ready(function(){  
    
    
    $("#country").change(function(event)
               {
                  var cname=$("#country").val();
                 // alert("You Have Selected "+cname);
                  $.get("state.jsp",{countryname:cname},function(data){
                      //alert("You Have Selected "+cname);
                    $("#sid").html(data); 
                  });
               });
               
//     $("#state").change(function(event)
//               {
//                  var sname=$("#state").val();
//                  alert("You Have Selected "+sname);
//                  $.get("city.jsp",{statename:sname},function(data){
//                      //alert("You Have Selected "+cname);
//                    $("#sid").html(data); 
//                  });
//               });

       $("#state").change(function(event)
               {
                  var cname=$("#state").val();
                  alert("You Have Selected "+cname);
                  $.get("city.jsp",
                  {
                      statename:cname
                  },
                  function(responseText){
                    $("#City_id").html(responseText); 
                  });
               });
      
      
  
  $("#txtemail").blur(function(){ 
    	var email = $("#txtemail").val();
		 $.get("checkemailjQuery_server.jsp", 
		 {
			 mail : email
		 },
		 function(data,status){
			$("#checkemail").text(data);
		 
		 });
            });
               
    
});  
</script>  

<!--<script>
            $(document).ready(function() 
            { //alert("You Have Selected ");
               $("#state_id").change(function(event)
               {
                  var sname=$("#State_id").val();
                  alert("You Have Selected "+sname);
                  $.get("city.jsp",{statename : sname},function(responseText){
                    $("#cid").html(responseText); 
                     });
                  });
            });
  </script>-->
<!-- <script>  
$(document).ready(function(){  
 
               
 $("#state").change(function(event)
               {
                  var sname=$("#state").val();
                  alert("You Have Selected "+sname);
                  $.get("city.jsp",{statename:sname},function(dataa){
                      //alert("You Have Selected "+cname);
                    $("#cid").html(dataa); 
                  });
               });
});  
</script>  -->


</head>
<body>

    <div class="login-page bg-light">
        <div class="container">
            <div class="row">
                <div class="col-lg-10 offset-lg-1">
                  <h3 class="mb-3">SignUp Now</h3>
                    <div class="bg-white shadow rounded">
                        
                        <div class="row">
                            <div class="col-md-7 pe-0">
                                <div class="form-left h-100 py-5 px-5">
                                    
                                    <div class="row">
                                        <div class="col col-xxl-12 col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="logheading">
                                               <p class=" text-center" ><a href="#buisnessform"> <span id="buisnessview"> As a Buissness</span></a></p>
                                            </div>
                                      
                                      </div>
                                        
                                       
                                    </div>
                                    <hr>
                                  
                                    <section id="buisnessform">
                                    <form action="signup_server.jsp"  class="row g-4">
                                        <div class="col-12">
                                            <label>Buisness Name :<span class="text-danger">*</span></label>
                                            <div class="input-group">
                                                <div class="input-group-text"><i class="bi bi-person-fill"></i></div>
                                                <input name="txtname" type="text" class="form-control" placeholder="Buissness Name">
                                                
                                            </div>
                                        </div>
                                       
                                        <div class="col-12">
                                            <label>Buisness Email :<span class="text-danger">*</span></label>
                                            <div class="input-group">
                                                <div class="input-group-text"><i class="fa-sharp fa-solid fa-envelope"></i></div>
                                                <input name="txtemail" id="txtemail" type="email" class="form-control" placeholder="Buisness Email">
                                                <small id="checkemail" class="text-danger input-group"></small>
                                            </div>
                                        </div>

                                            <div class="col-12">
                                                <label>Mobile No :<span class="text-danger">*</span></label>
                                                <div class="input-group">
                                                    <div class="input-group-text"><i class="fa-sharp fa-solid fa-mobile"></i></div>
                                                    <input name="txtmobno" type="text" class="form-control" placeholder="Enter Username">
                                                </div>
                                            </div>

                                            <div class="col-12">
                                                <label>Create Password :<span class="text-danger">*</span></label>
                                                <div class="input-group">
                                                    <div class="input-group-text"><i class="bi bi-lock-fill"></i></div>
                                                    <input name="txtpassword" type="password" class="form-control" placeholder="Create Password">
                                                </div>
                                            </div>
                                            
                                        <div class="col-12">
                                                <label>Country :<span class="text-danger">*</span></label>
                                                <div class="input-group">
                                                    <div class="input-group-text"><i class="bi bi-lock-fill"></i></div>
                                                    <select name="country" id="country" class="form-select" aria-label="Default select example">
                                                          <option selected>Select Country</option>
                                                          <%
                                                          Connection con;
                                                          PreparedStatement pst;
                                                           ResultSet rs;
                                    try{
                                        Class.forName("com.mysql.jdbc.Driver");
                                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/udhari", "root", "");
                                        String sql = "select distinct CountryName from DropDownTest";
                                        pst = con.prepareStatement(sql);
                                        rs=pst.executeQuery();
                                        while(rs.next())
                                        {
                                            %>
                                            <option><%= rs.getString("CountryName") %></option>
                                            <%
                                        }
                                        %>
                                        </select>
                                        <%
                                         }catch(Exception e)
                                         {
                                        out.println(e.getMessage());
                                        }
                                                          
                                                          
                                                          %>
                                                    
                                                </div>
                                            </div>

                                            <div class="col-sm-6">
                                                <div id="sid">
                                                <label>State :<span class="text-danger">*</span></label>
                                                <div class="input-group">
                                                    <div class="input-group-text"><i class="fa-sharp fa-solid fa-flag-usa"></i></div>
                                                    <select name="state" id="state" class="form-select">
                                                          <option>Select State</option>
                                                          
                                                     </select>
                                                </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div id="cid">
                                                <label>City :<span class="text-danger">*</span></label>
                                                <div class="input-group">
                                                    <div class="input-group-text"><i class="fa-sharp fa-solid fa-city"></i></div>
                                                    <select name="city" id="city" class="form-select">
                                                          <option>Select City</option>
                                                          <option>A</option>
                                                          <option>B</option>
                                                         
                                                     </select>
                                                </div>
                                                </div>
                                            </div>

                                            <div class="col-12">
                                                <label>Enter Address :<span class="text-danger">*</span></label>
                                                <div class="input-group">
                                                    <!-- <div class="input-group-text"><i class="bi bi-lock-fill"></i></div> -->
                                                    <textarea name="txtadd" class="form-control" placeholder="Enter Address" id="floatingTextarea2" style="height: 100px"></textarea>
                                                    <!-- <input type="text" class="form-control" placeholder="Create Password"> -->
                                                </div>
                                            </div>
                                            

                                            <div class="col-12">
                                                <button type="submit" class="btn btn-warning px-4 float-end mt-4">SignUp</button>
                                            </div>
                                    </form>
                                </section>

                                    
                                
                                </div>
                            </div>
                            <div class="col-md-5 ps-0 d-none d-md-block">
                                <div id = "logimg" class="form-right h-100  text-white text-center pt-5">
                                    <img src="images/index/signupimg.svg" alt="">
                                </div>
                            </div>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
     
</body>
</html>