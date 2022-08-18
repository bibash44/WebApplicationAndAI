/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import Dao.CartDao;
import Model.CartProductModel;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Bibash kattel
 */
@WebServlet(name = "viewcart", urlPatterns = {"/viewcart"})
public class ViewCart extends HttpServlet {

   
   

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        CartDao cartDao= new CartDao();
        String userid= request.getParameter("userid");
        List<CartProductModel> cartProductModels= cartDao.getLoggedInUserCartDetails( userid);
        
        request.setAttribute("cartdetails", cartProductModels);
        RequestDispatcher dispatcher = request.getRequestDispatcher("./shopping-cart.jsp");
        dispatcher.forward(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

   

}
