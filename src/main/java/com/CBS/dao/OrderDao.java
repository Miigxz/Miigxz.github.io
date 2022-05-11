package com.CBS.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.CBS.model.*;

public class OrderDao {
	private Connection connection;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public OrderDao (Connection connection) {
		this.connection = connection;
	}
	
	public boolean insertOrder(Order model) {
		
		boolean result = false;
		
		try {
			
			query = "INSERT INTO Orders (product_id, user_id, user_firstname, user_lastname, user_contact, user_address, order_quantity, order_date) VALUES (?,?,?,?,?,?,?,?)";
			pst = this.connection.prepareStatement(query);
			pst.setInt(1, model.getId());
			pst.setInt(2, model.getUid());
			pst.setString(3, model.getuFirstname());
			pst.setString(4, model.getuLastname());
			pst.setString(5, model.getuContact());
			pst.setString(6, model.getuAddress());
			pst.setInt(7, model.getQuantity());
			pst.setString(8, model.getDate());
			pst.executeUpdate();
			result = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public List<Order> userOrders(){
		List<Order> list = new ArrayList<Order>();
		try {
			
			query = "SELECT * FROM Orders ORDER BY order_id desc";
			pst = this.connection.prepareStatement(query);
			rs = pst.executeQuery();
			
			while (rs.next()) {
				Order order = new Order();
				ProductDao productDao = new ProductDao(this.connection);
				int pId = rs.getInt("product_id");
				
				Product product = productDao.getSingleProduct(pId);
				
				order.setOrderId(rs.getInt("order_id"));
				order.setId(pId);
				order.setName(product.getName());
				order.setuFirstname(rs.getString("user_firstname"));
				order.setuLastname(rs.getString("user_lastname"));
				order.setuContact(rs.getString("user_contact"));
				order.setuAddress(rs.getString("user_address"));;
				order.setPrice(product.getPrice()*rs.getInt("order_quantity"));
				order.setQuantity(rs.getInt("order_quantity"));
				order.setDate(rs.getString("order_date"));
				list.add(order);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Order> oldUserOrders(){
		List<Order> list = new ArrayList<>();
		try {
			
			query = "SELECT * FROM oldOrders ORDER BY order_id desc";
			pst = this.connection.prepareStatement(query);
			rs = pst.executeQuery();
			
			while (rs.next()) {
				Order order = new Order();
				ProductDao productDao = new ProductDao(this.connection);
				int pId = rs.getInt("product_id");
				
				Product product = productDao.getSingleProduct(pId);
				
				order.setOrderId(rs.getInt("order_id"));
				order.setId(pId);
				order.setName(product.getName());
				order.setPrice(product.getPrice()*rs.getInt("order_quantity"));
				order.setQuantity(rs.getInt("order_quantity"));
				order.setDate(rs.getString("order_date"));
				list.add(order);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public void cancelOrder(int id) {
		try {
			query = "DELETE FROM Orders WHERE order_id = ?";
			pst = this.connection.prepareStatement(query);
			pst.setInt(1, id);
			pst.execute();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void deleteOrder(String Oid) {
		try {
			query = "DELETE FROM Orders WHERE order_id = ?";
			pst = this.connection.prepareStatement(query);
			pst.setInt(1, Integer.parseInt(Oid));
			pst.execute();
			
		} catch (Exception e) {
			e.printStackTrace();;
			// TODO: handle exception
		}
	}
}
