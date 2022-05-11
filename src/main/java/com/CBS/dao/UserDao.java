package com.CBS.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.CBS.encryption.AESAlgorithm;
import com.CBS.model.User;

public class UserDao {
	private Connection connection;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public UserDao(Connection connection) {
		this.connection = connection;
	}
	
	
	public User userLogin (String username, String password) {
		User user = null;
		try {
			query = "SELECT * FROM Accounts WHERE username = ? and password = ?";
			pst = this.connection.prepareStatement(query);
			pst.setString(1, username);
			pst.setString(2, password);
			rs = pst.executeQuery();
			
			if (rs.next()) {
				user = new User();
				user.setId(rs.getInt("id"));
				user.setUsername(rs.getString("username"));
				user.setFirstname(rs.getString("firstname"));
				user.setLastname(rs.getString("lastname"));
				user.setContactnum(rs.getString("contactnum"));
				user.setAddress(rs.getString("address"));
				user.setUsertype(rs.getString("usertype"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.print(e.getMessage());
		}
		return user;
	}
	
	public boolean userRegister(User user) {
		boolean set = false;
		try {
			query = "INSERT INTO Accounts (username, password, email, firstname, lastname, contactnum, address, usertype) VALUES (?,?,?,?,?,?,?,?)";
			pst = this.connection.prepareStatement(query);
			String ePass = AESAlgorithm.encrypt(user.getPassword());
			
			pst.setString(1, user.getUsername());
			pst.setString(2, ePass);
			pst.setString(3, user.getEmail());
			pst.setString(4, user.getFirstname());
			pst.setString(5, user.getLastname());
			pst.setString(6, user.getContactnum());
			pst.setString(7, user.getAddress());
			pst.setString(8,"customer");
			pst.executeUpdate();

			set = true;
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return set;
	}
	
	public boolean userRegisterAdmin(User user) {
		boolean set = false;
		try {
			query = "INSERT INTO Accounts (username, password, email, firstname, lastname, contactnum, address, usertype) VALUES (?,?,?,?,?,?,?,?)";
			pst = this.connection.prepareStatement(query);
			String ePass = AESAlgorithm.encrypt(user.getPassword());
			
			pst.setString(1, user.getUsername());
			pst.setString(2, ePass);
			pst.setString(3, user.getEmail());
			pst.setString(4, user.getFirstname());
			pst.setString(5, user.getLastname());
			pst.setString(6, user.getContactnum());
			pst.setString(7, user.getAddress());
			pst.setString(8,"admin");
			pst.executeUpdate();

			set = true;
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return set;
	}
	
	public boolean updateContactNum(String newContactNum, String username) {
		boolean set = false;
		try {
			query = "UPDATE Accounts SET contactnum = ? WHERE username = ?";
			pst = this.connection.prepareStatement(query);
			pst.setString(1, newContactNum);
			pst.setString(2, username);
			
			set = pst.executeUpdate() > 0;
		}catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return set;
	}
	
	public boolean updateAddress(String newAddress, String username) {
		boolean set = false;
		try {
			query = "UPDATE Accounts SET address = ? WHERE username = ?";
			pst = this.connection.prepareStatement(query);
			pst.setString(1, newAddress);
			pst.setString(2, username);
			
			set = pst.executeUpdate() > 0;
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return set;
	}
}
