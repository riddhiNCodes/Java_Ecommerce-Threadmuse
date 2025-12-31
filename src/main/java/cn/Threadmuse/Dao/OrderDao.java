package cn.Threadmuse.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.ArrayList;

import cn.Threadmuse.Model.Cart;
import cn.Threadmuse.Model.UserModel;
import cn.Threadmuse.Model.order;

public class OrderDao {
	private Connection conn;

    public OrderDao(Connection conn) {
        this.conn = conn;
    }

    // INSERT ORDER AND RETURN GENERATED ORDER ID
    public int createOrder(order order) {
        int orderId = -1;

        String sql = "INSERT INTO orders(user_id, total_amount, name, phone, address, payment_mode, status, created_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            PreparedStatement ps = conn.prepareStatement(sql,PreparedStatement.RETURN_GENERATED_KEYS);
            ps.setInt(1, order.getUserId());
            ps.setInt(2, order.getTotalAmount());
            ps.setString(3, order.getName());
            ps.setString(4, order.getPhone());
            ps.setString(5, order.getAddress());
            ps.setString(6, order.getPaymentMode());
            ps.setString(7, order.getStatus());
            ps.setString(8, order.getCreatedAt());
            

            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                orderId = rs.getInt(1);   // return the last inserted order id
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return orderId;
    }
 
    //fetch all orders  for admin
    
    public List<order> getAllOrders() {
        List<order> list = new ArrayList<>();

        String sql = "SELECT * FROM orders ORDER BY order_id DESC";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                order o = new order();
                o.setOrderId(rs.getInt("order_id"));
                o.setUserId(rs.getInt("user_id"));
                o.setTotalAmount(rs.getInt("total_amount"));
                o.setName(rs.getString("name"));;
                o.setPhone(rs.getString("phone"));
                o.setAddress(rs.getString("address"));
                o.setPaymentMode(rs.getString("payment_mode"));
                o.setStatus(rs.getString("status"));
                o.setCreatedAt(rs.getString("created_at"));
                

                list.add(o);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // GET ORDER BY USER ID → For My Orders Page
  
    public List<order> getOrdersByUser(int userId) {
        List<order> list = new ArrayList<>();

        String sql = "SELECT * FROM orders WHERE user_id = ? ORDER BY order_id DESC";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                order o = new order();
                
                o.setOrderId(rs.getInt("order_id"));
                o.setUserId(rs.getInt("user_id"));
                o.setTotalAmount(rs.getInt("total_amount"));
                o.setName(rs.getString("name"));;
                o.setPhone(rs.getString("phone"));
                o.setAddress(rs.getString("address"));
                o.setPaymentMode(rs.getString("payment_mode"));
                o.setStatus(rs.getString("status"));
                o.setCreatedAt(rs.getString("created_at"));
              
                list.add(o);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    
    // GET  ORDER items BY ORDER ID
    public List<Cart> getItemsByOrderId(int orderId) {
        List<Cart> list = new ArrayList<>();

        String sql = "SELECT * FROM order_items WHERE order_id = ?";

        try {
        	PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, orderId);

         ResultSet rs = ps.executeQuery();

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
    
 // GET SINGLE ORDER BY ORDER ID
    public order getOrderById(int orderId) {
        order o = null;

        String sql = "SELECT * FROM orders WHERE order_id = ?";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, orderId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                o = new order();
                o.setOrderId(rs.getInt("order_id"));
                o.setUserId(rs.getInt("user_id"));
                o.setTotalAmount(rs.getInt("total_amount"));
                o.setName(rs.getString("name"));
                o.setPhone(rs.getString("phone"));
                o.setAddress(rs.getString("address"));
                o.setPaymentMode(rs.getString("payment_mode"));
                o.setStatus(rs.getString("status"));
                o.setCreatedAt(rs.getString("created_at"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return o;
    }
    
  //get user by id
    public List<order> getOrdersWithProducts(int userId) {

        List<order> list = new ArrayList<>();

        try {
            String sql = "SELECT o.order_id, o.user_id, o.created_at, o.total_amount, " +
                         "o.payment_mode, o.status, oi.product_name, oi.image " +
                         "FROM orders o " +
                         "JOIN order_items oi ON o.order_id = oi.order_id " +
                         "WHERE o.user_id = ? " +
                         "ORDER BY o.order_id DESC";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                order o = new order();

                o.setOrderId(rs.getInt("order_id"));
                o.setUserId(rs.getInt("user_id"));
                o.setCreatedAt(rs.getString("created_at"));
                o.setTotalAmount(rs.getInt("total_amount"));
                o.setPaymentMode(rs.getString("payment_mode"));
                o.setStatus(rs.getString("status"));

                // product details
                o.setProductName(rs.getString("product_name"));
                o.setProductImage(rs.getString("image"));

                list.add(o);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

}