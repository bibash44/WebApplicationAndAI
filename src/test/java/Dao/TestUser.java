/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package Dao;

import Model.userModel;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Bibash kattel
 */
public class TestUser {
    
   

    /**
     * Test of registerUser method, of class UserDao.
     */
    @Test
    public void testRegisterUser() {
        System.out.println("registerUser");
        String fname = "Bibash";
        String lname = "Kattel";
        String email = "testbibash@gmail.com";
        String phonenumber = "045632487";
        String streetaddress = "Sandy Lane";
        String housenumber = "17";
        String city = "Coventry";
        String postcode = "cv1";
        String password = "1234";
        UserDao instance = new UserDao();
        int expResult = 1;
        int result = instance.registerUser(fname, lname, email, phonenumber, streetaddress, housenumber, city, postcode, password);
        assertEquals(expResult, result);
        
    }

    /**
     * Test of loginUser method, of class UserDao.
     */
    @Test
    public void testLoginUser() {
        System.out.println("loginUser");
        String email = "bibashkatel4@gmail.com";
        String password = "1234";
        UserDao instance = new UserDao();
        userModel expResult = instance.loginUser(email, password);;
        userModel result = instance.loginUser(email, password);
        assertEquals(expResult, result);
       
    }
    
}
