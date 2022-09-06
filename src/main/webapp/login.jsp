<%-- 
    Document   : login
    Created on : Aug 2, 2021, 12:12:48 AM
    Author     : mamas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LogIn Page</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
         <%@include file="components/navbar.jsp" %>
        <div class="row mt-5">
             
             <div class="col-md-4 offset-md-4">
                 
                 <div class="card" style="background:#cfd8dc">
                     
                     <div class="card-header text-center custom-bg text-white border-0">
                         <h3>Log In here</h3>
                     </div>    
                     
                        <div class="card-body px-5">
                            
                            <%@include file="components/message.jsp"%>
                            
                            
                             <form action="LoginServlet" method="post">

                                        <div class="mb-3">
                                            <label for="email" class="form-label">Email address</label>
                                            <input name="email" type="email" class="form-control" id="email" placeholder="Enter here" aria-descripassword="emailHelp">
                                        </div>
                                        <div class="mb-3">
                                            <label for="password" class="form-label">Password</label>
                                            <input name="password" type="password" class="form-control" id="password" placeholder="Enter here" aria-describedby="emailHelp">
                                        </div>

                                           <a class="text-center d-block mb-2" href="register.jsp">If not register click here </a>

                                         <div class="container text-center">
                                             <button type="submit" class="btn btn-outline-success custom-bg border-0">Sign In</button>
                                             <button type="reset" class="btn btn-outline-success custom-bg border-0">Reset</button>
                                         </div>

                               </form>
                            

                        </div>
                     
                 </div>
                 
             </div>
             
         </div>
    </body>
</html>
