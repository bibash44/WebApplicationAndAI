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
        String productname = "HP pavillion";
        String cpu = "Intel Core i7-10300H 2.50 GHz Turbo up to 4.5GHz";
        String processor = "8-Core (quad-core)";
        String graphics = "NVIDIA GeForce RTX 3060 with 6GB GDDR6";
        String display = "14-inch IPS display; Full-HD (1920 x 1080 pixels) resolution; 144Hz refresh rate";
        String connections = "LAN USB-C 3.2 Gen 2 HDMI USB 3.0 (with power off charging) 3 x USB 3.0 Headphone/microphone combo jack";
        String memory = "8GB DDR4-3200MHz";
        String storage = "1TB SSD";
        String power = "140 watt";
        String weight = "1";
        String image = "9511600_R_Z001A.jpg";
        String category = "laptop";
        String price = "699";
        ProductDao instance = new ProductDao();
        int expResult = 1;
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
         List<ProductModel> productModels = instance.getAllItems();
        List<ProductModel> expResult = productModels;
        List<ProductModel> result = productModels;
        assertEquals(expResult, result);

    }

    /**
     * Test of getItemsByCategory method, of class ProductDao.
     */
    @Test
    public void testGetItemsByCategory() {
        System.out.println("getItemsByCategory");
        String category = "laptop";
        ProductDao instance = new ProductDao();
        List<ProductModel> productModels = instance.getItemsByCategory(category);
        List<ProductModel> expResult = productModels;
        List<ProductModel> result = productModels;
        assertEquals(expResult, result);

    }

    /**
     * Test of deleteItem method, of class ProductDao.
     */
    @Test
    public void testDeleteItem() {
        System.out.println("deleteItem");
        int id = 4;
        ProductDao instance = new ProductDao();
        int expResult = 1;
        int result = instance.deleteItem(id);
        assertEquals(expResult, result);

    }

    /**
     * Test of getSingleItem method, of class ProductDao.
     */
    @Test
    public void testGetSingleItem() {
        System.out.println("getSingleItem");
        int id = 2;
        ProductDao instance = new ProductDao();
         ProductModel productModel = instance.getSingleItem(id);
        ProductModel expResult = productModel;
        ProductModel result = productModel;
        assertEquals(expResult, result);

    }

    /**
     * Test of updateItem method, of class ProductDao.
     */
    @Test
    public void testUpdateItem() {
        System.out.println("updateItem");

        System.out.println("additems");
        String productname = "HP pavillion";
        String cpu = "Intel Core i7-10300H 2.50 GHz Turbo up to 4.5GHz";
        String processor = "8-Core (quad-core)";
        String graphics = "NVIDIA GeForce RTX 3060 with 6GB GDDR6";
        String display = "14-inch IPS display; Full-HD (1920 x 1080 pixels) resolution; 144Hz refresh rate";
        String connections = "LAN USB-C 3.2 Gen 2 HDMI USB 3.0 (with power off charging) 3 x USB 3.0 Headphone/microphone combo jack";
        String memory = "8GB DDR4-3200MHz";
        String storage = "1TB SSD";
        String power = "140 watt";
        String weight = "1";
        String category = "laptop";
        String price = "699";
        String id = "3";
        ProductDao instance = new ProductDao();
        int expResult = 1;
        int result = instance.updateItem(productname, cpu, processor, graphics, display, connections, memory, storage, power, weight, category, price, id);
        assertEquals(expResult, result);

    }

}
