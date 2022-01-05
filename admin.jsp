<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.entities.User"%>
<%
    User user=(User) session.getAttribute("current-user");
    if(user==null)
    {
        session.setAttribute("message", "You are not logged in. Please log in first");
        response.sendRedirect("login.jsp");
        return; 
    }
    else{
            if(user.getUserType().equals("Normal"))
            {
                session.setAttribute("message", "You are not admin. don't access Admin page");
                response.sendRedirect("normal.jsp");
                return; 
            }
        }
   
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>admin panel</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
       
        <div class="container card-bacground">
                    <div class="container-fluid mt-2">
                       <%@include file="components/message.jsp"%> 
                    </div>
                    <!--first-row -->
                <div class="row mt-3">

                        <!--first-row : first-col-->
                        <div class="col-md-4">
                            <div class="card">
                                <div class="card-body text-center">
                                   
                                    <div class="container">
                                        <img style="max-width: 120px" class="img-fluid" src="img/users.png" alt="User"/>
                                    </div>
                                    <h1 class="mt-2">122435</h1>
                                    <h1 class="text-uppercase text-muted">Users</h1>
                                </div>
                            </div>
                        </div>

                        <!--first-row : second-col-->
                        <div class="col-md-4">
                            <div class="card">
                                <div class="card-body text-center">
                                    <div class="container">
                                        <img style="max-width: 120px" class="img-fluid" src="img/categories.png" alt="User"/>
                                    </div>
                                    <h1 class="mt-2">122435</h1>
                                    <h1 class="text-uppercase text-muted">Categories</h1>
                                </div>
                            </div>
                        </div>

                        <!--first-row : third-col-->
                        <div class="col-md-4">
                            <div class="card">
                                <div class="card-body text-center">
                                    <div class="container">
                                        <img style="max-width: 120px" class="img-fluid" src="img/products.png" alt="User"/>
                                    </div>
                                    <h1 class="mt-2">122435</h1>
                                    <h1 class="text-uppercase text-muted">Products</h1>
                                </div>
                            </div>
                        </div>

                </div>
                    
                    
                    <!--Second-row-->
                <div class="row mt-3">
                    <!--second-row : first-col-->
                        <div class="col-md-6">
                            <div class="card" data-toggle="modal" data-target="#add-category-modal">
                                <div class="card-body text-center">
                                    <div class="container">
                                        <img style="max-width: 120px" class="img-fluid" src="img/add-categories.png" alt="User"/>
                                    </div>
                                    <p class="mt-2">Click here to add new Categories</p>
                                    <h1 class="text-uppercase text-muted">Add Categories</h1>
                                </div>
                            </div>
                        </div>

                        <!--second-row : second-col-->
                        <div class="col-md-6">
                            <div class="card" data-toggle="modal" data-target="#add-product-modal">
                                <div class="card-body text-center">
                                    <div class="container">
                                        <img style="max-width: 120px" class="img-fluid" src="img/add-products.png" alt="User"/>
                                    </div>
                                    <p class="mt-2">Click here to add new Products</p>
                                    <h1 class="text-uppercase text-muted">Add Products</h1>
                                </div>
                            </div>
                        </div>
                </div>

            
        </div>
        
     
        <!--add category modal-->
       
            <div class="modal fade" id="add-category-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header custom-bg text-white">
                    <h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  <div class="modal-body">
                    
                      <form action="ProducOperationServlet" method="post">
                          
                          <input type="hidden" name="operation" value="addcategory">
                          
                          <div class="form-group">
                              <input type="text" class="form-control" name="catTitle" placeholder="Enter category title" required />
                          </div>
                          <div class="form-group">
                              <textarea style="height: 150px" class="form-control" name="catDescription" placeholder="Enter category description" required></textarea>
                          </div>
                          <div class="container text-center">
                              <button class="btn btn-outline-success">Add category</button>
                              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                 
                          </div>
                          
                      </form>
                      
                  </div>
                </div>
              </div>
            </div>
            
        
        <!--#######################################################################################-->
            <!--Products Modal -->
            <div class="modal fade" id="add-product-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header custom-bg text-white">
                    <h5 class="modal-title" id="exampleModalLabel">Fill Product Details</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  <div class="modal-body">
                    
                      <form action="ProducOperationServlet" method="post" enctype="multipart/form-data">
                          
                          <input type="hidden" name="operation" value="addproduct">
                          
                          <!--Products Name-->
                          <div class="form-group">
                              <input type="text" class="form-control" name="proName" placeholder="Enter product name" required />
                          </div>
                          
                          
                          <!--Products Description-->
                          <div class="form-group">
                              <textarea style="height: 150px" class="form-control" name="proDesc" placeholder="Enter product description" required></textarea>
                          </div>
                          
                          
                          <!--Products Price-->
                          <div class="form-group">
                              <input type="number" class="form-control" name="proPrice" placeholder="Enter product price" required />
                          </div>
                          
                          <!--Products Discount-->
                          <div class="form-group">
                              <input type="number" class="form-control" name="proDiscount" placeholder="Enter product discount" required />
                          </div>
                          
                          <!--Products Quantity -->
                          <div class="form-group">
                              <input type="number" class="form-control" name="proQuantity" placeholder="Enter product quantity" required />
                          </div>
                          
                          <!--Products Category-->
                          <%
                           CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                           List<Category> list= cdao.getCategorys();
                          %>
                          
                          <div class="form-group">
                              <label for="">Select Category</label>
                              <select name="catId" class="form-control" id="">
                                  <% 
                                  for(Category c: list){
                                  %>
                                  <option value="<%= c.getCategoryId() %>"><%=c.getCategoryTitle() %></option>
                                  <% 
                                      } 
                                  %>
                              </select>
                          </div>
                              
                              
                          <!--Products Photo-->
                          <div class="form-group">
                              <label for="proPhoto">Select Photo of product</label>
                              <input type="file" class="form-control" name="proPhoto" id="proPhoto" required />
                          </div>
                          
                          <!--Products add Category-->
                          <div class="container text-center">
                              <button class="btn btn-outline-success">Add Product</button>
                              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                 
                          </div>
                          
                      </form>
                      
                  </div>
                </div>
              </div>
            </div>
        <!--end add category modal-->
        
    </body>
</html>
