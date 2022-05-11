package com.CBS.model;

public class Product {
	private int id;
	private String name;
	private Double price;
	private int stock;
	private String image;
	
	public Product() {
	}
	
	public Product(int id) {
		this.id = id;
	}

	public Product(int id, String name, Double price, int stock, String image) {
		this.id = id;
		this.name = name;
		this.price = price;
		this.stock = stock;
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

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", price=" + price + ", stock=" + stock + ", image=" + image
				+ "]";
	}
	
}
