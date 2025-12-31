package cn.Threadmuse.Dao;

import java.util.*;

import cn.Threadmuse.Model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ProductDao {
	  private Connection conn;
	  private String query;
	  private PreparedStatement pst;
	  private ResultSet rs;
	  
	  public ProductDao(Connection conn) {
		
		this.conn = conn;
	  }
	  
	  public List<Product> getAllproducts()
	  {
		  List<Product> products = new ArrayList<Product>();
		  try { 
			    query = "SELECT * FROM products ";
			    pst = this.conn.prepareStatement(query);

			    ResultSet rs = pst.executeQuery();
			    while(rs.next()) {
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

		  catch(Exception e)
		  {
			  e.printStackTrace();
		  }
		  return products;
	  }
	  
	  public List<Product> getOfficeProduct() {
		  List<Product> list = new ArrayList<>();

		    try {
		        String sql = "SELECT * FROM products WHERE category=?  LIMIT 4";
		        PreparedStatement ps = conn.prepareStatement(sql);
		        ps.setString(1, "office");

		        ResultSet rs = ps.executeQuery();
		        while (rs.next()) {
		            Product p = new Product();
		            p.setId(rs.getInt("id"));
		            p.setName(rs.getString("name"));
		            p.setImage(rs.getString("image"));
		            p.setPrice(rs.getInt("price"));
		            list.add(p);
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		    return list;
	  }

	  public List<Product> getcasualsProduct() {
		  List<Product> list = new ArrayList<>();

		    try {
		        String sql = "SELECT * FROM products WHERE category=?  LIMIT 4";
		        PreparedStatement ps = conn.prepareStatement(sql);
		        ps.setString(1, "casuals");

		        ResultSet rs = ps.executeQuery();
		        while (rs.next()) {
		            Product p = new Product();
		            p.setId(rs.getInt("id"));
		            p.setName(rs.getString("name"));
		            p.setImage(rs.getString("image"));
		            p.setPrice(rs.getInt("price"));
		            list.add(p);
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		    return list;
	  }

	  
	  public List<Product> getAllproductsCasual(String category)
	  {
		  List<Product> products = new ArrayList<Product>();
		  
		  try {
			query = "select * from products where category = 'casuals'";
			pst = this.conn.prepareStatement(query);
			
			rs= pst.executeQuery();
			while(rs.next())
			{
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
		  catch(Exception e)
		  {
			  e.printStackTrace();
		  }
		  return products;
	  }
	  
	  public List<Product> getAllproductsOffice(String category)
	  {
		  List<Product> products = new ArrayList<Product>();
		  
		  try {
			query = "select * from products where category = 'office'";
			pst = this.conn.prepareStatement(query);
			
			rs= pst.executeQuery();
			while(rs.next())
			{
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
		  catch(Exception e)
		  {
			  e.printStackTrace();
		  }
		  return products;
	  }
	  
	  public List<Product> getAllproductsCollege(String category)
	  {
		  List<Product> products = new ArrayList<Product>();
		  
		  try {
			query = "select * from products where category = 'college'";
			pst = this.conn.prepareStatement(query);
			
			rs= pst.executeQuery();
			while(rs.next())
			{
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
		  catch(Exception e)
		  {
			  e.printStackTrace();
		  }
		  return products;
	  }
	  
	  public List<Product> getAllproductsEthnic(String category)
	  {
		  List<Product> products = new ArrayList<Product>();
		  
		  try {
			query = "select * from products where category = 'ethnic'";
			pst = this.conn.prepareStatement(query);
			
			rs= pst.executeQuery();
			while(rs.next())
			{
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
		  catch(Exception e)
		  {
			  e.printStackTrace();
		  }
		  return products;
	  }
	  
	  
	  public List<Product> getAllproductsParty(String category)
	  {
		  List<Product> products = new ArrayList<Product>();
		  
		  try {
			query = "select * from products where category = 'party'";
			pst = this.conn.prepareStatement(query);
			
			rs= pst.executeQuery();
			while(rs.next())
			{
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
		  catch(Exception e)
		  {
			  e.printStackTrace();
		  }
		  return products;
	  }
	
	  
	  
	  
	  public Product getProductById(int id) {
		   
		  Product row = new Product() ;
			
		    try {
		    	
		    	String query = "SELECT * FROM products WHERE id = ?";

		    	pst = this.conn.prepareStatement(query);

		        pst.setInt(1, id);
		        rs = pst.executeQuery();

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
