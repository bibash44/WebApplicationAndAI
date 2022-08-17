/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import Dao.ProductDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Bibash kattel
 */
@WebServlet(name = "updateitem", urlPatterns = {"/updateitem"})
public class UpdateItem extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        ProductDao productDao = new ProductDao();
        
        String id = request.getParameter("id");
        String productname = request.getParameter("productname");
        String cpu = request.getParameter("cpu");
        String processor = request.getParameter("processor");
        String graphics = request.getParameter("graphics");
        String display = request.getParameter("display");
        String connections = request.getParameter("connections");
        String memory = request.getParameter("memory");
        String storage = request.getParameter("storage");
        String power = request.getParameter("power");
        String weight = request.getParameter("weight");
        String category = request.getParameter("category");
        String price = request.getParameter("price");
        
        int updateItemResponse = productDao.updateItem(productname, cpu, processor, graphics, display, connections, memory, storage, power, weight, category, price, id);
        
        if (updateItemResponse == 1) {
            response.sendRedirect("viewallitems");
        } else {
           response.sendRedirect("getsingleitem?id="+id);
        }
        
    }
    
}
