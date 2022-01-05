<%-- 
    Document   : register
    Created on : Aug 2, 2021, 12:11:47 AM
    Author     : mamas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User_Registration</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
         <%@include file="components/navbar.jsp" %>
        
         <div class="container-fluid">
             <div class="row mt-5">
             
             <div class="col-md-4 offset-md-4">
                 
                 <div class="card" style="background:#cfd8dc">
                     <div class="card-body px-5" >
                         
                         <div class="container text-center">
                            
                             <img class="img-fluid" src="img/emoji-man.jpg" width="50" height="50" alt="Regintration pictur"/>
                        
                         </div> 
                         
                          <h3 class="text-center my-3">Sign Up here</h3>
                          
                             <form action="RegisterServlet" method="post">
                     
                                    <div class="mb-3">
                                        <label for="name" class="form-label">User Name</label>
                                        <input name="user_name" type="text" class="form-control" id="name" placeholder="Enter here"aria-describedby="emailHelp">
                                    </div>
                                    <div class="mb-3">
                                        <label for="email" class="form-label">Email address</label>
                                        <input name="user_email" type="email" class="form-control" id="email" placeholder="Enter here" aria-descripassword="emailHelp">
                                    </div>
                                    <div class="mb-3">
                                        <label for="password" class="form-label">Password</label>
                                        <input name="user_password" type="password" class="form-control" id="password" placeholder="Enter here" aria-describedby="emailHelp">
                                    </div>
                                    <div class="mb-3">
                                        <label for="phone" class="form-label">Phone</label>
                                        <input name="user_phone" type="number" class="form-control" id="phone" placeholder="Enter here" aria-describedby="emailHelp">
                                    </div>
                                    <div class="mb-3">
                                        <label for="address" class="form-label">User address</label>
                                        <textarea name="user_address" style="height: 130px" class="form-control" placeholder="Enter your address"></textarea>

                                    </div>

                                     <div class="container text-center">
                                         <button class="btn btn-outline-success">Register</button>
                                         <button class="btn btn-outline-warning">Reset</button>
                                     </div>

                             </form>
                         
                     </div>
                 </div>
                 
             </div>
             
         </div>
         
         </div>
         
    </body>
</html>
