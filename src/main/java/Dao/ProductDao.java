/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Database.DBConnection;
import Model.ProductModel;
import Model.userModel;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
public class ProductDao {

    private final String table = "product";

    public int additems(String productname, String cpu, String processor, String graphics, String display,
            String connections, String memory, String storage, String power, String weight, String image,
            String category, String price) {

        DBConnection dBConnection = new DBConnection();
        Connection connection;

        try {
            connection = dBConnection.getCOnnectedToDatabase();
            Statement statement = connection.createStatement();

            String sql = "INSERT INTO " + table
                    + "(id, productname, cpu, processor, graphics, display, connections, memory, storage, power, weight, image, category, price)"
                    + " values(NULL, '" + productname + "', '" + cpu + "', '" + processor + "', '" + graphics + "' , '"
                    + display + "', '"
                    + connections + "', '" + memory + "', '" + storage + "', '" + power + "', '" + weight + "', '"
                    + image + "', '" + category + "', '" + price + "')";
            statement.executeUpdate(sql);
            System.err.println(sql);

            return 1;
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
            System.err.print(ex);
            return 0;
        }

    }

    public List<ProductModel> getAllItems() {
        DBConnection dBConnection = new DBConnection();
        Connection connection;
        List<ProductModel> productModels = new ArrayList<>();
        try {

            connection = dBConnection.getCOnnectedToDatabase();
            String sql = "SELECT * FROM product";
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {

                productModels.add(new ProductModel(
                        resultSet.getInt("id"),
                        resultSet.getString("productname"),
                        resultSet.getString("cpu"),
                        resultSet.getString("processor"),
                        resultSet.getString("graphics"),
                        resultSet.getString("display"),
                        resultSet.getString("connections"),
                        resultSet.getString("memory"),
                        resultSet.getString("storage"),
                        resultSet.getString("power"),
                        resultSet.getInt("weight"),
                        resultSet.getString("image"),
                        resultSet.getString("category"),
                        resultSet.getString("price")
                ));
            }
        } catch (SQLException ex) {
            System.err.print(ex);
        }
        return productModels;
    }

    public List<ProductModel> getItemsByCategory(String category) {
        DBConnection dBConnection = new DBConnection();
        Connection connection;
        List<ProductModel> productModels = new ArrayList<>();
        try {

            connection = dBConnection.getCOnnectedToDatabase();
            String sql = "SELECT * FROM product WHERE category='" + category + "'";
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {

                productModels.add(new ProductModel(
                        resultSet.getInt("id"),
                        resultSet.getString("productname"),
                        resultSet.getString("cpu"),
                        resultSet.getString("processor"),
                        resultSet.getString("graphics"),
                        resultSet.getString("display"),
                        resultSet.getString("connections"),
                        resultSet.getString("memory"),
                        resultSet.getString("storage"),
                        resultSet.getString("power"),
                        resultSet.getInt("weight"),
                        resultSet.getString("image"),
                        resultSet.getString("category"),
                        resultSet.getString("price")));
            }
        } catch (SQLException ex) {
            System.err.print(ex);
        }
        return productModels;
    }

    public int deleteItem(int id) {
        DBConnection dBConnection = new DBConnection();
        Connection connection;

        try {
            connection = dBConnection.getCOnnectedToDatabase();
            Statement statement = connection.createStatement();

            String sql = "DELETE FROM product WHERE id='" + id + "'";
            statement.executeUpdate(sql);
            System.err.println(sql);

            return 1;
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
            System.err.print(ex);
            return 0;
        }
    }

    public ProductModel getSingleItem(int id) {
        DBConnection dBConnection = new DBConnection();
        Connection connection;
        try {
            connection = dBConnection.getCOnnectedToDatabase();
            Statement statement = connection.createStatement();

            String sql = "SELECT * FROM " + table + " WHERE id= '" + id + "'";
            System.err.println(sql);

            ResultSet resultSet = statement.executeQuery(sql);
            ProductModel model = null;
            if (resultSet.next()) {
                model = new ProductModel(
                        resultSet.getInt("id"),
                        resultSet.getString("productname"),
                        resultSet.getString("cpu"),
                        resultSet.getString("processor"),
                        resultSet.getString("graphics"),
                        resultSet.getString("display"),
                        resultSet.getString("connections"),
                        resultSet.getString("memory"),
                        resultSet.getString("storage"),
                        resultSet.getString("power"),
                        resultSet.getInt("weight"),
                        resultSet.getString("image"),
                        resultSet.getString("category"),
                        resultSet.getString("price"));
            }

            return model;
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
            System.err.print(ex);

        }
        return null;

    }

    public int updateItem(String productname, String cpu, String processor, String graphics, String display,
            String connections, String memory, String storage, String power, String weight, String category, String price, String id) {
        DBConnection dBConnection = new DBConnection();
        Connection connection;

        try {
            connection = dBConnection.getCOnnectedToDatabase();
            Statement statement = connection.createStatement();

            String sql = "UPDATE " + table + " SET productname='" + productname + "', cpu='" + cpu + "', processor='"
                    + processor + "',  graphics='" + graphics + "', display='" + display + "', connections='"
                    + connections + "', memory='" + memory + "' , storage='" + storage + "', power='" + power + "',weight='" + weight
                    + "',category='" + category + "' ,price='" + price + "' WHERE id='" + id + "'";

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
