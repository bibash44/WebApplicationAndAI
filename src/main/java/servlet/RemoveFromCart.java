/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import Dao.CartDao;
import Dao.ProductDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Bibash kattel
 */
@WebServlet(name = "removefromcart", urlPatterns = {"/removefromcart"})
public class RemoveFromCart extends HttpServlet {

   
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
           CartDao cartDao = new CartDao();
        String id = request.getParameter("id");
        int deleteItemResponse = cartDao.removeFromCart(id);

        PrintWriter printWriter = response.getWriter();

        if (deleteItemResponse == 1) {
            printWriter.write(deleteItemResponse + "Success , Item removed successfully.");
        } else if (deleteItemResponse == 0) {
            printWriter.write(deleteItemResponse + "Failed ,Failed to remove item");
        }
    }

}
