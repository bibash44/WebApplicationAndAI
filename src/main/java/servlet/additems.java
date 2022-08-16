/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import Dao.ProductDao;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Bibash kattel
 */
@WebServlet(name = "additems", urlPatterns = {"/additems"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 5, // 5 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class additems extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ProductDao productDao = new ProductDao();

        String productname = request.getParameter("productname");
        String cpu = request.getParameter("cpu");
        String proceessor = request.getParameter("procesor");
        String graphics = request.getParameter("graphics");
        String display = request.getParameter("display");
        String connections = request.getParameter("connections");
        String memory = request.getParameter("memory");
        String storage = request.getParameter("storage");
        String power = request.getParameter("power");
        String weight = request.getParameter("weight");
        String category = request.getParameter("category");

        Part part = request.getPart("image");
        String filename = part.getSubmittedFileName();
        String path = getServletContext().getRealPath(filename);

        part.write(path);

        System.out.println(path);

        if (filename == null) {

        }
        String image = String.valueOf(filename);

        int addItemsResponse = productDao.additems(productname, cpu, proceessor, graphics, display, connections, memory, storage, power, weight, image, category);

        if (addItemsResponse == 1) {
            response.getWriter().println("1, success");
            RequestDispatcher dispatcher = request.getRequestDispatcher("./adminprofile.jsp");
            dispatcher.forward(request, response);
        }
        else{
            response.getWriter().write("0, failed to add product, please try again");
//            RequestDispatcher dispatcher = request.getRequestDispatcher("./additems.jsp");
//            dispatcher.forward(request, response);
        }

    }

}
