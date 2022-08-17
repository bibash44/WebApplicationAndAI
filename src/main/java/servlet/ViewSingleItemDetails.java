/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import Dao.ProductDao;
import Model.ProductModel;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
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
@WebServlet(name = "viewsingleitemdetails", urlPatterns = {"/viewsingleitemdetails"})
public class ViewSingleItemDetails extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        ProductDao productDao = new ProductDao();
        int id = Integer.valueOf(request.getParameter("id"));
        ProductModel model = productDao.getSingleItem(id);

        request.setAttribute("id", id);

        HashMap<String, String> singleItemDetails = new HashMap<>();

        singleItemDetails.put("id", String.valueOf(model.getId()));
        singleItemDetails.put("productname", String.valueOf(model.getProductname()));
        singleItemDetails.put("cpu", String.valueOf(model.getCpu()));
        singleItemDetails.put("processor", String.valueOf(model.getProcessor()));
        singleItemDetails.put("graphics", String.valueOf(model.getGraphics()));
        singleItemDetails.put("display", String.valueOf(model.getDisplay()));
        singleItemDetails.put("connections", String.valueOf(model.getConnections()));
        singleItemDetails.put("memory", String.valueOf(model.getMemory()));
        singleItemDetails.put("storage", String.valueOf(model.getStorage()));
        singleItemDetails.put("power", String.valueOf(model.getPower()));
        singleItemDetails.put("weight", String.valueOf(model.getWeight()));
        singleItemDetails.put("image", String.valueOf(model.getImage()));
        singleItemDetails.put("category", String.valueOf(model.getCategory()));
        singleItemDetails.put("price", String.valueOf(model.getPrice()));

        request.setAttribute("singleitemdetails", singleItemDetails);
        RequestDispatcher dispatcher = request.getRequestDispatcher("shop-details.jsp");
        dispatcher.forward(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }



}
