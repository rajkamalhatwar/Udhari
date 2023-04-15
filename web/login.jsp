<!DOCTYPE html>
<html lang="en">
<head>
    <title>How To Create</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">   
     
  <link rel="stylesheet" href="css/login.css">
 
 
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>  
<script>  
$(document).ready(function(){  
    $("#customerform").hide(); 
    $("#buisnessview").click(function(){  
        $("#buisnessform").show();  
         $("#customerform").hide(); 
    }); 
    $("#customerview").click(function(){  
        $("#customerform").show(); 
        $("#buisnessform").hide();  
         
    }); 
    
    
     $("#txtemail").blur(function(){ 
    	var emaill = $("#txtemail").val();
		 $.get("checkemailjQuery_server.jsp", 
		 {
			 email : emaill
		 },
		 function(data,status){
			$("#checkemail").text(data);
		 
		 });
			  
 	     	
	 });
});  
</script> 


</head>
<body>

    <div class="login-page bg-light">
        <div class="container">
            <div class="row">
                <div class="col-lg-10 offset-lg-1">
                  <h3 class="mb-3">Login Now</h3>
                    <div class="bg-white shadow rounded">
                        
                        <div class="row">
                            <div class="col-md-7 pe-0">
                                <div class="form-left h-100 py-5 px-5">
                                    
                                    <div class="row">
                                        <div class="col col-xxl-6 col-xl-6 col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                            <div class=" logheading">
                                                <p class="shadow p-2 mb-4 bg-body rounded text-center"><a href="#customerform"> <span id="customerview">As a Customer</span> </a></p>
                                             </div>
                                     
                                       </div>
                                       <div class="col col-xxl-6 col-xl-6 col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                             <div class="logheading">
                                                <p class="shadow p-2 mb-4 bg-body rounded text-center" ><a href="#buisnessform"> <span id="buisnessview"> As a Buissness</span></a></p>
                                             </div>
                                       
                                       </div>
                                    </div>

                                    <hr>
                                    <section id="buisnessform">
                                    <form action="blogin_server.jsp"  class="row g-4">
                                            <div class="col-12">
                                                <label>Username<span class="text-danger">*</span></label>
                                                <div class="input-group">
                                                    <div class="input-group-text"><i class="bi bi-person-fill"></i></div>
                                                    <input id="txtemail" name="username" type="text" class="form-control" placeholder="Enter Username">
                                                     <small id="checkemail" class="text-danger input-group"></small>
                                                </div>
                                            </div>

                                            <div class="col-12">
                                                <label>Password<span class="text-danger">*</span></label>
                                                <div class="input-group">
                                                    <div class="input-group-text"><i class="bi bi-lock-fill"></i></div>
                                                    <input name="password" type="text" class="form-control" placeholder="Enter Password">
                                                </div>
                                            </div>

                                            <div class="col-sm-6">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" id="inlineFormCheck">
                                                    <label class="form-check-label" for="inlineFormCheck">Remember me</label>
                                                </div>
                                            </div>

                                            <div class="col-sm-6">
                                                <a href="forgotpass.jsp" class="float-end text-black">Forgot Password?</a>
                                            </div>

                                            <div class="col-12">
                                                <button type="submit" class="btn btn-warning px-4 float-end mt-4">login</button>
                                            </div>
                                    </form>
                                </section>

                                    
                                <section id="customerform">
                                    <form action=""  class="row g-4">
                                        <div class="col-12">
                                            <label>Email<span class="text-danger">*</span></label>
                                            <div class="input-group">
                                                <div class="input-group-text"><i class="bi bi-person-fill"></i></div>
                                                <input type="text" class="form-control" placeholder="Enter Email">
                                            </div>
                                        </div>

                                        <div class="col-12">
                                            <label>OTP<span class="text-danger">*</span></label>
                                            <div class="input-group">
                                                <div class="input-group-text"><i class="bi bi-lock-fill"></i></div>
                                                <input type="text" class="form-control" placeholder="Enter OTP">
                                            </div>
                                        </div>

                                        <div class="col-sm-6">
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" id="inlineFormCheck">
                                                <label class="form-check-label" for="inlineFormCheck">Remember me</label>
                                            </div>
                                        </div>

                                        <div class="col-sm-6">
                                            <a href="#" class="float-end text-black">Forgot Password?</a>
                                        </div>

                                        <div class="col-12">
                                            <button type="submit" class="btn btn-warning px-4 float-end mt-4">login</button>
                                        </div>
                                </form>
                            </section>
                                </div>
                            </div>
                            <div class="col-md-5 ps-0 d-none d-md-block">
                                <div id = "logimg" class="form-right h-100  text-white text-center pt-5">
                                    <img src="images/index/undraw_login_re_4vu2.svg" alt="">
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