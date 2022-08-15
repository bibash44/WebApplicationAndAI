/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Database.DBConnection;
import com.mysql.cj.xdevapi.PreparableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Bibash kattel
 */
public class UserDao {
    
    private final DBConnection dBConnection = new DBConnection();
    private Connection connection;
    private final String table = "user";
    
    public boolean registerUser(String fname, String lname, String email, String phonenumber, String streetaddress, String housenumber, String city, String postcode, String password){
        try {
            connection= dBConnection.getCOnnectedToDatabase();
            Statement statement= connection.createStatement();
            String insertSQL = "INSERT INTO USER (fname, lname, email, phonenumber,  streetaddress, housenumber, city, postcode, password) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            
            
            String sql = "INSERT INTO " + table + "(id, fname, lname, email, phonenumber, streetaddress, housenumber, city, postcode, password)"
                    + " values(NULL, '" + fname + "', '" + lname + "', '" + email + "', '" + phonenumber + "' , '" + streetaddress + "', '"
                    + housenumber + "', '" + city + "', '"  + postcode + "', '" + password + "')";
            statement.executeUpdate(sql);
            System.err.println(sql);
            
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
             System.err.print(ex);
            return false;
        }
        
    }   
}
