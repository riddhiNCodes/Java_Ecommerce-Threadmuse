package cn.Threadmuse.Model;

public class UserModel {
	
	private int id;
	private String name;
	private String email;
	private String pass;
	private String mob;
	
	public UserModel() {
		super();
	}
	
	public UserModel(int id, String name, String email, String pass, String mob) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.pass = pass;
		this.mob = mob;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getMob() {
		return mob;
	}

	public void setMob(String mob) {
		this.mob = mob;
	}

	@Override
	public String toString() {
		return "UserModel [id=" + id + ", name=" + name + ", email=" + email + ", pass=" + pass + ", mob=" + mob + "]";
	}
	


	
}
