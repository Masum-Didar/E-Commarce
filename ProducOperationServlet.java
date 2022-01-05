
package com.learn.mycart.servlets;

import com.learn.mycart.dao.CategoryDao;
import com.learn.mycart.dao.ProductDao;
import com.learn.mycart.entities.Category;
import com.learn.mycart.entities.Product;
import com.learn.mycart.helper.FactoryProvider;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class ProducOperationServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
//            Servlet 2:
//            Add Caterory
//            Add Product
            String op = request.getParameter("operation");
            
            if(op.trim().equals("addcategory"))
            {
                //Add Category
                //Fetching category data
                
                String title = request.getParameter("catTitle");
                String description = request.getParameter("catDescription");
                
                Category category = new Category();
                category.setCategoryTitle(title);
                category.setCategoryDescription(description);
                
                //Sava the category to database
                CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
                
                int catId=categoryDao.saveCategory(category);
//                out.println("Category saved");
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", "Category Id: "+catId+" and Category Title: "+title+" added successfully added");
                
                response.sendRedirect("admin.jsp");
                
                return;
                
            }
            else if(op.trim().equals("addproduct"))
            {
                //Add Product
                String proName = request.getParameter("proName");
                String proDesc = request.getParameter("proDesc");
                int proPrice =Integer.parseInt(request.getParameter("proPrice"));
                int proDiscount =Integer.parseInt(request.getParameter("proDiscount"));
                int proQuantity =Integer.parseInt(request.getParameter("proQuantity"));
                int catId =Integer.parseInt(request.getParameter("catId"));
                
                Part part = request.getPart("proPhoto");
                
                Product p = new Product(); 
                
                p.setpName(proName);
                p.setpDesc(proDesc);
                p.setpPrice(proPrice);
                p.setpDiscount(proDiscount);
                p.setpQuantity(proQuantity);
                p.setpPoto(part.getSubmittedFileName());
                
                //Get category by Id.......
                
                CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                Category category = cdao.getcategoryById(catId);
                
                p.setCategory(category);
                
                //Product Save.............
                ProductDao pdao=new ProductDao(FactoryProvider.getFactory());
                pdao.saveProduct(p);

                //Photo upload
                
                
//              Find out the path to upload photo
                String path = request.getRealPath("img") + File.separator + "products" + File.separator + part.getSubmittedFileName();
                System.out.println(path);
                
                
                
                
                //Uploasing code...........
                
                try {
                    FileOutputStream fos= new FileOutputStream(path);

                    InputStream is = part.getInputStream();

    //              Reading Data

                    byte [] data = new byte[is.available()];

                    is.read(data);

    //              Writing data

                    fos.write(data);
                    fos.close();

                } catch (Exception e) {
                    
                    e.printStackTrace();
                }
                
                
                


                
                
                out.println("Product saved successfully...!!!!!!!!!!!");
                 
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", "Category Id: "+catId+" and Product Name: "+proName+" added successfully added");
                
                response.sendRedirect("admin.jsp");
                
                return;
                
            }

            
            
            
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
