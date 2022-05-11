package com.CBS.model;

public class cOrder extends Order{
	private int orderId;
	private int uid;
	private int quantity;
	private String date;

	public cOrder() {
	}

	public cOrder(int orderId, int uid, int quantity, String date) {
		super();
		this.orderId = orderId;
		this.uid = uid;

		this.quantity = quantity;
		this.date = date;
	}

	public cOrder(int uid, int quantity, String date) {
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
		return "cOrder [orderId=" + orderId + ", uid=" + uid + ", quantity=" + quantity + ", date=" + date + "]";
	}

}
