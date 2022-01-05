

<%@page import="com.learn.mycart.helper.Helper"%>
<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.dao.ProductDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MtCart-Home</title>
        
        <%@include file="components/common_css_js.jsp" %>
        
        
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container text-center">
            <%@include file="components/message.jsp" %>
        </div>
        
        <div class="row mt-3 mx-4">
            
            <% 
                String cat=request.getParameter("category");
               // out.println(cat);
                
             ProductDao pDao = new ProductDao(FactoryProvider.getFactory());
             
              List<Product> plist=null;
            
              if(cat==null || cat.trim().equals("all") ){
                 
                  plist = pDao.getAllProducts(); 
              
              
              } else
              {
                  
                  int cid = Integer.parseInt(cat.trim());
                 plist= pDao.getAllProductsById(cid);
                  
              }
             
             
             
             CategoryDao cDao = new CategoryDao(FactoryProvider.getFactory());
             List<Category> clist = cDao.getCategorys();
             
            %>
            
            <!--Show Categories-->
            <div class="col-md-2">
                
                <div class="list-group mt-4">
                    <a href="index.jsp?category=all" class="list-group-item list-group-item-action active" aria-current="true">
                     All Categories
                    </a>
                <% 
                
                for(Category category : clist){
                    %>    
                    <a href="index.jsp?category=<%= category.getCategoryId() %>" class="list-group-item list-group-item-action"><%=category.getCategoryTitle() %></a>

                    <%    
                        }
                    %>
                </div>
                
            </div>
            
            
            <!--Show Products-->
            <div class="col-md-10 card-bacground">
                
                
                <!--Row-->
                    <div class="row mt-4">

                        <!--Column : 12-->
                        <div class="col-md-12">

                            <div class="card-columns">

                                <!--Traversing product-->

                                <%
                                    for(Product p : plist){
                                %>
                                <!--Product Card-->
                                <div class="card">

                                        <div class="container text-center">
                                             <img src="img/products/<%= p.getpPoto()%>" style="max-height: 200px; max-width: 100%; width: auto" class="card-img-top mt-2" alt="...">
                                        </div>


                                    <div class="card-body">
                                        <h5 class="card-title"><%=p.getpName() %> </h5>

                                        <p class="card-text">
                                            <%= Helper.get10Words(p.getpDesc()) %>
                                        </p>
                                    </div>

                                        <div class="card-footer text-center">
                                            <button class="btn custom-bg text-white"onclick="add_to_cart(<%=p.getpId() %>,'<%=p.getpName() %>',<%=p.getPrinceAfterDiscount() %>)"> Add to Cart</button>
                                            <button class="btn btn-outline-success"><span class="price-decorate">&#2547; <%=p.getPrinceAfterDiscount()%>/- </span> <span class="discount-label">&#2547; <%=p.getpPrice() %>/-</span> <%= p.getpDiscount()%>% off</button>
                                        </div>    
                                </div>

                                <%  
                                    }

                                     if(plist.size()== 0){
                                        out.println("Sorry!!! No item available in this category");
                                        }
                                %>

                            </div>

                        </div>

                    </div>

                
            </div>
            
            
        </div>
        
        
          <%@include file="components/common_modal.jsp" %>                      
        
    </body>
</html>
