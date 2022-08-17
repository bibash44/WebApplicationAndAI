/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Database;

/**
 *
 * @author Bibash kattel
 */
import java.sql.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBConnection {
    
////    Defining variable for database connectioin
    private Connection con;
//    private final String conStrng = "jdbc:mysql://localhost/";
//    private final String database = "webapi";
//    private final String username = "root";
//    private final String password = "";
//    
    // Initialize all the information regarding
        // Database Connection
        String dbURL = "jdbc:mysql://localhost:3306/";
        // Database name to access
        String dbName = "webapi";
        String dbUsername = "root";
        String dbPassword = "";

//    Returning connection variable of database
    public Connection getCOnnectedToDatabase() throws SQLException {

        try {
            
//            con = DriverManager.getConnection(conStrng+database, username, password);
        Class.forName("com.mysql.cj.jdbc.Driver");
         con = DriverManager.getConnection(dbURL + dbName,
                                                     dbUsername, 
                                                     dbPassword);
         return con;
        } catch (SQLException e) {
            System.out.println(e);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (con == null) {
                con.close();
            }
        }

        return con;

    }

}
