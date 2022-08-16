/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Database.DBConnection;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Bibash kattel
 */
public class ProductDao {

    private final DBConnection dBConnection = new DBConnection();
    private Connection connection;
    private final String table = "product";

    public int additems(String productname, String cpu, String proceessor, String graphics, String display, String connections, String memory, String storage, String power, String weight, String image, String category) {
        try {
            connection = dBConnection.getCOnnectedToDatabase();
            Statement statement = connection.createStatement();

            String sql = "INSERT INTO " + table + "(id, productname, cpu, proceessor, graphics, display, connections, memory, storage, power, weight, image, category)"
                    + " values(NULL, '" + productname + "', '" + cpu + "', '" + proceessor + "', '" + graphics + "' , '" + display + "', '"
                    + connections + "', '" + memory + "', '" + storage + "', '" + power + "', '" + weight + "', '" + image + "', '" + category + "')";
            statement.executeUpdate(sql);
            System.err.println(sql);

            return 1;
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
            System.err.print(ex);
            return 0;
        }

    }

}
