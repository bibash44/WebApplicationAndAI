package servlet;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import Dao.UserDao;
import Model.userModel;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import javax.servlet.RequestDispatcher;

/**
 *
 * @author Bibash kattel
 */
@WebServlet(name = "login", urlPatterns = {"/login"})
public class login extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        UserDao userDao = new UserDao();

        String email = request.getParameter("email").toLowerCase();
        String password = request.getParameter("password");

        userModel loggedInUser = userDao.loginUser(email, password);
        PrintWriter printWriter = response.getWriter();

        HttpSession session = request.getSession();

        HashMap<String, String> loggedInuserDetails = new HashMap<>();

        if (loggedInUser == null) {
//            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
//            dispatcher.forward(request, response);
            printWriter.write("0,Login failed, ");
        } else {
            loggedInuserDetails.put("id", String.valueOf(loggedInUser.getId()));
            loggedInuserDetails.put("fname", loggedInUser.getFname());
            loggedInuserDetails.put("lname", loggedInUser.getLname());
            loggedInuserDetails.put("email", loggedInUser.getEmail());
            loggedInuserDetails.put("phonenumber", loggedInUser.getPhonenumber());
            loggedInuserDetails.put("streetaddress", loggedInUser.getStreetaddress());
            loggedInuserDetails.put("housenumber", String.valueOf(loggedInUser.getHousenumber()));
            loggedInuserDetails.put("city", loggedInUser.getCity());
            loggedInuserDetails.put("postcode", loggedInUser.getPostcode());
            loggedInuserDetails.put("usertype", loggedInUser.getUsertype());

            session.setAttribute("userdetails", loggedInuserDetails);
            printWriter.write("1,Login success," + loggedInUser.getUsertype());

//            RequestDispatcher dispatcher = request.getRequestDispatcher("userprofile.jsp");
//            dispatcher.forward(request, response);
        }
    }

}
