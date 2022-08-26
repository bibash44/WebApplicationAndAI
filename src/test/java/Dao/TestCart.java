
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
        String productid = "2";
        String userid = "2";
        String quantity = "1";
        CartDao instance = new CartDao();
        int expResult = 1;
        int result = instance.addToCart(productid, userid, quantity);
        assertEquals(expResult, result);
      
    }

    @Test
    public void testGetLoggedInUserCartDetails() {
        System.out.println("getLoggedInUserCartDetails");
        String userid = "2";
        CartDao instance = new CartDao();
        List<CartProductModel> cartProductModels = instance.getLoggedInUserCartDetails(userid);
        List<CartProductModel> expResult = cartProductModels;
        List<CartProductModel> result = cartProductModels;
        assertEquals(expResult, result);
        
    }

    /**
     * Test of getLoggedInUserOrderDetails method, of class CartDao.
     */
    @Test
    public void testGetLoggedInUserOrderDetails() {
        System.out.println("getLoggedInUserOrderDetails");
        String userid = "1";
        CartDao instance = new CartDao();
        List<CartProductModel> expResult = instance.getLoggedInUserOrderDetails(userid);
        List<CartProductModel> result = instance.getLoggedInUserOrderDetails(userid);
        assertEquals(expResult, result);
       
    }

    /**
     * Test of removeFromCart method, of class CartDao.
     */
    @Test
    public void testRemoveFromCart() {
        System.out.println("removeFromCart");
        String id = "12";
        CartDao instance = new CartDao();
        int expResult = 1;
        int result = instance.removeFromCart(id);
        assertEquals(expResult, result);
       
    }

    /**
     * Test of placeOrder method, of class CartDao.
     */
    @Test
    public void testPlaceOrder() {
        System.out.println("placeOrder");
        String userid = "2";
        CartDao instance = new CartDao();
        int expResult = instance.placeOrder(userid);
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
        List<CartProductUserModel> cartProductUserModels = instance.getAllOrdersDetails();
        List<CartProductUserModel> expResult = cartProductUserModels;
        List<CartProductUserModel> result = cartProductUserModels;
        assertEquals(expResult, result);
       
    }
    
}
