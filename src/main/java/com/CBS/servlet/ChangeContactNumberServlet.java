package com.CBS.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.CBS.connection.DBCon;
import com.CBS.dao.UserDao;
import com.CBS.model.User;

public class ChangeContactNumberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ChangeContactNumberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String newContactNum = request.getParameter("newContactNum");
		User auth = (User) request.getSession().getAttribute("auth");
		String username = auth.getUsername();
		RequestDispatcher dispatcher = null;

		try {
			UserDao udao = new UserDao(DBCon.getConnection());

			if (newContactNum != "") {
				User newUser = new User();
				newUser.setId(auth.getId());
				newUser.setContactnum(newContactNum);
				
				udao.updateContactNum(newContactNum, username);
				
				auth.setContactnum(newContactNum);
				dispatcher = request.getRequestDispatcher("confirmCheckout.jsp");
				dispatcher.forward(request, response);
			} else {
				response.sendRedirect("confirmCheckout.jsp");	
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
