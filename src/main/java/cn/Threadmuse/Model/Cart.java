package cn.Threadmuse.Model;

public class Cart {
	private int orderId;
	private int userid;
	private String category;
	
	public Cart() {}
	
	public Cart(int orderId, int userid, String category) {
		super();
		this.orderId = orderId;
		this.userid = userid;
		this.category = category;
	}



	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}



	private int id;
    private String name;
    private int price;
    private String size;
    private int quantity;
    private String image;

   private double subtotal;
   

		public double getSubtotal() {
	return subtotal;
}

   public void setSubtotal(double subtotal) {
	this.subtotal = subtotal;
   }

		public Cart(int id, String name, int price, String size, int quantity, String image) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.size = size;
		this.quantity = quantity;
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



		public int getPrice() {
			return price;
		}



		public void setPrice(int price) {
			this.price = price;
		}



		public String getSize() {
			return size;
		}



		public void setSize(String size) {
			this.size = size;
		}



		public int getQuantity() {
			return quantity;
		}



		public void setQuantity(int quantity) {
			this.quantity = quantity;
		}



		public String getImage() {
			return image;
		}



		public void setImage(String image) {
			this.image = image;
		}



		public double getTotal() {
        return this.price * this.quantity;
    }



		@Override
		public String toString() {
			return "Cart [id=" + id + ", name=" + name + ", price=" + price + ", size=" + size + ", quantity="
					+ quantity + ", image=" + image + "]";
		}

   

}
