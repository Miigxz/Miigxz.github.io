package com.CBS.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.CBS.connection.DBCon;
import com.CBS.dao.UserDao;
import com.CBS.model.User;

/**
 * Servlet implementation class RegisterAdminServlet
 */
public class RegisterAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterAdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String repassword = request.getParameter("repassword");
		String email = request.getParameter("email");
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String contactnumber = request.getParameter("contactnumber");
		String address = request.getParameter("address");

		if (password != null && repassword != null && password.equals(repassword)) {
			User newUser = new User();

			newUser.setUsername(username);
			newUser.setPassword(password);
			newUser.setEmail(email);
			newUser.setFirstname(firstname);
			newUser.setLastname(lastname);
			newUser.setContactnum(contactnumber);
			newUser.setAddress(address);

			try {
				UserDao userReg = new UserDao(DBCon.getConnection());
				if (userReg.userRegister(newUser)) {
					response.sendRedirect("login.jsp");
				} else {
					String errorMessage = "username/email is unavailable or email/contact number has invalid format";
					HttpSession regSession = request.getSession();
					regSession.setAttribute("RegError", errorMessage);
					RequestDispatcher dispatcher = request.getRequestDispatcher("createAdminAccount.jsp");
					dispatcher.forward(request, response);
					//response.sendRedirect("register.jsp");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

			System.out.println("User Registered successfully");
		}
	}

}
