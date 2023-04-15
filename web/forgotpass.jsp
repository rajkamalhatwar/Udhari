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
   
    
    
     $("#txtemail").blur(function(){ 
    	var emaill = $("#txtemail").val();
		 $.get("checkemailjQuery_server.jsp", 
		 {
			 emailr : emaill
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
                  <h3 class="mb-3">Enter email to receive OTP</h3>
                    <div class="bg-white shadow rounded">
                        
                        <div class="row">
                            <div class="col-md-7 pe-0">
                                <div class="form-left h-100 py-5 px-5">
                                    
                                    

                                   
                                    <section id="buisnessform">
                                    <form action="forgotpass_server.jsp"  class="row g-4">
                                            <div class="col-12">
                                                <label>Enter Email : <span class="text-danger">*</span></label>
                                                <div class="input-group">
                                                    <div class="input-group-text"><i class="bi bi-person-fill"></i></div>
                                                    <input id="txtemail" name="txtemail" type="text" class="form-control" placeholder="Enter Email">
                                                     <small id="checkemail" class="text-danger input-group"></small>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <button type="submit" class="btn btn-warning px-4 float-end mt-4">Send OTP</button>
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