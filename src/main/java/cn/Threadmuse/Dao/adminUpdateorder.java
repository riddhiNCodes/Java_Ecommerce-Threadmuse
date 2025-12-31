package cn.Threadmuse.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;


public class adminUpdateorder{
	
	private Connection conn;

    public adminUpdateorder(Connection conn) {
        this.conn = conn;
    }

	  //admin update status
    public boolean updateOrderStatus(int orderId, String status) {
        boolean result = false;
        try {
            String sql = "UPDATE orders SET status=? WHERE order_id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, status);
            ps.setInt(2, orderId);

            int row = ps.executeUpdate();
            if (row > 0) {
                result = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
    
    
        	
    }
    
    



