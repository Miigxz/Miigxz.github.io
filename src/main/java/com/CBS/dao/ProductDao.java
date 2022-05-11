package com.CBS.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.CBS.model.*;

public class ProductDao {
	private Connection connection;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public ProductDao(Connection connection) {
		this.connection = connection;
	}
	
	public List<Product> getAllProducts() {
		List<Product> products = new ArrayList<>();
		try {
			query = "SELECT * FROM Products";
			pst = this.connection.prepareStatement(query);
			rs = pst.executeQuery();
			
			while (rs.next()) {
				Product row = new Product();
				row.setId(rs.getInt("id"));
				row.setName(rs.getString("name"));
				row.setPrice(rs.getDouble("price"));
				row.setStock(rs.getInt("stock"));
				row.setImage(rs.getString("image"));
				
				products.add(row);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return products;
	}	
	
	public List<Product> getSearchProduct(String txtSearch) {
		List<Product> products = new ArrayList<>();
		try {
			query = "SELECT * FROM Products WHERE name LIKE ?";
			pst = this.connection.prepareStatement(query);
			pst.setString(1, "%" + txtSearch + "%");
			rs = pst.executeQuery();

			while (rs.next()) {
				Product row = new Product();
				row.setId(rs.getInt("id"));
				row.setName(rs.getString("name"));
				row.setPrice(rs.getDouble("price"));
				row.setStock(rs.getInt("stock"));
				row.setImage(rs.getString("image"));
				
				products.add(row);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return products;
	}
	
	public List<Cart> getCartProducts(ArrayList<Cart> cartList){
		List<Cart> products = new ArrayList<Cart>();
		
		try {
			if(cartList.size()>0) {
				for(Cart item:cartList) {
					query = "SELECT * FROM Products where id = ?";
					pst = this.connection.prepareStatement(query);
					pst.setInt(1, item.getId());
					rs = pst.executeQuery();
					while (rs.next()) {
						Cart row = new Cart();
						row.setId(rs.getInt("id"));
						row.setName(rs.getString("name"));
						row.setPrice(rs.getDouble("price")*item.getQuantity());
						row.setQuantity(item.getQuantity());
						row.setStock(rs.getInt("stock"));
						products.add(row);
					}
				}
			}	
		} catch (Exception e) {
			System.out.println(e.getMessage());
//			e.printStackTrace();
		}
		
		return products;
	}
	
	public double getTotalCartPrice(ArrayList<Cart> cartList) {
		double sum = 0;
		try {
			if (cartList.size()>0) {
				for(Cart item:cartList) {
					query = "SELECT price FROM Products WHERE id = ?";
					pst = this.connection.prepareStatement(query);
					pst.setInt(1, item.getId());
					rs = pst.executeQuery();
					
					while (rs.next()) {
						sum += rs.getDouble("price")*item.getQuantity();
					}
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return sum;
	}
	
	public Product getSingleProduct(int id) {
		Product row = null;
		
		try {
			query = "SELECT * FROM Products WHERE id = ?";
			pst = this.connection.prepareStatement(query);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			
			while (rs.next()) {
				row = new Product();
				row.setId(rs.getInt("id"));
				row.setName(rs.getString("name"));
				row.setPrice(rs.getDouble("price"));
				row.setStock(rs.getInt("stock"));
				row.setImage(rs.getString("image"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return row;
	}
	
	public List<Product> getAvailableProducts() {
		List<Product> products = new ArrayList<>();
		try {
			query = "SELECT * FROM Products WHERE stock != 0";
			pst = this.connection.prepareStatement(query);
			rs = pst.executeQuery();
			
			while (rs.next()) {
				Product row = new Product();
				row.setId(rs.getInt("id"));
				row.setName(rs.getString("name"));
				row.setPrice(rs.getDouble("price"));
				row.setStock(rs.getInt("stock"));
				row.setImage(rs.getString("image"));
				
				products.add(row);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return products;
	}	
	
	public Product updateProductStock(int id, int quantity, int stock) {
		Product row = null;
		
		try {
			query = "UPDATE Products SET stock = ? WHERE id = ?";
			pst = this.connection.prepareStatement(query);
			pst.setInt(1, stock-quantity);
			pst.setInt(2, id);
			pst.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return row;
	}
}
