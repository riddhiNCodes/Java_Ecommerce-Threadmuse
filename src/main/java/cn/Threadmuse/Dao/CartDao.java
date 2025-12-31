package cn.Threadmuse.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;
import cn.Threadmuse.Model.Cart;


public class CartDao {

	
	private Connection conn;
    private PreparedStatement ps;
   private ResultSet rs;
    
    public CartDao(Connection conn) {
        this.conn = conn;
    }

    public int addOrderItem(Cart item) {
        int result = 0;

        String sql = "INSERT INTO order_items(order_id, product_id, product_name, category, size, price, quantity, subtotal, image) VALUES (?,?,?,?,?,?,?,?,?)";

        try {
            ps = conn.prepareStatement(sql);

            ps.setInt(1, item.getOrderId());
            ps.setInt(2, item.getId());
            ps.setString(3, item.getName());
            ps.setString(4, item.getCategory());
            ps.setString(5, item.getSize());
            ps.setInt(6, item.getPrice());
            ps.setInt(7, item.getQuantity());
            ps.setDouble(8, item.getTotal());
            ps.setString(9, item.getImage());

            result = ps.executeUpdate();

            if (result > 0) {
                System.out.println("ORDER ITEM INSERTED → Product: " + item.getName());
            }

        } catch (Exception ex) {
            System.out.println("#########################################");
            System.out.println("ORDER ITEM INSERT FAILED!");
            System.out.println("SQL ERROR MESSAGE:");
            ex.printStackTrace();
            System.out.println("#########################################");
        }

        return result;
    }

    
    public List<Cart> getItemsByOrderId(int orderId) {
        List<Cart> list = new ArrayList<>();

        String sql = "SELECT * FROM order_items WHERE order_id = ?";

        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, orderId);

             rs = ps.executeQuery();

            while (rs.next()) {
                Cart item = new Cart();
                
                item.setOrderId(rs.getInt("item_id"));
                item.setUserid(rs.getInt("order_id"));
                item.setId(rs.getInt("product_id"));
                item.setName(rs.getString("product_name"));
                item.setCategory(rs.getString("category"));
                item.setSize(rs.getString("size"));
                item.setPrice(rs.getInt("price"));
                item.setQuantity(rs.getInt("quantity"));
                item.setSubtotal(rs.getDouble("subtotal"));
                item.setImage(rs.getString("image"));
                
            list.add(item);
            }
       }
        catch(Exception e) {e.printStackTrace();} 
       return list;
    }

	public void addOrderItem(int userId, int i) {
		// TODO Auto-generated method stub
		
	}
}