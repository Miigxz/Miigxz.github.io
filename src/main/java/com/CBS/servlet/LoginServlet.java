package com.CBS.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;


import com.CBS.connection.DBCon;
import com.CBS.dao.UserDao;
import com.CBS.encryption.AESAlgorithm;
import com.CBS.model.User;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("login.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try(PrintWriter out = response.getWriter()) {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String ePass = AESAlgorithm.encrypt(password);
			
			try {
				UserDao udao = new UserDao(DBCon.getConnection());
				User user = udao.userLogin(username, ePass);
				
				if (user != null ) {
					request.getSession().setAttribute("auth", user);
					
					System.out.print("user login successfully");
					response.sendRedirect("index.jsp");
				} else {
					String message = "Invalid Username/Password";
					request.setAttribute("message", message);
					RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
					dispatcher.forward(request, response);
					//response.sendRedirect("login.jsp");
					
					System.out.print("user login failed");
				}
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			
			System.out.println(username+ePass);
		}
	}

}
