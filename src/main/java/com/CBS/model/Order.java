package com.CBS.model;

public class Order extends Product {
	private int orderId;
	private int uid;
	private String uFirstname;
	private String uLastname;
	private String uContact;
	private String uAddress;
	private int quantity;
	private String date;

	public Order() {
	}

	public Order(int orderId, int uid, String uFirstname, String uLastname, String uContact, String uAddress,
			int quantity, String date) {
		super();
		this.orderId = orderId;
		this.uid = uid;
		this.uFirstname = uFirstname;
		this.uLastname = uLastname;
		this.uContact = uContact;
		this.uAddress = uAddress;
		this.quantity = quantity;
		this.date = date;
	}

	public Order(int uid, int quantity, String date) {
		super();
		this.uid = uid;
		this.quantity = quantity;
		this.date = date;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getuFirstname() {
		return uFirstname;
	}

	public void setuFirstname(String uFirstname) {
		this.uFirstname = uFirstname;
	}

	public String getuLastname() {
		return uLastname;
	}

	public void setuLastname(String uLastname) {
		this.uLastname = uLastname;
	}

	public String getuContact() {
		return uContact;
	}

	public void setuContact(String uContact) {
		this.uContact = uContact;
	}

	public String getuAddress() {
		return uAddress;
	}

	public void setuAddress(String uAddress) {
		this.uAddress = uAddress;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "Order [orderId=" + orderId + ", uid=" + uid + ", uFirstname=" + uFirstname + ", uLastname=" + uLastname
				+ ", uContact=" + uContact + ", uAddress=" + uAddress + ", quantity=" + quantity + ", date=" + date
				+ "]";
	}

}
