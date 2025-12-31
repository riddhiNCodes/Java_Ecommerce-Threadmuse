package cn.Threadmuse.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import cn.Threadmuse.Model.Product;

public class AdminProductDao {

	private Connection conn;
	private String query;
	private PreparedStatement pst;

	public AdminProductDao(Connection conn) {

		this.conn = conn;
	}

	public int insertProduct(Product product) {
		int rowInserted = 0;

		try {
			query = "INSERT INTO products(name,descript,category,sub_category,gender,price,discount,sizes,colors,image) "
					+ "VALUES (?,?,?,?,?,?,?,?,?,?)";

			pst = this.conn.prepareStatement(query);

			pst.setString(1, product.getName());
			pst.setString(2, product.getDescript());
			pst.setString(3, product.getCategory());
			pst.setString(4, product.getSub_category());
			pst.setString(5, product.getGender());
			pst.setInt(6, product.getPrice());
			pst.setString(7, product.getDiscount());
			pst.setString(8, product.getSizes());
			pst.setString(9, product.getColors());
			pst.setString(10, product.getImage());

			rowInserted = pst.executeUpdate();

			if (rowInserted > 0) {
				System.out.println("Data inserted successfully");
			}

		} catch (Exception ex) {
			ex.getMessage();
		}

		return rowInserted;
	}

	public List<Product> getAllproducts() {
		List<Product> products = new ArrayList<Product>();
		try {
			query = "SELECT * FROM products ";
			pst = this.conn.prepareStatement(query);

			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				Product row = new Product();
				row.setId(rs.getInt("id"));
				row.setName(rs.getString("name"));
				row.setDescript(rs.getString("descript"));
				row.setSub_category(rs.getString("sub_category"));
				row.setCategory(rs.getString("category"));
				row.setGender(rs.getString("gender"));
				row.setPrice(rs.getInt("price"));
				row.setDiscount(rs.getString("discount"));
				row.setSizes(rs.getString("sizes"));
				row.setColors(rs.getString("colors"));
				row.setImage(rs.getString("image"));
				products.add(row);
			}
		}

		catch (Exception e) {
			e.printStackTrace();
		}
		return products;
	}
	
	
	public boolean removeProduct(int id) {

	    boolean status = false;

	    try {
	        String query = "DELETE FROM products WHERE id = ?";
	        PreparedStatement pst = conn.prepareStatement(query);
	        pst.setInt(1, id);

	        int rows = pst.executeUpdate();

	        if (rows > 0) {
	            status = true;
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return status;
	}
 

	public boolean updateProduct(Product p) {

	    boolean status = false;

	    try {
	        String sql = "UPDATE products SET name=?, descript=?, category=?, sub_category=?, gender=?, price=?, discount=?, sizes=?, colors=?, image=? WHERE id=?";

	        PreparedStatement ps = conn.prepareStatement(sql);

	        ps.setString(1, p.getName());
	        ps.setString(2, p.getDescript());
	        ps.setString(3, p.getCategory());
	        ps.setString(4, p.getSub_category());
	        ps.setString(5, p.getGender());
	        ps.setInt(6, p.getPrice());
	        ps.setString(7, p.getDiscount());
	        ps.setString(8, p.getSizes());
	        ps.setString(9, p.getColors());
	        ps.setString(10, p.getImage());
	        ps.setInt(11, p.getId());

	        int rows = ps.executeUpdate();
	        status = rows > 0;

	        System.out.println("ROWS UPDATED = " + rows);

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return status;
	}

public Product getProductById(int id) {
	   
	  Product row = new Product() ;
		
	    try {
	    	
	    	String query = "SELECT * FROM products WHERE id = ?";

	    	pst = this.conn.prepareStatement(query);

	        pst.setInt(1, id);
	        ResultSet rs = pst.executeQuery();

	        if (rs.next()) {
	        	
	        	row.setId(rs.getInt("id"));
				row.setName(rs.getString("name"));
				row.setDescript(rs.getString("descript"));
				row.setSub_category(rs.getString("sub_category"));
				row.setCategory(rs.getString("category"));
				row.setGender(rs.getString("gender"));
				row.setPrice(rs.getInt("price"));
				row.setDiscount(rs.getString("discount"));
				row.setSizes(rs.getString("sizes"));
				row.setColors(rs.getString("colors"));
				row.setImage(rs.getString("image"));
	       
				
	        
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return row;
	   
	}


}