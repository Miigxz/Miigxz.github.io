package com.CBS.dao;

import java.sql.*;
import java.util.*;

import com.CBS.model.Product;

public class CrudDao {
	private Connection connection;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public CrudDao (Connection connection) {
		this.connection = connection;
	}
	
	public boolean insertProduct(Product product){
		boolean set = false;
		try {
			query = "INSERT INTO Products (name, price, stock, image) VALUES (?,?,?,?)";
			pst = this.connection.prepareStatement(query);
			pst.setString(1, product.getName());
			pst.setDouble(2, product.getPrice());
			pst.setInt(3, product.getStock());
			pst.setString(4, product.getImage());
			pst.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return set;
	}
	
	public void deleteProduct(int id) {
		try {
			query = "DELETE FROM Products WHERE id = ?";
			pst = this.connection.prepareStatement(query);
			pst.setInt(1, id);
			pst.execute();
			
		}catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
	}
	
	public boolean updateProduct(Product product) {
		boolean set = false;
		try {
			query = "UPDATE Products SET name = ?, price = ?, stock = ?, image = ? WHERE id = ?";
			pst = this.connection.prepareStatement(query);
			pst.setString(1, product.getName());
			pst.setDouble(2, product.getPrice());
			pst.setInt(3, product.getStock());
			pst.setString(4, product.getImage());
			pst.setInt(5, product.getId());
			
			set = pst.executeUpdate() > 0;

			pst.close();
		}catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return set;
	}
	
	public Product getProduct (int id) {
		Product product = null;
		try {
			query = "SELECT * FROM Products WHERE id = ?";
			pst = this.connection.prepareStatement(query);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				product = new Product();
				product.setId(rs.getInt("id"));
				product.setName(rs.getString("name"));
				product.setPrice(rs.getDouble("price"));
				product.setStock(rs.getInt("stock"));
				product.setImage(rs.getString("image"));
			}
		}catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return product;
	}
}
