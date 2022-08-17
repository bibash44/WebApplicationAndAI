/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import Dao.ProductDao;
import Model.ProductModel;
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
@WebServlet(name = "getitemsbycategory", urlPatterns = {"/getitemsbycategory"})
public class GetItemsByCategory extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDao productDao = new ProductDao();
//        productDao.getAllItems();

        String category = request.getParameter("category");
        List<ProductModel> responseGettingItems = productDao.getItemsByCategory(category);

        for (ProductModel responseGettingItem : responseGettingItems) {
            System.out.println(responseGettingItem.getGraphics());
        }
        
        request.setAttribute("category", category);
        request.setAttribute("itemsdetails", responseGettingItems);
        RequestDispatcher dispatcher = request.getRequestDispatcher("./listofitems.jsp");
        dispatcher.forward(request, response);

//        if (category.equals("pc")) {
//            RequestDispatcher dispatcher = request.getRequestDispatcher("./pc.jsp");
//            dispatcher.forward(request, response);
//        } else if (category.equals("laptop")) {
//            RequestDispatcher dispatcher = request.getRequestDispatcher("./laptop.jsp");
//            dispatcher.forward(request, response);
//        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
