package cn.Threadmuse.Dao;

import java. sql.*;
import java.util.*;
import cn.Threadmuse.Model.UserModel;


public class UserDao {
  private Connection conn;
  private String query;
  private PreparedStatement pst;
  private ResultSet rs;
  
  public UserDao(Connection conn) {
	super();
	this.conn = conn;
  }
  
  public UserModel userlogin(String email, String pass)
  {
	  UserModel user = null;
	  
	  try {
		  query="Select * from user_detail where  Email=? and Password=?";
		  pst = this.conn.prepareStatement(query);
		  pst.setString(1, email);
		  pst.setString(2, pass);
		  
		  rs=pst.executeQuery();
		  
		  if(rs.next())
		  {
			  user = new UserModel();
			  user.setId(rs.getInt("Id"));
			  user.setName(rs.getString("Name"));
			  user.setEmail(rs.getString("Email"));
			  user.setMob(rs.getString("phone"));
			  
		  }
	  }catch(Exception e)
	  {
		  e.printStackTrace();
		  System.out.println(e.getMessage());
	  }
	  return user;
	  
  }
  
  public boolean isEmailExists(String email) {
	    try {
	        String sql = "SELECT id FROM user_detail WHERE email=?";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setString(1, email);
	        ResultSet rs = ps.executeQuery();
	        return rs.next();

	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;  // fail safe, do not crash
	    }
	}

  
  public UserModel userRegister(String Name, String Email, String Password, String Phone )
  {
	  UserModel user = new UserModel();
     try {
    	 query= "insert into user_detail(Name,Email,Password,Phone)"+" values (?,?,?,?)";
    	 pst = this.conn.prepareStatement(query); 
    	 pst.setString(1, Name);
    	 pst.setString(2, Email);
    	 pst.setString(3, Password);
    	 pst.setString(4, Phone);
    	 
    int	r= pst.executeUpdate();
    	 
    	 if (r > 0) {
	      System.out.println("Data inserted successfully");
	       user.setName(Name);;
	       user.setEmail(Email);;
	       user.setPass(Password);;
	       user.setMob(Phone);;
    	 
    	 } 
        
     }
    catch(Exception ex) {
    	System.out.println("Error "+ex.getMessage());
    }
	 
  return user;
  }
  
  public List<UserModel> getAllUsers() {
	    List<UserModel> list = new ArrayList<>();
	    String sql = "SELECT * FROM user_detail";

	    try {
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ResultSet rs = ps.executeQuery();
	        
	        while (rs.next()) {
	            UserModel u = new UserModel();
	            u.setId(rs.getInt("id"));
	            u.setName(rs.getString("name"));
	            u.setEmail(rs.getString("email"));
	            u.setMob(rs.getString("phone"));
	          
	            list.add(u);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	       
	    }
	    return list;
	}

//Admin delete user
  
  public boolean removeUser(int userid) {
      boolean deleted = false;

      try {
          String sql = "DELETE FROM user_detail WHERE Id = ?";
          PreparedStatement ps = conn.prepareStatement(sql);

          ps.setInt(1, userid);   

          int r = ps.executeUpdate();

          if (r > 0) {
              deleted = true; 
          }

          ps.close();          
      }
      catch (Exception ex) {
          ex.printStackTrace();
      }

      return deleted;
  }

  

}
  
 

