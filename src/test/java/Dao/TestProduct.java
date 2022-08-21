
package Dao;

import Model.ProductModel;
import java.util.List;
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
public class TestProduct {
    
  
    /**
     * Test of additems method, of class ProductDao.
     */
    @Test
    public void testAdditems() {
        System.out.println("additems");
        String productname = "";
        String cpu = "";
        String processor = "";
        String graphics = "";
        String display = "";
        String connections = "";
        String memory = "";
        String storage = "";
        String power = "";
        String weight = "";
        String image = "";
        String category = "";
        String price = "";
        ProductDao instance = new ProductDao();
        int expResult = 0;
        int result = instance.additems(productname, cpu, processor, graphics, display, connections, memory, storage, power, weight, image, category, price);
        assertEquals(expResult, result);
       
    }

    /**
     * Test of getAllItems method, of class ProductDao.
     */
    @Test
    public void testGetAllItems() {
        System.out.println("getAllItems");
        ProductDao instance = new ProductDao();
        List<ProductModel> expResult = null;
        List<ProductModel> result = instance.getAllItems();
        assertEquals(expResult, result);
        
    }

    /**
     * Test of getItemsByCategory method, of class ProductDao.
     */
    @Test
    public void testGetItemsByCategory() {
        System.out.println("getItemsByCategory");
        String category = "";
        ProductDao instance = new ProductDao();
        List<ProductModel> expResult = null;
        List<ProductModel> result = instance.getItemsByCategory(category);
        assertEquals(expResult, result);
        
    }

    /**
     * Test of deleteItem method, of class ProductDao.
     */
    @Test
    public void testDeleteItem() {
        System.out.println("deleteItem");
        int id = 0;
        ProductDao instance = new ProductDao();
        int expResult = 0;
        int result = instance.deleteItem(id);
        assertEquals(expResult, result);
        
    }

    /**
     * Test of getSingleItem method, of class ProductDao.
     */
    @Test
    public void testGetSingleItem() {
        System.out.println("getSingleItem");
        int id = 0;
        ProductDao instance = new ProductDao();
        ProductModel expResult = null;
        ProductModel result = instance.getSingleItem(id);
        assertEquals(expResult, result);
        
    }

    /**
     * Test of updateItem method, of class ProductDao.
     */
    @Test
    public void testUpdateItem() {
        System.out.println("updateItem");
        String productname = "";
        String cpu = "";
        String processor = "";
        String graphics = "";
        String display = "";
        String connections = "";
        String memory = "";
        String storage = "";
        String power = "";
        String weight = "";
        String category = "";
        String price = "";
        String id = "";
        ProductDao instance = new ProductDao();
        int expResult = 1;
        int result = instance.updateItem(productname, cpu, processor, graphics, display, connections, memory, storage, power, weight, category, price, id);
        assertEquals(expResult, result);
        
    }
    
}
