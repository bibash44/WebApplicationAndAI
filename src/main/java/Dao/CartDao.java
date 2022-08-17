/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Database.DBConnection;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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

    public int addToCart(String productid, String userid, String quantity) {

        try {
            connection = dBConnection.getCOnnectedToDatabase();
            Statement statement = connection.createStatement();
            
           

            String select = "SELECT * FROM " + table
                    + " WHERE productid='" + productid
                    + "' AND userid='" + userid + "'";

            String insert = "INSERT INTO " + table + "(id, productid, userid, quantity)"
                    + " values(NULL, '" + productid + "', '" + userid + "', '" + quantity + "')";

            String update = "UPDATE " + table + " set quantity=quantity+"+quantity
                    + " WHERE productid='" + productid
                    + "' AND userid='" + userid + "'";

            ResultSet productExist = statement.executeQuery(select);

            if (productExist.next()) {
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

}
