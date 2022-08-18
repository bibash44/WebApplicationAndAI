/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import Dao.CartDao;
import Model.CartProductModel;
import Model.CartProductUserModel;
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
@WebServlet(name = "viewordersbyadmin", urlPatterns = {"/viewordersbyadmin"})
public class ViewOrdersbyAdmin extends HttpServlet {

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        CartDao cartDao= new CartDao();
        List<CartProductUserModel> cartProductUserModels= cartDao.getAllOrdersDetails();
        
        request.setAttribute("orderdetails", cartProductUserModels);
        RequestDispatcher dispatcher = request.getRequestDispatcher("./viewordersbyadmin.jsp");
        dispatcher.forward(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

   

}
