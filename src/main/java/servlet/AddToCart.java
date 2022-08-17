/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import Dao.CartDao;
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
@WebServlet(name = "addtocart", urlPatterns = {"/addtocart"})
public class AddToCart extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userid = request.getParameter("userid");
        String productid = request.getParameter("productid");
        String quantity = request.getParameter("quantity");
        CartDao cartDao = new CartDao();
        int responseFromAddToCart = cartDao.addToCart(productid, userid, quantity);

        PrintWriter printWriter = response.getWriter();

        if (responseFromAddToCart == 1) {
            printWriter.write("1,"+"Product no "+productid+" successfully to cart,");
        } else {
            printWriter.write("0,Failed to add to cart,");
        }
    }

}
