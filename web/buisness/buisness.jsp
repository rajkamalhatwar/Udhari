<%@ page import = "java.sql.*"  %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />


    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css" integrity="sha384-b6lVK+yci+bfDmaY1u0zE8YYJt0TZxLEAFyYSLHId4xoVvsrQu3INevFKo+Xir8e" crossorigin="anonymous">
    <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css" integrity="sha384-b6lVK+yci+bfDmaY1u0zE8YYJt0TZxLEAFyYSLHId4xoVvsrQu3INevFKo+Xir8e" crossorigin="anonymous"> -->

    <link rel="stylesheet" href="bcss/buisness.css" />
    <link rel="stylesheet" href="bcss/myprofile.css" />
    
     <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    
    <title>Buisness Dashboard</title>
</head>

<body>
    <script type="text/javascript">
$(document).ready(
		function(){
			$("#dashboardsection").show();
			$("#myprofilesection").hide();
			 $("#editprofilesection").hide();
			
			$("#dashboardview").click(
					function(){
                                                $("#heading").text("Dashboard");
//                                                 $("#dashboardview").css("color : #dcbd4e;");
						$("#dashboardsection").show();
			                        $("#myprofilesection").hide();
                                                $("#editprofilesection").hide();
                                                
					}
			);
			
			$("#myprofileview").click(
					function(){
						$("#dashboardsection").hide();
			                        $("#myprofilesection").show();
                                                $("#heading").text("My Profile");
                                                $("#editprofilesection").hide();
//                                                $("a").addClass("active");
					}
			);
                        
                        $("#editprofileview").click(
					function(){
						$("#dashboardsection").hide();
			                        $("#myprofilesection").hide();
                                                $("#heading").text("Edit Profile");
                                                $("#editprofilesection").show();

					}
			);
			
			
			
			
			
			
			
			
			
			
			
			
			
			
		});



</script>
    
    
       <%
            String username = (String)session.getAttribute("seslogs");
        %>
        
   
    
    
    <div class="d-flex shadow-sm" id="wrapper">
        <!-- Sidebar -->
        <div class="white-custom-bg" id="sidebar-wrapper">
            <div class="sidebar-heading text-center py-4 second-text fs-4 fw-bold text-uppercase border-bottom"><i
                    class="bi bi-coin me-2 primary-text"></i>UDHARI</div>
            <div class="list-group list-group-flush my-3">
                <span id="dashboardview" class="txtcolor"><a href="#dashboardsection" class="list-group-item list-group-item-action bg-transparent  second-text fw-bold"><i
                        class="fas fa-tachometer-alt me-2"></i>Dashboard</a></span>
                <a href="#" class="list-group-item list-group-item-action bg-transparent second-text fw-bold"><i
                        class="fas fa-user me-2"></i>Add Customer</a>
                <a href="#" class="list-group-item list-group-item-action bg-transparent second-text fw-bold"><i
                        class="bi bi-kanban-fill me-2"></i>Manage Customers</a>
                <a href="#" class="list-group-item list-group-item-action bg-transparent second-text fw-bold"><i
                        class="fas fa-gift me-2"></i>Add Item</a>
                <a href="#" class="list-group-item list-group-item-action bg-transparent second-text fw-bold"><i
                        class="fas fa-shopping-cart me-2"></i>Manage Item's</a>
                <span id="myprofileview"  class="txtcolor"><a href="#myprofilesection" class="list-group-item list-group-item-action bg-transparent second-text fw-bold"><i
                        class="bi bi-person-lines-fill me-2"></i>My Profile</a></span>
                <!-- <a href="#" class="list-group-item list-group-item-action bg-transparent second-text fw-bold"><i
                        class="fas fa-comment-dots me-2"></i>Chat</a>
                <a href="#" class="list-group-item list-group-item-action bg-transparent second-text fw-bold"><i
                        class="fas fa-map-marker-alt me-2"></i>Outlet</a> -->
                <a href="#" class="list-group-item list-group-item-action bg-transparent text-danger fw-bold"><i
                        class="fas fa-power-off me-2"></i>Logout</a>
            </div>
        </div>
        <!-- /#sidebar-wrapper -->

        <!-- Page Content -->
         
        <div id="page-content-wrapper">
            
            <nav class="navbar navbar-expand-lg navbar-light bg-transparent primary-bg py-4 px-4">
                <div class="d-flex align-items-center">
                    <i class="fas fa-align-left primary-text fs-4 me-3" id="menu-toggle"></i>
                    <h2 id="heading"class="fs-2 m-0">Dashboard</h2>
                </div>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle second-text fw-bold" href="#" id="navbarDropdown"
                                role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <%=username%>
                                <!-- <img class="img-profile rounded-circle"
                                    src="img/undraw_profile.svg"> -->
                                    
                                     <%
                                    String imagename = null;
                                Class.forName("com.mysql.jdbc.Driver");                //1st step load driver
                                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/udhari", "root", "");     //set Connnection
                                String sqll = "select image from tbl_signup where BuisnessEmail='"+username+"'";
                                PreparedStatement pstt = conn.prepareStatement(sqll);
                                ResultSet rss = pstt.executeQuery(sqll);
                                while(rss.next()){
                                	imagename = rss.getString(1);
                                } 
                                if(imagename==null){
                                	%>
                                	<img src="bimages/undraw_profile.svg" class="rounded-circle" alt="" width="38" height="38">
                                	<%
                                	
                                }else{
                                	%>
                                        <img src="profilepictures/<%=imagename%>" class="rounded-circle" alt="" width="38" height="38">
                                	<%
                                	
                                }
                                    
                                    
                                    
                                    
                                    %>

                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#">Profile</a></li>
                                <li><a class="dropdown-item" href="#">Settings</a></li>
                                <li><a class="dropdown-item" href="#">Logout</a></li>
                            </ul>
                        </li>

                        <!-- <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">Douglas McGee</span>
                                <img class="img-profile rounded-circle"
                                    src="img/undraw_profile.svg">
                            </a>
                            
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Profile
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Settings
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Activity Log
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout
                                </a>
                            </div>
                        </li> -->
                    </ul>
                </div>
            </nav>
            <section id="dashboardsection" >
            <div class="container-fluid px-4">
                <div class="row g-3 my-2">
                    <div class="col-md-3">
                        <div class="p-3 bg-white shadow d-flex justify-content-around align-items-center rounded">
                            <div>
                                <h3 class="fs-2">720</h3>
                                <p class="fs-5">Item's</p>
                            </div>
                            <i class="fas fa-gift fs-1 primary-text border rounded-full secondary-bg p-3"></i>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="p-3 bg-white shadow d-flex justify-content-around align-items-center rounded">
                            <div>
                                <h3 class="fs-2">4920</h3>
                                <p class="fs-5">Udhari(Rs)</p>
                            </div>
                            <i
                                class="fas fa-hand-holding-usd fs-1 primary-text border rounded-full secondary-bg p-3"></i>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="p-3 bg-white shadow d-flex justify-content-around align-items-center rounded">
                            <div>
                                <h3 class="fs-2">3899</h3>
                                <p class="fs-5">Customer's</p>
                            </div>
                            <i class="fas fa-users fs-1 primary-text border rounded-full secondary-bg p-3"></i>
                        </div>
                    </div>

                    <!-- <div class="col-md-3">
                        <div class="p-3 bg-white shadow d-flex justify-content-around align-items-center rounded">
                            <div>
                                <h3 class="fs-2">%25</h3>
                                <p class="fs-5">Increase</p>
                            </div>
                            <i class="fas fa-chart-line fs-1 primary-text border rounded-full secondary-bg p-3"></i>
                        </div>
                    </div> -->
                </div>

                <div class="row my-5">
                    <h3 class="fs-4 mb-3">Recent Customer's</h3>
                    <div class="col">
                        <table class="table bg-white rounded shadow-sm  table-hover">
                            <thead>
                                <tr>
                                    <th scope="col" width="50">#</th>
                                    <th scope="col">Product</th>
                                    <th scope="col">Customer</th>
                                    <th scope="col">Price</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th scope="row">1</th>
                                    <td>Television</td>
                                    <td>Jonny</td>
                                    <td>$1200</td>
                                </tr>
                                <tr>
                                    <th scope="row">2</th>
                                    <td>Laptop</td>
                                    <td>Kenny</td>
                                    <td>$750</td>
                                </tr>
                                <tr>
                                    <th scope="row">3</th>
                                    <td>Cell Phone</td>
                                    <td>Jenny</td>
                                    <td>$600</td>
                                </tr>
                                <tr>
                                    <th scope="row">4</th>
                                    <td>Fridge</td>
                                    <td>Killy</td>
                                    <td>$300</td>
                                </tr>
                                <tr>
                                    <th scope="row">5</th>
                                    <td>Books</td>
                                    <td>Filly</td>
                                    <td>$120</td>
                                </tr>
                                <tr>
                                    <th scope="row">6</th>
                                    <td>Gold</td>
                                    <td>Bumbo</td>
                                    <td>$1800</td>
                                </tr>
                                <tr>
                                    <th scope="row">7</th>
                                    <td>Pen</td>
                                    <td>Bilbo</td>
                                    <td>$75</td>
                                </tr>
                                <tr>
                                    <th scope="row">8</th>
                                    <td>Notebook</td>
                                    <td>Frodo</td>
                                    <td>$36</td>
                                </tr>
                                <tr>
                                    <th scope="row">9</th>
                                    <td>Dress</td>
                                    <td>Kimo</td>
                                    <td>$255</td>
                                </tr>
                                <tr>
                                    <th scope="row">10</th>
                                    <td>Paint</td>
                                    <td>Zico</td>
                                    <td>$434</td>
                                </tr>
                                <tr>
                                    <th scope="row">11</th>
                                    <td>Carpet</td>
                                    <td>Jeco</td>
                                    <td>$1236</td>
                                </tr>
                                <tr>
                                    <th scope="row">12</th>
                                    <td>Food</td>
                                    <td>Haso</td>
                                    <td>$422</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

            </div>
             </section> 
                                
           <%
               String name = "";
               String about ="";
               String joindate ="";
                try{
                   Class.forName("com.mysql.jdbc.Driver");                //1st step load driver
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/udhari", "root", "");     //set Connnection
    String sql = "select * from tbl_signup where BuisnessEmail= '"+username+"' " ;
    PreparedStatement pst = con.prepareStatement(sql);
    ResultSet rs = pst.executeQuery(sql);
   
   if(rs.next()){
	 name = rs.getString("BuisnessName");
         session.setAttribute("sesname", name);
         about= rs.getString("about");
          session.setAttribute("sesabout", about);
         joindate= rs.getString("signupdate");
   } 
                } catch(Exception e){
                    System.out.println(e);
                }
           
           
           
           
           
           %>
               
             <section id="myprofilesection">
         <div class="row">
                 <div class="col col-xxl-12 col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12">
                     <div class="container mt-4 mb-4 p-3 d-flex justify-content-center">
                       <div class="shadow card p-4">
                          <div class=" image d-flex flex-column justify-content-center align-items-center">
                              <button class="btn btn-secondary"> 
                                <%
                                    String imagename2 = null;
                                
                                String sql2 = "select image from tbl_signup where BuisnessEmail='"+username+"'";
                                PreparedStatement pstt2 = conn.prepareStatement(sql2);
                                ResultSet rss2 = pstt2.executeQuery(sql2);
                                while(rss2.next()){
                                	imagename2 = rss2.getString(1);
                                } 
                                if(imagename2==null){
                                	%>
                                	<img src="bimages/undraw_profile.svg" class="rounded-circle" height="100" width="100" />
                                	<%
                                	
                                }else{
                                	%>
                                        <img src="profilepictures/<%=imagename2%>" class="rounded-circle" height="100" width="100" />
                                	<%
                                	
                                }
                                    
                                    
                                    
                                    
                                    %>
                              </button>
                                   
                              <span class="name mt-3"><%=name%></span> <span class="idd"><%=username%></span>
<!--            <div class="d-flex flex-row justify-content-center align-items-center gap-2">
                <span class="idd1">Oxc4c16a645_b21a</span> <span><i class="bi bi-instagram"></i></span> </div>-->
            <div class="d-flex flex-row justify-content-center align-items-center mt-3">
                <span class="number">1069 <span class="follow">Customers</span></span> </div>
                <div class=" d-flex mt-2"> 
                    <span id="editprofileview">
                        <a href="#editprofilesection">
                        <input type="button"  value="Edit Profile"  class="btn1 btn-warning">
                         <a/>
                    </span>
                </div>
            <div class="text mt-3">
                <div class="text-center fw-bold">
                    <span >About<br></span>
                </div>
                
                <span><%=about%> </span>
            </div>
            <div class="gap-3 mt-3 icons d-flex flex-row justify-content-center align-items-center">
                <span><i class="bi bi-instagram"></i></span> <span><i class="bi bi-twitter"></i></span>
                <span><i class="bi bi-linkedin"></i></span> <span><i class="bi bi-youtube"></i></span> 
            </div>
            <div class=" px-2 rounded mt-4 date text-center "> <span class="join">Joined <%=joindate%></span> </div>
        </div>
    </div>
</div>
                     
                     
                 </div>
        </div>
        
    </section>


    <section id="editprofilesection">
         <div class="row">
                 <div class="col col-xxl-12 col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12">
                     <div class="container mt-4 mb-4 p-3 d-flex justify-content-center">
                       <div class="shadow card p-4">
                           <form action="editprofile_server.jsp" method="post" enctype = "multipart/form-data" >
                          <div class=" image d-flex flex-column justify-content-center align-items-center">
                              <button class="btn btn-secondary">
                                   <%
                                    String imagename3 = null;
                                
                                String sql3 = "select image from tbl_signup where BuisnessEmail='"+username+"'";
                                PreparedStatement pstt3 = conn.prepareStatement(sql3);
                                ResultSet rss3 = pstt3.executeQuery(sql3);
                                while(rss3.next()){
                                	imagename3 = rss3.getString(1);
                                } 
                                if(imagename3==null){
                                	%>
                                	<img src="bimages/undraw_profile.svg" class="rounded-circle" height="100" width="100" />
                                	<%
                                	
                                }else{
                                	%>
                                        <img src="profilepictures/<%=imagename3%>" class="rounded-circle" height="100" width="100" />
                                	<%
                                	
                                }
                                    
                                    
                                    
                                    
                                    %>
                              </button>
                              <div class="mb-3 text mt-3">
                                  <span>Upload Profile Picture :</span>
                                  <input class="form-control" type="file" name="file" id="formFile">
                               </div>
                              
                            
                              <input type="text" name="txtname" value="<%=name%>" class="name form-control mt-3"> 
                              <span class="idd"><%=username%></span>
<!--            <div class="d-flex flex-row justify-content-center align-items-center gap-2">
                <span class="idd1">Oxc4c16a645_b21a</span> <span><i class="bi bi-instagram"></i></span> </div>-->
            <div class="d-flex flex-row justify-content-center align-items-center mt-3">
                <span class="number">1069 <span class="follow">Customers</span></span> </div>
            
            <div class="text mt-3">
                <div class="text-center fw-bold">
                    <span >Change About :<br></span>
                </div>
                
                <textarea name="txtabout" class="form-control"><%=about%>  </textarea>
            </div>
            
            <div class="gap-3 mt-3 icons d-flex flex-row justify-content-center align-items-center">
                <span><i class="bi bi-instagram"></i></span> <span><i class="bi bi-twitter"></i></span>
                <span><i class="bi bi-linkedin"></i></span> <span><i class="bi bi-youtube"></i></span> 
            </div>
            <div class=" d-flex mt-2"> <input type="submit" value="Save" class="btn1 btn-warning"> </div>    
             
            <div class=" px-2 rounded mt-4 date "> <span class="join">Joined <%=joindate%></span> </div>
        </div>
        </form>
    </div>
</div>
                     
                     
                 </div>
        </div>
        
    </section>
                                    
                       
              
        </div>
         
         
    </div>
    <!-- /#page-content-wrapper -->
    </div>
    </section>
                                
    
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        var el = document.getElementById("wrapper");
        var toggleButton = document.getElementById("menu-toggle");

        toggleButton.onclick = function () {
            el.classList.toggle("toggled");
            
        };
        
        
// $(document).ready(function(){  
//    $("#myprofilesection").hide(); 
//    $("#dashboardview").click(function(){  
//        $("#dashboradsection").show();  
//         $("#myprofilesection").hide(); 
//    }); 
//    $("#myprofileview").click(function(){ 
//        $("#myprofilesection").show();
//      $("#dashboradsection").hide();  
//          
//         
//    }); 
    
    
    

    </script>
</body>

</html>