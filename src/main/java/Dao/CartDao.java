/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Database.DBConnection;
import Model.CartProductModel;
import Model.CartProductUserModel;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Bibash kattel
 */
public class CartDao {

    private final DBConnection dBConnection = new DBConnection();
    private Connection connection;
    private final String table = "cart";
    private final String table2 = "product";
    private final String table3 = "user";

    public int addToCart(String productid, String userid, String quantity) {

        try {
            connection = dBConnection.getCOnnectedToDatabase();
            Statement statement = connection.createStatement();

            String select = "SELECT * FROM " + table
                    + " WHERE productid='" + productid
                    + "' AND userid='" + userid + "'";

            String insert = "INSERT INTO " + table + "(id, productid, userid, quantity)"
                    + " values(NULL, '" + productid + "', '" + userid + "', '" + quantity + "')";

            String update = "UPDATE " + table + " set quantity=quantity+" + quantity
                    + " WHERE productid='" + productid
                    + "' AND userid='" + userid + "'";

            ResultSet productExist = statement.executeQuery(select);

            if (productExist.next() && productExist.getString("ordered").equals("false")) {
                statement.executeUpdate(update);
            } else {
                statement.executeUpdate(insert);
            }

            return 1;
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
            System.err.print(ex);
            return 0;
        }
    }

    public List<CartProductModel> getLoggedInUserCartDetails(String userid) {

        List<CartProductModel> cartProductModels = new ArrayList<>();
        try {
            connection = dBConnection.getCOnnectedToDatabase();
            Statement statement = connection.createStatement();
            String select = "SELECT C.id, C.productid, C.userid,C.quantity, "
                    + " P.productname, P.image, P.price  FROM " + table2
                    + " P INNER JOIN " + table + " C"
                    + " ON C.productid=P.id "
                    + " WHERE C.ordered='false' AND  C.userid='" + userid + "'";

            ResultSet productExist = statement.executeQuery(select);
            System.out.println(select);
            while (productExist.next()) {

                cartProductModels.add(new CartProductModel(
                        productExist.getString("id"),
                        productExist.getString("productid"),
                        productExist.getString("userid"),
                        productExist.getString("productname"),
                        productExist.getString("image"),
                        productExist.getString("price"),
                        productExist.getString("quantity")
                ));

                System.out.println("CARTID :" + productExist.getString("id"));
                System.out.println("IMAGE :" + productExist.getString("image"));
                System.out.println("PRICE :" + productExist.getString("price"));
                System.out.println("QUANTITY :" + productExist.getString("quantity"));
            }

            return cartProductModels;
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
            System.err.print(ex);
            return cartProductModels;
        }
    }

    public List<CartProductModel> getLoggedInUserOrderDetails(String userid) {

        List<CartProductModel> cartProductModels = new ArrayList<>();
        try {
            connection = dBConnection.getCOnnectedToDatabase();
            Statement statement = connection.createStatement();
            String select = "SELECT C.id, C.productid, C.userid,C.quantity, "
                    + " P.productname, P.image, P.price  FROM " + table2
                    + " P INNER JOIN " + table + " C"
                    + " ON C.productid=P.id "
                    + " WHERE C.ordered='true' AND  C.userid='" + userid + "'";

            ResultSet productExist = statement.executeQuery(select);
            System.out.println(select);
            while (productExist.next()) {

                cartProductModels.add(new CartProductModel(
                        productExist.getString("id"),
                        productExist.getString("productid"),
                        productExist.getString("userid"),
                        productExist.getString("productname"),
                        productExist.getString("image"),
                        productExist.getString("price"),
                        productExist.getString("quantity")
                ));

                System.out.println("CARTID :" + productExist.getString("id"));
                System.out.println("IMAGE :" + productExist.getString("image"));
                System.out.println("PRICE :" + productExist.getString("price"));
                System.out.println("QUANTITY :" + productExist.getString("quantity"));
            }

            return cartProductModels;
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
            System.err.print(ex);
            return cartProductModels;
        }
    }

    public int removeFromCart(String id) {
        DBConnection dBConnection = new DBConnection();
        Connection connection;

        try {
            connection = dBConnection.getCOnnectedToDatabase();
            Statement statement = connection.createStatement();

            String sql = "DELETE FROM " + table + " WHERE id='" + id + "'";
            statement.executeUpdate(sql);
            System.err.println(sql);

            return 1;
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
            System.err.print(ex);
            return 0;
        }
    }

    public int placeOrder(String userid) {
        try {
            connection = dBConnection.getCOnnectedToDatabase();
            Statement statement = connection.createStatement();

            String update = "UPDATE " + table + " set ordered='true'"
                    + " WHERE userid='" + userid + "'";
            statement.executeUpdate(update);

            return 1;
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
            System.err.print(ex);
            return 0;
        }
    }

    public List<CartProductUserModel> getAllOrdersDetails() {

        List<CartProductUserModel> cartProductUserModels = new ArrayList<>();
        try {
            connection = dBConnection.getCOnnectedToDatabase();
            Statement statement = connection.createStatement();
            String select = "SELECT C.id, C.productid, C.userid, C.quantity, "
                    + " P.productname, P.image, P.price, "
                    + " U.fname, U.lname, U.email, U.phonenumber, U.streetaddress, U.housenumber, U.city, U.postcode "
                    + "  FROM " + table
                    + " C LEFT JOIN " + table2 + " P"
                    + " ON C.productid=P.id "
                    + " LEFT JOIN  " + table3 + " U"
                    + " ON C.userid= U.id "
                    + "WHERE C.ordered='true'";

            ResultSet productExist = statement.executeQuery(select);
            System.out.println(select);
            while (productExist.next()) {

                cartProductUserModels.add(new CartProductUserModel(
                        productExist.getString("id"),
                         productExist.getString("productid"),
                         productExist.getString("userid"),
                         productExist.getString("quantity"),
                         productExist.getString("productname"),
                         productExist.getString("image"),
                         productExist.getString("price"),
                         productExist.getString("fname"),
                         productExist.getString("lname"),
                         productExist.getString("email"),
                         productExist.getString("phonenumber"),
                         productExist.getString("streetaddress"),
                         productExist.getString("housenumber"),
                         productExist.getString("city"),
                         productExist.getString("postcode")
                        ));
                        
                        
                System.out.println("CARTID :" + productExist.getString("id"));
                System.out.println("IMAGE :" + productExist.getString("image"));
                System.out.println("PRICE :" + productExist.getString("price"));
                System.out.println("QUANTITY :" + productExist.getString("quantity"));
                System.out.println("FNAME :" + productExist.getString("fname"));
                System.out.println("FNAME :" + productExist.getString("productname"));
            }

            return cartProductUserModels;
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
            System.err.print(ex);
            return cartProductUserModels;
        }
    }
}
