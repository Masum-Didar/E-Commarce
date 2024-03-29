
package com.learn.mycart.servlets;

import com.learn.mycart.dao.UserDao;
import com.learn.mycart.entities.User;
import com.learn.mycart.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class LoginServlet extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           
            
            //Coding Area
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            
            //Validation
            
            
            //Authenticating User
            UserDao userDao = new UserDao(FactoryProvider.getFactory());
            User user = userDao.getUserByEmailandPassword(email, password);
                
            //System.out.println(user);
            HttpSession httpSession = request.getSession();
            
            if(user==null)
            {
                httpSession.setAttribute("message", "Invalide Details..!! try with another account");
                response.sendRedirect("login.jsp");
                
                return;
            }
            else
            {
               // out.println("<hi> Welcome "+user.getUserName()+" </h1>");
                
                
//                httpSession.setAttribute("message", "Welcome "+user.getUserName()+"");
//                response.sendRedirect("index.jsp");
//                
//                return;
                
                

                //login
                httpSession.setAttribute("current-user", user);
               
                if(user.getUserType().equals("Admin"))
                {
                    //Admin:- admin.jsp
                    response.sendRedirect("admin.jsp");
                }
                
                else if(user.getUserType().equals("Normal"))
                    {
                        //Normal:- normal.jsp
                        response.sendRedirect("normal.jsp");
                    }
                       
                        else
                        {
                            out.println("We have note identified user type");
                        }
                
                
                
                
                
                
                
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
