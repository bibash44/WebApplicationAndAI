/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

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
@WebServlet(name = "deleteitem", urlPatterns = {"/deleteitem"})
public class deleteitem extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        ProductDao productDao = new ProductDao();
        int id = Integer.parseInt(request.getParameter("id"));
        int deleteItemResponse = productDao.deleteItem(id);

        PrintWriter printWriter = response.getWriter();

        if (deleteItemResponse == 1) {
            printWriter.write(deleteItemResponse + "Success , Item removed successfully.");
        } else if (deleteItemResponse == 0) {
            printWriter.write(deleteItemResponse + "Failed ,Failed to remove item");
        }
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
