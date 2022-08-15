/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import Dao.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Bibash kattel
 */
@WebServlet(name = "register", urlPatterns = {"/register"})
public class register extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        UserDao userDao = new UserDao();

        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String email = request.getParameter("email");
        String phonenumber = request.getParameter("phonenumber");
        String streetaddress = request.getParameter("streetaddress");
        String housenumber = request.getParameter("housenumber");
        String city = request.getParameter("city");
        String postcode = request.getParameter("postcode");
        String password = request.getParameter("password");

        boolean saveUser = userDao.registerUser(fname, lname, email, phonenumber, streetaddress, housenumber, city, postcode, password);

        PrintWriter printWriter = response.getWriter();
        if (saveUser) {
            printWriter.println("User registered successfully.");
        } else {
            printWriter.println("Failed to register user");
        }
//        response.sendRedirect(request.getContextPath() + "/register.jsp?success="+saveUser);
//        if(saveUser){
//            request.setAttribute("success", "User registered successully");
//        }
//        else{
//            request.setAttribute("unsuccess", "Failed to register user ");
//        }
        

//        if (saveUser) {
//            request.setAttribute("success", "User registered successfully");
//
//        } else {
//            request.setAttribute("failed", "Failed to register user");
//        }
//
//        RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
//        rd.forward(request, response);
    }

}
