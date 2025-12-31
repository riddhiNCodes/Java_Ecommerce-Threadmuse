package cn.Threadmuse.Model;

public class Product {
  private int id;
  private String name;
  private String descript;
  private String category;
  private String sub_category;
  private String gender;
  private int price;
  private String discount;
  private String sizes;
  private String colors;
  private String image;
 
  
  public Product() {
	super();
}


  

  public Product(int id, String name, String descript, String category, String sub_category, String gender, int price,
		String discount, String sizes, String colors, String image) {
	super();
	this.id = id;
	this.name = name;
	this.descript = descript;
	this.category = category;
	this.sub_category = sub_category;
	this.gender = gender;
	this.price = price;
	this.discount = discount;
	this.sizes = sizes;
	this.colors = colors;
	this.image = image;
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


  public String getDescript() {
	return descript;
  }


  public void setDescript(String descript) {
	this.descript = descript;
  }


  public String getCategory() {
	return category;
  }


  public void setCategory(String category) {
	this.category = category;
  }


  public String getSub_category() {
	return sub_category;
  }


  public void setSub_category(String sub_category) {
	this.sub_category = sub_category;
  }


  public String getGender() {
	return gender;
  }


  public void setGender(String gender) {
	this.gender = gender;
  }


  public int getPrice() {
	return price;
  }


  public void setPrice(int price) {
	this.price = price;
  }


  public String getDiscount() {
	return discount;
  }


  public void setDiscount(String discount) {
	this.discount = discount;
  }


  public String getSizes() {
	return sizes;
  }


  public void setSizes(String sizes) {
	this.sizes = sizes;
  }


  public String getColors() {
	return colors;
  }


  public void setColors(String colors2) {
	this.colors = colors2;
  }


  public String getImage() {
	return image;
  }


  public void setImage(String image) {
	this.image = image;
  }


  @Override
  public String toString() {
	return "Product [id=" + id + ", name=" + name + ", descript=" + descript + ", category=" + category
			+ ", sub_category=" + sub_category + ", gender=" + gender + ", price=" + price + ", discount=" + discount
			+ ", sizes=" + sizes + ", colors=" + colors + ", image=" + image + "]";
  }
  
  

}