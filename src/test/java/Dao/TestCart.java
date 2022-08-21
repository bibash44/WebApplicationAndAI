
package Dao;

import Model.CartProductModel;
import Model.CartProductUserModel;
import java.util.List;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Bibash kattel
 */
public class TestCart {
    
    

    /**
     * Test of addToCart method, of class CartDao.
     */
    @Test
    public void testAddToCart() {
        System.out.println("addToCart");
        String productid = "";
        String userid = "";
        String quantity = "";
        CartDao instance = new CartDao();
        int expResult = 0;
        int result = instance.addToCart(productid, userid, quantity);
        assertEquals(expResult, result);
      
    }

    
    @Test
    public void testGetLoggedInUserCartDetails() {
        System.out.println("getLoggedInUserCartDetails");
        String userid = "";
        CartDao instance = new CartDao();
        List<CartProductModel> expResult = null;
        List<CartProductModel> result = instance.getLoggedInUserCartDetails(userid);
        assertEquals(expResult, result);
        
    }

    /**
     * Test of getLoggedInUserOrderDetails method, of class CartDao.
     */
    @Test
    public void testGetLoggedInUserOrderDetails() {
        System.out.println("getLoggedInUserOrderDetails");
        String userid = "";
        CartDao instance = new CartDao();
        List<CartProductModel> expResult = null;
        List<CartProductModel> result = instance.getLoggedInUserOrderDetails(userid);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of removeFromCart method, of class CartDao.
     */
    @Test
    public void testRemoveFromCart() {
        System.out.println("removeFromCart");
        String id = "";
        CartDao instance = new CartDao();
        int expResult = 0;
        int result = instance.removeFromCart(id);
        assertEquals(expResult, result);
       
    }

    /**
     * Test of placeOrder method, of class CartDao.
     */
    @Test
    public void testPlaceOrder() {
        System.out.println("placeOrder");
        String userid = "";
        CartDao instance = new CartDao();
        int expResult = 0;
        int result = instance.placeOrder(userid);
        assertEquals(expResult, result);
       
    }

    /**
     * Test of getAllOrdersDetails method, of class CartDao.
     */
    @Test
    public void testGetAllOrdersDetails() {
        System.out.println("getAllOrdersDetails");
        CartDao instance = new CartDao();
        List<CartProductUserModel> expResult = null;
        List<CartProductUserModel> result = instance.getAllOrdersDetails();
        assertEquals(expResult, result);
       
    }
    
}
