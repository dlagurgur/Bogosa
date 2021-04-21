package db;

public class Product_DataBean {
	private int product_id;
	private String product_name;
	private int product_price;
	private String product_image;
	private int product_category;
	private String product_detail;
	private String user_id;
	
	
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int menu_id) {
		this.product_id = menu_id;
	}
	
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String menu_name) {
		this.product_name = menu_name;
	}
	
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int menu_price) {
		this.product_price = menu_price;
	}
	
	public String getProduct_image() {
		return product_image;
	}
	public void setProduct_image(String menu_image) {
		this.product_image = menu_image;
	}
	
	public int getProduct_category() {
		return product_category;
	}
	public void setProduct_category(int menu_category) {
		this.product_category = menu_category;
	}
	
	public String getProduct_detail() {
		return product_detail;
	}
	public void setProduct_detail(String menu_detail) {
		this.product_detail = menu_detail;
	}
	
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
}
